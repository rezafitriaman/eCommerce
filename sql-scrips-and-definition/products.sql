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