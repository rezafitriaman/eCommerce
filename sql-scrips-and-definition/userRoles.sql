-- Role Definitions and Uses
-- Admin
-- Definition:
-- The Admin role typically has the highest level of access and control over the entire e-commerce platform.
-- Uses:
-- Manage all aspects of the e-commerce site, including users, products, categories, orders, and settings.
-- Access and modify all records, including creating, updating, and deleting users, products, and other data.
-- Monitor site performance and access detailed reports and analytics.
-- Handle administrative tasks such as setting site-wide policies, promotions, and managing other roles and permissions.
-- Oversee system security and handle any issues related to breaches or unauthorized access.

-- Customer
-- Definition: The Customer role is assigned to reqular users who use the platform to browse products, make purchases, and manage their accounts.
-- Uses:
-- Browse product listings, categories, and search for specific items.
-- Add products to the cart, create wishlists, and place orders.
-- Manage their own accounts, including updating personal information and viewing order history.
-- Write reviews for products they have purchased.
-- Track shipments and handle returns or order-related issues through support tickets.


-- Vendor
-- Definition:
-- The Vendor role is for users who sell products on the e-commerce platform.They manage own inventory and orders.
-- Uses:
-- List and manage their products, including adding new products, updating existing listings, and managing inventory levels.
-- View and process orders made for their products.
-- Access sales reports and analytics specific to their products.
-- Manage promotions and discounts for their products.
-- Respond to customer inquiries and support tickets related to their products.
-- Update product availability and shipping details.

-- Support
-- Definition:
-- The Support role is fr users who provide customer service and handle inquiries and issues raised by customers.
-- Uses:
-- Manage support tickets, including responding to customer inquiries and resolving issues related to orders, products, or account management.
-- Provide assistance with returns, refunds, and exchanges.
-- Help customers with account-related issues such as password resets, updating account information, and troubleshooting login problems.
-- Monitor customer feedback and work to improve customer satisfaction.
-- Escalate issues to Admins or Vendors if necessary.

-- Insert Roles into 'UserRoles' table

INSERT INTO ecommerce_table.userroles (rolename) VALUES('Admin'),('Customer'),('Vendor'),('Support');
