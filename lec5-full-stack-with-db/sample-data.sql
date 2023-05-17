-- Insert data into the enclosures table
INSERT INTO enclosures (name, capacity) VALUES ('Lion Den', 3);
INSERT INTO enclosures (name, capacity) VALUES ('Elephant House', 2);
INSERT INTO enclosures (name, capacity) VALUES ('Bird Aviary', 15);
INSERT INTO enclosures (name, capacity) VALUES ('Aquarium', 20);
INSERT INTO enclosures (name, capacity) VALUES ('Reptile House', 10);
INSERT INTO enclosures (name, capacity) VALUES ('Empty Enclosure', 5);

-- Insert data into the staff table
INSERT INTO staff (name, position, hire_date) VALUES ('John Doe', 'Zookeeper', '2020-05-01');
INSERT INTO staff (name, position, hire_date) VALUES ('Jane Smith', 'Veterinarian', '2018-03-15');
INSERT INTO staff (name, position, hire_date) VALUES ('Bob Johnson', 'Maintenance', '2019-07-30');

-- Insert data into the animals table
INSERT INTO animals (name, species, age, enclosure_id) VALUES ('Leo', 'Lion', 5, 1);
INSERT INTO animals (name, species, age, enclosure_id) VALUES ('Nelly', 'Elephant', 8, 2);
INSERT INTO animals (name, species, age, enclosure_id) VALUES ('Polly', 'Parrot', 2, 3);
INSERT INTO animals (name, species, age, enclosure_id) VALUES ('Nemo', 'Clownfish', 1, 4);
INSERT INTO animals (name, species, age, enclosure_id) VALUES ('Sly', 'Snake', 3, 5);
INSERT INTO animals (name, species, age, enclosure_id) VALUES ('Lizzy', 'Lizard', 2, 5);
INSERT INTO animals (name, species, age, enclosure_id) VALUES ('Fluffy', 'Lion', 4, 1);
INSERT INTO animals (name, species, age, enclosure_id) VALUES ('Bubbles', 'Clownfish', 2, 4);