-- TODO What if u want to order but u dont have account so u dont have a user id, is this possible?
-- Users to Orders
--
-- Type: One-to-Many
-- Description: Each user can place multiple orders, but each order is placed by one user.
-- Foreign Key: Orders.UserID → Users.UserID

INSERT INTO ecommerce_table.orders (userid, shippingaddressid, billingaddressid, totalamount, orderstatus)
VALUES ((SELECT userid FROM ecommerce_table.users WHERE email = 'customer@example.com'), 1, 2, 1, 'Shipped');

-- Insert example data into Orders
INSERT INTO ecommerce_table.Orders (UserID, ShippingAddressID, BillingAddressID, TotalAmount, OrderStatus)
VALUES (6, 5, 5, 29.99, 'Shipped'),
       (2, 2, 2, 59.99, 'Processing');

-- Delete one row
-- DELETE FROM ecommerce_table.orders where orderid = 11;

-- Delete all rows on a table
-- TRUNCATE table ecommerce_table.orders cascade;

-- list constraint
-- SELECT conname
-- FROM pg_constraint
-- WHERE conrelid = 'ecommerce_table.Orders'::regclass
--   AND contype = 'u';


-- To update the order status in the Orders table, you can use the UPDATE SQL statement.
-- The order status can change as the order progresses through different stages such as Processing, Shipped, Delivered,
-- Cancelled, and Returned. Here's how you can handle and update the order status with examples.

-- Explanation
-- Pending: Initial status when the order is first created.
-- Processing: The order is being prepared or packaged.
-- Shipped: The order has been shipped and is on the way to the customer.
-- Delivered: The order has been delivered to the customer.
-- Cancelled: The order has been cancelled by the user or the store.
-- Returned: The order has been returned by the customer.
-- These statuses ensure that you can track the order's progress and handle it appropriately at each stage. Using transactions ensures that multiple updates to the order status are performed atomically, preventing any partial updates.
--------------------------------------------


-- Create the OrderStatusHistory Table
CREATE TABLE ecommerce_table.OrderStatusHistory (
    StatusHistoryID SERIAL PRIMARY KEY,
    OrderID INT NOT NULL,
    Status VARCHAR(50) NOT NULL,
    ChangeTimestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (OrderID) REFERENCES ecommerce_table.orders(OrderID)
);

-- Create a Trigger to Log Status Changes
CREATE OR REPLACE FUNCTION log_status_change()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO ecommerce_table.OrderStatusHistory (ORDERID, STATUS, CHANGETIMESTAMP)
    VALUES (NEW.OrderID, NEW.OrderStatus, CURRENT_TIMESTAMP);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER after_order_status_update
AFTER UPDATE OF OrderStatus ON ecommerce_table.orders
FOR EACH ROW
EXECUTE FUNCTION log_status_change();


-- Step 1: Create an Order with 'Pending' Status
INSERT INTO ecommerce_table.orders (userid, SHIPPINGADDRESSID, BILLINGADDRESSID, TOTALAMOUNT, ORDERSTATUS)
VALUES ((SELECT userid FROM ecommerce_table.users WHERE email = 'rezafitriaman@hotmail.com'), '9', '8', 0.00, 'Pending');

-- Step 2: Update Status to 'Processing' Based on Events
UPDATE ecommerce_table.orders
SET orderstatus = 'Processing'
WHERE orderid = '14';

-- Step 3: Update status to 'Shipped'
UPDATE ecommerce_table.orders
SET orderstatus = 'Shipped'
WHERE orderid = '14';

-- Step 4: Update status to 'Delivered'
UPDATE ecommerce_table.orders
SET orderstatus = 'Delivered'
WHERE orderid = '14';

-- Checking Status History
SELECT * FROM ecommerce_table.OrderStatusHistory
WHERE orderid = 14
ORDER BY changetimestamp;


-------------------------------
-- Delete one row
DELETE from ecommerce_table.orders where orderid = 13;
-- Delete all rows
TRUNCATE table ecommerce_table.OrderStatusHistory;
