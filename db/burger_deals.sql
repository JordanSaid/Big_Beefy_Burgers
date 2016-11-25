DROP TABLE restaurants;
DROP TABLE deals;
DROP TABLE days;
DROP TABLE burgers;

CREATE TABLE burgers
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  price DECIMAL
);

CREATE TABLE days
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null
);

CREATE TABLE deals
(
  id SERIAL8 primary key,
  label VARCHAR(255) not null,
  burger_id INT8 references burgers(id),
  day_id INT8 references days(id)
);

CREATE TABLE restaurants
(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  burger_id INT8 references burgers(id),
  deal_id INT8 references deals(id)
);
