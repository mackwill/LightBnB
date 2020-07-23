const pool = require("./db/pool");

/**
 * Get a single user from the database given their email.
 * @param {String} email The email of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithEmail = function (email) {
  let user;

  return pool
    .query(
      `
  SELECT * FROM users
  WHERE email = $1;`,
      [email]
    )
    .then((res) => {
      for (const userId in res.rows) {
        user = res.rows[userId];
        if (user.email.toLowerCase() === email.toLowerCase()) {
          break;
        } else {
          user = null;
        }
      }
      return user;
    });
};
exports.getUserWithEmail = getUserWithEmail;

/**
 * Get a single user from the database given their id.
 * @param {string} id The id of the user.
 * @return {Promise<{}>} A promise to the user.
 */
const getUserWithId = function (id) {
  return pool.query(`SELECT * FROM users WHERE id = $1;`, [id]).then((res) => {
    if (res.rows.length > 0) {
      return res.rows[0];
    }
    return null;
  });
};
exports.getUserWithId = getUserWithId;

/**
 * Add a new user to the database.
 * @param {{name: string, password: string, email: string}} user
 * @return {Promise<{}>} A promise to the user.
 */
const addUser = function (user) {
  return pool
    .query(
      `
  INSERT INTO users (name, email, password) 
  VALUES ($1, $2, $3)
  RETURNING *;
  `,
      [user.name, user.email, user.password]
    )
    .then((res) => {
      return res.rows[0];
    });
};
exports.addUser = addUser;

/// Reservations

/**
 * Get all reservations for a single user.
 * @param {string} guest_id The id of the user.
 * @return {Promise<[{}]>} A promise to the reservations.
 */
const getAllReservations = function (guest_id, limit = 10) {
  return pool
    .query(
      `
      SELECT
      reservations.id,
      properties.*,
      reservations.start_date,
      avg(property_reviews.rating) as average_rating
    FROM
      reservations
      JOIN properties ON (property_id = properties.id)
      JOIN property_reviews ON property_reviews.property_id = properties.id
    WHERE
      reservations.guest_id = $1
      AND end_date < now() :: date
    GROUP BY
      reservations.id,
      properties.title,
      properties.cost_per_night,
      reservations.start_date
    ORDER BY
      start_date
    LIMIT
      $2
  `,
      [guest_id, limit]
    )
    .then((res) => {
      console.log("reservations: ", res.rows);
      return res.rows;
    });
};
exports.getAllReservations = getAllReservations;

/// Properties

const handleOptions = (options) => {
  const queryParams = [];
  let queryStringOptions = "";
  let nextQueryParam;
  if (options.city) {
    queryParams.length > 0
      ? (nextQueryParam = "AND")
      : (nextQueryParam = "WHERE");
    queryParams.push(`%${options.city}%`);
    queryStringOptions += `${nextQueryParam} city LIKE $${queryParams.length} `;
  }

  if (options.owner_id) {
    queryParams.length > 0
      ? (nextQueryParam = "AND")
      : (nextQueryParam = "WHERE");
    queryParams.push(options.owner_id);
    queryStringOptions += `${nextQueryParam} owner_id = $${queryParams.length} `;
  }

  if (options.minimum_price_per_night) {
    queryParams.length > 0
      ? (nextQueryParam = "AND")
      : (nextQueryParam = "WHERE");
    queryParams.push(options.minimum_price_per_night);
    queryStringOptions += `${nextQueryParam} cost_per_night >= $${queryParams.length} `;
  }

  if (options.maximum_price_per_night) {
    queryParams.length > 0
      ? (nextQueryParam = "AND")
      : (nextQueryParam = "WHERE");
    queryParams.push(options.maximum_price_per_nigh);
    queryStringOptions += `${nextQueryParam} cost_per_night <= $${queryParams.length} `;
  }

  if (options.minimum_rating) {
    queryParams.length > 0
      ? (nextQueryParam = "AND")
      : (nextQueryParam = "WHERE");
    queryParams.push(options.minimum_rating);
    queryStringOptions += `${nextQueryParam} rating >= $${queryParams.length} `;
  }
  console.log("queryStringOptions", queryStringOptions);

  return { queryStringOptions, queryParams };
};

/**
 * Get all properties.
 * @param {{}} options An object containing query options.
 * @param {*} limit The number of results to return.
 * @return {Promise<[{}]>}  A promise to the properties.
 */
const getAllProperties = function (options, limit = 10) {
  let queryString = `
  SELECT properties.*, avg(property_reviews.rating) as average_rating
  FROM properties
  LEFT JOIN property_reviews ON properties.id = property_id
  `;

  const { queryStringOptions, queryParams } = handleOptions(options);

  queryString += queryStringOptions;

  queryParams.push(limit);
  queryString += `
  GROUP BY properties.id
  ORDER BY cost_per_night
  LIMIT $${queryParams.length};
  `;

  console.log("queryString: ", queryString);
  console.log("queryParams: ", queryParams);
  return pool.query(queryString, queryParams).then((res) => res.rows);
};
exports.getAllProperties = getAllProperties;

/**
 * Add a property to the database
 * @param {{}} property An object containing all of the property details.
 * @return {Promise<{}>} A promise to the property.
 */
const addProperty = function (property) {
  const {
    owner_id,
    title,
    description,
    thumbnail_photo_url,
    cover_photo_url,
    cost_per_night,
    street,
    city,
    province,
    post_code,
    country,
    parking_spaces,
    number_of_bathrooms,
    number_of_bedrooms,
  } = property;
  return pool
    .query(
      `
  INSERT INTO properties (owner_id, title, description, thumbnail_photo_url, cover_photo_url, cost_per_night, street, city, province, post_code, country, parking_spaces, number_of_bathrooms, number_of_bedrooms)
  VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13, $14)
  RETURNING *;
  `,
      [
        owner_id,
        title,
        description,
        thumbnail_photo_url,
        cover_photo_url,
        cost_per_night,
        street,
        city,
        province,
        post_code,
        country,
        parking_spaces,
        number_of_bathrooms,
        number_of_bedrooms,
      ]
    )
    .then((res) => res.rows[0])
    .catch((err) => {
      console.error("Error: ", err);
    });
};
exports.addProperty = addProperty;
