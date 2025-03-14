create database mygears_db
go

use mygears_db
go

create table Categories
(
	Id int primary key not null identity(1, 1),
	Slug varchar(255),
	CategoryName nvarchar(max),
);

create table Brands
(
	Id int primary key not null identity(1, 1),
	BrandName nvarchar(max),
	Description nvarchar(max),
	Slug varchar(255)
);

create table Products
(
	Id int primary key not null identity(1, 1),
	ProductName nvarchar(max),
	Slug varchar(255),
	Description nvarchar(max),
	UnitPrice Decimal(18, 0),
	Image varchar(255),
	Quantity int,
	Discount int,
	DateCreated datetime,
	DateModified datetime,
	IsActive bit,
	IsHome bit,
	IsBestSeller bit,
	CategoryId int not null,
	BrandId int not null,
	Constraint FK_Products_Categories foreign key (CategoryId) references Categories(Id),
	Constraint FK_Products_Brands foreign key (BrandId) references Brands(Id),
);

create table Attributes
(
	Id int primary key not null identity(1, 1),
	AttributeName nvarchar(max)
);

create table CategoryAttributes
(
	Id int primary key not null identity(1, 1),
	CategoryId int not null,
	AttributeId int not null,
	Constraint FK_CategoryAttributes_Categories foreign key (CategoryId) references Categories(Id),
	Constraint FK_CategoryAttributes_Attributes foreign key (AttributeId) references Attributes(Id)
);

create table ProductAttributes
(
	Id int primary key not null identity(1, 1),
	ProductId int not null,
	AttributeId int not null,
	Value nvarchar(255),
	Constraint FK_ProductAttributes_Products foreign key (ProductId) references Products(Id),
	Constraint FK_ProductAttributes_Attributes foreign key (AttributeId) references Attributes(Id)
);

create table Shippings
(
	Id int primary key not null identity(1, 1),
	COD decimal(18, 0),
	Ward nvarchar(255),
	District nvarchar(255),
	City nvarchar(255),
);

create table Orders
(
	Id int primary key not null identity(1, 1),
	OrderCode varchar(255),
	UserName varchar(255),
	CreatedDate Datetime,
	Status int,
	TotalAmount decimal(18, 0)
);

create table OrderDetails
(
	Id int primary key not null identity(1, 1),
	OrderCode varchar(255),
	UserName varchar(255),
	ProductId int not null,
	Quantity int,
	Total decimal(18, 0),
	Constraint FK_OrderDetails_Products foreign key(ProductID) references Products(Id)
);

create table Coupons
(
	Id int primary key not null identity(1, 1),
	Code nvarchar(max),
	Description nvarchar(max),
	DateStart Datetime,
	DateExpired Datetime,
	Quantity int, 
	IsActive bit 
);

create table MomoInfos
(
	Id int primary key not null identity(1, 1),
	OrderId int not null,
	OrderInfo varchar(255),
	FullName nvarchar(255),
	Amount decimal(18,0),
	DatePaid Datetime
);
