-- Purpose of Orders to OrderDetails
-- Orders Table:
--
-- Represents a customer's order as a whole.
-- Contains general information about the order such as the user who placed it, the total amount, order status, etc.
-- OrderDetails Table:
--
-- Represents individual items within an order.
-- Contains detailed information about each product included in the order, such as the quantity ordered and the price at the time of the order.
-- Why You Need It:
--
-- E-commerce orders typically consist of multiple items/products. Each item in an order needs to be tracked individually for quantity, price, and other specifics.
-- The OrderDetails table captures this item-level information.
-- This allows the Orders table to remain succinct, containing only general information, while OrderDetails holds the detailed breakdown.

-- Put the pl/pgSQL here!

-- Steps to Achieve This
-- Create a function that calculates and updates the TotalAmount in the Orders table.
-- Create a trigger that calls this function after an insert, update, or delete operation on the OrderDetails table.

-- Create Procedural language pl/pgSQL
-- Create the Function:
CREATE OR REPLACE FUNCTION update_order_total()
    RETURNS TRIGGER AS $$
BEGIN
    -- update the TotalAmount in Orders table for the given OrderID
    UPDATE ecommerce_table.orders
    SET totalamount = (
        SELECT COALESCE(sum(quantity * price), 0)
        FROM ecommerce_table.orderdetails od
        WHERE od.orderID = NEW.orderID
    )
    WHERE orderid = NEW.OrderID;

    RETURN NEW; -- This returns the new row to the trigger
END;
$$ LANGUAGE plpgsql;

-- Create the Trigger:
CREATE OR REPLACE TRIGGER orderdetails_after_insert_update_delete
    AFTER INSERT OR UPDATE OR DELETE ON ecommerce_table.orderdetails
    FOR EACH ROW
EXECUTE FUNCTION update_order_total();

-- Insert an Order:
INSERT INTO ecommerce_table.Orders (userid, shippingaddressid, billingaddressid, totalamount, orderstatus)
VALUES ((SELECT userid FROM ecommerce_table.users WHERE email = 'newuser2@example.com'), 7, 7, 0.00, 'Pending');

-- Insert OrderDetails:
INSERT INTO ecommerce_table.orderdetails (orderid, productid, quantity, price)
VALUES (12, 3, 1, (select price from ecommerce_table.products where products.productid = 3)),
       (12, 4, 2, (select price from ecommerce_table.products where products.productid = 4));

INSERT INTO ecommerce_table.orderdetails (orderid, productid, quantity, price)
VALUES (12, 8, 3, (select price from ecommerce_table.products where products.productid = 8));

SELECT * FROM ecommerce_table.orders WHERE orderid = 12;