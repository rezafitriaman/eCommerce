--Categories (Self-referencing)

--Type: One-to-Many
--Description: A category can have multiple subcategories (child categories), but each subcategory has only one parent category.
--Foreign Key: Categories.ParentCategoryID → Categories.CategoryID

-- Categories to Products
--
-- Type: One-to-Many
-- Description: Each category can contain multiple products, but each product belongs to only one category.
-- Foreign Key: Products.CategoryID → Categories.CategoryID

-- Example Category Structure
-- Nasi (Rice Dishes)
--
-- Nasi Goreng (Fried Rice)
-- Nasi Uduk (Coconut Rice)
-- Nasi Kuning (Yellow Rice)

-- Mie (Noodle Dishes)
--
-- Mie Goreng (Fried Noodles)
-- Mie Ayam (Chicken Noodles)
-- Bakmi (Noodles)

-- Sate (Satay)
--
-- Sate Ayam (Chicken Satay)
-- Sate Kambing (Goat Satay)
-- Sate Sapi (Beef Satay)

-- Lauk (Main Dishes)
--
-- Ayam Goreng (Fried Chicken)
-- Rendang (Spicy Beef Stew)
-- Ikan Bakar (Grilled Fish)

-- Sayur (Vegetable Dishes)
--
-- Gado-Gado (Vegetable Salad with Peanut Sauce)
-- Sayur Lodeh (Vegetable Stew in Coconut Milk)
-- Capcay (Stir-Fried Vegetables)

-- Jajanan Pasar (Traditional Snacks)
--
-- Klepon (Sweet Rice Cake Balls)
-- Onde-Onde (Sesame Balls)
-- Martabak (Stuffed Pancake)

-- Minuman (Drinks)
--
-- Es Teh (Iced Tea)
-- Es Cendol (Iced Coconut Drink)
-- Kopi Tubruk (Indonesian Coffee)

-- Kue (Cakes and Desserts)
--
-- Kue Lapis (Layer Cake)
-- Kue Cubit (Mini Pancakes)
-- Dadar Gulung (Rolled Pancake with Coconut Filling)

-- Insert top-level categories
INSERT INTO ecommerce_table.categories (categoryname, parentcategoryid) VALUES
    ('Nasi (Rice Dishes)', NULL),
    ('Mie (Noodle Dishes)', NULL),
    ('Sate (Satay)', NULL),
    ('Lauk (Main Dishes)', NULL),
    ('Sayur (Vegetable Dishes)', NULL),
    ('Jajanan Pasar (Traditional Snacks)', NULL),
    ('Minuman (Drinks)', NULL),
    ('Kue (Cakes and Desserts)', NULL);

-- Insert subcategories for 'Nasi (Rice Dishes)'
INSERT INTO ecommerce_table.categories (categoryname, parentcategoryid) VALUES
    ('Nasi Goreng (Fried Rice)', 1),
    ('Nasi Uduk (Coconut Rice)', 1),
    ('Nasi Kuning (Yellow Rice)', 1);

-- Insert subcategories for 'Mie (Noodle Dishes)'
INSERT INTO ecommerce_table.Categories (CategoryName, ParentCategoryID) VALUES
    ('Mie Goreng (Fried Noodles)', 2),
    ('Mie Ayam (Chicken Noodles)', 2),
    ('Bakmi (Noodles)', 2);


-- Insert subcategories for 'Lauk (Main Dishes)'
INSERT INTO ecommerce_table.Categories (CategoryName, ParentCategoryID) VALUES
    ('Ayam Goreng (Fried Chicken)', 3),
    ('Rendang (Spicy Beef Stew)', 3),
    ('Ikan Bakar (Grilled Fish)', 3);


-- Insert subcategories for 'Sate (Satay)'
INSERT INTO ecommerce_table.categories (categoryname, parentcategoryid) VALUES
    ('Sate Ayam (Chicken Satay)', 4),
    ('Sate Kambing (Goat Satay)', 4),
    ('Sate Sapi (Beef Satay)', 4);

-- Insert subcategories for 'Sayur (Vegetable Dishes)'
INSERT INTO ecommerce_table.Categories (CategoryName, ParentCategoryID) VALUES
    ('Gado-Gado (Vegetable Salad with Peanut Sauce)', 5),
    ('Sayur Lodeh (Vegetable Stew in Coconut Milk)', 5),
    ('Capcay (Stir-Fried Vegetables)', 5);

-- Insert subcategories for 'Jajanan Pasar (Traditional Snacks)'
INSERT INTO ecommerce_table.Categories (CategoryName, ParentCategoryID) VALUES
    ('Klepon (Sweet Rice Cake Balls)', 6),
    ('Onde-Onde (Sesame Balls)', 6),
    ('Martabak (Stuffed Pancake)', 6);

-- Insert subcategories for 'Minuman (Drinks)'
INSERT INTO ecommerce_table.Categories (CategoryName, ParentCategoryID) VALUES
    ('Es Teh (Iced Tea)', 7),
    ('Es Cendol (Iced Coconut Drink)', 7),
    ('Kopi Tubruk (Indonesian Coffee)', 7);

-- Insert subcategories for 'Kue (Cakes and Desserts)'
INSERT INTO ecommerce_table.Categories (CategoryName, ParentCategoryID) VALUES
    ('Kue Lapis (Layer Cake)', 8),
    ('Kue Cubit (Mini Pancakes)', 8),
    ('Dadar Gulung (Rolled Pancake with Coconut Filling)', 8);


