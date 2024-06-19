-- Products to ProductCategories
-- Type: Many-to-Many (with junction table)
-- Description: Each product can belong to multiple categories, and each category can contain multiple products. The junction table ProductCategories resolves this many-to-many relationship.

-- The ProductCategories junction table is used to assign products to multiple categories, thereby supporting the many-to-many relationship.

INSERT INTO ecommerce_table.ProductCategories (productid, categoryid) VALUES
    (1,6),
    (2,1);

-- Link product to multiple categories using ProductCategories table
INSERT INTO ecommerce_table.ProductCategories (ProductID, CategoryID) VALUES
    (1, 8); -- Assigning 'Kue Lapis' to 'Kue (Cakes and Desserts)'