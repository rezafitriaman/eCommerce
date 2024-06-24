-- Create schema for the e-commerce database
CREATE SCHEMA ecommerce_table;

-- Create UserRoles table
CREATE TABLE ecommerce_table.UserRoles (
	RoleID SERIAL PRIMARY KEY,
	RoleName VARCHAR(50) NOT NULL
);

-- Create User table
CREATE TABLE ecommerce_table.Users (
	UserID SERIAL PRIMARY KEY,
	Username VARCHAR(50) NOT NULL UNIQUE,
	PasswordHash VARCHAR(255) NOT NULL,
	Email VARCHAR(100) NOT NULL UNIQUE,
	FirstName VARCHAR(50),
	LastName VARCHAR(50),
	PhoneNumber VARCHAR(20),
	RoleID INT NOT NULL,
	FOREIGN KEY (RoleID) REFERENCES  ecommerce_table.UserRoles(RoleID)
);

-- Create Addresses table
CREATE TABLE ecommerce_table.Addresses (
	AddressID SERIAL PRIMARY KEY,
	UserID INT NOT NULL,
	Street VARCHAR(255) NOT NULL,
	City VARCHAR(100) NOT NULL,
	State VARCHAR(100) NOT NULL,
	PostalCode VARCHAR(20) NOT NULL,
	Country VARCHAR(100) NOT NULL,
	FOREIGN KEY(UserID) REFERENCES ecommerce_table.Users(UserID)
);

-- Create Categories table
CREATE TABLE ecommerce_table.Categories (
	CategoryID SERIAL PRIMARY KEY,
	CategoryName VARCHAR(100) NOT NULL,
	ParentCategoryID INT,
	FOREIGN KEY (ParentCategoryID) REFERENCES ecommerce_table.Categories(CategoryID)
);

-- Create Products table
CREATE TABLE ecommerce_table.Products (
	ProductID SERIAL PRIMARY KEY,
	ProductName VARCHAR(255) NOT NULL,
	Description TEXT,
	Price DECIMAL(10, 2) NOT NULL,
	SKU VARCHAR(50) NOT NULL UNIQUE,
	StockQuantity INT NOT NULL,
);

-- Create ProductCategories table
CREATE TABLE ecommerce_table.ProductCategories (
   ProductCategoryID SERIAL PRIMARY KEY,
   ProductID INT NOT NULL,
   CategoryID INT NOT NULL,
   FOREIGN KEY (ProductID) REFERENCES ecommerce_table.Products(ProductID),
   FOREIGN KEY (CategoryID) REFERENCES ecommerce_table.Categories(CategoryID),
   CONSTRAINT UQ_ProductCategories UNIQUE (ProductID, CategoryID) -- to ensure the combination of the ProductID and CategoryID are unique
);

-- Create ProductImages table
CREATE TABLE ecommerce_table.ProductImages (
	ImageID SERIAL PRIMARY KEY,
	ProductID INT NOT NULL,
	ImageURL VARCHAR(200) NOT NULL,
	IsPrimary BOOLEAN NOT NULL DEFAULT FALSE,
	FOREIGN KEY (ProductID) REFERENCES ecommerce_table.Products(ProductID)
);

-- Create ProductAttributes table
Create table ecommerce_table.ProductAttributtes (
	AttributeID SERIAL PRIMARY KEY,
	ProductID INT NOT NULL,
	AttributeName VARCHAR(100) NOT NULL,
	AttributeValue VARCHAR(255) NOT NULL,
	FOREIGN KEY (ProductID) REFERENCES ecommerce_table.Products(ProductID)
);

-- Create ProductTags table
CREATE TABLE ecommerce_table.ProductTags (
	TagID SERIAL PRIMARY KEY,
	ProductID INT NOT NULL,
	TagName VARCHAR(100) NOT NULL,
	FOREIGN KEY (ProductID) REFERENCES ecommerce_table.Products(ProductID)
);

-- Create Promotions table
CREATE TABLE ecommerce_table.Promotions (
	PromotionID SERIAL PRIMARY KEY,
	PromotionName VARCHAR(100) NOT NULL,
	DiscountType VARCHAR(50) NOT NULL,
	DiscountValue DECIMAL(10, 2) NOT NULL,
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL
);

-- Create Coupons table
CREATE TABLE ecommerce_table.Coupons (
	CouponID SERIAL PRIMARY KEY,
	Code VARCHAR(50) NOT NULL UNIQUE,
	DiscountType VARCHAR(50) NOT NULL,
	DiscountValue DECIMAL(10, 2) NOT NULL,
	ExpiryDate DATE NOT NULL,
	UsageLimit INT NOT NULL
);

-- Create ShippingMethods table
CREATE TABLE ecommerce_table.ShippingMethods (
	ShippingMethodID SERIAL PRIMARY KEY,
	MethodName VARCHAR(100) NOT NULL,
	Cost DECIMAL(10, 2) NOT NULL,
	DeliveryTime VARCHAR(50) NOT NULL
);

-- Create Inventory table
CREATE TABLE ecommerce_table.Inventory (
	InventoryID SERIAL PRIMARY KEY,
	ProductID INT NOT NULL,
	WarehouseLocation VARCHAR(100) NOT NULL,
	Quantity INT NOT NULL,
	FOREIGN KEY (ProductID) REFERENCES ecommerce_table.Products(ProductID)
);

CREATE TABLE ecommerce_table.ProductAvailability (
	AvailabilityID SERIAL PRIMARY KEY,
	ProductID INT NOT NULL,
	IsAvailable BOOLEAN NOT NULL,
	FOREIGN KEY (ProductID) REFERENCES ecommerce_table.Products(ProductID)
);

-- Create ProductReviews table
CREATE TABLE ecommerce_table.ProductReviews (
	ReviewID SERIAL PRIMARY KEY,
	ProductID INT NOT NULL,
	UserID INT NOT NULL,
	Rating INT CHECK (RATING >= 1 AND RATING <= 5),
	ReviewText TEXT,
	ReviewDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (ProductID) REFERENCES ecommerce_table.Products(ProductID),
	FOREIGN KEY (UserID) REFERENCES ecommerce_table.Users(UserID)
);

-- Create Orders table
CREATE TABLE ecommerce_table.Orders (
	OrderID SERIAL PRIMARY KEY,
	UserID INT NOT NULL,
	OrderDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	ShippingAddressID INT NOT NULL,
	BillingAddressID INT NOT NULL,
	TotalAmount DECIMAL(10, 2) NOT NULL,
	OrderStatus VARCHAR(50) NOT NULL,
	FOREIGN KEY (UserID) REFERENCES ecommerce_table.Users(UserID),
	FOREIGN KEY (ShippingAddressID) REFERENCES ecommerce_table.Addresses(AddressID),
	FOREIGN KEY (BillingAddressID) REFERENCES ecommerce_table.Addresses(AddressID)
);

-- Create SupportTickets table
CREATE TABLE ecommerce_table.SupportTickets (
	TicketID SERIAL PRIMARY KEY,
	UserID INT NOT NULL,
	OrderID INT,
	Subject VARCHAR(255) NOT NULL,
	Status VARCHAR(50) NOT NULL,
	CreatedDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (UserID) REFERENCES ecommerce_table.Users(UserID),
	FOREIGN KEY (OrderID) REFERENCES ecommerce_table.Orders(OrderID)
);

-- Create TicketMessages table
CREATE TABLE ecommerce_table.TicketMessages (
	MessageID SERIAL PRIMARY KEY,
	TicketID INT NOT NULL,
	SenderID INT NOT NULL,
	MessageText TEXT NOT NULL,
	Timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (TicketID) REFERENCES ecommerce_table.SupportTickets(TicketID),
	FOREIGN KEY (SenderID) REFERENCES ecommerce_table.Users(UserID)
);

-- Create OrderDetails table
CREATE TABLE ecommerce_table.OrderDetails (
	OrderDetailID SERIAL PRIMARY KEY,
	OrderID INT NOT NULL,
	ProductID INT NOT NULL,
	Quantity INT NOT NULL,
	Price DECIMAL(10, 2) NOT NULL,
	FOREIGN KEY (OrderID) REFERENCES ecommerce_table.Orders(OrderID),
	FOREIGN KEY (ProductID) REFERENCES ecommerce_table.Products(ProductID)
);

-- Create OrdersPromotions table
CREATE TABLE ecommerce_table.OrdersPromotions (
	OrderPromotionID SERIAL PRIMARY KEY,
	OrderID INT NOT NULL,
	PromotionID INT NOT NULL,
	FOREIGN KEY (OrderID) REFERENCES ecommerce_table.Orders(OrderID),
	FOREIGN KEY (PromotionID) REFERENCES ecommerce_table.Promotions(PromotionID)
);

-- Create Payments table
CREATE TABLE ecommerce_table.Payments (
	PaymentID SERIAL PRIMARY KEY,
	OrderID INT NOT NULL,
	PaymentMethod VARCHAR(50) NOT NULL,
	Amount DECIMAL(10, 2) NOT NULL,
	PaymentDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	PaymentStatus VARCHAR(50) NOT NULL,
	FOREIGN KEY (OrderID) REFERENCES ecommerce_table.Orders(OrderID)
);

-- Create Wishlist table
CREATE TABLE ecommerce_table.Wishlist (
	WishlistID SERIAL PRIMARY KEY,
	UserID INT NOT NULL,
	ProductID INT NOT NULL,
	FOREIGN KEY (UserID) REFERENCES ecommerce_table.Users(UserID),
	FOREIGN KEY (ProductID) REFERENCES ecommerce_table.Products(ProductID)
);

-- Create Shipments table
CREATE TABLE ecommerce_table.Shipments (
	ShipmentID SERIAL PRIMARY KEY,
	OrderID INT NOT NULL,
	ShippingMethodID INT NOT NULL,
	TrackingNumber VARCHAR(100) NOT NULL,
	ShipmentDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	DeliveryDate TIMESTAMP,
	FOREIGN KEY (OrderID) REFERENCES ecommerce_table.Orders(OrderID),
	FOREIGN KEY (ShippingMethodID) REFERENCES ecommerce_table.ShippingMethods(ShippingMethodID)
);

-- Create ShipmentUpdates table
CREATE TABLE ecommerce_table.ShipmentUpdates (
	UpdateID SERIAL PRIMARY KEY,
	ShipmentID INT NOT NULL,
	StatusUpdate VARCHAR(255) NOT NULL,
	Timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (ShipmentID) REFERENCES ecommerce_table.Shipments(ShipmentID)
);

-- Create AuditLogs table
CREATE TABLE ecommerce_table.AuditLogs (
	LogID SERIAL PRIMARY KEY,
	UserID INT NOT NULL,
	Action VARCHAR(255) NOT NULL,
	Timestamp TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
	Details TEXT,
	FOREIGN KEY (UserID) REFERENCES ecommerce_table.Users(UserID)
);