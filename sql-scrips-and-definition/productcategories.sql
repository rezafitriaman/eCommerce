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

-- Link product to multiple categories using ProductCategories table
INSERT INTO ecommerce_table.ProductCategories (ProductID, CategoryID) VALUES
    (2, 1),
    (3, 1),
    (4, 1),
    (5, 1);

INSERT INTO ecommerce_table.productcategories (productid, categoryid) VALUES
    (2, 9);

INSERT INTO ecommerce_table.productcategories (productid, categoryid) VALUES
    (9, 3),
    (9, 17);

----------------- this is needed because we have CategoryID on our products table -------------------

-- Step 1: Migrate Existing Data
-- Insert existing CategoryID relationships from Products into ProductCategories
-- INSERT INTO ecommerce_table.productcategories (productid, categoryid)
-- SELECT ProductID, CategoryID
-- FROM ecommerce_table.Products;

DELETE FROM ecommerce_table.productcategories
WHERE productcategoryid = 24;

-- Step 1: Check for existing duplicates
SELECT  productid, categoryid, count(*)
FROM ecommerce_table.productcategories
GROUP BY productid, categoryid
HAVING count(*) > 1;

-- Step 2: Remove duplicates (if any)
WITH CTE AS (SELECT ProductCategoryID,
                    ROW_NUMBER() OVER (PARTITION BY ProductID, CategoryID ORDER BY ProductCategoryID) AS rn
             FROM ecommerce_table.ProductCategories)
DELETE
FROM ecommerce_table.ProductCategories
    USING CTE
WHERE ecommerce_table.ProductCategories.ProductCategoryID = CTE.ProductCategoryID
  AND CTE.rn > 1;
-- or --
WITH CTE AS (SELECT row_number() OVER (
    PARTITION BY productid, categoryid
    ORDER BY productcategoryid
    ) AS row_num,
                    productcategoryid
             FROM ecommerce_table.productcategories)
DELETE
FROM ecommerce_table.productcategories
WHERE productcategoryid IN (SELECT productcategoryid
                            FROM CTE
                            WHERE row_num > 1);


-- Step 3: Add the unique constraint on an existed table.
ALTER TABLE ecommerce_table.ProductCategories
    ADD CONSTRAINT UQ_ProductCategories UNIQUE (ProductID, CategoryID);

--- test ---

SELECT productid, count(*)
from ecommerce_table.productcategories
group by productid
having count(*) > 1;

with cte as (
    SELECT row_number() over (
        partition by productid
        ORDER BY productid
        ) as row_num, productcategoryid, productid, categoryid
    FROM ecommerce_table.productcategories
)
--DELETE FROM ecommerce_table.productcategories
--where productcategoryid in (
select
    --cte.row_num,
    --cte.productid,
    --cte.categoryid,
    cte.productcategoryid
from cte
--    left join ecommerce_table.productcategories
--on ecommerce_table.productcategories.productcategoryid = cte.productcategoryid
where cte.row_num > 1;
--);

--- test ----