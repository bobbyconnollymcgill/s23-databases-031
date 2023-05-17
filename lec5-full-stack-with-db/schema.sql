-- -- Create a new PostgreSQL database
-- CREATE DATABASE zoo_management;

-- -- Connect to the newly created database
-- \c zoo_management;

CREATE TABLE enclosures (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  capacity INTEGER NOT NULL
);

-- Create the necessary tables for animals, enclosures, and staff
CREATE TABLE animals (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  species VARCHAR(255) NOT NULL,
  age INTEGER NOT NULL,
  enclosure_id INTEGER REFERENCES enclosures(id)
);

CREATE TABLE staff (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  position VARCHAR(255) NOT NULL,
  hire_date DATE NOT NULL
);