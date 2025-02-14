--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4 (Debian 16.4-1.pgdg120+2)
-- Dumped by pg_dump version 17.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.addresses (address_id, building_name, city, country, pincode, state, street) VALUES (1, 'Greenwood Towers', 'Los Angeles', 'USA', '900001', 'CA', '456 Oak Avenue');
INSERT INTO public.addresses (address_id, building_name, city, country, pincode, state, street) VALUES (2, 'Sunset Villas', 'Chicago', 'USA', '606001', 'IL', '789 Maple Lane');
INSERT INTO public.addresses (address_id, building_name, city, country, pincode, state, street) VALUES (3, 'Skyline Heights', 'Houston', 'USA', '770002', 'TX', '159 Birch Road');
INSERT INTO public.addresses (address_id, building_name, city, country, pincode, state, street) VALUES (4, 'Downtown Residences', 'Phoenix', 'USA', '850003', 'AZ', '753 Cedar Street');
INSERT INTO public.addresses (address_id, building_name, city, country, pincode, state, street) VALUES (5, 'Royal Estates', 'San Diego', 'USA', '921004', 'CA', '852 Pine Avenue');
INSERT INTO public.addresses (address_id, building_name, city, country, pincode, state, street) VALUES (6, 'Horizon Towers', 'Dallas', 'USA', '752005', 'TX', '963 Redwood Blvd');
INSERT INTO public.addresses (address_id, building_name, city, country, pincode, state, street) VALUES (7, 'Summit Apartments', 'San Antonio', 'USA', '782006', 'TX', '147 Spruce Drive');
INSERT INTO public.addresses (address_id, building_name, city, country, pincode, state, street) VALUES (8, 'Ocean View', 'San Francisco', 'USA', '941007', 'CA', '369 Palm Lane');
INSERT INTO public.addresses (address_id, building_name, city, country, pincode, state, street) VALUES (9, 'Grand Residences', 'Seattle', 'USA', '981008', 'WA', '951 Cherry Road');
INSERT INTO public.addresses (address_id, building_name, city, country, pincode, state, street) VALUES (10, 'Parkside Villas', 'Denver', 'USA', '802009', 'CO', '258 Willow Way');


--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.brands (brand_id, brand_logo, brand_name) VALUES (9, 'default.png', 'L''Oréal');
INSERT INTO public.brands (brand_id, brand_logo, brand_name) VALUES (10, 'default.png', 'Maybelline');
INSERT INTO public.brands (brand_id, brand_logo, brand_name) VALUES (11, 'default.png', 'Lego');
INSERT INTO public.brands (brand_id, brand_logo, brand_name) VALUES (12, 'default.png', 'Hasbro');
INSERT INTO public.brands (brand_id, brand_logo, brand_name) VALUES (13, 'default.png', 'Toyota');
INSERT INTO public.brands (brand_id, brand_logo, brand_name) VALUES (14, 'default.png', 'Ford');
INSERT INTO public.brands (brand_id, brand_logo, brand_name) VALUES (15, 'default.png', 'IKEA');
INSERT INTO public.brands (brand_id, brand_logo, brand_name) VALUES (16, 'default.png', 'Ashley Furniture');
INSERT INTO public.brands (brand_id, brand_logo, brand_name) VALUES (17, 'default.png', 'Nestlé');
INSERT INTO public.brands (brand_id, brand_logo, brand_name) VALUES (18, 'default.png', 'Kellogg''s');
INSERT INTO public.brands (brand_id, brand_logo, brand_name) VALUES (19, 'default.png', 'Whiskas');
INSERT INTO public.brands (brand_id, brand_logo, brand_name) VALUES (20, 'default.png', 'Pedigree');
INSERT INTO public.brands (brand_id, brand_logo, brand_name) VALUES (1, '13cb0566-80e7-4ef4-bd09-0700ca090c01.png', 'Samsung');
INSERT INTO public.brands (brand_id, brand_logo, brand_name) VALUES (2, 'a72f6f8d-3b9d-4932-8405-579ddcdb9a75.png', 'LG');
INSERT INTO public.brands (brand_id, brand_logo, brand_name) VALUES (3, '5e28fe93-bb6c-496a-b774-4275925c7316.png', 'Uniqlo');
INSERT INTO public.brands (brand_id, brand_logo, brand_name) VALUES (4, '8b7657e1-538d-4418-bedd-959e7a6382d3.png', 'The North Face');
INSERT INTO public.brands (brand_id, brand_logo, brand_name) VALUES (5, 'aeb4c6b5-26a2-42ad-9d95-c549c096a039.jpg', 'Penguin Random House');
INSERT INTO public.brands (brand_id, brand_logo, brand_name) VALUES (6, 'd1f857b0-8610-43eb-bbd6-c86eebd09834.jpg', 'HarperCollins');
INSERT INTO public.brands (brand_id, brand_logo, brand_name) VALUES (7, 'f21c2cec-c13a-44a4-ba30-f695e6b6f397.png', 'Under Armour');
INSERT INTO public.brands (brand_id, brand_logo, brand_name) VALUES (8, 'c89e290b-269b-4669-a72b-f7a8136ac8e6.png', 'Reebok');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (user_id, email, first_name, last_name, mobile_number, password) VALUES (1, 'michael.anderson@example.com', 'Michael', 'Anderson', '9123456789', '$2a$10$2rTxZF..W5w4P3jWuh.h3.dKxPCDbFUYCKU1tJ9FJaFOU5LV4jrjO');
INSERT INTO public.users (user_id, email, first_name, last_name, mobile_number, password) VALUES (2, 'sophia.martinez@example.com', 'Sophia', 'Martinez', '9234567890', '$2a$10$yr4xax2CO297QulgoC/RzewgT56UYhDNfcQUXvwnS/PMfF1A31BNO');
INSERT INTO public.users (user_id, email, first_name, last_name, mobile_number, password) VALUES (3, 'alexander.brown@example.com', 'Alexander', 'Brown', '9345678901', '$2a$10$29eMygBB4SzGR63uK9T9eeYWY0MovDNcX2LFTWXRkXu5NOsBOl4ai');
INSERT INTO public.users (user_id, email, first_name, last_name, mobile_number, password) VALUES (4, 'emily.garcia@example.com', 'Emily', 'Garcia', '9456789012', '$2a$10$yWvQ5KIIWFQ8zxUsMlcyuul6hHikzrqFUlW9zxocMN6vo1/6tzMGO');
INSERT INTO public.users (user_id, email, first_name, last_name, mobile_number, password) VALUES (5, 'benjamin.johnson@example.com', 'Benjamin', 'Johnson', '9567890123', '$2a$10$ZPNLZ3TAmfSG9.JRf9t.i.yVdlwTHQhJ.z7vKd7S4kZQwMbs6cZ8i');
INSERT INTO public.users (user_id, email, first_name, last_name, mobile_number, password) VALUES (6, 'olivia.lopez@example.com', 'Olivia', 'Lopez', '9678901234', '$2a$10$1Rcu7rRP7nIaHV0c/CATCO.S/SiF5BO8j1.sCebNwpb9r/LHDDzXe');
INSERT INTO public.users (user_id, email, first_name, last_name, mobile_number, password) VALUES (7, 'daniel.harris@example.com', 'Daniel', 'Harris', '9789012345', '$2a$10$slmyQOBs/OsXNhKowsA4AurjHPV4CtcuCgFPq0YCeSKYsdzuOcjuu');
INSERT INTO public.users (user_id, email, first_name, last_name, mobile_number, password) VALUES (8, 'isabella.white@example.com', 'Isabella', 'White', '9890123456', '$2a$10$ZQ9rPeHEyl1A.FvCSasA7.Hc8D/k/69t6QYtq.U2nu7xxNlRZKy2a');
INSERT INTO public.users (user_id, email, first_name, last_name, mobile_number, password) VALUES (9, 'james.clark@example.com', 'James', 'Clark', '9901234567', '$2a$10$1/aHa.dbs5gFjUxAXaTEsOrrp7eb7GQUwCdmc45lKpxUfPoMQ6.hS');
INSERT INTO public.users (user_id, email, first_name, last_name, mobile_number, password) VALUES (10, 'charlotte.hall@example.com', 'Charlotte', 'Halls', '9012345678', '$2a$10$.27Alyi3X7c8ryAF4mWpxu1LOFD91ua0SajhP6ehzxbBhQ5JdTgiu');


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.carts (cart_id, total_price, user_id) VALUES (2, 5130000, 2);
INSERT INTO public.carts (cart_id, total_price, user_id) VALUES (3, 40960000, 3);
INSERT INTO public.carts (cart_id, total_price, user_id) VALUES (4, 1900000, 4);
INSERT INTO public.carts (cart_id, total_price, user_id) VALUES (5, 46159800, 5);
INSERT INTO public.carts (cart_id, total_price, user_id) VALUES (6, 5940000, 6);
INSERT INTO public.carts (cart_id, total_price, user_id) VALUES (7, 7494000, 7);
INSERT INTO public.carts (cart_id, total_price, user_id) VALUES (8, 26830000, 8);
INSERT INTO public.carts (cart_id, total_price, user_id) VALUES (9, 1060200, 9);
INSERT INTO public.carts (cart_id, total_price, user_id) VALUES (10, 26985000, 10);
INSERT INTO public.carts (cart_id, total_price, user_id) VALUES (1, 29650000, 1);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.categories (category_id, category_name) VALUES (1, 'Home Appliances');
INSERT INTO public.categories (category_id, category_name) VALUES (2, 'Clothing');
INSERT INTO public.categories (category_id, category_name) VALUES (3, 'Books');
INSERT INTO public.categories (category_id, category_name) VALUES (4, 'Sports & Fitness');
INSERT INTO public.categories (category_id, category_name) VALUES (5, 'Beauty & Personal Care');
INSERT INTO public.categories (category_id, category_name) VALUES (6, 'Toys & Games');
INSERT INTO public.categories (category_id, category_name) VALUES (7, 'Automotive');
INSERT INTO public.categories (category_id, category_name) VALUES (8, 'Furniture');
INSERT INTO public.categories (category_id, category_name) VALUES (9, 'Groceries');
INSERT INTO public.categories (category_id, category_name) VALUES (10, 'Pet Supplies');


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (21, 'Buildable Star Wars spaceship with minifigures', 10, 'default.png', 1500000, 'Lego Star Wars Set', 25, 1350000, 11, 6);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (22, 'Interactive police station playset', 8, 'default.png', 1200000, 'Lego City Police Station', 30, 1104000, 11, 6);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (23, 'Classic Monopoly board game for family fun', 5, 'default.png', 500000, 'Hasbro Monopoly Board Game', 40, 475000, 12, 6);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (24, 'Soft dart blaster for action-packed play', 8, 'default.png', 700000, 'Hasbro Nerf Blaster', 25, 644000, 12, 6);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (26, 'Long-lasting and reliable car battery', 10, 'default.png', 2500000, 'Toyota Car Battery', 20, 2250000, 13, 7);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (27, 'Durable brake pads for optimal performance', 8, 'default.png', 1500000, 'Ford Brake Pads', 25, 1380000, 14, 7);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (28, 'High-quality windshield wipers for clear visibility', 5, 'default.png', 600000, 'Ford Windshield Wipers', 30, 570000, 14, 7);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (30, 'Spacious bookshelf for organizing books and decor', 10, 'default.png', 1800000, 'IKEA Bookshelf', 30, 1620000, 15, 8);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (31, 'Comfortable and stylish recliner sofa', 15, 'default.png', 5000000, 'Ashley Recliner Sofa', 25, 4250000, 16, 8);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (32, 'Elegant queen-size bed frame', 12, 'default.png', 4000000, 'Ashley Queen Bed Frame', 20, 3520000, 16, 8);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (33, 'Delicious milk chocolate bar', 5, 'default.png', 20000, 'Nestlé Chocolate Bar', 50, 19000, 17, 9);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (34, 'Premium instant coffee', 8, 'default.png', 150000, 'Nestlé Coffee', 40, 138000, 17, 9);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (35, 'Classic breakfast cereal', 7, 'default.png', 75000, 'Kellogg''s Corn Flakes', 30, 69750, 18, 9);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (36, 'Healthy and crunchy granola mix', 10, 'default.png', 120000, 'Kellogg''s Granola', 25, 108000, 18, 9);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (37, 'Nutritious dry cat food', 8, 'default.png', 120000, 'Whiskas Cat Food', 40, 110400, 19, 10);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (38, 'Tasty wet food for cats', 6, 'default.png', 80000, 'Whiskas Wet Food', 30, 75200, 19, 10);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (40, 'Tasty and healthy dog treats', 5, 'default.png', 90000, 'Pedigree Dog Treats', 25, 85500, 20, 10);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (17, 'Anti-aging serum for youthful skin', 10, 'default.png', 900000, 'L''Oréal Face Serum', 34, 810000, 9, 5);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (10, 'Dystopian novel by George Orwell', 7, 'default.png', 180000, '1984', 38, 167400, 5, 3);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (9, 'Classic novel by F. Scott Fitzgerald', 5, 'default.png', 150000, 'The Great Gatsby', 44, 142500, 5, 3);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (8, 'Durable and waterproof hiking boots', 10, 'default.png', 2500000, 'The North Face Hiking Boots', 9, 2250000, 4, 2);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (39, 'Balanced nutrition dry dog food', 7, 'default.png', 150000, 'Pedigree Dog Food', 46, 139500, 20, 10);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (12, 'Science fiction novel by Aldous Huxley', 5, 'default.png', 160000, 'Brave New World', 24, 152000, 6, 3);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (19, 'Waterproof and volumizing mascara', 5, 'default.png', 200000, 'Maybelline Mascara', 29, 190000, 10, 5);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (20, 'Long-lasting foundation for a flawless look', 7, 'default.png', 400000, 'Maybelline Foundation', 30, 372000, 10, 5);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (15, 'Flexible and comfortable shorts for training', 7, 'default.png', 450000, 'Reebok Training Shorts', 25, 418500, 8, 4);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (1, '55-inch 4K UHD Smart TV with HDR', 5, 'default.png', 12000000, 'Samsung Smart TV', 20, 11400000, 1, 1);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (16, 'Non-slip yoga mat for home workouts', 5, 'default.png', 700000, 'Reebok Yoga Mat', 16, 665000, 8, 4);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (11, 'Pulitzer Prize-winning novel by Harper Lee', 6, 'default.png', 170000, 'To Kill a Mockingbird', 35, 159800, 6, 3);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (4, 'Convection Microwave Oven with Smart Inverter', 5, 'default.png', 5000000, 'LG Microwave Oven', 14, 4750000, 2, 1);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (25, 'High-performance synthetic engine oil', 7, 'default.png', 900000, 'Toyota Engine Oil', 25, 837000, 13, 7);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (6, 'Warm yet lightweight down jacket for winter', 10, 'default.png', 1500000, 'Uniqlo Ultra Light Down Jacket', 20, 1350000, 3, 2);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (13, 'Lightweight and comfortable running shoes', 10, 'default.png', 1200000, 'Under Armour Running Shoes', 20, 1080000, 7, 4);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (29, 'Modern wooden dining table for 4 people', 12, 'default.png', 3500000, 'IKEA Dining Table', 19, 3080000, 15, 8);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (5, 'Breathable and lightweight AIRism cotton t-shirt', 15, 'default.png', 300000, 'Uniqlo AIRism T-Shirt', 34, 255000, 3, 2);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (7, 'Soft and warm fleece jacket for outdoor adventures', 12, 'default.png', 2000000, 'The North Face Fleece Jacket', 23, 1760000, 4, 2);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (18, 'Nourishing shampoo for strong and healthy hair', 8, 'default.png', 350000, 'L''Oréal Shampoo', 44, 322000, 9, 5);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (2, 'Double Door Refrigerator with Digital Inverter Technology', 10, 'default.png', 15000000, 'Samsung Refrigerator', 25, 13500000, 1, 1);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (14, 'Breathable and tight-fitting compression shirt', 8, 'default.png', 500000, 'Under Armour Compression Shirt', 33, 460000, 7, 4);
INSERT INTO public.products (product_id, description, discount, image, price, product_name, quantity, special_price, brand_id, category_id) VALUES (3, 'Front Load Washing Machine with Steam Technology', 8, 'default.png', 10000000, 'LG Washing Machine', 11, 9200000, 2, 1);


--
-- Data for Name: cart_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.cart_items (cart_item_id, discount, product_price, quantity, cart_id, product_id) VALUES (23, 12, 1760000, 2, 2, 7);
INSERT INTO public.cart_items (cart_item_id, discount, product_price, quantity, cart_id, product_id) VALUES (24, 8, 322000, 5, 2, 18);
INSERT INTO public.cart_items (cart_item_id, discount, product_price, quantity, cart_id, product_id) VALUES (25, 10, 13500000, 3, 3, 2);
INSERT INTO public.cart_items (cart_item_id, discount, product_price, quantity, cart_id, product_id) VALUES (26, 8, 460000, 1, 3, 14);
INSERT INTO public.cart_items (cart_item_id, discount, product_price, quantity, cart_id, product_id) VALUES (27, 5, 142500, 4, 4, 9);
INSERT INTO public.cart_items (cart_item_id, discount, product_price, quantity, cart_id, product_id) VALUES (28, 5, 665000, 2, 4, 16);
INSERT INTO public.cart_items (cart_item_id, discount, product_price, quantity, cart_id, product_id) VALUES (29, 8, 9200000, 5, 5, 3);
INSERT INTO public.cart_items (cart_item_id, discount, product_price, quantity, cart_id, product_id) VALUES (30, 6, 159800, 1, 5, 11);
INSERT INTO public.cart_items (cart_item_id, discount, product_price, quantity, cart_id, product_id) VALUES (31, 10, 1350000, 2, 6, 6);
INSERT INTO public.cart_items (cart_item_id, discount, product_price, quantity, cart_id, product_id) VALUES (32, 10, 810000, 4, 6, 17);
INSERT INTO public.cart_items (cart_item_id, discount, product_price, quantity, cart_id, product_id) VALUES (33, 10, 2250000, 3, 7, 8);
INSERT INTO public.cart_items (cart_item_id, discount, product_price, quantity, cart_id, product_id) VALUES (34, 7, 372000, 2, 7, 20);
INSERT INTO public.cart_items (cart_item_id, discount, product_price, quantity, cart_id, product_id) VALUES (35, 5, 4750000, 5, 8, 4);
INSERT INTO public.cart_items (cart_item_id, discount, product_price, quantity, cart_id, product_id) VALUES (36, 12, 3080000, 1, 8, 29);
INSERT INTO public.cart_items (cart_item_id, discount, product_price, quantity, cart_id, product_id) VALUES (37, 7, 167400, 3, 9, 10);
INSERT INTO public.cart_items (cart_item_id, discount, product_price, quantity, cart_id, product_id) VALUES (38, 7, 139500, 4, 9, 39);
INSERT INTO public.cart_items (cart_item_id, discount, product_price, quantity, cart_id, product_id) VALUES (39, 5, 11400000, 2, 10, 1);
INSERT INTO public.cart_items (cart_item_id, discount, product_price, quantity, cart_id, product_id) VALUES (40, 7, 837000, 5, 10, 25);
INSERT INTO public.cart_items (cart_item_id, discount, product_price, quantity, cart_id, product_id) VALUES (41, 8, 9200000, 2, 1, 3);
INSERT INTO public.cart_items (cart_item_id, discount, product_price, quantity, cart_id, product_id) VALUES (42, 10, 2250000, 5, 1, 8);


--
-- Data for Name: coupons; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.coupons (coupon_id, code, discount_amount, expiry_date, redeem_count, redeem_quota, start_date) VALUES (2, 'SUMMER15', 15000, '2025-08-31', 0, 200, '2025-05-01');
INSERT INTO public.coupons (coupon_id, code, discount_amount, expiry_date, redeem_count, redeem_quota, start_date) VALUES (3, 'FALL20', 20000, '2025-11-30', 0, 150, '2025-09-01');
INSERT INTO public.coupons (coupon_id, code, discount_amount, expiry_date, redeem_count, redeem_quota, start_date) VALUES (4, 'WINTER25', 25000, '2026-02-28', 0, 180, '2025-12-01');
INSERT INTO public.coupons (coupon_id, code, discount_amount, expiry_date, redeem_count, redeem_quota, start_date) VALUES (5, 'WELCOME5', 5000, '2025-12-31', 0, 500, '2025-03-01');
INSERT INTO public.coupons (coupon_id, code, discount_amount, expiry_date, redeem_count, redeem_quota, start_date) VALUES (6, 'LOYAL30', 30000, '2026-06-30', 0, 250, '2025-06-01');
INSERT INTO public.coupons (coupon_id, code, discount_amount, expiry_date, redeem_count, redeem_quota, start_date) VALUES (7, 'VIP50', 50000, '2026-07-31', 0, 100, '2025-07-01');
INSERT INTO public.coupons (coupon_id, code, discount_amount, expiry_date, redeem_count, redeem_quota, start_date) VALUES (8, 'FLASH12', 12000, '2025-06-30', 0, 300, '2025-03-01');
INSERT INTO public.coupons (coupon_id, code, discount_amount, expiry_date, redeem_count, redeem_quota, start_date) VALUES (9, 'HOLIDAY40', 40000, '2026-01-15', 0, 220, '2025-11-01');
INSERT INTO public.coupons (coupon_id, code, discount_amount, expiry_date, redeem_count, redeem_quota, start_date) VALUES (10, 'NEWYEAR20', 20000, '2026-03-31', 0, 180, '2025-12-25');
INSERT INTO public.coupons (coupon_id, code, discount_amount, expiry_date, redeem_count, redeem_quota, start_date) VALUES (1, 'SPRING10', 10000, '2025-04-30', 1, 100, '2025-02-13');


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.payments (payment_id, payment_method) VALUES (1, 'PayPal');
INSERT INTO public.payments (payment_id, payment_method) VALUES (2, 'Debit');
INSERT INTO public.payments (payment_id, payment_method) VALUES (3, 'Credit');
INSERT INTO public.payments (payment_id, payment_method) VALUES (4, 'Apple Pay');
INSERT INTO public.payments (payment_id, payment_method) VALUES (5, 'Google Pay');
INSERT INTO public.payments (payment_id, payment_method) VALUES (6, 'Bank Transfer');
INSERT INTO public.payments (payment_id, payment_method) VALUES (7, 'QRIS');
INSERT INTO public.payments (payment_id, payment_method) VALUES (8, 'Cash on Delivery');
INSERT INTO public.payments (payment_id, payment_method) VALUES (9, 'Pay Later');
INSERT INTO public.payments (payment_id, payment_method) VALUES (10, 'Venmo');


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (order_id, email, order_date, order_status, total_amount, payment_id, final_amount, coupon_id) VALUES (1, 'michael.anderson@example.com', '2025-02-14', 'Order Accepted !', 29650000, 1, 29650000, NULL);
INSERT INTO public.orders (order_id, email, order_date, order_status, total_amount, payment_id, final_amount, coupon_id) VALUES (2, 'sophia.martinez@example.com', '2025-02-14', 'Order Accepted !', 4510000, 2, 4510000, NULL);
INSERT INTO public.orders (order_id, email, order_date, order_status, total_amount, payment_id, final_amount, coupon_id) VALUES (3, 'alexander.brown@example.com', '2025-02-14', 'Order Accepted !', 2289600, 3, 2289600, NULL);
INSERT INTO public.orders (order_id, email, order_date, order_status, total_amount, payment_id, final_amount, coupon_id) VALUES (4, 'emily.garcia@example.com', '2025-02-14', 'Order Accepted !', 955000, 4, 955000, NULL);
INSERT INTO public.orders (order_id, email, order_date, order_status, total_amount, payment_id, final_amount, coupon_id) VALUES (5, 'benjamin.johnson@example.com', '2025-02-14', 'Order Accepted !', 2377500, 5, 2377500, NULL);
INSERT INTO public.orders (order_id, email, order_date, order_status, total_amount, payment_id, final_amount, coupon_id) VALUES (6, 'olivia.lopez@example.com', '2025-02-14', 'Order Accepted !', 14554000, 6, 14554000, NULL);
INSERT INTO public.orders (order_id, email, order_date, order_status, total_amount, payment_id, final_amount, coupon_id) VALUES (7, 'daniel.harris@example.com', '2025-02-14', 'Order Accepted !', 9122000, 7, 9122000, NULL);
INSERT INTO public.orders (order_id, email, order_date, order_status, total_amount, payment_id, final_amount, coupon_id) VALUES (8, 'isabella.white@example.com', '2025-02-14', 'Order Accepted !', 1755200, 8, 1755200, NULL);
INSERT INTO public.orders (order_id, email, order_date, order_status, total_amount, payment_id, final_amount, coupon_id) VALUES (9, 'james.clark@example.com', '2025-02-14', 'Order Accepted !', 32400000, 9, 32400000, NULL);
INSERT INTO public.orders (order_id, email, order_date, order_status, total_amount, payment_id, final_amount, coupon_id) VALUES (10, 'charlotte.hall@example.com', '2025-02-14', 'Order Accepted !', 35530000, 10, 35530000, NULL);
INSERT INTO public.orders (order_id, email, order_date, order_status, total_amount, payment_id, final_amount, coupon_id) VALUES (11, 'michael.anderson@example.com', '2025-02-14', 'Order Accepted !', 1373000, 1, 1363000, 1);


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.order_items (order_item_id, discount, ordered_product_price, quantity, order_id, product_id) VALUES (1, 8, 9200000, 2, 1, 3);
INSERT INTO public.order_items (order_item_id, discount, ordered_product_price, quantity, order_id, product_id) VALUES (2, 10, 2250000, 5, 1, 8);
INSERT INTO public.order_items (order_item_id, discount, ordered_product_price, quantity, order_id, product_id) VALUES (3, 10, 1350000, 3, 2, 6);
INSERT INTO public.order_items (order_item_id, discount, ordered_product_price, quantity, order_id, product_id) VALUES (4, 8, 460000, 1, 2, 14);
INSERT INTO public.order_items (order_item_id, discount, ordered_product_price, quantity, order_id, product_id) VALUES (5, 7, 167400, 4, 3, 10);
INSERT INTO public.order_items (order_item_id, discount, ordered_product_price, quantity, order_id, product_id) VALUES (6, 10, 810000, 2, 3, 17);
INSERT INTO public.order_items (order_item_id, discount, ordered_product_price, quantity, order_id, product_id) VALUES (7, 15, 255000, 3, 4, 5);
INSERT INTO public.order_items (order_item_id, discount, ordered_product_price, quantity, order_id, product_id) VALUES (8, 5, 190000, 1, 4, 19);
INSERT INTO public.order_items (order_item_id, discount, ordered_product_price, quantity, order_id, product_id) VALUES (9, 5, 142500, 2, 5, 9);
INSERT INTO public.order_items (order_item_id, discount, ordered_product_price, quantity, order_id, product_id) VALUES (10, 7, 418500, 5, 5, 15);
INSERT INTO public.order_items (order_item_id, discount, ordered_product_price, quantity, order_id, product_id) VALUES (11, 5, 4750000, 3, 6, 4);
INSERT INTO public.order_items (order_item_id, discount, ordered_product_price, quantity, order_id, product_id) VALUES (12, 5, 152000, 2, 6, 12);
INSERT INTO public.order_items (order_item_id, discount, ordered_product_price, quantity, order_id, product_id) VALUES (13, 12, 1760000, 5, 7, 7);
INSERT INTO public.order_items (order_item_id, discount, ordered_product_price, quantity, order_id, product_id) VALUES (14, 8, 322000, 1, 7, 18);
INSERT INTO public.order_items (order_item_id, discount, ordered_product_price, quantity, order_id, product_id) VALUES (15, 6, 159800, 4, 8, 11);
INSERT INTO public.order_items (order_item_id, discount, ordered_product_price, quantity, order_id, product_id) VALUES (16, 7, 372000, 3, 8, 20);
INSERT INTO public.order_items (order_item_id, discount, ordered_product_price, quantity, order_id, product_id) VALUES (17, 10, 13500000, 2, 9, 2);
INSERT INTO public.order_items (order_item_id, discount, ordered_product_price, quantity, order_id, product_id) VALUES (18, 10, 1080000, 5, 9, 13);
INSERT INTO public.order_items (order_item_id, discount, ordered_product_price, quantity, order_id, product_id) VALUES (19, 5, 11400000, 3, 10, 1);
INSERT INTO public.order_items (order_item_id, discount, ordered_product_price, quantity, order_id, product_id) VALUES (20, 5, 665000, 2, 10, 16);
INSERT INTO public.order_items (order_item_id, discount, ordered_product_price, quantity, order_id, product_id) VALUES (21, 5, 152000, 4, 11, 12);
INSERT INTO public.order_items (order_item_id, discount, ordered_product_price, quantity, order_id, product_id) VALUES (22, 15, 255000, 3, 11, 5);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.roles (role_id, role_name) VALUES (101, 'ADMIN');
INSERT INTO public.roles (role_id, role_name) VALUES (102, 'USER');


--
-- Data for Name: user_address; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_address (user_id, address_id) VALUES (1, 1);
INSERT INTO public.user_address (user_id, address_id) VALUES (2, 2);
INSERT INTO public.user_address (user_id, address_id) VALUES (3, 3);
INSERT INTO public.user_address (user_id, address_id) VALUES (4, 4);
INSERT INTO public.user_address (user_id, address_id) VALUES (5, 5);
INSERT INTO public.user_address (user_id, address_id) VALUES (6, 6);
INSERT INTO public.user_address (user_id, address_id) VALUES (7, 7);
INSERT INTO public.user_address (user_id, address_id) VALUES (8, 8);
INSERT INTO public.user_address (user_id, address_id) VALUES (9, 9);
INSERT INTO public.user_address (user_id, address_id) VALUES (10, 10);


--
-- Data for Name: user_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.user_role (user_id, role_id) VALUES (1, 101);
INSERT INTO public.user_role (user_id, role_id) VALUES (1, 102);
INSERT INTO public.user_role (user_id, role_id) VALUES (2, 102);
INSERT INTO public.user_role (user_id, role_id) VALUES (3, 102);
INSERT INTO public.user_role (user_id, role_id) VALUES (4, 102);
INSERT INTO public.user_role (user_id, role_id) VALUES (5, 102);
INSERT INTO public.user_role (user_id, role_id) VALUES (6, 102);
INSERT INTO public.user_role (user_id, role_id) VALUES (7, 102);
INSERT INTO public.user_role (user_id, role_id) VALUES (8, 102);
INSERT INTO public.user_role (user_id, role_id) VALUES (9, 102);
INSERT INTO public.user_role (user_id, role_id) VALUES (10, 102);


--
-- Name: addresses_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.addresses_address_id_seq', 10, true);


--
-- Name: brands_brand_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brands_brand_id_seq', 20, true);


--
-- Name: cart_items_cart_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cart_items_cart_item_id_seq', 42, true);


--
-- Name: carts_cart_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carts_cart_id_seq', 10, true);


--
-- Name: categories_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_category_id_seq', 10, true);


--
-- Name: coupons_coupon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.coupons_coupon_id_seq', 10, true);


--
-- Name: order_items_order_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_order_item_id_seq', 22, true);


--
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 11, true);


--
-- Name: payments_payment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.payments_payment_id_seq', 11, true);


--
-- Name: products_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_seq', 51, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 10, true);


--
-- PostgreSQL database dump complete
--

