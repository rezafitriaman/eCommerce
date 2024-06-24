-- Products to ProductCategories
--
-- Type: Many-to-Many (with junction table)
-- Description: Each product can belong to multiple categories, and each category can contain multiple products. The junction table ProductCategories resolves this many-to-many relationship.
-- Foreign Keys:
-- ProductCategories.ProductID → Products.ProductID
-- ProductCategories.CategoryID → Categories.CategoryID

-- The Products table is created with a foreign key referencing Categories to accommodate a default category.
-- An example product, "Kue Lapis," is inserted and linked to both "Kue (Cakes and Desserts)" and "Jajanan Pasar (Traditional Snacks)" categories.

INSERT INTO ecommerce_table.products (productname, description, price, sku, stockquantity) VALUES
('Kue Lapis', 'Kue lapis is een gestoomde koek met gekleurde laagjes dat heerlijk naar cocos smaakt.', 3.00, 'jaj123456789', 5),
('Nasi Goreng (Fried Rice)', 'Nasi Goreng is the popular Indonesian fried rice which is traditionally served with a fried egg.', 8.99, 'nas123456789', 4);

-- Insert products for Nasi (Rice Dishes)
INSERT INTO ecommerce_table.Products (ProductName, Description, Price, SKU, StockQuantity)
VALUES ('Nasi Goreng Special', 'Special fried rice with egg and chicken', 3.99, 'NASI-GORENG-001', 100);
INSERT INTO ecommerce_table.Products (ProductName, Description, Price, SKU, StockQuantity)
VALUES ('Nasi Uduk Betawi', 'Coconut rice with traditional Betawi spices', 4.49, 'NASI-UDUK-001', 100);
INSERT INTO ecommerce_table.Products (ProductName, Description, Price, SKU, StockQuantity)
VALUES ('Nasi Kuning Komplit', 'Yellow rice with complete side dishes', 4.99, 'NASI-KUNING-001', 100);

-- Insert products for Mie (Noodle Dishes)
INSERT INTO ecommerce_table.Products (ProductName, Description, Price, SKU, StockQuantity)
VALUES ('Mie Goreng Jawa', 'Javanese style fried noodles', 3.49, 'MIE-GORENG-001', 100);
INSERT INTO ecommerce_table.Products (ProductName, Description, Price, SKU, StockQuantity)
VALUES ('Mie Ayam Jakarta', 'Jakarta style chicken noodles', 3.99, 'MIE-AYAM-001', 100);
INSERT INTO ecommerce_table.Products (ProductName, Description, Price, SKU, StockQuantity)
VALUES ('Bakmi Spesial', 'Special noodles with chicken and vegetables', 4.49, 'BAKMI-001', 100);

-- Insert products for Sate (Satay)
INSERT INTO ecommerce_table.Products (ProductName, Description, Price, SKU, StockQuantity)
VALUES ('Sate Ayam Madura', 'Chicken satay with Madura sauce', 2.99, 'SATE-AYAM-001', 100);
INSERT INTO ecommerce_table.Products (ProductName, Description, Price, SKU, StockQuantity)
VALUES ('Sate Kambing', 'Goat satay with spicy sauce', 3.99, 'SATE-KAMBING-001', 100);
INSERT INTO ecommerce_table.Products (ProductName, Description, Price, SKU, StockQuantity)
VALUES ('Sate Sapi', 'Beef satay with peanut sauce', 3.49, 'SATE-SAPI-001', 100);

-- Insert products for Lauk (Main Dishes)
INSERT INTO ecommerce_table.Products (ProductName, Description, Price, SKU, StockQuantity)
VALUES ('Ayam Goreng Kalasan', 'Fried chicken with Kalasan spices', 4.99, 'AYAM-GORENG-001', 100);
INSERT INTO ecommerce_table.Products (ProductName, Description, Price, SKU, StockQuantity)
VALUES ('Ikan Bakar Jimbaran', 'Grilled fish Jimbaran style', 6.49, 'IKAN-BAKAR-001', 100);
INSERT INTO ecommerce_table.Products (ProductName, Description, Price, SKU, StockQuantity)
VALUES ('Rendang Padang', 'Spicy beef stew Padang style', 5.99, 'RENDANG-001', 100);

----------- Drop CategoryID column on Products because we dont need it
-- Drop the CategoryID column from the Products table
-- ALTER TABLE ecommerce_table.Products
-- DROP COLUMN CategoryID;

-- Select all from productCategories table
SELECT * FROM ecommerce_table.ProductCategories;

-- Select all from categories table that have productID x
SELECT *
FROM ecommerce_table.Categories c
    JOIN ecommerce_table.ProductCategories pc ON c.CategoryID = pc.CategoryID
    JOIN ecommerce_table.products p ON p.productid = pc.productid
WHERE pc.ProductID = 9;

-- select all from products table that have categoryId x
SELECT *
FROM ecommerce_table.Products p
    JOIN ecommerce_table.ProductCategories pc ON p.ProductID = pc.ProductID
    JOIN ecommerce_table.Categories c ON pc.categoryid = c.categoryid
WHERE pc.CategoryID = 1;

