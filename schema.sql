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
	CategoryID INT NOT NULL,
	ProductName VARCHAR(255) NOT NULL,
	Description TEXT,
	Price DECIMAL(10, 2) NOT NULL,
	SKU VARCHAR(50) NOT NULL UNIQUE,
	StockQuantity INT NOT NULL,
	FOREIGN KEY (CategoryID) REFERENCES ecommerce_table.Categories(CategoryID)
);

-- Create ProductCategories table
CREATE TABLE ecommerce_table.ProductCategories (
	ProductCategoryID SERIAL PRIMARY KEY,
	ProductID INT NOT NULL,
	CategoryID INT NOT NULL,
	FOREIGN KEY (ProductID) REFERENCES ecommerce_table.Products(ProductID),
	FOREIGN KEY (CategoryID) REFERENCES ecommerce_table.Categories(CategoryID)
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

-- Create Promotions tabe
CREATE TABLE ecommerce_table.Promotions (
	PromotionID SERIAL PRIMARY KEY,
	PromotionName VARCHAR(100) NOT NULL,
	DiscountType VARCHAR(50) NOT NULL,
	DiscountValue DECIMAL(10, 2) NOT NULL,
	StartDate DATE NOT NULL,
	EndDate DATE NOT NULL
);
