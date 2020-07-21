INSERT INTO
  users (name, email, password)
VALUES
  (
    'Fionnula Bellard',
    'fbellard0@cyberchimps.com',
    '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'
  ),
  (
    'Tilda Fosse',
    'tfosse1@si.edu',
    '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'
  ),
  (
    'Aimee Stobart',
    'astobart2@reverbnation.com',
    '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'
  ),
  (
    'Sherman Brobeck',
    'sbrobeck3@odnoklassniki.ru',
    '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'
  ),
  (
    'Jodie Dugget',
    'jdugget4@java.com',
    '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'
  ),
  (
    'Mariya Doore',
    'mdoore5@is.gd',
    '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'
  ),
  (
    'Brock Redborn',
    'bredborn6@soup.io',
    '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'
  ),
  (
    'Nanni Fernely',
    'nfernely7@jigsy.com',
    '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'
  ),
  (
    'Dee Derricoat',
    'dderricoat8@shinystat.com',
    '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'
  ),
  (
    'Valentia McSharry',
    'vmcsharry9@exblog.jp',
    '$2a$10$FB/BOAVhpuLvpOREQVmvmezD4ED/.JBIDRh70tGevYzYzQgFId2u.'
  );

INSERT INTO
  properties (
    owner_id,
    title,
    description,
    thumbnail_photo_url,
    cover_photo_url,
    cost_per_night,
    parking_spaces,
    number_of_bathrooms,
    number_of_bedrooms,
    country,
    province,
    city,
    street,
    post_code,
    active
  )
VALUES
  (
    '1',
    'Speed Corner',
    'description',
    'https://images.pexels.com/photos/584399/living-room-couch-interior-room-584399.jpeg?cs=srgb&dl=brown-wooden-center-table-584399.jpg&fm=jpg',
    'https://images.pexels.com/photos/584399/living-room-couch-interior-room-584399.jpeg?cs=srgb&dl=brown-wooden-center-table-584399.jpg&fm=jpg',
    '869',
    '0',
    '1',
    '1',
    'Canada',
    'SK',
    'Lloydminster',
    '3rd',
    'S9V5J3',
    'TRUE'
  ),
  (
    '3',
    'Some House',
    'description',
    'https://images.pexels.com/photos/271816/pexels-photo-271816.jpeg?cs=srgb&dl=apartment-architecture-bookcase-bookshelves-271816.jpg&fm=jpg',
    'https://images.pexels.com/photos/271816/pexels-photo-271816.jpeg?cs=srgb&dl=apartment-architecture-bookcase-bookshelves-271816.jpg&fm=jpg',
    '611',
    '3',
    '1',
    '2',
    'Canada',
    'BC',
    'Peachland',
    'Calypso',
    'B3S4L9',
    'TRUE'
  ),
  (
    '4',
    'Jon Snow South',
    'description',
    'https://images.pexels.com/photos/1457842/pexels-photo-1457842.jpeg?cs=srgb&dl=photo-of-living-room-1457842.jpg&fm=jpg',
    'https://images.pexels.com/photos/1457842/pexels-photo-1457842.jpeg?cs=srgb&dl=photo-of-living-room-1457842.jpg&fm=jpg',
    '509',
    '1',
    '2',
    '1',
    'Canada',
    'QC',
    'Laval',
    'Holmberg',
    'H7S5M5',
    'FALSE'
  ),
  (
    '4',
    'That House',
    'description',
    'https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?cs=srgb&dl=apartment-bed-bedroom-chair-271624.jpg&fm=jpg',
    'https://images.pexels.com/photos/271624/pexels-photo-271624.jpeg?cs=srgb&dl=apartment-bed-bedroom-chair-271624.jpg&fm=jpg',
    '335',
    '1',
    '1',
    '1',
    'Canada',
    'AB',
    'Stony Plain',
    'Bonner',
    'T7Z1A3',
    'TRUE'
  ),
  (
    '6',
    'House of Nicolas Cage',
    'The place of Nicolas Cage',
    'https://images.pexels.com/photos/439227/pexels-photo-439227.jpeg?cs=srgb&dl=apartment-bed-bedroom-book-shelves-439227.jpg&fm=jpg',
    'https://images.pexels.com/photos/439227/pexels-photo-439227.jpeg?cs=srgb&dl=apartment-bed-bedroom-book-shelves-439227.jpg&fm=jpg',
    '327',
    '5',
    '3',
    '4',
    'Canada',
    'QC',
    'Notre-Dame-des-Prairies',
    'Fallview',
    'K6V4F6',
    'FALSE'
  ),
  (
    '8',
    'Chez Nicolas Cage',
    'description',
    'https://images.pexels.com/photos/1643383/pexels-photo-1643383.jpeg?cs=srgb&dl=interior-design-of-home-1643383.jpg&fm=jpg',
    'https://images.pexels.com/photos/1643383/pexels-photo-1643383.jpeg?cs=srgb&dl=interior-design-of-home-1643383.jpg&fm=jpg',
    '869',
    '4',
    '4',
    '6',
    'Canada',
    'ON',
    'Casselman',
    'Linden',
    'G8A6G6',
    'TRUE'
  );

INSERT INTO
  reservations (start_date, end_date, property_id, guest_id)
VALUES
  ('2019-04-27', '2019-05-10', 2, 5),
  ('2018-03-29', '2018-04-02', 2, 3),
  ('2020-06-26', '2020-06-30', 2, 6),
  ('2019-07-25', '2019-07-30', 6, 3),
  ('2018-11-17', '2018-11-18', 3, 9),
  ('2019-11-27', '2019-12-27', 6, 8),
  ('2019-01-12', '2019-01-20', 6, 3),
  ('2019-08-15', '2019-08-25', 1, 1),
  ('2019-11-21', '2019-11-24', 1, 3),
  ('2018-02-02', '2018-02-09', 1, 3);

INSERT INTO
  property_reviews (
    guest_id,
    property_id,
    reservation_id,
    rating,
    message
  )
VALUES
  (5, 2, 1, 1, 'message'),
  (3, 2, 3, 2, 'message'),
  (6, 2, 5, 5, 'message'),
  (3, 6, 6, 2, 'message'),
  (9, 3, 2, 3, 'message'),
  (8, 6, 8, 5, 'message'),
  (3, 6, 7, 5, 'message'),
  (1, 1, 9, 2, 'message'),
  (3, 1, 10, 3, 'message'),
  (3, 1, 4, 2, 'message');