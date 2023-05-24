CREATE TABLE restaurants (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    opening_hours VARCHAR(50),
    cuisine_type VARCHAR(100)
);

CREATE TABLE chefs (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    experience_years INTEGER,
    specialty VARCHAR(255),
    restaurant_id INTEGER,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants (id) ON DELETE CASCADE
);

CREATE TABLE dishes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    price DECIMAL(5, 2),
    description TEXT,
    chef_id INTEGER,
    FOREIGN KEY (chef_id) REFERENCES chefs (id) ON DELETE CASCADE
);

CREATE TABLE ingredients (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    unit VARCHAR(50)
);

-- junction table that makes it "many-to-many" between dishes and ingredients
CREATE TABLE dish_ingredients (
    dish_id INTEGER,
    ingredient_id INTEGER,
    quantity DECIMAL(5, 2),
    PRIMARY KEY (dish_id, ingredient_id),
    FOREIGN KEY (dish_id) REFERENCES dishes (id) ON DELETE CASCADE,
    FOREIGN KEY (ingredient_id) REFERENCES ingredients (id) ON DELETE CASCADE
);

CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20)
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    restaurant_id INTEGER,
    order_date TIMESTAMP,
    total DECIMAL(7, 2),
    FOREIGN KEY (customer_id) REFERENCES customers (id) ON DELETE CASCADE,
    FOREIGN KEY (restaurant_id) REFERENCES restaurants (id) ON DELETE CASCADE
);

CREATE TABLE order_items (
    order_id INTEGER,
    dish_id INTEGER,
    quantity INTEGER,
    price DECIMAL(5, 2),
    PRIMARY KEY (order_id, dish_id),
    FOREIGN KEY (order_id) REFERENCES orders (id) ON DELETE CASCADE,
    FOREIGN KEY (dish_id) REFERENCES dishes (id) ON DELETE CASCADE
);