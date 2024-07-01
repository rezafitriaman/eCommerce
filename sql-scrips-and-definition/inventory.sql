-- Products to Inventory
--
-- Type: One-to-Many
-- Description: Each product can have multiple inventory entries (e.g., for different warehouses), but each inventory entry is associated with only one product.
-- Foreign Key: Inventory.ProductID → Products.ProductID

-- Inventory Table Explanation
-- The Inventory table is used to keep track of the stock of each product at various locations (e.g., warehouses). It helps in managing the availability of products and ensuring that the stock levels are accurate for each location. This is essential for:
--
-- Stock Management: Knowing the quantity of each product available at different locations helps in restocking and logistics.
-- Order Fulfillment: Ensuring that you can fulfill orders from the nearest location with available stock.
-- Reporting: Tracking inventory levels for financial reporting and business analysis.

-- Relationships and Use Case
-- One-to-Many Relationship
--
-- Products to Inventory: One product can have multiple inventory entries, each representing stock in different warehouse locations.
-- Use Case Example
--
-- You sell "Nasi Goreng" and keep stock in multiple warehouses. When an order is placed, the system checks the Inventory table to see where the product is available and reduces the stock accordingly from the nearest warehouse.
-- This ensures accurate stock management, avoids overselling, and helps in quick order fulfillment.

-- Set initial inventory data
INSERT INTO ecommerce_table.inventory (productid, warehouselocation, quantity) VALUES ((SELECT productid FROM ecommerce_table.products where productname = 'Sate Kambing'), 'Warehouse A', 50);
INSERT INTO ecommerce_table.inventory (productid, warehouselocation, quantity) VALUES ((SELECT productid FROM ecommerce_table.products where productname = 'Sate Kambing'), 'Warehouse B', 30);
INSERT INTO ecommerce_table.inventory (productid, warehouselocation, quantity) VALUES ((SELECT productid FROM ecommerce_table.products where productname = 'Sate Kambing'), 'Warehouse C', 20);

-- Then if u sold an item u need to update it
UPDATE ecommerce_table.inventory
SET quantity = quantity - 1
WHERE productid = (select productid from ecommerce_table.products where productname = 'Nas') AND warehouselocation = 'Warehouse A';

-- TODO attempt to update a non-existent inventory item with error handling

-- Error Handling
-- To handle such situations, you can:
--
-- Check Existence Before Update: Query the table to check if the item exists before attempting the update.
--     Use Conditional Logic in Application Code: Add logic in your application to handle cases where the item does not exist.
