-- Explanation of ProductTags
-- ProductTags are used to provide additional metadata or descriptors for products that help in categorizing, filtering, and searching products more effectively. Tags are usually short, descriptive keywords or phrases that can capture essential attributes of a product that might not fit neatly into the predefined category structure.
--
-- Why You Need ProductTags:
--
-- Enhanced Searchability: Tags improve the search experience for users. Customers can search for products using tags to quickly find what they're looking for.
-- Flexible Filtering: Tags provide a flexible way to filter products based on various attributes that are not captured by categories.
-- Better Organization: Tags help in organizing products in a more granular way. For example, products under "Nasi Goreng" can have tags like "Spicy", "Vegetarian", "Seafood".
-- Marketing and Recommendations: Tags can be used for personalized recommendations and marketing campaigns based on customer preferences and behaviors.


-- ProductTags
--
-- Tags for Nasi Goreng Special
--
-- TagID: 1
--
-- ProductID: 1
--
-- TagName: Spicy
--
-- TagID: 2
--
-- ProductID: 1
--
-- TagName: Seafood
--
-- Tags for Nasi Uduk Betawi
--
-- TagID: 3
--
-- ProductID: 2
--
-- TagName: Coconut
--
-- TagID: 4
--
-- ProductID: 2
--
-- TagName: Traditional

INSERT INTO ecommerce_table.producttags (productid, tagname) VALUES
    ((select productid from ecommerce_table.products where productname = 'Nasi Goreng Special'), 'Spicy'),
    ((select productid from ecommerce_table.products where productname = 'Nasi Goreng Special'), 'Traditional'),
    ((select productid from ecommerce_table.products where productname = 'Nasi Uduk Betawi'), 'Coconut'),
    ((select productid from ecommerce_table.products where productname = 'Nasi Uduk Betawi'), 'Fish')
    ON CONFLICT (productid, tagname) DO UPDATE
    SET tagname = EXCLUDED.tagname;
