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

INSERT INTO days (id, name) VALUES (1, 'Monday');
INSERT INTO days (id, name) VALUES (2, 'Tuesday');
INSERT INTO days (id, name) VALUES (3, 'Wednesday');
INSERT INTO days (id, name) VALUES (4, 'Thursday'); 
INSERT INTO days (id, name) VALUES (5, 'Friday'); 
INSERT INTO days (id, name) VALUES (6, 'Saturday'); 
INSERT INTO days (id, name) VALUES (7, 'Sunday');
INSERT INTO days (id, name)
  VALUES (8, 'Everyday');
INSERT INTO days (id, name)
  VALUES (9, 'Not Weekends')




