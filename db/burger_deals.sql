DROP TABLE joins;
DROP TABLE deals;
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

CREATE TABLE deals(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  description VARCHAR(255) not null,
  day_id INT8 references days(id),
  restaurant_id INT8 references restaurants(id)
);

CREATE TABLE joins(
  id SERIAL8 primary key,
  restaurant_id INT8 references restaurants(id),
  deal_id INT8 references deals(id)
);


