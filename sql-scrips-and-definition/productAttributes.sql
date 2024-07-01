-- Products to ProductAttributes
--
-- Type: One-to-Many
-- Description: Each product can have multiple attributes, but each attribute is associated with only one product.
-- Foreign Key: ProductAttributes.ProductID → Products.ProductID
--
-- What is ProductAttributes and Why Do You Need It?
--
-- The ProductAttributes table is designed to store additional details about a product that can vary widely between
-- different products. Attributes are specific characteristics or features of a product that are not covered by the
-- standard columns in the Products table. This table allows for flexibility in defining unique attributes for each
-- product without having to create new columns in the Products table for each attribute type.
-- For example, for Indonesian food, you might want to store information like spice level, serving size, ingredients,
-- and cooking time. Different products (food items) can have different sets of attributes, and this table allows you
-- to store all that information in a structured way.

-- Example ProductAttributes for Nasi Goreng
--
-- AttributeName: Spice Level
-- AttributeValue: Medium
-- AttributeName: Serving Size
-- AttributeValue: 1 plate
-- AttributeName: Ingredients
-- AttributeValue: Rice, Eggs, Chicken, Soy Sauce
-- AttributeName: Cooking Time
-- AttributeValue: 20 minutes

-- Breakdown of the Statemen --

-- ON CONFLICT (ProductID, AttributeName):
--
-- This specifies the columns (ProductID and AttributeName) that have a unique constraint and can cause a conflict. In this case, if there is an existing row in the ProductAttributes table with the same ProductID and AttributeName, a conflict will be detected.

-- DO UPDATE:
--
-- This tells PostgreSQL to perform an update instead of throwing an error when a conflict is detected.
-- How to delete table

-- SET AttributeValue = EXCLUDED.AttributeValue:
--
-- This specifies what to do during the update. Here, it sets the AttributeValue of the existing row to the value from the row that caused the conflict.
-- EXCLUDED.AttributeValue refers to the value of AttributeValue from the row that was being inserted but caused the conflict. PostgreSQL uses the EXCLUDED keyword to refer to the values of the new row that was not inserted because of the conflict.


-- Insert productattributes and if it has a conflict it update the values
INSERT INTO ecommerce_table.productattributes (productid, attributename, attributevalue) VALUES
    ((select productid from ecommerce_table.products where productname = 'Nasi Uduk Betawi'), 'Spice Level', 'Low'),
    ((select productid from ecommerce_table.products where productname = 'Nasi Uduk Betawi'), 'Serving Size', '1 plate'),
    ((select productid from ecommerce_table.products where productname = 'Nasi Uduk Betawi'), 'Ingredients', 'Rice, Eggs, Chicken, Soy Sauce'),
    ((select productid from ecommerce_table.products where productname = 'Nasi Uduk Betawi'), 'Cooking Time', '20 minutes')
    ON CONFLICT (productid, attributename) DO UPDATE
    SET attributevalue = EXCLUDED.attributevalue;


INSERT INTO ecommerce_table.productattributes (productid, attributename, attributevalue) VALUES
    ((select productid from ecommerce_table.products where productname = 'Sate Sapi'), 'Spice level', 'Low'),
    ((select productid from ecommerce_table.products where productname = 'Sate Sapi'), 'Serving Size', '1 plate'),
    ((select productid from ecommerce_table.products where productname = 'Sate Sapi'), 'Cooking Time', 'Rice, Eggs, Chicken, Soy Sauce')
    ON CONFLICT (productid, attributename) DO UPDATE
    SET attributevalue = EXCLUDED.attributevalue;

-- Delete row
DELETE from ecommerce_table.productattributes where attributeid = 28;

INSERT INTO ecommerce_table.productattributes (productid, attributename, attributevalue) VALUES
    (11, 'Spice level', 'High')
    ON CONFLICT (productid, attributename) DO UPDATE
    SET attributevalue = EXCLUDED.attributevalue;

TRUNCATE TABLE ecommerce_table.productattributes;
-- Or
DELETE FROM ecommerce_table.productattributes;

-- Delete table
DROP TABLE ecommerce_table.productattributes;