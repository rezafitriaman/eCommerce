-- Products to ProductCategories
--
-- Type: Many-to-Many (with junction table)
-- Description: Each product can belong to multiple categories, and each category can contain multiple products. The junction table ProductCategories resolves this many-to-many relationship.
-- Foreign Keys:
-- ProductCategories.ProductID → Products.ProductID
-- ProductCategories.CategoryID → Categories.CategoryID

-- The Products table is created with a foreign key referencing Categories to accommodate a default category.
-- An example product, "Kue Lapis," is inserted and linked to both "Kue (Cakes and Desserts)" and "Jajanan Pasar (Traditional Snacks)" categories.

INSERT INTO ecommerce_table.products (categoryid, productname, description, price, sku, stockquantity) VALUES
(6, 'Kue Lapis', 'Kue lapis is een gestoomde koek met gekleurde laagjes dat heerlijk naar cocos smaakt.', 3.00, 'jaj123456789', 5),
(1, 'Nasi Goreng (Fried Rice)', 'Nasi Goreng is the popular Indonesian fried rice which is traditionally served with a fried egg.', 8.99, 'nas123456789', 4);

-- Insert products for Nasi (Rice Dishes)
INSERT INTO ecommerce_table.Products (CategoryID, ProductName, Description, Price, SKU, StockQuantity)
VALUES (9, 'Nasi Goreng Special', 'Special fried rice with egg and chicken', 3.99, 'NASI-GORENG-001', 100);

INSERT INTO ecommerce_table.Products (CategoryID, ProductName, Description, Price, SKU, StockQuantity)
VALUES (10, 'Nasi Uduk Betawi', 'Coconut rice with traditional Betawi spices', 4.49, 'NASI-UDUK-001', 100);

INSERT INTO ecommerce_table.Products (CategoryID, ProductName, Description, Price, SKU, StockQuantity)
VALUES (11, 'Nasi Kuning Komplit', 'Yellow rice with complete side dishes', 4.99, 'NASI-KUNING-001', 100);

-- Insert products for Mie (Noodle Dishes)
INSERT INTO ecommerce_table.Products (CategoryID, ProductName, Description, Price, SKU, StockQuantity)
VALUES (12, 'Mie Goreng Jawa', 'Javanese style fried noodles', 3.49, 'MIE-GORENG-001', 100);
INSERT INTO ecommerce_table.Products (CategoryID, ProductName, Description, Price, SKU, StockQuantity)
VALUES (13, 'Mie Ayam Jakarta', 'Jakarta style chicken noodles', 3.99, 'MIE-AYAM-001', 100);
INSERT INTO ecommerce_table.Products (CategoryID, ProductName, Description, Price, SKU, StockQuantity)
VALUES (14, 'Bakmi Spesial', 'Special noodles with chicken and vegetables', 4.49, 'BAKMI-001', 100);
