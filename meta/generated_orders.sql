-- Optimized SQL Insert statements
SET SQL_MODE='NO_AUTO_VALUE_ON_ZERO';
START TRANSACTION;
INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-01 10:00:00', 'Street 619, City 0X', 'completed', 839.77, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 7, 39.99), (NULL, @order_id, 3, 4, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-02 10:00:00', 'Street 989, City 1X', 'completed', 779.81, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 6, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-03 10:00:00', 'Street 541, City 2X', 'completed', 769.79, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-04 10:00:00', 'Street 102, City 3X', 'completed', 889.77, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 7, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-05 10:00:00', 'Street 175, City 4X', 'completed', 1079.73, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 12, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-06 10:00:00', 'Street 243, City 5X', 'completed', 889.78, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-07 10:00:00', 'Street 931, City 6X', 'completed', 339.89, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 1, 39.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-08 10:00:00', 'Street 703, City 7X', 'completed', 879.76, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 14, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-09 10:00:00', 'Street 308, City 8X', 'completed', 1009.76, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 7, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 12, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-10 10:00:00', 'Street 991, City 9X', 'completed', 1079.72, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 14, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 10, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-11 10:00:00', 'Street 817, City 10X', 'completed', 819.79, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 7, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-12 10:00:00', 'Street 496, City 11X', 'completed', 1319.66, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 13, 29.99), (NULL, @order_id, 2, 12, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-13 10:00:00', 'Street 337, City 12X', 'completed', 699.81, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 4, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-14 10:00:00', 'Street 755, City 13X', 'completed', 719.81, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-15 10:00:00', 'Street 640, City 14X', 'completed', 989.77, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 5, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 12, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-16 10:00:00', 'Street 200, City 15X', 'completed', 829.79, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-17 10:00:00', 'Street 604, City 16X', 'completed', 959.75, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 13, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-18 10:00:00', 'Street 667, City 17X', 'completed', 619.84, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 3, 7, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-19 10:00:00', 'Street 70, City 18X', 'completed', 1119.72, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 12, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-20 10:00:00', 'Street 367, City 19X', 'completed', 489.88, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 5, 29.99), (NULL, @order_id, 2, 1, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-21 10:00:00', 'Street 973, City 20X', 'completed', 879.79, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 7, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 11, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-22 10:00:00', 'Street 641, City 21X', 'completed', 1179.71, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 13, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-23 10:00:00', 'Street 478, City 22X', 'completed', 839.79, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-24 10:00:00', 'Street 340, City 23X', 'completed', 1259.70, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 16, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-25 10:00:00', 'Street 297, City 24X', 'completed', 629.82, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 3, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-26 10:00:00', 'Street 978, City 25X', 'completed', 1479.64, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 13, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 17, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-27 10:00:00', 'Street 861, City 26X', 'completed', 779.79, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-28 10:00:00', 'Street 789, City 27X', 'completed', 1059.74, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 8, 39.99), (NULL, @order_id, 3, 10, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-29 10:00:00', 'Street 559, City 28X', 'completed', 279.92, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 6, 29.99), (NULL, @order_id, 3, 2, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-30 10:00:00', 'Street 833, City 29X', 'completed', 389.88, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 1, 39.99), (NULL, @order_id, 3, 1, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-01-31 10:00:00', 'Street 384, City 30X', 'completed', 1619.62, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 7, 29.99), (NULL, @order_id, 2, 14, 39.99), (NULL, @order_id, 3, 17, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-02-01 10:00:00', 'Street 178, City 31X', 'completed', 829.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 6, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-02-02 10:00:00', 'Street 861, City 32X', 'completed', 699.83, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 4, 29.99), (NULL, @order_id, 2, 7, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-02-03 10:00:00', 'Street 980, City 33X', 'completed', 869.78, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-02-04 10:00:00', 'Street 164, City 34X', 'completed', 1179.70, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 14, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 12, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-02-05 10:00:00', 'Street 673, City 35X', 'completed', 949.78, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 7, 29.99), (NULL, @order_id, 2, 1, 39.99), (NULL, @order_id, 3, 14, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-02-06 10:00:00', 'Street 33, City 36X', 'completed', 739.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-02-07 10:00:00', 'Street 480, City 37X', 'completed', 789.81, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 7, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 10, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-02-08 10:00:00', 'Street 72, City 38X', 'completed', 669.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 15, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 2, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-02-09 10:00:00', 'Street 905, City 39X', 'completed', 1229.69, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 8, 39.99), (NULL, @order_id, 3, 11, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-02-10 10:00:00', 'Street 445, City 40X', 'completed', 409.88, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 7, 29.99), (NULL, @order_id, 2, 5, 39.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-02-11 10:00:00', 'Street 860, City 41X', 'completed', 999.75, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 10, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-02-12 10:00:00', 'Street 36, City 42X', 'completed', 529.84, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 5, 39.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-02-13 10:00:00', 'Street 177, City 43X', 'completed', 839.79, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-02-14 10:00:00', 'Street 624, City 44X', 'completed', 1499.63, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 14, 29.99), (NULL, @order_id, 2, 7, 39.99), (NULL, @order_id, 3, 16, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-02-15 10:00:00', 'Street 321, City 45X', 'completed', 1029.73, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 13, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-02-16 10:00:00', 'Street 424, City 46X', 'completed', 879.78, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-02-17 10:00:00', 'Street 970, City 47X', 'completed', 859.78, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 7, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-02-18 10:00:00', 'Street 433, City 48X', 'completed', 889.77, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-02-19 10:00:00', 'Street 397, City 49X', 'completed', 819.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 10, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-02-20 10:00:00', 'Street 904, City 50X', 'completed', 619.81, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 14, 29.99), (NULL, @order_id, 2, 5, 39.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-02-21 10:00:00', 'Street 266, City 51X', 'completed', 769.81, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 6, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 7, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-02-22 10:00:00', 'Street 894, City 52X', 'completed', 939.77, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 10, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-02-23 10:00:00', 'Street 322, City 53X', 'completed', 279.93, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 2, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 2, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-02-24 10:00:00', 'Street 331, City 54X', 'completed', 859.79, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 10, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-02-25 10:00:00', 'Street 477, City 55X', 'completed', 609.84, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-02-26 10:00:00', 'Street 643, City 56X', 'completed', 769.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 7, 39.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-02-27 10:00:00', 'Street 556, City 57X', 'completed', 799.81, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 7, 29.99), (NULL, @order_id, 2, 1, 39.99), (NULL, @order_id, 3, 11, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-02-28 10:00:00', 'Street 241, City 58X', 'completed', 889.78, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 7, 29.99), (NULL, @order_id, 2, 7, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-02-29 10:00:00', 'Street 417, City 59X', 'completed', 1129.71, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 13, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 10, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-01 10:00:00', 'Street 977, City 60X', 'completed', 819.77, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 13, 39.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-02 10:00:00', 'Street 464, City 61X', 'completed', 849.78, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 1, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-03 10:00:00', 'Street 745, City 62X', 'completed', 729.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-04 10:00:00', 'Street 327, City 63X', 'completed', 1069.73, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 8, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-05 10:00:00', 'Street 378, City 64X', 'completed', 439.86, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 2, 39.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-06 10:00:00', 'Street 985, City 65X', 'completed', 969.76, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 11, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-07 10:00:00', 'Street 465, City 66X', 'completed', 579.82, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 14, 29.99), (NULL, @order_id, 2, 4, 39.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-08 10:00:00', 'Street 814, City 67X', 'completed', 899.76, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 13, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 7, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-09 10:00:00', 'Street 428, City 68X', 'completed', 809.81, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 5, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 10, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-10 10:00:00', 'Street 975, City 69X', 'completed', 519.86, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 4, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-11 10:00:00', 'Street 384, City 70X', 'completed', 699.81, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-12 10:00:00', 'Street 395, City 71X', 'completed', 819.82, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 1, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 11, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-13 10:00:00', 'Street 939, City 72X', 'completed', 729.81, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-14 10:00:00', 'Street 611, City 73X', 'completed', 499.85, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 5, 39.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-15 10:00:00', 'Street 789, City 74X', 'completed', 799.82, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 3, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 11, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-16 10:00:00', 'Street 282, City 75X', 'completed', 969.75, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 8, 39.99), (NULL, @order_id, 3, 7, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-17 10:00:00', 'Street 812, City 76X', 'completed', 1129.72, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 7, 39.99), (NULL, @order_id, 3, 11, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-18 10:00:00', 'Street 259, City 77X', 'completed', 1179.71, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 13, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-19 10:00:00', 'Street 670, City 78X', 'completed', 799.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-20 10:00:00', 'Street 994, City 79X', 'completed', 899.77, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-21 10:00:00', 'Street 116, City 80X', 'completed', 629.83, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-22 10:00:00', 'Street 115, City 81X', 'completed', 1079.73, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 12, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-23 10:00:00', 'Street 328, City 82X', 'completed', 839.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 5, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-24 10:00:00', 'Street 883, City 83X', 'completed', 889.78, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-25 10:00:00', 'Street 482, City 84X', 'completed', 599.84, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 4, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-26 10:00:00', 'Street 977, City 85X', 'completed', 999.75, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 11, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-27 10:00:00', 'Street 366, City 86X', 'completed', 1059.72, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 13, 29.99), (NULL, @order_id, 2, 8, 39.99), (NULL, @order_id, 3, 7, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-28 10:00:00', 'Street 492, City 87X', 'completed', 1109.72, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 7, 39.99), (NULL, @order_id, 3, 10, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-29 10:00:00', 'Street 76, City 88X', 'completed', 849.78, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 7, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-30 10:00:00', 'Street 861, City 89X', 'completed', 469.87, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 3, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-03-31 10:00:00', 'Street 908, City 90X', 'completed', 1039.71, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 13, 29.99), (NULL, @order_id, 2, 15, 39.99), (NULL, @order_id, 3, 1, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-04-01 10:00:00', 'Street 532, City 91X', 'completed', 1119.73, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 7, 39.99), (NULL, @order_id, 3, 12, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-04-02 10:00:00', 'Street 893, City 92X', 'completed', 769.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 7, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-04-03 10:00:00', 'Street 659, City 93X', 'completed', 849.79, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-04-04 10:00:00', 'Street 447, City 94X', 'completed', 709.82, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 1, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-04-05 10:00:00', 'Street 736, City 95X', 'completed', 729.81, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-04-06 10:00:00', 'Street 27, City 96X', 'completed', 729.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-04-07 10:00:00', 'Street 272, City 97X', 'completed', 679.81, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 4, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-04-08 10:00:00', 'Street 946, City 98X', 'completed', 559.86, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 3, 29.99), (NULL, @order_id, 2, 8, 39.99), (NULL, @order_id, 3, 3, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-04-09 10:00:00', 'Street 169, City 99X', 'completed', 939.79, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 2, 29.99), (NULL, @order_id, 2, 7, 39.99), (NULL, @order_id, 3, 12, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-04-10 10:00:00', 'Street 970, City 100X', 'completed', 579.83, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 7, 39.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-04-11 10:00:00', 'Street 590, City 101X', 'completed', 839.79, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-04-12 10:00:00', 'Street 861, City 102X', 'completed', 709.81, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-04-13 10:00:00', 'Street 711, City 103X', 'completed', 709.83, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 6, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-04-14 10:00:00', 'Street 43, City 104X', 'completed', 539.86, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 5, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 3, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-04-15 10:00:00', 'Street 430, City 105X', 'completed', 1249.69, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 13, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-04-16 10:00:00', 'Street 988, City 106X', 'completed', 1089.73, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 11, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-04-17 10:00:00', 'Street 485, City 107X', 'completed', 759.82, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 5, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-04-18 10:00:00', 'Street 695, City 108X', 'completed', 689.82, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 1, 39.99), (NULL, @order_id, 3, 7, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-04-19 10:00:00', 'Street 453, City 109X', 'completed', 1159.71, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 12, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-04-20 10:00:00', 'Street 32, City 110X', 'completed', 549.83, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 13, 29.99), (NULL, @order_id, 2, 4, 39.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-04-21 10:00:00', 'Street 63, City 111X', 'completed', 819.79, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 7, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-04-22 10:00:00', 'Street 128, City 112X', 'completed', 489.88, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 4, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-04-23 10:00:00', 'Street 76, City 113X', 'completed', 769.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 7, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-04-24 10:00:00', 'Street 938, City 114X', 'completed', 779.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 7, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-04-25 10:00:00', 'Street 108, City 115X', 'completed', 869.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 5, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 12, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-04-26 10:00:00', 'Street 490, City 116X', 'completed', 589.84, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 4, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-04-27 10:00:00', 'Street 960, City 117X', 'completed', 1049.73, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 8, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-04-28 10:00:00', 'Street 487, City 118X', 'completed', 1209.69, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 13, 29.99), (NULL, @order_id, 2, 8, 39.99), (NULL, @order_id, 3, 10, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-04-29 10:00:00', 'Street 459, City 119X', 'completed', 929.77, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 10, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-04-30 10:00:00', 'Street 867, City 120X', 'completed', 1289.68, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 7, 29.99), (NULL, @order_id, 2, 17, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-01 10:00:00', 'Street 845, City 121X', 'completed', 909.77, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-02 10:00:00', 'Street 138, City 122X', 'completed', 939.78, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 6, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 12, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-03 10:00:00', 'Street 546, City 123X', 'completed', 919.77, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-04 10:00:00', 'Street 888, City 124X', 'completed', 569.85, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-05 10:00:00', 'Street 762, City 125X', 'completed', 639.84, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 6, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-06 10:00:00', 'Street 677, City 126X', 'completed', 1159.72, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 14, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-07 10:00:00', 'Street 822, City 127X', 'completed', 949.78, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 7, 29.99), (NULL, @order_id, 2, 1, 39.99), (NULL, @order_id, 3, 14, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-08 10:00:00', 'Street 840, City 128X', 'completed', 539.87, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 3, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-09 10:00:00', 'Street 200, City 129X', 'completed', 929.76, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-10 10:00:00', 'Street 603, City 130X', 'completed', 899.77, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 7, 39.99), (NULL, @order_id, 3, 7, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-11 10:00:00', 'Street 551, City 131X', 'completed', 1249.67, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 17, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 10, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-12 10:00:00', 'Street 737, City 132X', 'completed', 619.84, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 5, 29.99), (NULL, @order_id, 2, 8, 39.99), (NULL, @order_id, 3, 3, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-13 10:00:00', 'Street 124, City 133X', 'completed', 839.77, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 14, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-14 10:00:00', 'Street 280, City 134X', 'completed', 849.78, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 9, 39.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-15 10:00:00', 'Street 197, City 135X', 'completed', 619.84, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 7, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-16 10:00:00', 'Street 185, City 136X', 'completed', 509.86, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 6, 29.99), (NULL, @order_id, 2, 7, 39.99), (NULL, @order_id, 3, 1, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-17 10:00:00', 'Street 348, City 137X', 'completed', 869.78, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 1, 39.99), (NULL, @order_id, 3, 10, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-18 10:00:00', 'Street 848, City 138X', 'completed', 929.77, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-19 10:00:00', 'Street 853, City 139X', 'completed', 859.78, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-20 10:00:00', 'Street 212, City 140X', 'completed', 669.83, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 7, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-21 10:00:00', 'Street 434, City 141X', 'completed', 659.81, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 2, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-22 10:00:00', 'Street 274, City 142X', 'completed', 829.79, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-23 10:00:00', 'Street 423, City 143X', 'completed', 759.79, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 4, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-24 10:00:00', 'Street 408, City 144X', 'completed', 999.74, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-25 10:00:00', 'Street 944, City 145X', 'completed', 1119.73, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 13, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-26 10:00:00', 'Street 134, City 146X', 'completed', 729.83, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 6, 29.99), (NULL, @order_id, 3, 11, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-27 10:00:00', 'Street 389, City 147X', 'completed', 699.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 13, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 3, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-28 10:00:00', 'Street 816, City 148X', 'completed', 769.82, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 4, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-29 10:00:00', 'Street 691, City 149X', 'completed', 1039.74, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 10, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-30 10:00:00', 'Street 31, City 150X', 'completed', 1299.67, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 15, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-05-31 10:00:00', 'Street 447, City 151X', 'completed', 849.78, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 7, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-06-01 10:00:00', 'Street 254, City 152X', 'completed', 949.76, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 7, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-06-02 10:00:00', 'Street 774, City 153X', 'completed', 539.86, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 4, 29.99), (NULL, @order_id, 2, 8, 39.99), (NULL, @order_id, 3, 2, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-06-03 10:00:00', 'Street 161, City 154X', 'completed', 799.79, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-06-04 10:00:00', 'Street 273, City 155X', 'completed', 439.89, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 5, 29.99), (NULL, @order_id, 2, 1, 39.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-06-05 10:00:00', 'Street 612, City 156X', 'completed', 999.77, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 6, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 14, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-06-06 10:00:00', 'Street 154, City 157X', 'completed', 439.87, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 1, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-06-07 10:00:00', 'Street 99, City 158X', 'completed', 799.77, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 15, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 3, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-06-08 10:00:00', 'Street 287, City 159X', 'completed', 719.81, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 1, 39.99), (NULL, @order_id, 3, 7, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-06-09 10:00:00', 'Street 942, City 160X', 'completed', 359.90, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 6, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 2, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-06-10 10:00:00', 'Street 42, City 161X', 'completed', 829.78, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-06-11 10:00:00', 'Street 613, City 162X', 'completed', 909.79, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 5, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 12, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-06-12 10:00:00', 'Street 764, City 163X', 'completed', 1079.73, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 13, 29.99), (NULL, @order_id, 2, 1, 39.99), (NULL, @order_id, 3, 13, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-06-13 10:00:00', 'Street 541, City 164X', 'completed', 679.82, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 7, 29.99), (NULL, @order_id, 2, 8, 39.99), (NULL, @order_id, 3, 3, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-06-14 10:00:00', 'Street 89, City 165X', 'completed', 909.79, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 6, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 13, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-06-15 10:00:00', 'Street 144, City 166X', 'completed', 629.84, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 6, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-06-16 10:00:00', 'Street 604, City 167X', 'completed', 929.76, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-06-17 10:00:00', 'Street 47, City 168X', 'completed', 979.74, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 14, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-06-18 10:00:00', 'Street 831, City 169X', 'completed', 619.83, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 1, 39.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-06-19 10:00:00', 'Street 121, City 170X', 'completed', 579.84, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 2, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-06-20 10:00:00', 'Street 195, City 171X', 'completed', 609.83, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 3, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-06-21 10:00:00', 'Street 153, City 172X', 'completed', 1029.73, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 15, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 10, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-06-22 10:00:00', 'Street 935, City 173X', 'completed', 789.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-06-23 10:00:00', 'Street 343, City 174X', 'completed', 789.81, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 6, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-06-24 10:00:00', 'Street 821, City 175X', 'completed', 819.79, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 7, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-06-25 10:00:00', 'Street 195, City 176X', 'completed', 399.88, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 4, 39.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-06-26 10:00:00', 'Street 560, City 177X', 'completed', 929.75, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 13, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-06-27 10:00:00', 'Street 310, City 178X', 'completed', 1069.73, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 13, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 12, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-06-28 10:00:00', 'Street 269, City 179X', 'completed', 829.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 7, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 10, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-06-29 10:00:00', 'Street 955, City 180X', 'completed', 1039.75, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 3, 29.99), (NULL, @order_id, 2, 15, 39.99), (NULL, @order_id, 3, 7, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-06-30 10:00:00', 'Street 69, City 181X', 'completed', 1049.77, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 3, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 16, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-01 10:00:00', 'Street 896, City 182X', 'completed', 959.76, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-02 10:00:00', 'Street 201, City 183X', 'completed', 819.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 7, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-03 10:00:00', 'Street 774, City 184X', 'completed', 749.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-04 10:00:00', 'Street 592, City 185X', 'completed', 1259.70, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 16, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-05 10:00:00', 'Street 959, City 186X', 'completed', 559.84, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 8, 39.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-06 10:00:00', 'Street 315, City 187X', 'completed', 659.84, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 4, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-07 10:00:00', 'Street 540, City 188X', 'completed', 579.83, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 13, 29.99), (NULL, @order_id, 2, 1, 39.99), (NULL, @order_id, 3, 3, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-08 10:00:00', 'Street 476, City 189X', 'completed', 599.84, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 4, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-09 10:00:00', 'Street 575, City 190X', 'completed', 809.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 7, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-10 10:00:00', 'Street 267, City 191X', 'completed', 649.82, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 4, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-11 10:00:00', 'Street 329, City 192X', 'completed', 679.83, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 1, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-12 10:00:00', 'Street 587, City 193X', 'completed', 959.75, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 7, 39.99), (NULL, @order_id, 3, 7, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-13 10:00:00', 'Street 510, City 194X', 'completed', 909.73, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 19, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 2, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-14 10:00:00', 'Street 234, City 195X', 'completed', 909.77, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-15 10:00:00', 'Street 246, City 196X', 'completed', 639.82, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 2, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-16 10:00:00', 'Street 242, City 197X', 'completed', 1009.75, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 10, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-17 10:00:00', 'Street 541, City 198X', 'completed', 859.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 7, 29.99), (NULL, @order_id, 3, 13, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-18 10:00:00', 'Street 114, City 199X', 'completed', 729.83, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 5, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 10, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-19 10:00:00', 'Street 467, City 200X', 'completed', 469.88, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 5, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 4, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-20 10:00:00', 'Street 728, City 201X', 'completed', 909.77, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-21 10:00:00', 'Street 152, City 202X', 'completed', 979.74, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 15, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-22 10:00:00', 'Street 222, City 203X', 'completed', 819.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 3, 11, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-23 10:00:00', 'Street 81, City 204X', 'completed', 1029.72, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 14, 29.99), (NULL, @order_id, 2, 9, 39.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-24 10:00:00', 'Street 364, City 205X', 'completed', 759.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-25 10:00:00', 'Street 997, City 206X', 'completed', 819.79, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-26 10:00:00', 'Street 901, City 207X', 'completed', 809.78, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-27 10:00:00', 'Street 645, City 208X', 'completed', 789.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-28 10:00:00', 'Street 999, City 209X', 'completed', 819.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 6, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-29 10:00:00', 'Street 801, City 210X', 'completed', 1579.60, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 13, 29.99), (NULL, @order_id, 2, 16, 39.99), (NULL, @order_id, 3, 11, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-30 10:00:00', 'Street 59, City 211X', 'completed', 839.77, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 14, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-07-31 10:00:00', 'Street 19, City 212X', 'completed', 929.75, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 13, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-01 10:00:00', 'Street 903, City 213X', 'completed', 719.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 4, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-02 10:00:00', 'Street 209, City 214X', 'completed', 1039.74, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 10, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-03 10:00:00', 'Street 746, City 215X', 'completed', 1169.71, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 12, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-04 10:00:00', 'Street 49, City 216X', 'completed', 999.75, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 7, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-05 10:00:00', 'Street 852, City 217X', 'completed', 969.76, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 7, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-06 10:00:00', 'Street 390, City 218X', 'completed', 919.76, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 8, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-07 10:00:00', 'Street 853, City 219X', 'completed', 399.88, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 1, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-08 10:00:00', 'Street 628, City 220X', 'completed', 779.82, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 6, 29.99), (NULL, @order_id, 3, 12, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-09 10:00:00', 'Street 855, City 221X', 'completed', 619.84, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 6, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 4, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-10 10:00:00', 'Street 653, City 222X', 'completed', 469.87, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 3, 4, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-11 10:00:00', 'Street 301, City 223X', 'completed', 549.86, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 6, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-12 10:00:00', 'Street 804, City 224X', 'completed', 749.79, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 8, 39.99), (NULL, @order_id, 3, 2, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-13 10:00:00', 'Street 678, City 225X', 'completed', 859.77, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 13, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 7, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-14 10:00:00', 'Street 804, City 226X', 'completed', 719.78, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 16, 29.99), (NULL, @order_id, 2, 6, 39.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-15 10:00:00', 'Street 670, City 227X', 'completed', 639.82, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 4, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-16 10:00:00', 'Street 810, City 228X', 'completed', 659.83, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-17 10:00:00', 'Street 298, City 229X', 'completed', 599.82, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 13, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 1, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-18 10:00:00', 'Street 214, City 230X', 'completed', 979.76, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 11, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-19 10:00:00', 'Street 983, City 231X', 'completed', 819.81, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 5, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 11, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-20 10:00:00', 'Street 926, City 232X', 'completed', 1169.72, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 14, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-21 10:00:00', 'Street 810, City 233X', 'completed', 1059.74, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 11, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-22 10:00:00', 'Street 913, City 234X', 'completed', 659.83, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 1, 39.99), (NULL, @order_id, 3, 7, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-23 10:00:00', 'Street 908, City 235X', 'completed', 819.78, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-24 10:00:00', 'Street 253, City 236X', 'completed', 589.82, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 13, 29.99), (NULL, @order_id, 2, 5, 39.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-25 10:00:00', 'Street 755, City 237X', 'completed', 689.82, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 6, 29.99), (NULL, @order_id, 2, 9, 39.99), (NULL, @order_id, 3, 3, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-26 10:00:00', 'Street 121, City 238X', 'completed', 1109.73, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 12, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-27 10:00:00', 'Street 478, City 239X', 'completed', 1039.75, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 12, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-28 10:00:00', 'Street 948, City 240X', 'completed', 1489.62, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 14, 29.99), (NULL, @order_id, 2, 13, 39.99), (NULL, @order_id, 3, 11, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-29 10:00:00', 'Street 386, City 241X', 'completed', 869.79, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 11, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-30 10:00:00', 'Street 268, City 242X', 'completed', 709.82, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 7, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-08-31 10:00:00', 'Street 734, City 243X', 'completed', 649.82, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 7, 39.99), (NULL, @order_id, 3, 2, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-09-01 10:00:00', 'Street 874, City 244X', 'completed', 809.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 1, 39.99), (NULL, @order_id, 3, 10, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-09-02 10:00:00', 'Street 298, City 245X', 'completed', 749.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-09-03 10:00:00', 'Street 49, City 246X', 'completed', 789.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 6, 29.99), (NULL, @order_id, 2, 9, 39.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-09-04 10:00:00', 'Street 794, City 247X', 'completed', 889.77, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 7, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-09-05 10:00:00', 'Street 467, City 248X', 'completed', 739.83, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 3, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-09-06 10:00:00', 'Street 10, City 249X', 'completed', 619.83, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 4, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-09-07 10:00:00', 'Street 417, City 250X', 'completed', 719.83, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 5, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-09-08 10:00:00', 'Street 374, City 251X', 'completed', 1059.73, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 10, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-09-09 10:00:00', 'Street 895, City 252X', 'completed', 989.75, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 10, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-09-10 10:00:00', 'Street 464, City 253X', 'completed', 699.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 13, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 3, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-09-11 10:00:00', 'Street 655, City 254X', 'completed', 699.81, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-09-12 10:00:00', 'Street 769, City 255X', 'completed', 479.86, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 1, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-09-13 10:00:00', 'Street 356, City 256X', 'completed', 749.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-09-14 10:00:00', 'Street 197, City 257X', 'completed', 939.75, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 9, 39.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-09-15 10:00:00', 'Street 776, City 258X', 'completed', 329.91, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 6, 29.99), (NULL, @order_id, 3, 3, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-09-16 10:00:00', 'Street 190, City 259X', 'completed', 609.83, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 2, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-09-17 10:00:00', 'Street 89, City 260X', 'completed', 579.88, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 10, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-09-18 10:00:00', 'Street 245, City 261X', 'completed', 769.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-09-19 10:00:00', 'Street 355, City 262X', 'completed', 879.78, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-09-20 10:00:00', 'Street 756, City 263X', 'completed', 829.79, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-09-21 10:00:00', 'Street 383, City 264X', 'completed', 599.85, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 7, 29.99), (NULL, @order_id, 2, 1, 39.99), (NULL, @order_id, 3, 7, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-09-22 10:00:00', 'Street 775, City 265X', 'completed', 929.78, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 7, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 12, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-09-23 10:00:00', 'Street 536, City 266X', 'completed', 759.82, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 4, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-09-24 10:00:00', 'Street 463, City 267X', 'completed', 629.84, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 7, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-09-25 10:00:00', 'Street 65, City 268X', 'completed', 1099.72, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 10, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-09-26 10:00:00', 'Street 749, City 269X', 'completed', 769.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-09-27 10:00:00', 'Street 465, City 270X', 'completed', 1369.66, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 13, 39.99), (NULL, @order_id, 3, 11, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-09-28 10:00:00', 'Street 31, City 271X', 'completed', 439.88, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 6, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 2, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-09-29 10:00:00', 'Street 46, City 272X', 'completed', 749.82, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 5, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-09-30 10:00:00', 'Street 512, City 273X', 'completed', 689.83, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 6, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 7, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-01 10:00:00', 'Street 539, City 274X', 'completed', 449.88, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 6, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 3, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-02 10:00:00', 'Street 511, City 275X', 'completed', 919.76, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-03 10:00:00', 'Street 607, City 276X', 'completed', 989.74, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 7, 39.99), (NULL, @order_id, 3, 7, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-04 10:00:00', 'Street 901, City 277X', 'completed', 809.81, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 6, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 11, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-05 10:00:00', 'Street 343, City 278X', 'completed', 939.75, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 7, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-06 10:00:00', 'Street 443, City 279X', 'completed', 999.76, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 3, 14, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-07 10:00:00', 'Street 824, City 280X', 'completed', 649.84, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 5, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-08 10:00:00', 'Street 334, City 281X', 'completed', 909.75, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 16, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 7, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-09 10:00:00', 'Street 290, City 282X', 'completed', 879.76, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 13, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-10 10:00:00', 'Street 291, City 283X', 'completed', 949.76, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 7, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-11 10:00:00', 'Street 323, City 284X', 'completed', 959.76, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 11, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-12 10:00:00', 'Street 556, City 285X', 'completed', 1049.73, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-13 10:00:00', 'Street 763, City 286X', 'completed', 1149.72, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 13, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-14 10:00:00', 'Street 931, City 287X', 'completed', 829.79, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-15 10:00:00', 'Street 172, City 288X', 'completed', 559.84, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 3, 4, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-16 10:00:00', 'Street 172, City 289X', 'completed', 369.88, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 1, 39.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-17 10:00:00', 'Street 198, City 290X', 'completed', 419.87, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 1, 39.99), (NULL, @order_id, 3, 1, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-18 10:00:00', 'Street 389, City 291X', 'completed', 659.84, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 6, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-19 10:00:00', 'Street 403, City 292X', 'completed', 1069.74, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 7, 39.99), (NULL, @order_id, 3, 11, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-20 10:00:00', 'Street 864, City 293X', 'completed', 779.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-21 10:00:00', 'Street 131, City 294X', 'completed', 559.85, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 1, 39.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-22 10:00:00', 'Street 740, City 295X', 'completed', 839.76, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 15, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 3, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-23 10:00:00', 'Street 809, City 296X', 'completed', 949.76, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 10, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-24 10:00:00', 'Street 173, City 297X', 'completed', 739.78, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 14, 29.99), (NULL, @order_id, 2, 8, 39.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-25 10:00:00', 'Street 705, City 298X', 'completed', 489.86, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 2, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-26 10:00:00', 'Street 932, City 299X', 'completed', 839.76, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 16, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 4, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-27 10:00:00', 'Street 113, City 300X', 'completed', 2019.52, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 18, 39.99), (NULL, @order_id, 3, 20, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-28 10:00:00', 'Street 124, City 301X', 'completed', 1059.74, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 11, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-29 10:00:00', 'Street 642, City 302X', 'completed', 769.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-30 10:00:00', 'Street 686, City 303X', 'completed', 939.75, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 7, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-10-31 10:00:00', 'Street 671, City 304X', 'completed', 979.76, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 11, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-11-01 10:00:00', 'Street 388, City 305X', 'completed', 629.85, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 5, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-11-02 10:00:00', 'Street 810, City 306X', 'completed', 569.86, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 4, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-11-03 10:00:00', 'Street 934, City 307X', 'completed', 639.82, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 13, 29.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-11-04 10:00:00', 'Street 65, City 308X', 'completed', 979.75, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-11-05 10:00:00', 'Street 223, City 309X', 'completed', 1009.76, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 13, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-11-06 10:00:00', 'Street 882, City 310X', 'completed', 689.83, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 7, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-11-07 10:00:00', 'Street 994, City 311X', 'completed', 1269.70, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 17, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-11-08 10:00:00', 'Street 213, City 312X', 'completed', 479.89, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 2, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-11-09 10:00:00', 'Street 640, City 313X', 'completed', 1029.73, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 13, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-11-10 10:00:00', 'Street 908, City 314X', 'completed', 1019.74, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-11-11 10:00:00', 'Street 557, City 315X', 'completed', 659.84, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 6, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-11-12 10:00:00', 'Street 454, City 316X', 'completed', 1119.72, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 8, 39.99), (NULL, @order_id, 3, 10, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-11-13 10:00:00', 'Street 278, City 317X', 'completed', 629.83, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-11-14 10:00:00', 'Street 143, City 318X', 'completed', 689.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 13, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 2, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-11-15 10:00:00', 'Street 841, City 319X', 'completed', 1089.73, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 12, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-11-16 10:00:00', 'Street 571, City 320X', 'completed', 679.82, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-11-17 10:00:00', 'Street 579, City 321X', 'completed', 659.82, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 4, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-11-18 10:00:00', 'Street 554, City 322X', 'completed', 729.83, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 5, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 10, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-11-19 10:00:00', 'Street 934, City 323X', 'completed', 879.77, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 7, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-11-20 10:00:00', 'Street 988, City 324X', 'completed', 529.85, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 3, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-11-21 10:00:00', 'Street 721, City 325X', 'completed', 1129.74, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 6, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 15, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-11-22 10:00:00', 'Street 873, City 326X', 'completed', 1319.69, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 7, 39.99), (NULL, @order_id, 3, 16, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-11-23 10:00:00', 'Street 8, City 327X', 'completed', 649.83, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 6, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-11-24 10:00:00', 'Street 805, City 328X', 'completed', 1219.69, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 14, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 12, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-11-25 10:00:00', 'Street 776, City 329X', 'completed', 739.79, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 15, 29.99), (NULL, @order_id, 2, 1, 39.99), (NULL, @order_id, 3, 5, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-11-26 10:00:00', 'Street 504, City 330X', 'completed', 1419.66, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 12, 39.99), (NULL, @order_id, 3, 14, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-11-27 10:00:00', 'Street 15, City 331X', 'completed', 1089.72, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 9, 39.99), (NULL, @order_id, 3, 8, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-11-28 10:00:00', 'Street 936, City 332X', 'completed', 789.80, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 7, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-11-29 10:00:00', 'Street 89, City 333X', 'completed', 1089.73, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 11, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-11-30 10:00:00', 'Street 452, City 334X', 'completed', 819.79, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 1, 39.99), (NULL, @order_id, 3, 9, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-12-01 10:00:00', 'Street 614, City 335X', 'completed', 2109.53, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 33, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-12-02 10:00:00', 'Street 473, City 336X', 'completed', 1729.60, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 24, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-12-03 10:00:00', 'Street 451, City 337X', 'completed', 1879.58, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 30, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-12-04 10:00:00', 'Street 862, City 338X', 'completed', 1839.57, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 13, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 25, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-12-05 10:00:00', 'Street 773, City 339X', 'completed', 1959.56, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 29, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-12-06 10:00:00', 'Street 970, City 340X', 'completed', 1619.63, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 24, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-12-07 10:00:00', 'Street 350, City 341X', 'completed', 1929.55, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 15, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 28, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-12-08 10:00:00', 'Street 532, City 342X', 'completed', 1949.56, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 7, 39.99), (NULL, @order_id, 3, 28, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-12-09 10:00:00', 'Street 441, City 343X', 'completed', 1929.56, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 28, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-12-10 10:00:00', 'Street 192, City 344X', 'completed', 2339.47, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 13, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 35, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-12-11 10:00:00', 'Street 500, City 345X', 'completed', 1549.66, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 5, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 24, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-12-12 10:00:00', 'Street 449, City 346X', 'completed', 1729.61, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 4, 39.99), (NULL, @order_id, 3, 26, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-12-13 10:00:00', 'Street 839, City 347X', 'completed', 1659.63, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 6, 29.99), (NULL, @order_id, 2, 7, 39.99), (NULL, @order_id, 3, 24, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-12-14 10:00:00', 'Street 904, City 348X', 'completed', 2109.51, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 14, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 29, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-12-15 10:00:00', 'Street 648, City 349X', 'completed', 2029.55, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 33, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-12-16 10:00:00', 'Street 564, City 350X', 'completed', 1809.58, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 13, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 26, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-12-17 10:00:00', 'Street 894, City 351X', 'completed', 1869.58, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 7, 39.99), (NULL, @order_id, 3, 27, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-12-18 10:00:00', 'Street 530, City 352X', 'completed', 2039.54, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 2, 39.99), (NULL, @order_id, 3, 32, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-12-19 10:00:00', 'Street 244, City 353X', 'completed', 1719.61, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 9, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 25, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-12-20 10:00:00', 'Street 465, City 354X', 'completed', 1479.65, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 20, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-12-21 10:00:00', 'Street 3, City 355X', 'completed', 1589.64, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 23, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-12-22 10:00:00', 'Street 416, City 356X', 'completed', 2169.50, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 13, 29.99), (NULL, @order_id, 2, 7, 39.99), (NULL, @order_id, 3, 30, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-12-23 10:00:00', 'Street 861, City 357X', 'completed', 1769.62, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 4, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 29, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-12-24 10:00:00', 'Street 278, City 358X', 'completed', 1799.59, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 27, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-12-25 10:00:00', 'Street 968, City 359X', 'completed', 1929.56, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 28, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-12-26 10:00:00', 'Street 623, City 360X', 'completed', 2119.52, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 7, 29.99), (NULL, @order_id, 2, 14, 39.99), (NULL, @order_id, 3, 27, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-12-27 10:00:00', 'Street 137, City 361X', 'completed', 1929.56, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 11, 29.99), (NULL, @order_id, 2, 5, 39.99), (NULL, @order_id, 3, 28, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-12-28 10:00:00', 'Street 219, City 362X', 'completed', 1899.56, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 12, 29.99), (NULL, @order_id, 2, 6, 39.99), (NULL, @order_id, 3, 26, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-12-29 10:00:00', 'Street 697, City 363X', 'completed', 2279.49, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 10, 29.99), (NULL, @order_id, 2, 7, 39.99), (NULL, @order_id, 3, 34, 49.99);

INSERT INTO customer_orders (order_id, user_id, order_date, shipping_address, status, total_amount, payment_status) VALUES (NULL, NULL, '2024-12-30 10:00:00', 'Street 849, City 364X', 'completed', 1659.63, 'paid');
SET @order_id = LAST_INSERT_ID();
INSERT INTO customer_order_details (order_detail_id, order_id, product_id, quantity, unit_price) VALUES (NULL, @order_id, 1, 8, 29.99), (NULL, @order_id, 2, 3, 39.99), (NULL, @order_id, 3, 26, 49.99);

COMMIT;
