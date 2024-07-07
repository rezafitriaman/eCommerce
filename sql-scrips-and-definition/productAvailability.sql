-- Explanation of ProductAvailability
-- The ProductAvailability table serves a specific purpose:
--
-- Purpose: To provide an easy way to quickly check if a product is available for sale without calculating it every time from the stock quantity or other conditions.
-- Use Cases:
-- Temporary Unavailability: If a product is temporarily unavailable due to reasons other than stock quantity (e.g., seasonal items, maintenance), this table can flag it as unavailable.
-- Maintenance and Control: Separate control over product availability allows you to manage product visibility on the website independently of stock levels.

-- Detailed Usage Scenario
-- Nasi Goreng:
--
-- StockQuantity: 100
-- IsAvailable: TRUE
-- Description: Nasi Goreng is in stock and available for customers to purchase.
-- Nasi Campur:
--
-- StockQuantity: 50
-- IsAvailable: TRUE
-- Description: Nasi Campur is in stock and available for customers to purchase.
-- Nasi Uduk:
--
-- StockQuantity: 30
-- IsAvailable: FALSE
-- Description: Although Nasi Uduk has 30 units in stock, it is marked as unavailable, perhaps because it is a seasonal dish or under maintenance.

INSERT INTO ecommerce_table.productavailability (productid, isavailable) VALUES (12, TRUE), (15, TRUE), (5, FALSE);

-- delete rows
TRUNCATE TABLE ecommerce_table.productavailability;

-- delete table
DROP TABLE ecommerce_table.productavailability;
