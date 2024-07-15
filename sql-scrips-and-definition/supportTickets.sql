-- Explanation of SupportTickets
-- SupportTickets table is essential for managing customer support and communication. Here’s why it’s important and what it does:
--
-- Issue Tracking: Customers can raise support tickets for any issues they face with their orders, such as delivery problems, product defects, or general inquiries.
-- Communication: It provides a structured way for customers and support agents to communicate and track the resolution process.
-- History and Reference: Tickets provide a record of customer issues and interactions, which can be referenced later for quality control, customer satisfaction analysis, or legal reasons.
-- Priority and Status Management: Tickets can be prioritized and tracked through different statuses (e.g., Open, In Progress, Resolved, Closed), helping support teams manage and resolve issues efficiently.

-- Explanation of ERD
-- An Entity-Relationship Diagram (ERD) is a visual representation of the database schema. It shows the tables (entities) in the database, the columns (attributes) in each table, and the relationships between the tables. ERDs help in understanding the database structure, relationships, and constraints, facilitating the design and implementation of the database.

-- SupportTickets Table with Status Constraint
-- To ensure the Status column in SupportTickets only has specific values (Open, In Progress, Resolved, Closed), you can use a CHECK constraint.

-- ERD for Users, Orders, and SupportTickets
-- The relationships are as follows:
--
-- Users to Orders
--
-- Type: One-to-Many
-- Description: Each user can place multiple orders, but each order is placed by one user.
-- Foreign Key: Orders.UserID → Users.UserID

-- Users to SupportTickets
--
-- Type: One-to-Many
-- Description: Each user can create multiple support tickets, but each ticket is created by one user.
-- Foreign Key: SupportTickets.UserID → Users.UserID

-- Orders to SupportTickets
--
-- Type: One-to-Many
-- Description: Each order can be referenced in multiple support tickets, but each support ticket references one order.
-- Foreign Key: SupportTickets.OrderID → Orders.OrderID

-- Create function to insert support tickets with dynamic subject
CREATE OR REPLACE FUNCTION create_support_ticket(
    p_user_id INT,
    p_order_id INT,
    p_subject VARCHAR(250),
    p_status VARCHAR(50)
)
    RETURNS VOID AS $$
BEGIN
    INSERT INTO ecommerce_table.SupportTickets (UserID, OrderID, Subject, Status)
    VALUES (p_user_id, p_order_id, p_subject, p_status);
EXCEPTION
    WHEN unique_violation THEN
        RAISE NOTICE 'A support ticket for UserID % and OrderID % with a subject "%" already exists.', p_user_id, p_order_id, p_subject;
    WHEN others THEN
        RAISE EXCEPTION 'An error occurred: %', SQLERRM;
END
$$ LANGUAGE plpgsql;

-- Explanation:
-- Dynamic Subject: The function uses the || operator to concatenate the OrderID with the static part of the subject string.
-- Exception Handling:
-- unique_violation: This exception catches cases where a duplicate entry is attempted (if you have a unique constraint set up).
-- others: This catches any other errors that may occur and raises an exception with the error message.
-- Insert example data into SupportTickets using function
SELECT create_support_ticket((SELECT userid from ecommerce_table.users where email = 'customer@example.com'),
                             8,
                             'Delivery Issue', 'Open');
SELECT create_support_ticket(6, 7, 'Product Quality Issue', 'Open');
SELECT create_support_ticket(2, 8, 'Product Quality Issue', 'Open');

-- Retrieve support tickets related to a specific order
SELECT
    *
FROM
    ecommerce_table.supporttickets st
--JOIN
--    ecommerce_table.users u ON st.userid = u.userid
JOIN
    ecommerce_table.orders o ON st.orderid = o.orderid
WHERE
    st.orderid = 7;