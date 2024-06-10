# foodOrder
Create a food order website with backend and frontend stack

Schema includes 25 tables, covering various aspects of ecommerce food selling website:

Entities and Attributes

1.UserRoles

RoleID (PK)
RoleName

2.Users

UserID (PK)
Username
PasswordHash
Email
FirstName
LastName
PhoneNumber
RoleID (FK)

3.Addresses

AddressID (PK)
UserID (FK)
Street
City
State
PostalCode
Country

4.Categories

CategoryID (PK)
CategoryName
ParentCategoryID (FK to CategoryID)

5.Products

ProductID (PK)
CategoryID (FK)
ProductName
Description
Price
SKU
StockQuantity

6.ProductCategories

ProductCategoryID (PK)
ProductID (FK)
CategoryID (FK)

7.ProductImages

ImageID (PK)
ProductID (FK)
ImageURL
IsPrimary

8.ProductAttributes

AttributeID (PK)
ProductID (FK)
AttributeName
AttributeValue

9.ProductTags

TagID (PK)
ProductID (FK)
TagName

10.Promotions

PromotionID (PK)
PromotionName
DiscountType
DiscountValue
StartDate
EndDate

11.Coupons

CouponID (PK)
Code
DiscountType
DiscountValue
ExpiryDate
UsageLimit

12.ShippingMethods

ShippingMethodID (PK)
MethodName
Cost
DeliveryTime

13.Inventory

InventoryID (PK)
ProductID (FK)
WarehouseLocation
Quantity

14.ProductAvailability

AvailabilityID (PK)
ProductID (FK)
IsAvailable

15.ProductReviews

ReviewID (PK)
ProductID (FK)
UserID (FK)
Rating
ReviewText
ReviewDate

16.SupportTickets

TicketID (PK)
UserID (FK)
OrderID (FK)
Subject
Status
CreatedDate

17.TicketMessages

MessageID (PK)
TicketID (FK)
SenderID (FK)
MessageText
Timestamp

18.Orders

OrderID (PK)
UserID (FK)
OrderDate
ShippingAddressID (FK)
BillingAddressID (FK)
TotalAmount
OrderStatus

19.OrderDetails

OrderDetailID (PK)
OrderID (FK)
ProductID (FK)
Quantity
Price

20.OrdersPromotions

OrderPromotionID (PK)
OrderID (FK)
PromotionID (FK)

21.Payments

PaymentID (PK)
OrderID (FK)
PaymentMethod
Amount
PaymentDate
PaymentStatus

22.Wishlist

WishlistID (PK)
UserID (FK)
ProductID (FK)

23.Shipments

ShipmentID (PK)
OrderID (FK)
ShippingMethodID (FK)
TrackingNumber
ShipmentDate
DeliveryDate

24.ShipmentUpdates

UpdateID (PK)
ShipmentID (FK)
StatusUpdate
Timestamp

25.AuditLogs

LogID (PK)
UserID (FK)
Action
Timestamp
Details
