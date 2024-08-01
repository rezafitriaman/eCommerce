-- Explanation of Orders to Payments Relationship
-- Purpose:
--
-- The relationship between the Orders and Payments tables allows you to manage the financial transactions associated with each order.
-- Each order can have multiple payments, which is useful for scenarios like split payments, partial payments, refunds, or multiple payment methods.
-- This setup helps in tracking the total payment status of an order accurately, ensuring that the financial records are consistent and detailed.
-- Example Scenario:
--
-- A customer places an order for Indonesian food.
-- The total amount for the order is $30.00.
-- The customer decides to pay $20.00 using a credit card and the remaining $10.00 using a gift card.
-- Two entries are created in the Payments table, each linked to the same order in the Orders table.

INSERT INTO ecommerce_table.payments (orderid, paymentmethod, amount, paymentstatus)
VALUES (15, 'Creadit Card', 16.97, 'Completed');

-- delete one row
--delete from ecommerce_table.payments where paymentid = 3;

-- To ensure that the total payments for an order match exactly the TotalAmount specified in the Orders table, you can use a combination of triggers and a check at the time of order completion. Here’s an approach that includes both a trigger to ensure individual payments do not exceed the total amount and a procedure to finalize the order that checks if the total payments match the order amount.
--
-- Step 1: Modify the Trigger Function
-- Modify the trigger function to ensure that the total payments do not exceed the order amount.
--
-- Step 2: Create a Function to Finalize Orders
-- Create a stored procedure to finalize an order that will check if the total payments match the order amount.

-- Trigger Function to Check Total Payment

CREATE OR REPLACE FUNCTION check_total_payment()
RETURNS TRIGGER AS $$
BEGIN
   -- Check the total payments for the order
    DECLARE total_payments DECIMAL(10,2);
    BEGIN
        SELECT COALESCE(SUM(Amount), 0)
        INTO total_payments
        FROM ecommerce_table.payments
        WHERE orderid = NEW.OrderID;

        -- Check if the total payments exceed the total amount of the order
        IF total_payments + NEW.Amount > (SELECT TotalAmount FROM ecommerce_table.orders WHERE orderid = NEW.orderID) THEN
            RAISE EXCEPTION 'Total payments exceed the order amount';
        END IF;

        RETURN NEW;
    END;
END;
$$ LANGUAGE PLPGSQL;


-- Trigger to Execute the Function
CREATE TRIGGER trigger_check_total_payment
BEFORE INSERT OR UPDATE ON ecommerce_table.payments
FOR EACH ROW
EXECUTE FUNCTION check_total_payment();

-- Function to Finalize Orders
-- This function checks if the total payments match the order amount and changes the order status to 'Completed' if they do.

CREATE OR REPLACE FUNCTION finalize_order(order_id INT)
RETURNS VOID AS $$
DECLARE
    total_payments DECIMAL(10, 2);
    order_amount DECIMAL(10, 2);
BEGIN
    SELECT COALESCE(SUM(amount), 0)
    INTO total_payments
    FROM ecommerce_table.payments
    WHERE orderid = order_id AND paymentstatus = 'Completed';

    SELECT TotalAmount
    INTO order_amount
    FROM ecommerce_table.orders
    WHERE orderid = order_id;

    IF total_payments = order_amount THEN
        UPDATE ecommerce_table.orders
        SET orderstatus = 'Processing'
        WHERE orderid = order_id;
    ELSE
        RAISE EXCEPTION 'Total payments do not match the order amount';
    END IF;
END;
$$ LANGUAGE plpgsql;

-- Insert payments
INSERT INTO ecommerce_table.Payments (OrderID, PaymentMethod, Amount, PaymentStatus)
VALUES (15, 'Credit Card', 15.00, 'Completed');

INSERT INTO ecommerce_table.Payments (OrderID, PaymentMethod, Amount, PaymentStatus)
VALUES (15, 'Gift Card', 1.97, 'Completed');

-- Attempt to finalize the order
SELECT finalize_order(15); -- This should succeed and set the order status to 'Completed'

--------- other example-----------
-- Insert a payment that makes the total exceed the order amount (this should fail)
INSERT INTO ecommerce_table.Payments (OrderID, PaymentMethod, Amount, PaymentStatus)
VALUES (1, 'PayPal', 5.00, 'Completed');

-- Insert payments that don't match the total order amount exactly
INSERT INTO ecommerce_table.Payments (OrderID, PaymentMethod, Amount, PaymentStatus)
VALUES (12, 'Credit Card', 26.00, 'Completed');
INSERT INTO ecommerce_table.Payments (OrderID, PaymentMethod, Amount, PaymentStatus)
VALUES (12, 'Gift Card', 0.11, 'Completed');

-- Attempt to finalize the order (this should fail)
SELECT finalize_order(12);

INSERT INTO ecommerce_table.Payments (OrderID, PaymentMethod, Amount, PaymentStatus)
VALUES (12, 'Gift Card', 0.33, 'Completed');

SELECT finalize_order(12);