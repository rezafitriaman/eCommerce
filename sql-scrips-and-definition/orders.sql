-- TODO What if u want to order but u dont have accunt so u dont have a user id, is this possible?

INSERT INTO ecommerce_table.orders (userid, shippingaddressid, billingaddressid, totalamount, orderstatus) VALUES ((SELECT userid
                                                                                                                    FROM ecommerce_table.users
                                                                                                                    WHERE email = 'customer@example.com'), 1, 2, 1, 'Shipped');

-- Insert example data into Orders
INSERT INTO ecommerce_table.Orders (UserID, ShippingAddressID, BillingAddressID, TotalAmount, OrderStatus)
VALUES (6, 5, 5, 29.99, 'Shipped'),
       (2, 2, 2, 59.99, 'Processing');

-- Delete all rows on a table
TRUNCATE table ecommerce_table.orders cascade;

-- list constraint
SELECT conname
FROM pg_constraint
WHERE conrelid = 'ecommerce_table.Orders'::regclass
  AND contype = 'u';