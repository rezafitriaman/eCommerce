-- Products to ProductImages
--
-- Type: One-to-Many
-- Description: Each product can have multiple images, but each image is associated with only one product.
-- Foreign Key: ProductImages.ProductID → Products.ProductID

INSERT INTO ecommerce_table.productimages (PRODUCTID, IMAGEURL, ISPRIMARY) VALUES
    ((SELECT productid FROM ecommerce_table.products WHERE productname = 'Nasi Goreng (Fried Rice)'), 'https://www.recipetineats.com/tachyon/2016/03/Nasi-Goreng_3-1.jpg?resize=900%2C1260&zoom=1',TRUE),
    ((SELECT productid FROM ecommerce_table.products WHERE productname = 'Nasi Goreng (Fried Rice)'), 'https://watschaftdepodcast.com/wp-content/uploads/2023/02/Nasi-Goreng.jpg', FALSE);

INSERT INTO ecommerce_table.productimages (PRODUCTID, IMAGEURL, ISPRIMARY) VALUES
    ((SELECT productid FROM ecommerce_table.products WHERE productname = 'Mie Goreng Jawa'), 'https://www.recipetineats.com/tachyon/2020/02/Mie-Goreng_5.jpg', TRUE),
    ((SELECT productid FROM ecommerce_table.products WHERE productname = 'Mie Goreng Jawa'), 'https://admin.ruthgeorgiev.com/wp-content/uploads/2020/08/494A2843-1-scaled.jpg', FALSE);

INSERT INTO ecommerce_table.productimages (PRODUCTID, IMAGEURL, ISPRIMARY) VALUES
    ((SELECT productid FROM ecommerce_table.products WHERE productname = 'Sate Sapi'), 'https://img.kurio.network/BK4xVgUiUepaDHJSNqGJEyr9ZmQ=/440x440/filters:quality(80)/https://kurio-img.kurioapps.com/21/05/11/41c74d86-b615-4174-9fc9-ec875528bdf8.jpe', TRUE),
    ((SELECT productid FROM ecommerce_table.products WHERE productname = 'Sate Sapi'), 'https://hijrahfood.co.id/blog/wp-content/uploads/2023/03/resep-sate-daging-sapi-696x392.jpg', FALSE);

drop table if exists ecommerce_table.productimages;

SELECT productid FROM ecommerce_table.products WHERE productname = 'Nasi Goreng (Fried Rice)'