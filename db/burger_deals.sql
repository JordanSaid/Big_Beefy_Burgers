DROP TABLE restaurant_deals;
DROP TABLE deals;
DROP TABLE burgers;
DROP TABLE days;
DROP TABLE restaurants;

CREATE TABLE days(
  id SERIAL8 primary key,
  name VARCHAR(255) not null
);

CREATE TABLE restaurants(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  menu VARCHAR(255) not null
);

CREATE TABLE burgers(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  restaurant_id INT8 references restaurants(id)
);

CREATE TABLE deals(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  description VARCHAR(255) not null,
  day_id INT8 references days(id),
  restaurant_id INT8 references restaurants(id)
);

CREATE TABLE restaurant_deals(
  id SERIAL8 primary key,
  deal_id INT8 references deals(id),
  burger_id INT8 references burgers(id)
);


