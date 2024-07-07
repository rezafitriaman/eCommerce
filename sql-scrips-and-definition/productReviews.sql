-- Products to ProductReviews

-- Explanation of the ProductReviews Table

-- ReviewID: Unique identifier for each review.
-- ProductID: References the product being reviewed (foreign key to Products table).
-- UserID: References the user who wrote the review (foreign key to Users table).
-- Rating: Numeric rating given to the product (e.g., 1 to 5 stars).
-- ReviewText: Text of the review written by the user.
-- ReviewDate: Timestamp of when the review was submitted.

-- Why ProductReviews is Important
-- Customer Feedback: Collects valuable feedback from customers about the products.
-- Trust and Credibility: Positive reviews build trust and credibility with potential customers.
-- Improved Product Insights: Helps the business understand customer preferences and improve products.
-- SEO Benefits: User-generated content can improve search engine rankings.
-- Sales Influence: Good reviews can significantly influence the purchasing decisions of other customers.

INSERT INTO ecommerce_table.productreviews (productid, userid, rating, reviewtext)
    VALUES ((SELECT productid FROM ecommerce_table.products WHERE productname = 'Kue Lapis'),
            (SELECT userid FROM ecommerce_table.users WHERE username = 'newuserExample'),
            5,
            'Delicius Kue Lapis! The best I have ever had.');


-- Purpose of ProductReviews
-- The ProductReviews table serves the following purposes:
--
-- Collect Feedback: It allows customers to provide feedback on products they've purchased. This feedback can help other customers make informed purchasing decisions.
-- Improve Products: Reviews provide valuable insights to sellers about customer satisfaction and areas for product improvement.
-- Build Trust: Positive reviews can build trust and credibility for your products and store.
-- Relationships Involving ProductReviews
-- Users to ProductReviews
--
-- Type: One-to-Many
-- Description: Each user can write multiple reviews, but each review is written by one user.
-- Foreign Key: ProductReviews.UserID → Users.UserID
-- Products to ProductReviews
--
-- Type: One-to-Many
-- Description: Each product can have multiple reviews, but each review is associated with only one product.
-- Foreign Key: ProductReviews.ProductID → Products.ProductID

-- Other example

INSERT INTO ecommerce_table.productreviews (productid, userid, rating, reviewtext)
VALUES ((SELECT productid FROM ecommerce_table.products WHERE productname = 'Mie Goreng Jawa'),
        (SELECT userid FROM ecommerce_table.users WHERE username = 'newuserExample2'),
        5,
        'Greate taste, but a bit too oily for my liking.');

