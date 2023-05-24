-- -- Restaurants
-- INSERT INTO restaurants (name, location, phone, opening_hours, cuisine_type)
-- VALUES 
-- ('La Bella Italia', 'New York', '1234567890', '10 AM - 11 PM', 'Italian'),
-- ('Sushi Express', 'Los Angeles', '0987654321', '11 AM - 10 PM', 'Japanese'),
-- ('The Spice Market', 'San Francisco', '1234987650', '9 AM - 9 PM', 'Indian'),
-- ('Pasta Fresca', 'Toronto', '2345678901', '10 AM - 10 PM', 'Italian'),
-- ('Ocean Bites', 'Vancouver', '3456789012', '11 AM - 10 PM', 'Seafood'),
-- ('Ginger Express', 'Ottawa', '4567890123', '12 PM - 9 PM', 'Chinese'),
-- ('Grilled Heaven', 'Edmonton', '5678901234', '11 AM - 11 PM', 'American'),
-- ('French Delight', 'Quebec City', '6789012345', '10 AM - 10 PM', 'French'),
-- ('Crispy Poutine', 'Montreal', '7890123456', '11 AM - 10 PM', 'Canadian'),
-- ('Biryani House', 'Winnipeg', '8901234567', '12 PM - 9 PM', 'Indian'),
-- ('Kimchi Place', 'Calgary', '9012345678', '11 AM - 11 PM', 'Korean');

-- -- Chefs
-- INSERT INTO chefs (name, experience_years, specialty, restaurant_id)
-- VALUES 
-- ('Mario Rossi', 15, 'Pasta', 1),
-- ('Sakura Tanaka', 12, 'Sushi', 2),
-- ('Raj Kapoor', 20, 'Curry', 3),
-- ('Giorgio Conti', 10, 'Lasagna', 4),
-- ('Molly Sanderson', 12, 'Fish & Chips', 5),
-- ('Liam Ong', 14, 'General Tso Chicken', 6),
-- ('Aaron Stone', 16, 'Steak', 7),
-- ('Marie Claude', 18, 'Croissant', 8),
-- ('Andre Lavoie', 13, 'Poutine', 9),
-- ('Ananya Sharma', 14, 'Biryani', 10),
-- ('Jae Lee', 15, 'Bulgogi', 11);

-- -- Dishes
-- INSERT INTO dishes (name, price, description, chef_id)
-- VALUES 
-- ('Spaghetti Carbonara', 18.00, 'Classic Italian pasta dish with eggs, cheese, pancetta, and pepper', 1),
-- ('California Roll', 10.50, 'Sushi roll filled with cucumber, crab, and avocado', 2),
-- ('Chicken Tikka Masala', 15.00, 'Grilled chunks of chicken enveloped in a creamy spiced tomato sauce', 3),
-- ('Lasagna Bolognese', 20.00, 'Traditional Italian lasagna with meat and cheese', 4),
-- ('Fish & Chips', 15.00, 'Classic dish with crispy fish fillet and fries', 5),
-- ('General Tso Chicken', 18.50, 'Fried chicken in a sweet, slightly spicy sauce, with steamed rice', 6),
-- ('Ribeye Steak', 25.00, 'Grilled ribeye steak with veggies', 7),
-- ('Croissant and Coffee', 8.00, 'Freshly baked croissant with hot coffee', 8),
-- ('Classic Poutine', 10.00, 'Fries with cheese curds and gravy', 9),
-- ('Chicken Biryani', 18.00, 'Aromatic rice with spiced chicken', 10),
-- ('Beef Bulgogi', 20.00, 'Sweet and savory marinated beef', 11);

-- Ingredients
INSERT INTO ingredients (name, unit)
VALUES 
('Eggs', 'pcs'),
('Cheese', 'grams'),
('Pancetta', 'grams'),
('Cucumber', 'pcs'),
('Crab', 'grams'),
('Avocado', 'pcs'),
('Chicken', 'grams'),
('Tomato Sauce', 'grams'),
('Lasagna Sheets', 'pcs'),
('Meat Sauce', 'grams'),
('Bechamel Sauce', 'grams'),
('Fish Fillet', 'grams'),
('Potatoes', 'grams'),
('Chicken', 'grams'),
('Rice', 'grams'),
('Soy Sauce', 'ml'),
('Beef', 'grams'),
('Bulgogi Marinade', 'grams'),
('Coffee', 'ml'),
('Gravy', 'ml');

-- Dish_Ingredients
INSERT INTO dish_ingredients (dish_id, ingredient_id, quantity)
VALUES 
(1, 1, 2),
(1, 2, 100),
(1, 3, 200),
(2, 4, 1),
(2, 5, 100),
(2, 6, 1),
(3, 7, 200),
(3, 8, 300),
(4, 9, 2),
(4, 10, 300),
(4, 11, 200),
(5, 12, 200),
(5, 13, 300),
(6, 14, 200),
(6, 15, 300),
(7, 16, 300),
(8, 19, 250),
(9, 13, 300),
(9, 2, 150),
(9, 20, 100),
(10, 14, 200),
(10, 15, 300),
(11, 17, 300),
(11, 18, 200);

-- Customers
INSERT INTO customers (name, email, phone)
VALUES 
('John Doe', 'john.doe@example.com', '5678901234'),
('Jane Smith', 'jane.smith@example.com', '0987654321'),
('Sophia Brown', 'sophia.brown@example.com', '8901234567'),
('Michael Lee', 'michael.lee@example.com', '9012345678'),
('Emily Clark', 'emily.clark@example.com', '9876543210'),
('James Johnson', 'james.johnson@example.com', '8765432109'),
('Emma Martinez', 'emma.martinez@example.com', '7654321098'),
('David Smith', 'david.smith@example.com', '6543210987');

-- Orders
INSERT INTO orders (customer_id, restaurant_id, order_date, total)
VALUES 
(1, 1, '2023-05-01 19:30:00', 36.00),
(2, 2, '2023-05-02 12:30:00', 21.00),
(1, 3, '2023-05-03 20:00:00', 30.00),
(3, 4, '2023-05-01 12:30:00', 40.00),
(4, 5, '2023-05-02 19:00:00', 30.00),
(5, 6, '2023-05-03 13:00:00', 37.00),
(6, 7, '2023-05-04 18:30:00', 50.00),
(3, 8, '2023-05-05 10:00:00', 16.00),
(4, 9, '2023-05-06 14:00:00', 20.00),
(5, 10, '2023-05-07 12:30:00', 36.00),
(6, 11, '2023-05-08 18:30:00', 40.00),
(2, 1, '2023-05-09 19:30:00', 54.00),
(3, 2, '2023-05-10 12:30:00', 10.50),
(4, 3, '2023-05-11 20:00:00', 30.00),
(1, 4, '2023-05-12 12:30:00', 60.00),
(2, 5, '2023-05-13 19:00:00', 15.00),
(3, 6, '2023-05-14 13:00:00', 74.00),
(4, 7, '2023-05-15 18:30:00', 50.00),
(1, 8, '2023-05-16 10:00:00', 16.00),
(2, 9, '2023-05-17 14:00:00', 30.00),
(3, 10, '2023-05-18 12:30:00', 36.00),
(4, 11, '2023-05-19 18:30:00', 20.00);

-- Order_Items
INSERT INTO order_items (order_id, dish_id, quantity, price)
VALUES 
(1, 1, 2, 36.00),
(2, 2, 2, 21.00),
(3, 3, 2, 30.00),
(4, 4, 2, 40.00),
(5, 5, 2, 30.00),
(6, 6, 2, 37.00),
(7, 7, 2, 50.00),
(8, 8, 2, 16.00),
(9, 9, 2, 20.00),
(10, 10, 2, 36.00),
(11, 11, 2, 40.00),
(12, 1, 3, 54.00), 
(13, 2, 1, 10.50), 
(14, 3, 2, 30.00), 
(15, 4, 3, 60.00), 
(16, 5, 1, 15.00), 
(17, 6, 4, 74.00), 
(18, 7, 2, 50.00), 
(19, 8, 2, 16.00), 
(20, 9, 3, 30.00), 
(21, 10, 2, 36.00), 
(22, 11, 1, 20.00); 