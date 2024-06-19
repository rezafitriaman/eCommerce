--Users to Addresses

--Type: One-to-Many
--Description: Each user can have multiple addresses, but each address belongs to only one user.
--Foreign Key: Addresses.UserID → Users.UserID

INSERT INTO ecommerce_table.Addresses (userid, street, city, state, postalcode, country) VALUES
    (2, 'Klantenstraat 123', 'Amsterdam', 'Noord-Holland', '1011AB', 'Netherlands'),
    (2, 'Tweede Straat 46', 'Rotterdam', 'Zuid-Holland', '3011AD', 'Netherlands'),
    (3, 'Leverancierslaan 789', 'Utrecht', 'Utrecht', '3511AD', 'Netherlands'),
    (4, 'Supportweg 10', 'Eindhoven', 'Noord-Brabant', '5611AA', 'Netherlands'),
    (6, 'Nieuwegebruikerspad 2', 'Groningen', 'Groningen', '9711AA', 'Netherlands');

-- add address for adminuserExample
INSERT INTO ecommerce_table.addresses (userid, street, city, state, postalcode, country) VALUES
    (1, 'Adminstraat 85', 'Groningen', 'Groningen', '9741ET', 'Netherlands');

--Querying Data:
--find all addresses for 'customerExample':
SELECT u.username
     , a.addressid
     , a.street
     , a.city
     , a.state
     , a.postalcode
     , a.country
FROM ecommerce_table.users AS u
Left JOIN ecommerce_table.addresses AS a
ON u.userid = a.userid
--WHERE u.username = 'customerExample';
--WHERE U.username = 'vendorExample';
