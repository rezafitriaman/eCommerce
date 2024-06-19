-- Insers Users into 'Users' table

INSERT INTO ecommerce_table.users(username, passwordhash, email, firstname, lastname, phonenumber, roleid) VALUES
    ('adminuserExample', 'hashedpassword1', 'admin@example.com', 'John-admin', 'Doa', '0031612345678', (SELECT roleid FROM ecommerce_table.userroles WHERE rolename = 'Admin')),
    ('customerExample', 'hashedpassword2', 'customer@example.com', 'John-customer', 'Doc', '0031612345671', (SELECT roleid FROM ecommerce_table.userroles WHERE rolename = 'Customer')),
    ('vendorExample', 'hashedpassword3', 'vendor@example.com', 'John-vendor', 'Dov', '0031612345672', (SELECT roleid FROM ecommerce_table.userroles WHERE rolename = 'Vendor')),
    ('supportExample', 'hashedpassword4', 'support@example.com', 'John-support', 'Dos', '0031612345673', (SELECT roleid FROM ecommerce_table.userroles WHERE rolename = 'Support'));

-- Insert extra customer
INSERT INTO ecommerce_table.Users (Username, PasswordHash, Email, FirstName, LastName, PhoneNumber, RoleID) VALUES
    ('newuserExample2', 'hashedpassword2', 'newuser2@example.com', 'New', 'User2', '0031612345674', (SELECT RoleID FROM ecommerce_table.UserRoles WHERE RoleName = 'Customer'));

-- Example Queries

-- Retrieve All Users with Their Roles
SELECT u.userid, u.username, u.email, u.firstname, u.lastname, r.rolename
FROM ecommerce_table.users u
JOIN ecommerce_table.userroles r ON u.roleid = r.roleid;

-- Retrieve All Admin Users
SELECT u.userid, u.username, u.email, u.firstname, u.lastname
FROM ecommerce_table.users u
JOIN ecommerce_table.userroles r ON u.roleid = r.roleid
WHERE r.rolename = 'Admin';

-- Count Users by Role
SELECT r.rolename, COUNT(u.userid) AS UserCount
FROM ecommerce_table.users u
JOIN ecommerce_table.userroles r ON u.roleid = r.roleid
GROUP BY r.rolename;

-- update User Role by RoleID
UPDATE ecommerce_table.Users
SET RoleID = (SELECT RoleID FROM ecommerce_table.UserRoles WHERE RoleName = 'Vendor')
WHERE Username = 'newuserExample';