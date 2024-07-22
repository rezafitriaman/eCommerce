-- Purpose of Orders to OrdersPromotions
-- In an e-commerce system, promotions can be applied to orders to give discounts or other benefits to customers.
-- An order can have multiple promotions applied, and a promotion can be used in multiple orders. This many-to-many
-- relationship is managed using a junction table, OrdersPromotions.
------------------------------------------

-- Explanation
-- Categories:
--
-- Categories can be created to represent different food categories, such as Nasi with subcategories like Nasi Goreng, Nasi Campur, etc.
-- Orders:
--
-- This table captures details of each order placed by users, including user ID, addresses, total amount, and status.
-- Promotions:
--
-- This table contains information about various promotions available, including the type and value of the discount.
-- OrdersPromotions:
--
-- This junction table links orders and promotions to handle the many-to-many relationship. Each entry represents a promotion applied to a specific order.
-- How OrdersPromotions Works
-- The OrdersPromotions table allows you to apply multiple promotions to an order and track which promotions have been applied. For example:
--
-- Order 1 (with ID 1) has the "Summer Sale" promotion applied.
-- Order 2 (with ID 2) has both the "New Year Discount" and "Summer Sale" promotions applied.
-- This setup helps manage promotions efficiently, ensuring that customers receive the correct discounts and benefits, and allowing for detailed tracking and reporting on promotion usage.


-- Insert promotions
INSERT INTO ecommerce_table.Promotions (PROMOTIONNAME, DISCOUNTTYPE, DISCOUNTVALUE, STARTDATE, ENDDATE)
VALUES ('Summer Sale', 'Percentage', 10.00, '2024-06-01', '2024-08-31'),
       ('New Year Dscount', 'Fixed Amount', 5.00, '2024-12-30', '2025-01-02');

-- Insert orders
INSERT INTO ecommerce_table.orders (userid, SHIPPINGADDRESSID, BILLINGADDRESSID, TOTALAMOUNT, ORDERSTATUS)
VALUES ((SELECT userid FROM ecommerce_table.users WHERE email = 'rezafitriaman@hotmail.com'), '9', '9', 0.00, 'Pending');

-- Inserts new products
INSERT INTO ecommerce_table.Products (ProductName, Description, Price, SKU, StockQuantity)
VALUES ('Nasi Campur', 'Indonesian Mixed Rice', 6.99, 'NASI-Campur-001', 100);

-- Inserts new productcategories
INSERT INTO ecommerce_table.productcategories (productid, categoryid)
SELECT 17, 1
WHERE NOT EXISTS (
    SELECT 1 FROM ecommerce_table.productcategories
    WHERE productid = 17 AND categoryid = 1
);

-- Insert orderdetails
INSERT INTO ecommerce_table.orderdetails (orderid, productid, quantity, price)
VALUES  (15, (select productid from ecommerce_table.products where productname = 'Nasi Campur'), 2, (select price from ecommerce_table.products where productname = 'Nasi Campur')),
        (15, (select productid from ecommerce_table.products where productname = 'Sate Ayam Madura'), 1, (select price from ecommerce_table.products where productname = 'Sate Ayam Madura'));

-- Insert orderspromotions
INSERT INTO ecommerce_table.orderspromotions (orderid, promotionid)
VALUES (15, 1),
       (15, 2);