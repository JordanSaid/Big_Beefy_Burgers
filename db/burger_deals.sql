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
  name VARCHAR(255) not null
);

CREATE TABLE burgers(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  price DECIMAL,
  restaurant_id INT8 references restaurants(id)
);

CREATE TABLE deals(
  id SERIAL8 primary key,
  name VARCHAR(255) not null,
  day_id INT8 references days(id),
  restaurant_id INT8 references restaurants(id)
);

-- CREATE TABLE join
-- (
--   id SERIAL8 primary key,
--   burger_id INT8 references burgers(id),
--   deal_id INT8 references deals(id)
-- )


