-- Explanation of Users to Wishlist
-- Users to Wishlist Relationship:
--
-- Type: One-to-Many
-- Description: Each user can have one wishlist that contains multiple products. This allows users to save products they are interested in purchasing later.
-- Foreign Key: Wishlist.UserID → Users.UserID
-- Why it is Needed:
--
-- A wishlist allows users to save products they are interested in, which can enhance user experience by providing a convenient way to track desired items.
-- It can help with marketing strategies such as sending reminders for items in the wishlist, or providing special offers for wishlist items.

INSERT INTO ecommerce_table.Wishlist (UserID, ProductID) VALUES (9, 13);
INSERT INTO ecommerce_table.Wishlist (UserID, ProductID) VALUES (9, 15);