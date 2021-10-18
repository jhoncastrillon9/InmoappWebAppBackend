/*Crear Base de datos*/
Create database [Inmoapp_dev]
GO
Use [Inmoapp_dev]
GO

/*Modulo de Schemas*/
GO
CREATE SCHEMA Companies
GO
CREATE SCHEMA Owners
GO
CREATE SCHEMA Tenants
GO
CREATE SCHEMA Properties
GO
CREATE SCHEMA Contracts
GO
CREATE SCHEMA Banks
GO
CREATE SCHEMA Commons

GO
/*Modulo de Inmobiliaria*/
Create table Companies.Company(
CompayId int identity (1,1)  primary key NOT NULL,
CompanyName nvarchar(200) Not null,
Document nvarchar(50),
Telephone nvarchar (30),
Mobile nvarchar(30),
Email nvarchar(80),
[Address] nvarchar (200),
Observation nvarchar(500)
)
GO

/*Modulo de Propietarios*/
GO
Create table Owners.[Owner](
OwnerId int identity (1,1)  primary key NOT NULL,
OwnerName nvarchar(200) not null,
Document nvarchar(50),
Telephone nvarchar (30),
Mobile nvarchar(30),
Email nvarchar(80),
[Address] nvarchar (200),
Observation nvarchar(500),
CompayId Int Not null References Companies.Company(CompayId)
)
GO

Create Table Properties.PropertyCategory(
PropertyCategoryId int identity (1,1)  primary key NOT NULL,
CategoryName nvarchar(200) not null
)
GO


Create Table Commons.[State](
[StateId] int Identity(1,1) primary key NOT NULL,
StateName nvarchar(100) not null
)
GO
Create Table Commons.City(
CityId int Identity(1,1) primary key NOT NULL,
CityName nvarchar(100) not null,
[StateId] Int Not null References Commons.[State]([StateId])
)
GO
Create Table Commons.[Zone](
[ZoneId] int identity (1,1)  primary key NOT NULL,
ZoneName nvarchar(200) not null,
CityId int not null references Commons.City(CityId)
)
GO
Create Table Commons.Neighborhood(
NeighborhoodId int identity (1,1)  primary key NOT NULL,
NeighborhoodName nvarchar(200) not null,
ZoneId int not null references Commons.[Zone](ZoneId)
)
GO
Create Table Properties.TypeOffer(
TypeOfferId int identity (1,1)  primary key NOT NULL,
TypeOfferName nvarchar(200) not null
)
GO

Create Table Properties.PropertyStatus(
PropertyStatusId int identity (1,1)  primary key NOT NULL,
PropertyStatusName nvarchar(200) not null
)
GO

Create Table Properties.Iva(
IvaId int identity (1,1)  primary key NOT NULL,
Valor Float not null
)
GO
Create Table Properties.Property(
PropertyId Int Identity (1,1) primary key Not null,
IdIva int references  Properties.Iva(IvaId),
Code nvarchar(100) not null,
Title nvarchar(100),
[Description] nvarchar(500),
[Address] nvarchar (200) not null,
PriceOwner decimal(18,2) not null,
[Percentage] decimal(18,2),
FeeCompany decimal(18,2), 
RecruitmentDate date,
FinalPrice decimal(18,2) not null,
Rooms Int,
Toilets int,
Reception bit,
[Pool] bit,
Area Decimal(18,2),
Observation nvarchar(500),
PropertyStatusId int not null references Properties.PropertyStatus(PropertyStatusId),
CityId int not null references Commons.City(CityId),
ZoneId int not null references Commons.[Zone](ZoneId),
OwnerId Int Not null references Owners.[Owner](OwnerId),
PropertyCategoryId Int Not null references Properties.PropertyCategory(PropertyCategoryId),
TypeOfferId int not null references Properties.TypeOffer(TypeOfferId),
CompayId Int Not null References Companies.Company(CompayId)
)
GO

Create Table Properties.Images(
ImageId Int Identity (1,1) Primary Key Not null,
ImageName nvarchar(50),
[Path] nvarchar(150) not null,
IsMain bit,
PropertyId Int not null References Properties.Property(PropertyId)

)

/*Modulo de Arredadores*/
GO
Create Table Tenants.Tenant  (
TenantId int identity (1,1)  primary key NOT NULL,
TenantName nvarchar(200) not null,
Document nvarchar(50),
Telephone nvarchar (30),
Mobile nvarchar(30) not null,
Email nvarchar(80),
[Address] nvarchar (200),
Observation nvarchar(500),
CompayId Int Not null References Companies.Company(CompayId)
)

GO
Create Table Contracts.[ContractsStatus](
[ContractsStatusId] int identity (1,1)  primary key NOT NULL,
[ContractsStatusName] nvarchar(200) not null
)


/*Modulo de contrqtos de arrendamiento*/
GO
Create Table Contracts.[Contract](
ContractId int identity(1,1) primary key not null ,
ContractDate Date not null,
InnitialDate Date Not Null,
QuantityMonths Int Not Null,
RentalFeeForOwner decimal(18,2) not null,
RentalFeeForTennat decimal(18,2) not null,
Observation nvarchar(300),
StatusId Int references Contracts.[ContractsStatus]([ContractsStatusId]),
PropertyId Int not null References Properties.Property(PropertyId),
TenantId int references Tenants.Tenant(TenantId) not null,
CompayId Int Not null References Companies.Company(CompayId)
)
GO

Create Table Contracts.[TenantsByContract](
[TenantsByContractId] int identity(1,1) primary key not null,
TenantId int references Tenants.Tenant(TenantId) not null,
[Profile] nvarchar(300)
)
GO
/*Tabla Maestra No tiene Id de Inmobiliara son iguales apra todos los clientes */
Create Table Banks.AccountsStatus(
AccountsStatusId Int Identity(1,1) Primary Key Not Null,
AccountsStatusName nvarchar (50)
)
GO
Create Table Banks.AccountsToPayContract(
AccountsToPayContractId Int Identity(1,1) primary key not null,
QuotaNumber Int not null,
[Value] Decimal(18,2) not null,
ExpirationDate Date not null,
AccountsStatusId int References Banks.AccountsStatus(AccountsStatusId),
ContractId Int References Contracts.[Contract](ContractId) not null,
CompayId Int Not null References Companies.Company(CompayId)
)
GO
Create Table Banks.AccountsToReceivableContract(
AccountsToReceivableContractId Int Identity(1,1) primary key not null,
QuotaNumber Int not null,
[Value] Decimal(18,2) not null,
ExpirationDate Date not null,
AccountsStatusId int References Banks.AccountsStatus(AccountsStatusId),
ContractId Int References Contracts.[Contract](ContractId) not null,
CompayId Int Not null References Companies.Company(CompayId)
)
GO

/*Modulo de Pagos*/
Create Table Banks.BankAccount(
BankAccountId Int Identity (1,1) Primary Key Not null,
BankAccountName nvarchar(50) Not null,
Total Decimal(18,2) Not Null,
CompayId Int Not null References Companies.Company(CompayId)
)
GO

/*Tipos de pagos*/
Create Table Banks.PaymentType(
PaymentTypeId Int Identity (1,1) Primary Key Not null,
PaymentTypeName nvarchar(50) Not Null,
CompayId Int Not null References Companies.Company(CompayId)
)
GO

Create Table Banks.HistoryBankAccount(
HistoryBankAccountId Int Identity (1,1) Primary Key Not null,
PaymentTypeId Int References Banks.PaymentType(PaymentTypeId) Not null,
[Value] Decimal(18,2) Not Null,
BankAccountId Int References Banks.BankAccount(BankAccountId) Not null,
AccountsToPayContractsId Int References Banks.AccountsToPayContract(AccountsToPayContractId),
AccountsToReceivableContractsId Int References Banks.AccountsToReceivableContract(AccountsToReceivableContractId),
Obervation nvarchar(500) Not Null,
CompayId Int Not null References Companies.Company(CompayId)
)
GO

