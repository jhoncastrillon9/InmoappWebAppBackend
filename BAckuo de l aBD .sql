/****** Object:  Schema [Altv]    Script Date: 10/03/2022 9:19:44 p. m. ******/
CREATE SCHEMA [Altv]
GO
/****** Object:  Schema [Banks]    Script Date: 10/03/2022 9:19:44 p. m. ******/
CREATE SCHEMA [Banks]
GO
/****** Object:  Schema [CodeMono]    Script Date: 10/03/2022 9:19:44 p. m. ******/
CREATE SCHEMA [CodeMono]
GO
/****** Object:  Schema [Commons]    Script Date: 10/03/2022 9:19:44 p. m. ******/
CREATE SCHEMA [Commons]
GO
/****** Object:  Schema [Companies]    Script Date: 10/03/2022 9:19:44 p. m. ******/
CREATE SCHEMA [Companies]
GO
/****** Object:  Schema [Contracts]    Script Date: 10/03/2022 9:19:44 p. m. ******/
CREATE SCHEMA [Contracts]
GO
/****** Object:  Schema [Owners]    Script Date: 10/03/2022 9:19:44 p. m. ******/
CREATE SCHEMA [Owners]
GO
/****** Object:  Schema [Properties]    Script Date: 10/03/2022 9:19:44 p. m. ******/
CREATE SCHEMA [Properties]
GO
/****** Object:  Schema [Tenants]    Script Date: 10/03/2022 9:19:44 p. m. ******/
CREATE SCHEMA [Tenants]
GO
/****** Object:  Schema [Users]    Script Date: 10/03/2022 9:19:44 p. m. ******/
CREATE SCHEMA [Users]
GO
/****** Object:  Table [Altv].[Loan]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Altv].[Loan](
	[LoanId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[LoanValue] [int] NOT NULL,
	[Interests] [int] NOT NULL,
	[TotalLoan] [int] NOT NULL,
	[Obervation] [nvarchar](500) NULL,
 CONSTRAINT [PK_Loan] PRIMARY KEY CLUSTERED 
(
	[LoanId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Altv].[History]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Altv].[History](
	[HistoryId] [int] IDENTITY(1,1) NOT NULL,
	[LoanId] [int] NOT NULL,
	[PaidValue] [int] NOT NULL,
	[DateCreation] [datetime] NOT NULL,
	[Obervation] [nvarchar](500) NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[HistoryId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [Altv].[GetLoans]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [Altv].[GetLoans] AS
SELECT L.[LoanId]
      ,L.[Name]
      ,L.[LoanValue]
      ,L.[Interests]
      ,L.[TotalLoan]
      ,L.[Obervation]
	  ,(L.[TotalLoan] - H.Balance) AS balance
FROM Loan  L LEFT JOIN (select loanId, sum(PaidValue) as Balance from History group by (LoanId))  H
ON L.LoanId = H.LoanId
GO
/****** Object:  Table [Altv].[Investment]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Altv].[Investment](
	[InvestmentId] [int] IDENTITY(1,1) NOT NULL,
	[InvestmenValue] [int] NOT NULL,
	[InvestmenDate] [datetime] NOT NULL,
	[Obervation] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[InvestmentId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Banks].[AccountsStatus]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Banks].[AccountsStatus](
	[AccountsStatusId] [int] IDENTITY(1,1) NOT NULL,
	[AccountsStatusName] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountsStatusId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Banks].[AccountsToPayContract]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Banks].[AccountsToPayContract](
	[AccountsToPayContractId] [int] IDENTITY(1,1) NOT NULL,
	[QuotaNumber] [int] NOT NULL,
	[Value] [decimal](18, 2) NOT NULL,
	[ExpirationDate] [date] NOT NULL,
	[AccountsStatusId] [int] NULL,
	[ContractId] [int] NOT NULL,
	[CompayId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountsToPayContractId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Banks].[AccountsToReceivableContract]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Banks].[AccountsToReceivableContract](
	[AccountsToReceivableContractId] [int] IDENTITY(1,1) NOT NULL,
	[QuotaNumber] [int] NOT NULL,
	[Value] [decimal](18, 2) NOT NULL,
	[ExpirationDate] [date] NOT NULL,
	[AccountsStatusId] [int] NULL,
	[ContractId] [int] NOT NULL,
	[CompayId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountsToReceivableContractId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Banks].[BankAccount]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Banks].[BankAccount](
	[BankAccountId] [int] IDENTITY(1,1) NOT NULL,
	[BankAccountName] [nvarchar](50) NOT NULL,
	[Total] [decimal](18, 2) NOT NULL,
	[CompayId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[BankAccountId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Banks].[HistoryBankAccount]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Banks].[HistoryBankAccount](
	[HistoryBankAccountId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentTypeId] [int] NOT NULL,
	[Value] [decimal](18, 2) NOT NULL,
	[BankAccountId] [int] NOT NULL,
	[AccountsToPayContractsId] [int] NULL,
	[AccountsToReceivableContractsId] [int] NULL,
	[Obervation] [nvarchar](500) NOT NULL,
	[CompayId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[HistoryBankAccountId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Banks].[PaymentType]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Banks].[PaymentType](
	[PaymentTypeId] [int] IDENTITY(1,1) NOT NULL,
	[PaymentTypeName] [nvarchar](50) NOT NULL,
	[CompayId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentTypeId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CodeMono].[User]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CodeMono].[User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [varchar](45) NOT NULL,
	[LastName] [varchar](45) NOT NULL,
	[UserTypeId] [smallint] NOT NULL,
	[Username] [varchar](45) NOT NULL,
	[Password] [varchar](45) NOT NULL,
	[Avatar] [varchar](45) NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedAt] [datetime] NULL,
	[DisabledBy] [int] NULL,
	[DisabledAt] [datetime] NULL,
	[Active] [bit] NOT NULL,
	[CompanyId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [CodeMono].[UserType]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [CodeMono].[UserType](
	[UserTypeId] [smallint] NOT NULL,
	[UserTypeName] [varchar](50) NOT NULL,
	[CreatedBy] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedBy] [int] NULL,
	[UpdatedAt] [datetime] NULL,
	[DisabledBy] [int] NULL,
	[DisabledAt] [datetime] NULL,
	[Active] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserTypeId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Commons].[City]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Commons].[City](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](100) NOT NULL,
	[StateId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Commons].[Neighborhood]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Commons].[Neighborhood](
	[NeighborhoodId] [int] IDENTITY(1,1) NOT NULL,
	[NeighborhoodName] [nvarchar](200) NOT NULL,
	[ZoneId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[NeighborhoodId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Commons].[State]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Commons].[State](
	[StateId] [int] IDENTITY(1,1) NOT NULL,
	[StateName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[StateId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Commons].[Zone]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Commons].[Zone](
	[ZoneId] [int] IDENTITY(1,1) NOT NULL,
	[ZoneName] [nvarchar](200) NOT NULL,
	[CityId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ZoneId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Companies].[Company]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Companies].[Company](
	[CompayId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](200) NOT NULL,
	[Document] [nvarchar](50) NULL,
	[Telephone] [nvarchar](30) NULL,
	[Mobile] [nvarchar](30) NULL,
	[Email] [nvarchar](80) NULL,
	[Address] [nvarchar](200) NULL,
	[Observation] [nvarchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[CompayId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Contracts].[Contract]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contracts].[Contract](
	[ContractId] [int] IDENTITY(1,1) NOT NULL,
	[ContractDate] [date] NOT NULL,
	[InnitialDate] [date] NOT NULL,
	[QuantityMonths] [int] NOT NULL,
	[RentalFeeForOwner] [decimal](18, 2) NOT NULL,
	[RentalFeeForTennat] [decimal](18, 2) NOT NULL,
	[Observation] [nvarchar](300) NULL,
	[StatusId] [int] NULL,
	[PropertyId] [int] NOT NULL,
	[TenantId] [int] NOT NULL,
	[CompayId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ContractId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Contracts].[ContractsStatus]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contracts].[ContractsStatus](
	[ContractsStatusId] [int] IDENTITY(1,1) NOT NULL,
	[ContractsStatusName] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ContractsStatusId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Contracts].[TenantsByContract]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Contracts].[TenantsByContract](
	[TenantsByContractId] [int] IDENTITY(1,1) NOT NULL,
	[TenantId] [int] NOT NULL,
	[Profile] [nvarchar](300) NULL,
PRIMARY KEY CLUSTERED 
(
	[TenantsByContractId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Logs]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Logs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NULL,
	[MessageTemplate] [nvarchar](max) NULL,
	[Level] [nvarchar](max) NULL,
	[TimeStamp] [datetime] NULL,
	[Exception] [nvarchar](max) NULL,
	[Properties] [nvarchar](max) NULL,
 CONSTRAINT [PK_Logs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Owners].[Owner]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Owners].[Owner](
	[OwnerId] [int] IDENTITY(1,1) NOT NULL,
	[OwnerName] [nvarchar](200) NOT NULL,
	[Document] [nvarchar](50) NULL,
	[Telephone] [nvarchar](30) NULL,
	[Mobile] [nvarchar](30) NULL,
	[Email] [nvarchar](80) NULL,
	[Address] [nvarchar](200) NULL,
	[Observation] [nvarchar](500) NULL,
	[CompayId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OwnerId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Properties].[Images]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Properties].[Images](
	[ImageId] [int] IDENTITY(1,1) NOT NULL,
	[ImageName] [nvarchar](50) NULL,
	[Path] [nvarchar](150) NOT NULL,
	[IsMain] [bit] NULL,
	[PropertyId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ImageId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Properties].[Iva]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Properties].[Iva](
	[IvaId] [int] IDENTITY(1,1) NOT NULL,
	[Valor] [float] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[IvaId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Properties].[Property]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Properties].[Property](
	[PropertyId] [int] IDENTITY(1,1) NOT NULL,
	[IdIva] [int] NULL,
	[Code] [nvarchar](100) NOT NULL,
	[Title] [nvarchar](100) NULL,
	[Description] [nvarchar](500) NULL,
	[Address] [nvarchar](200) NOT NULL,
	[PriceOwner] [decimal](18, 2) NOT NULL,
	[Percentage] [decimal](18, 2) NULL,
	[FeeCompany] [decimal](18, 2) NULL,
	[RecruitmentDate] [date] NULL,
	[FinalPrice] [decimal](18, 2) NOT NULL,
	[Rooms] [int] NULL,
	[Toilets] [int] NULL,
	[Reception] [bit] NULL,
	[Pool] [bit] NULL,
	[Area] [decimal](18, 2) NULL,
	[Observation] [nvarchar](500) NULL,
	[PropertyStatusId] [int] NOT NULL,
	[CityId] [int] NOT NULL,
	[ZoneId] [int] NOT NULL,
	[OwnerId] [int] NOT NULL,
	[PropertyCategoryId] [int] NOT NULL,
	[TypeOfferId] [int] NOT NULL,
	[CompayId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PropertyId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Properties].[PropertyCategory]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Properties].[PropertyCategory](
	[PropertyCategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PropertyCategoryId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Properties].[PropertyStatus]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Properties].[PropertyStatus](
	[PropertyStatusId] [int] IDENTITY(1,1) NOT NULL,
	[PropertyStatusName] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PropertyStatusId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Properties].[TypeOffer]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Properties].[TypeOffer](
	[TypeOfferId] [int] IDENTITY(1,1) NOT NULL,
	[TypeOfferName] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TypeOfferId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Tenants].[Tenant]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Tenants].[Tenant](
	[TenantId] [int] IDENTITY(1,1) NOT NULL,
	[TenantName] [nvarchar](200) NOT NULL,
	[Document] [nvarchar](50) NULL,
	[Telephone] [nvarchar](30) NULL,
	[Mobile] [nvarchar](30) NOT NULL,
	[Email] [nvarchar](80) NULL,
	[Address] [nvarchar](200) NULL,
	[Observation] [nvarchar](500) NULL,
	[CompayId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TenantId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Users].[Role]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Users].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Users].[UserByRole]    Script Date: 10/03/2022 9:19:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Users].[UserByRole](
	[UserByRoleId] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserByRoleId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Altv].[History] ON 

INSERT [Altv].[History] ([HistoryId], [LoanId], [PaidValue], [DateCreation], [Obervation]) VALUES (2, 11, 120000, CAST(N'2021-10-23T22:57:00.000' AS DateTime), NULL)
INSERT [Altv].[History] ([HistoryId], [LoanId], [PaidValue], [DateCreation], [Obervation]) VALUES (4, 9, 100000, CAST(N'2021-10-23T22:58:00.000' AS DateTime), NULL)
INSERT [Altv].[History] ([HistoryId], [LoanId], [PaidValue], [DateCreation], [Obervation]) VALUES (5, 17, 50000, CAST(N'2021-10-23T22:59:00.000' AS DateTime), NULL)
INSERT [Altv].[History] ([HistoryId], [LoanId], [PaidValue], [DateCreation], [Obervation]) VALUES (6, 15, 80000, CAST(N'2021-10-25T20:55:00.000' AS DateTime), NULL)
INSERT [Altv].[History] ([HistoryId], [LoanId], [PaidValue], [DateCreation], [Obervation]) VALUES (7, 15, 100000, CAST(N'2019-10-23T22:01:00.000' AS DateTime), NULL)
INSERT [Altv].[History] ([HistoryId], [LoanId], [PaidValue], [DateCreation], [Obervation]) VALUES (8, 7, 40000, CAST(N'2021-10-22T22:19:00.000' AS DateTime), NULL)
INSERT [Altv].[History] ([HistoryId], [LoanId], [PaidValue], [DateCreation], [Obervation]) VALUES (9, 12, 300000, CAST(N'2021-10-22T22:20:00.000' AS DateTime), NULL)
INSERT [Altv].[History] ([HistoryId], [LoanId], [PaidValue], [DateCreation], [Obervation]) VALUES (10, 13, 120000, CAST(N'2021-10-22T22:20:00.000' AS DateTime), NULL)
INSERT [Altv].[History] ([HistoryId], [LoanId], [PaidValue], [DateCreation], [Obervation]) VALUES (11, 15, 100000, CAST(N'2021-10-23T22:22:00.000' AS DateTime), NULL)
INSERT [Altv].[History] ([HistoryId], [LoanId], [PaidValue], [DateCreation], [Obervation]) VALUES (12, 9, 100000, CAST(N'2021-10-23T22:23:00.000' AS DateTime), NULL)
INSERT [Altv].[History] ([HistoryId], [LoanId], [PaidValue], [DateCreation], [Obervation]) VALUES (13, 11, 120000, CAST(N'2021-10-23T22:23:00.000' AS DateTime), NULL)
INSERT [Altv].[History] ([HistoryId], [LoanId], [PaidValue], [DateCreation], [Obervation]) VALUES (14, 10, 200000, CAST(N'2021-10-23T22:24:00.000' AS DateTime), NULL)
INSERT [Altv].[History] ([HistoryId], [LoanId], [PaidValue], [DateCreation], [Obervation]) VALUES (15, 17, 50000, CAST(N'2021-10-23T22:25:00.000' AS DateTime), NULL)
INSERT [Altv].[History] ([HistoryId], [LoanId], [PaidValue], [DateCreation], [Obervation]) VALUES (16, 15, 80000, CAST(N'2021-10-25T22:25:00.000' AS DateTime), NULL)
INSERT [Altv].[History] ([HistoryId], [LoanId], [PaidValue], [DateCreation], [Obervation]) VALUES (17, 7, 40000, CAST(N'2021-10-07T22:37:00.000' AS DateTime), NULL)
INSERT [Altv].[History] ([HistoryId], [LoanId], [PaidValue], [DateCreation], [Obervation]) VALUES (18, 9, 100000, CAST(N'2021-10-16T22:39:00.000' AS DateTime), NULL)
INSERT [Altv].[History] ([HistoryId], [LoanId], [PaidValue], [DateCreation], [Obervation]) VALUES (19, 9, 100000, CAST(N'2021-10-23T22:42:00.000' AS DateTime), NULL)
INSERT [Altv].[History] ([HistoryId], [LoanId], [PaidValue], [DateCreation], [Obervation]) VALUES (20, 10, 200000, CAST(N'2021-10-15T22:44:00.000' AS DateTime), NULL)
INSERT [Altv].[History] ([HistoryId], [LoanId], [PaidValue], [DateCreation], [Obervation]) VALUES (21, 10, 200000, CAST(N'2021-10-15T22:45:00.000' AS DateTime), NULL)
INSERT [Altv].[History] ([HistoryId], [LoanId], [PaidValue], [DateCreation], [Obervation]) VALUES (22, 11, 120000, CAST(N'2021-10-13T22:46:00.000' AS DateTime), NULL)
INSERT [Altv].[History] ([HistoryId], [LoanId], [PaidValue], [DateCreation], [Obervation]) VALUES (23, 12, 300000, CAST(N'2021-10-15T22:47:00.000' AS DateTime), NULL)
INSERT [Altv].[History] ([HistoryId], [LoanId], [PaidValue], [DateCreation], [Obervation]) VALUES (25, 15, 180000, CAST(N'2021-10-22T22:48:00.000' AS DateTime), NULL)
INSERT [Altv].[History] ([HistoryId], [LoanId], [PaidValue], [DateCreation], [Obervation]) VALUES (26, 5, 40000, CAST(N'2021-10-11T05:15:00.000' AS DateTime), NULL)
INSERT [Altv].[History] ([HistoryId], [LoanId], [PaidValue], [DateCreation], [Obervation]) VALUES (27, 5, 40000, CAST(N'2021-10-11T05:15:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [Altv].[History] OFF
GO
SET IDENTITY_INSERT [Altv].[Investment] ON 

INSERT [Altv].[Investment] ([InvestmentId], [InvestmenValue], [InvestmenDate], [Obervation]) VALUES (1, 430000, CAST(N'2021-10-25T13:07:37.687' AS DateTime), N'')
INSERT [Altv].[Investment] ([InvestmentId], [InvestmenValue], [InvestmenDate], [Obervation]) VALUES (2, 148000, CAST(N'2021-10-25T13:07:37.687' AS DateTime), N'')
INSERT [Altv].[Investment] ([InvestmentId], [InvestmenValue], [InvestmenDate], [Obervation]) VALUES (3, 220000, CAST(N'2021-10-27T13:07:37.687' AS DateTime), N'')
INSERT [Altv].[Investment] ([InvestmentId], [InvestmenValue], [InvestmenDate], [Obervation]) VALUES (4, 180000, CAST(N'2021-10-30T13:07:37.687' AS DateTime), N'')
INSERT [Altv].[Investment] ([InvestmentId], [InvestmenValue], [InvestmenDate], [Obervation]) VALUES (5, 100000, CAST(N'2021-10-30T13:07:37.687' AS DateTime), N'')
INSERT [Altv].[Investment] ([InvestmentId], [InvestmenValue], [InvestmenDate], [Obervation]) VALUES (6, 120000, CAST(N'2021-11-02T13:55:55.590' AS DateTime), N'')
INSERT [Altv].[Investment] ([InvestmentId], [InvestmenValue], [InvestmenDate], [Obervation]) VALUES (7, 120000, CAST(N'2021-10-30T13:55:55.590' AS DateTime), N'')
SET IDENTITY_INSERT [Altv].[Investment] OFF
GO
SET IDENTITY_INSERT [Altv].[Loan] ON 

INSERT [Altv].[Loan] ([LoanId], [Name], [LoanValue], [Interests], [TotalLoan], [Obervation]) VALUES (3, N'Mauricio bogota ', 500000, 100000, 600000, N'40000 6 octubre  falta 22 octubre 08 octubre')
INSERT [Altv].[Loan] ([LoanId], [Name], [LoanValue], [Interests], [TotalLoan], [Obervation]) VALUES (4, N'Monica cartagena', 200000, 40000, 240000, N'Falta octubre 21000 octubre 30 noviembre  7')
INSERT [Altv].[Loan] ([LoanId], [Name], [LoanValue], [Interests], [TotalLoan], [Obervation]) VALUES (5, N'Diego barra', 300000, 60000, 360000, N'Falta   22 octubre 8 noviembre  debe de pagar ')
INSERT [Altv].[Loan] ([LoanId], [Name], [LoanValue], [Interests], [TotalLoan], [Obervation]) VALUES (7, N'Milena mejía ', 200000, 40000, 240000, N'21 octubre  falta 28octubre ')
INSERT [Altv].[Loan] ([LoanId], [Name], [LoanValue], [Interests], [TotalLoan], [Obervation]) VALUES (9, N'Doña liliana', 500000, 100000, 600000, N'23octubre  falta 30 octubre 08 octu 06 noviembre  13 noviembre ')
INSERT [Altv].[Loan] ([LoanId], [Name], [LoanValue], [Interests], [TotalLoan], [Obervation]) VALUES (10, N'Carlos andres  bedoya', 1000000, 200000, 1200000, N'Falta   22 octubre 29 noviembre  05 noviembre debe ebe de pagar ')
INSERT [Altv].[Loan] ([LoanId], [Name], [LoanValue], [Interests], [TotalLoan], [Obervation]) VALUES (11, N'Doña nancy', 400000, 80000, 480000, N'Debe 23 octubre 30octubre 6 noviembre ')
INSERT [Altv].[Loan] ([LoanId], [Name], [LoanValue], [Interests], [TotalLoan], [Obervation]) VALUES (12, N'Doña vanesa ', 1000000, 200000, 1200000, N' 15 dio 300 Falta   22 octubre  octubre 29  5 noviembre   12 noviembre 19 noviembre debe de pagar e pagar ')
INSERT [Altv].[Loan] ([LoanId], [Name], [LoanValue], [Interests], [TotalLoan], [Obervation]) VALUES (13, N'Sandra jasmin', 200000, 40000, 240000, N'Falta   22 octubre 5 noviembre  debe de pagar ')
INSERT [Altv].[Loan] ([LoanId], [Name], [LoanValue], [Interests], [TotalLoan], [Obervation]) VALUES (14, N'Leonel alvarez', 300000, 60000, 360000, N' falta 30 octubre  15noviembre ')
INSERT [Altv].[Loan] ([LoanId], [Name], [LoanValue], [Interests], [TotalLoan], [Obervation]) VALUES (15, N'Doña lina', 1000000, 200000, 1200000, N'22 octubre  falta 29octubre 05novienbre 1.2 noviembre 19 noviembre 26 noviembre ')
INSERT [Altv].[Loan] ([LoanId], [Name], [LoanValue], [Interests], [TotalLoan], [Obervation]) VALUES (17, N'Jhoana alejandra  villada ', 250000, 50000, 300000, N'22 octubre  falta 29octubre 05novienbre 9 noviembre ')
INSERT [Altv].[Loan] ([LoanId], [Name], [LoanValue], [Interests], [TotalLoan], [Obervation]) VALUES (18, N'Liviana zapatos', 1000000, 200000, 1200000, N'27 noviembre  03 novienbre 10 noviembre 17 noviembre 24noviembre 01 diciembre ')
INSERT [Altv].[Loan] ([LoanId], [Name], [LoanValue], [Interests], [TotalLoan], [Obervation]) VALUES (19, N'Alexandra  Sierra 150000', 150000, 30000, 180000, N' falta 30 octubre 15 noviembre  ')
INSERT [Altv].[Loan] ([LoanId], [Name], [LoanValue], [Interests], [TotalLoan], [Obervation]) VALUES (20, N'Jenifer bedoya ', 1000000, 200000, 1200000, N'  falta 28octubre 04 noviembre 11 noviembre  18 noviembre  25 noviembre  02 diciembre ')
INSERT [Altv].[Loan] ([LoanId], [Name], [LoanValue], [Interests], [TotalLoan], [Obervation]) VALUES (21, N'Prima jenifer', 500000, 100000, 600000, N'1 el 7 ..el14   21 el 28 el 05 ')
INSERT [Altv].[Loan] ([LoanId], [Name], [LoanValue], [Interests], [TotalLoan], [Obervation]) VALUES (22, N'Doña lina dos ', 500, 100, 600, NULL)
SET IDENTITY_INSERT [Altv].[Loan] OFF
GO
SET IDENTITY_INSERT [Banks].[AccountsStatus] ON 

INSERT [Banks].[AccountsStatus] ([AccountsStatusId], [AccountsStatusName]) VALUES (2, N'Prueba stauts4 jhon5')
INSERT [Banks].[AccountsStatus] ([AccountsStatusId], [AccountsStatusName]) VALUES (3, N'prueba2255')
INSERT [Banks].[AccountsStatus] ([AccountsStatusId], [AccountsStatusName]) VALUES (6, N'Genaro22')
INSERT [Banks].[AccountsStatus] ([AccountsStatusId], [AccountsStatusName]) VALUES (7, N'putas llaves')
SET IDENTITY_INSERT [Banks].[AccountsStatus] OFF
GO
SET IDENTITY_INSERT [Banks].[BankAccount] ON 

INSERT [Banks].[BankAccount] ([BankAccountId], [BankAccountName], [Total], [CompayId]) VALUES (1, N'Holas Bancolombia', CAST(500000.00 AS Decimal(18, 2)), 55)
INSERT [Banks].[BankAccount] ([BankAccountId], [BankAccountName], [Total], [CompayId]) VALUES (2, N'dAVIVIENDA', CAST(112.00 AS Decimal(18, 2)), 55)
INSERT [Banks].[BankAccount] ([BankAccountId], [BankAccountName], [Total], [CompayId]) VALUES (3, N'tESOR123', CAST(12340.00 AS Decimal(18, 2)), 55)
INSERT [Banks].[BankAccount] ([BankAccountId], [BankAccountName], [Total], [CompayId]) VALUES (5, N'Hello', CAST(112.00 AS Decimal(18, 2)), 55)
INSERT [Banks].[BankAccount] ([BankAccountId], [BankAccountName], [Total], [CompayId]) VALUES (6, N'Burticas', CAST(345000.00 AS Decimal(18, 2)), 55)
INSERT [Banks].[BankAccount] ([BankAccountId], [BankAccountName], [Total], [CompayId]) VALUES (7, N'Value', CAST(59800.00 AS Decimal(18, 2)), 55)
SET IDENTITY_INSERT [Banks].[BankAccount] OFF
GO
SET IDENTITY_INSERT [Banks].[PaymentType] ON 

INSERT [Banks].[PaymentType] ([PaymentTypeId], [PaymentTypeName], [CompayId]) VALUES (1, N'ghgkjhg', 53)
SET IDENTITY_INSERT [Banks].[PaymentType] OFF
GO
SET IDENTITY_INSERT [CodeMono].[User] ON 

INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (6, N'Jhon', N'', 2, N'jhon@gmail.com', N'12345', NULL, 0, CAST(N'2021-10-18T22:01:17.163' AS DateTime), NULL, CAST(N'2021-10-18T22:01:17.163' AS DateTime), NULL, NULL, 1, 4)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (7, N'Jhon', N'', 2, N'jhon@gmail.com', N'12345', NULL, 0, CAST(N'2021-10-18T22:01:47.393' AS DateTime), NULL, CAST(N'2021-10-18T22:01:47.413' AS DateTime), NULL, NULL, 1, 5)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (8, N'Jhon', N'', 2, N'jhoncastrillon@juju.com', N'12345', NULL, 0, CAST(N'2021-10-18T22:04:57.650' AS DateTime), NULL, CAST(N'2021-10-18T22:04:57.650' AS DateTime), NULL, NULL, 1, 6)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (9, N'Jhon', N'', 2, N'jhoncastrillon@juju.com', N'12345', NULL, 0, CAST(N'2021-10-18T22:05:13.317' AS DateTime), NULL, CAST(N'2021-10-18T22:05:13.317' AS DateTime), NULL, NULL, 1, 7)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (10, N'Jhon', N'', 2, N'jhoncastrillon@juju.com', N'12345', NULL, 0, CAST(N'2021-10-18T22:05:37.753' AS DateTime), NULL, CAST(N'2021-10-18T22:05:37.753' AS DateTime), NULL, NULL, 1, 8)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (11, N'Jhon', N'', 2, N'jhoncastrillon@juju.com', N'12345', NULL, 0, CAST(N'2021-10-18T22:08:14.263' AS DateTime), NULL, CAST(N'2021-10-18T22:08:14.263' AS DateTime), NULL, NULL, 1, 9)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (12, N'Jhon', N'', 2, N'jhoncastrillon@juju.com', N'12345', NULL, 0, CAST(N'2021-10-18T22:08:24.200' AS DateTime), NULL, CAST(N'2021-10-18T22:08:24.200' AS DateTime), NULL, NULL, 1, 10)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (13, N'Jhon', N'', 2, N'jhoncastrillon@juju.com', N'12345', NULL, 0, CAST(N'2021-10-18T22:10:27.913' AS DateTime), NULL, CAST(N'2021-10-18T22:10:27.913' AS DateTime), NULL, NULL, 1, 11)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (14, N'Jhon', N'', 2, N'jhoncastrillon@juju.com', N'12345', NULL, 0, CAST(N'2021-10-18T22:11:45.847' AS DateTime), NULL, CAST(N'2021-10-18T22:11:45.847' AS DateTime), NULL, NULL, 1, 12)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (15, N'Jhon', N'', 2, N'jhoncastrillon@juju.com', N'12345', NULL, 0, CAST(N'2021-10-18T22:12:29.277' AS DateTime), NULL, CAST(N'2021-10-18T22:12:29.277' AS DateTime), NULL, NULL, 1, 13)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (16, N'Jhon', N'', 2, N'jhoncastrillon@juju.com', N'12345', NULL, 0, CAST(N'2021-10-18T22:18:01.157' AS DateTime), NULL, CAST(N'2021-10-18T22:18:01.157' AS DateTime), NULL, NULL, 1, 14)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (17, N'Jhon', N'', 2, N'jhoncastrillon@juju.com', N'12345', NULL, 0, CAST(N'2021-10-18T22:18:40.067' AS DateTime), NULL, CAST(N'2021-10-18T22:18:40.067' AS DateTime), NULL, NULL, 1, 15)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (18, N'Jhon', N'', 2, N'jhoncastrillon@juju.com', N'12345', NULL, 0, CAST(N'2021-10-18T22:20:22.340' AS DateTime), NULL, CAST(N'2021-10-18T22:20:22.340' AS DateTime), NULL, NULL, 1, 16)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (19, N'Jhon', N'', 2, N'jhoncastrillon@juju.com', N'12345', NULL, 0, CAST(N'2021-10-18T22:20:47.627' AS DateTime), NULL, CAST(N'2021-10-18T22:20:47.627' AS DateTime), NULL, NULL, 1, 17)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (20, N'Jhon', N'', 2, N'jhoncastrillon@juju.com', N'12345', NULL, 0, CAST(N'2021-10-18T22:20:59.607' AS DateTime), NULL, CAST(N'2021-10-18T22:20:59.607' AS DateTime), NULL, NULL, 1, 18)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (21, N'Jhon', N'', 2, N'jhoncastrillon@juju.com', N'12345', NULL, 0, CAST(N'2021-10-18T22:21:08.173' AS DateTime), NULL, CAST(N'2021-10-18T22:21:08.173' AS DateTime), NULL, NULL, 1, 19)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (22, N'Jhon', N'', 2, N'jhoncastrillon@juju.com', N'12345', NULL, 0, CAST(N'2021-10-18T22:21:29.143' AS DateTime), NULL, CAST(N'2021-10-18T22:21:29.143' AS DateTime), NULL, NULL, 1, 20)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (23, N'Jhon', N'', 2, N'jhoncastrillon@juju.com', N'12345', NULL, 0, CAST(N'2021-10-18T22:21:42.110' AS DateTime), NULL, CAST(N'2021-10-18T22:21:42.110' AS DateTime), NULL, NULL, 1, 21)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (24, N'Jhon', N'', 2, N'jhoncastrillon@juju.com', N'12345', NULL, 0, CAST(N'2021-10-18T22:21:58.673' AS DateTime), NULL, CAST(N'2021-10-18T22:21:58.673' AS DateTime), NULL, NULL, 1, 22)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (25, N'Jhon', N'', 2, N'jhoncastrillon@juju.com', N'12345', NULL, 0, CAST(N'2021-10-18T22:22:10.780' AS DateTime), NULL, CAST(N'2021-10-18T22:22:10.780' AS DateTime), NULL, NULL, 1, 23)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (26, N'Jhon', N'', 2, N'jhoncastrillon@juju.com', N'12345', NULL, 0, CAST(N'2021-10-18T22:27:01.920' AS DateTime), NULL, CAST(N'2021-10-18T22:27:01.920' AS DateTime), NULL, NULL, 1, 24)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (27, N'Jhon', N'', 2, N'jhoncastrillon@juju.com', N'12345', NULL, 0, CAST(N'2021-10-18T22:27:50.020' AS DateTime), NULL, CAST(N'2021-10-18T22:27:50.020' AS DateTime), NULL, NULL, 1, 25)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (28, N'Jhon', N'', 2, N'jhoncastrillon@juju.com', N'12345', NULL, 0, CAST(N'2021-10-18T22:49:50.363' AS DateTime), NULL, CAST(N'2021-10-18T22:49:50.363' AS DateTime), NULL, NULL, 1, 26)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (29, N'Jhon', N'', 2, N'jhoncastrillon@juju.com', N'12345', NULL, 0, CAST(N'2021-10-18T22:50:20.487' AS DateTime), NULL, CAST(N'2021-10-18T22:50:20.487' AS DateTime), NULL, NULL, 1, 27)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (30, N'Jhon', N'', 2, N'jhoncastrillon@juju.com', N'12345', NULL, 0, CAST(N'2021-10-18T22:54:17.460' AS DateTime), NULL, CAST(N'2021-10-18T22:54:17.460' AS DateTime), NULL, NULL, 1, 28)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (31, N'Jhon', N'', 2, N'jhoncastrillon@juju.com', N'12345', NULL, 0, CAST(N'2021-10-18T23:07:24.337' AS DateTime), NULL, CAST(N'2021-10-18T23:07:24.337' AS DateTime), NULL, NULL, 1, 29)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (32, N'Jhon', N'', 2, N'jhoncastrillon@juju.com', N'12345', NULL, 0, CAST(N'2021-10-18T23:09:52.557' AS DateTime), NULL, CAST(N'2021-10-18T23:09:52.557' AS DateTime), NULL, NULL, 1, 30)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (33, N'Pedro', N'', 2, N'pedro@gmail.com', N'12345', NULL, 0, CAST(N'2021-10-19T13:47:50.583' AS DateTime), NULL, CAST(N'2021-10-19T13:47:50.583' AS DateTime), NULL, NULL, 1, 31)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (34, N'Pedro', N'', 2, N'pedro@gmail.com', N'12345', NULL, 0, CAST(N'2021-10-19T13:49:07.440' AS DateTime), NULL, CAST(N'2021-10-19T13:49:07.440' AS DateTime), NULL, NULL, 1, 32)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (35, N'Pedro', N'', 2, N'pedrito@gmail.com', N'12345', NULL, 0, CAST(N'2021-10-19T14:52:15.667' AS DateTime), NULL, CAST(N'2021-10-19T14:52:15.667' AS DateTime), NULL, NULL, 1, 33)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (36, N'Pedro', N'', 2, N'pedrito@gmail.com', N'12345', NULL, 0, CAST(N'2021-10-19T14:57:38.410' AS DateTime), NULL, CAST(N'2021-10-19T14:57:38.410' AS DateTime), NULL, NULL, 1, 34)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (37, N'Pedro', N'', 2, N'pedrito@gmail.com', N'12345', NULL, 0, CAST(N'2021-10-19T14:59:04.643' AS DateTime), NULL, CAST(N'2021-10-19T14:59:04.643' AS DateTime), NULL, NULL, 1, 35)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (38, N'Pedro', N'', 2, N'pedrito@gmail.com', N'12345', NULL, 0, CAST(N'2021-10-19T14:59:35.713' AS DateTime), NULL, CAST(N'2021-10-19T14:59:35.713' AS DateTime), NULL, NULL, 1, 36)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (39, N'Pedro', N'', 2, N'pedrito@gmail.com', N'12345', NULL, 0, CAST(N'2021-10-19T15:00:12.153' AS DateTime), NULL, CAST(N'2021-10-19T15:00:12.153' AS DateTime), NULL, NULL, 1, 37)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (40, N'Pedro', N'', 2, N'pedrito@gmail.com', N'12345', NULL, 0, CAST(N'2021-10-19T15:04:14.403' AS DateTime), NULL, CAST(N'2021-10-19T15:04:14.403' AS DateTime), NULL, NULL, 1, 38)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (41, N'Pedro', N'', 2, N'pedrito@gmail.com', N'12345', NULL, 0, CAST(N'2021-10-19T15:59:22.137' AS DateTime), NULL, CAST(N'2021-10-19T15:59:22.137' AS DateTime), NULL, NULL, 1, 39)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (42, N'Pedro', N'', 2, N'pedrito@gmail.com', N'12345', NULL, 0, CAST(N'2021-10-19T16:19:12.323' AS DateTime), NULL, CAST(N'2021-10-19T16:19:12.323' AS DateTime), NULL, NULL, 1, 40)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (43, N'aaaaa', N'', 2, N'a@gmail', N'wewe', NULL, 0, CAST(N'2021-10-19T17:06:55.690' AS DateTime), NULL, CAST(N'2021-10-19T17:06:55.690' AS DateTime), NULL, NULL, 1, 41)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (44, N'a', N'', 2, N'a', N'a', NULL, 0, CAST(N'2021-10-19T17:22:02.413' AS DateTime), NULL, CAST(N'2021-10-19T17:22:02.413' AS DateTime), NULL, NULL, 1, 42)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (45, N'aa', N'', 2, N'a@gmail.com', N'a', NULL, 0, CAST(N'2021-10-19T17:52:44.453' AS DateTime), NULL, CAST(N'2021-10-19T17:52:44.453' AS DateTime), NULL, NULL, 1, 43)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (46, N'aa', N'', 2, N'asdjjks@gmail.com', N'aaa', NULL, 0, CAST(N'2021-10-19T19:25:52.177' AS DateTime), NULL, CAST(N'2021-10-19T19:25:52.177' AS DateTime), NULL, NULL, 1, 44)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (47, N'aaaa', N'', 2, N'aaju@gmail.com', N'aaa', NULL, 0, CAST(N'2021-10-19T20:51:39.773' AS DateTime), NULL, CAST(N'2021-10-19T20:51:39.773' AS DateTime), NULL, NULL, 1, 45)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (48, N'zxc', N'', 2, N'acasc@gmail.com', N'12345', NULL, 0, CAST(N'2021-10-19T21:06:42.613' AS DateTime), NULL, CAST(N'2021-10-19T21:06:42.613' AS DateTime), NULL, NULL, 1, 46)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (49, N'juan', N'', 2, N'juan@gmail.com', N'asnjans', NULL, 0, CAST(N'2021-10-19T21:09:49.790' AS DateTime), NULL, CAST(N'2021-10-19T21:09:49.790' AS DateTime), NULL, NULL, 1, 47)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (50, N'juan', N'', 2, N'aaa@gmail.com', N'aaaa', NULL, 0, CAST(N'2021-10-19T21:10:41.040' AS DateTime), NULL, CAST(N'2021-10-19T21:10:41.040' AS DateTime), NULL, NULL, 1, 48)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (51, N'juan', N'', 2, N'juan@gmali.com', N'121212', NULL, 0, CAST(N'2021-10-19T21:23:04.763' AS DateTime), NULL, CAST(N'2021-10-19T21:23:04.763' AS DateTime), NULL, NULL, 1, 49)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (52, N'aaaa', N'', 2, N'aaaa@gmail.com', N'121212', NULL, 0, CAST(N'2021-10-19T21:50:59.947' AS DateTime), NULL, CAST(N'2021-10-19T21:50:59.947' AS DateTime), NULL, NULL, 1, 50)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (53, N'ghgfhfg', N'', 2, N'gfhfg@gmail.com', N'sdfsd', NULL, 0, CAST(N'2021-10-19T22:07:53.953' AS DateTime), NULL, CAST(N'2021-10-19T22:07:53.953' AS DateTime), NULL, NULL, 1, 51)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (54, N'Jhon', N'', 2, N'jhoncas@gmail.com', N'123456', NULL, 0, CAST(N'2021-10-19T22:23:02.190' AS DateTime), NULL, CAST(N'2021-10-19T22:23:02.190' AS DateTime), NULL, NULL, 1, 52)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (55, N'Juan', N'', 2, N'juan7878@gmail.com', N'12345', NULL, 0, CAST(N'2021-10-19T22:33:26.107' AS DateTime), NULL, CAST(N'2021-10-19T22:33:26.107' AS DateTime), NULL, NULL, 1, 53)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (56, N'SuperJhon', N'', 2, N'jhoncastrillon9@gmail.com', N'1234', NULL, 0, CAST(N'2021-10-22T10:47:43.427' AS DateTime), NULL, CAST(N'2021-10-22T10:47:43.427' AS DateTime), NULL, NULL, 1, 54)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (57, N'Jhon2021', N'', 2, N'jhon2021@gmail.com', N'Jhon12345*', NULL, 0, CAST(N'2021-12-17T20:20:59.567' AS DateTime), NULL, CAST(N'2021-12-17T20:20:59.567' AS DateTime), NULL, NULL, 1, 55)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (58, N'Pedro', N'', 2, N'jhonpedro@gmail.com', N'1234', NULL, 0, CAST(N'2021-12-17T21:04:36.647' AS DateTime), NULL, CAST(N'2021-12-17T21:04:36.647' AS DateTime), NULL, NULL, 1, 56)
INSERT [CodeMono].[User] ([UserId], [FirstName], [LastName], [UserTypeId], [Username], [Password], [Avatar], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active], [CompanyId]) VALUES (59, N'juan', N'', 2, N'juan123333@gmail.com', N'1234', NULL, 0, CAST(N'2021-12-17T21:27:28.630' AS DateTime), NULL, CAST(N'2021-12-17T21:27:28.630' AS DateTime), NULL, NULL, 1, 57)
SET IDENTITY_INSERT [CodeMono].[User] OFF
GO
INSERT [CodeMono].[UserType] ([UserTypeId], [UserTypeName], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active]) VALUES (1, N'UserTypeDemo', 0, CAST(N'2021-10-08T03:44:23.400' AS DateTime), NULL, NULL, NULL, NULL, 1)
INSERT [CodeMono].[UserType] ([UserTypeId], [UserTypeName], [CreatedBy], [CreatedAt], [UpdatedBy], [UpdatedAt], [DisabledBy], [DisabledAt], [Active]) VALUES (2, N'Prod', 0, CAST(N'2021-10-19T01:22:00.053' AS DateTime), 0, CAST(N'2021-10-19T01:22:00.053' AS DateTime), 0, CAST(N'2021-10-19T01:22:00.053' AS DateTime), 1)
GO
SET IDENTITY_INSERT [Commons].[City] ON 

INSERT [Commons].[City] ([CityId], [CityName], [StateId]) VALUES (1, N'prueba city', 2)
SET IDENTITY_INSERT [Commons].[City] OFF
GO
SET IDENTITY_INSERT [Commons].[State] ON 

INSERT [Commons].[State] ([StateId], [StateName]) VALUES (1, N'Peruanos')
INSERT [Commons].[State] ([StateId], [StateName]) VALUES (2, N'chilenos')
INSERT [Commons].[State] ([StateId], [StateName]) VALUES (3, N'chilenos4')
SET IDENTITY_INSERT [Commons].[State] OFF
GO
SET IDENTITY_INSERT [Companies].[Company] ON 

INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (4, N'inmooap', NULL, NULL, NULL, N'jhon@gmail.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (5, N'inmooap', NULL, NULL, NULL, N'jhon@gmail.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (6, N'miyulim', NULL, NULL, NULL, N'jhoncastrillon@juju.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (7, N'miyulim', NULL, NULL, NULL, N'jhoncastrillon@juju.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (8, N'miyulim', NULL, NULL, NULL, N'jhoncastrillon@juju.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (9, N'miyulim', NULL, NULL, NULL, N'jhoncastrillon@juju.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (10, N'miyulim', NULL, NULL, NULL, N'jhoncastrillon@juju.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (11, N'miyulim', NULL, NULL, NULL, N'jhoncastrillon@juju.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (12, N'miyulim', NULL, NULL, NULL, N'jhoncastrillon@juju.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (13, N'miyulim', NULL, NULL, NULL, N'jhoncastrillon@juju.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (14, N'miyulim', NULL, NULL, NULL, N'jhoncastrillon@juju.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (15, N'miyulim', NULL, NULL, NULL, N'jhoncastrillon@juju.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (16, N'miyulim', NULL, NULL, NULL, N'jhoncastrillon@juju.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (17, N'miyulim', NULL, NULL, NULL, N'jhoncastrillon@juju.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (18, N'miyulim', NULL, NULL, NULL, N'jhoncastrillon@juju.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (19, N'miyulim', NULL, NULL, NULL, N'jhoncastrillon@juju.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (20, N'miyulim', NULL, NULL, NULL, N'jhoncastrillon@juju.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (21, N'miyulim', NULL, NULL, NULL, N'jhoncastrillon@juju.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (22, N'miyulim', NULL, NULL, NULL, N'jhoncastrillon@juju.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (23, N'miyulim', NULL, NULL, NULL, N'jhoncastrillon@juju.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (24, N'miyulim', NULL, NULL, NULL, N'jhoncastrillon@juju.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (25, N'miyulim', NULL, NULL, NULL, N'jhoncastrillon@juju.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (26, N'miyulim', NULL, NULL, NULL, N'jhoncastrillon@juju.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (27, N'miyulim', NULL, NULL, NULL, N'jhoncastrillon@juju.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (28, N'miyulim', NULL, NULL, NULL, N'jhoncastrillon@juju.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (29, N'miyulim', NULL, NULL, NULL, N'jhoncastrillon@juju.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (30, N'miyulim', NULL, NULL, NULL, N'jhoncastrillon@juju.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (31, N'pedritosimpo', NULL, NULL, NULL, N'pedro@gmail.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (32, N'pedritosimpo', NULL, NULL, NULL, N'pedro@gmail.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (33, N'pedriotpos', NULL, NULL, NULL, N'pedrito@gmail.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (34, N'pedriotpos', NULL, NULL, NULL, N'pedrito@gmail.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (35, N'pedriotpos', NULL, NULL, NULL, N'pedrito@gmail.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (36, N'pedriotpos', NULL, NULL, NULL, N'pedrito@gmail.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (37, N'pedriotpos', NULL, NULL, NULL, N'pedrito@gmail.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (38, N'pedriotpos', NULL, NULL, NULL, N'pedrito@gmail.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (39, N'pedriotpos', NULL, NULL, NULL, N'pedrito@gmail.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (40, N'pedriotpos', NULL, NULL, NULL, N'pedrito@gmail.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (41, N'aa', NULL, NULL, NULL, N'a@gmail', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (42, N'a', NULL, NULL, NULL, N'a', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (43, N'a', NULL, NULL, NULL, N'a@gmail.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (44, N'aaa', NULL, NULL, NULL, N'asdjjks@gmail.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (45, N'aaa', NULL, NULL, NULL, N'aaju@gmail.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (46, N'jujuju', NULL, NULL, NULL, N'acasc@gmail.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (47, N'jjjj', NULL, NULL, NULL, N'juan@gmail.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (48, N'aaaa', NULL, NULL, NULL, N'aaa@gmail.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (49, N'puerta azulk', NULL, NULL, NULL, N'juan@gmali.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (50, N'inmomomo', NULL, NULL, NULL, N'aaaa@gmail.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (51, N'asdff', NULL, NULL, NULL, N'gfhfg@gmail.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (52, N'miinnmop', NULL, NULL, NULL, N'jhoncas@gmail.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (53, N'erererer', NULL, NULL, NULL, N'juan7878@gmail.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (54, N'RealState', N'23423423', N'5676787', NULL, N'jhoncastrillon9@gmail.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (55, N'InmoPruebas', N'907898765', N'32323', N'306098765555', N'jhon2021@gmail.com', N'Carrera ', N'Thanksas fgfgf')
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (56, N'qwqw', NULL, NULL, NULL, N'jhonpedro@gmail.com', NULL, NULL)
INSERT [Companies].[Company] ([CompayId], [CompanyName], [Document], [Telephone], [Mobile], [Email], [Address], [Observation]) VALUES (57, N'awawsd', NULL, NULL, NULL, N'juan123333@gmail.com', NULL, NULL)
SET IDENTITY_INSERT [Companies].[Company] OFF
GO
SET IDENTITY_INSERT [dbo].[Logs] ON 

INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (1, N'Host starting...', N'Host starting...', N'Information', CAST(N'2021-10-23T15:22:39.563' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (2, N'User profile is available. Using ''"C:\Users\Admin\AppData\Local\ASP.NET\DataProtection-Keys"'' as key repository and Windows DPAPI to encrypt keys at rest.', N'User profile is available. Using ''{FullName}'' as key repository and Windows DPAPI to encrypt keys at rest.', N'Information', CAST(N'2021-10-23T15:22:41.020' AS DateTime), NULL, N'<properties><property key=''FullName''>C:\Users\Admin\AppData\Local\ASP.NET\DataProtection-Keys</property><property key=''SourceContext''>Microsoft.AspNetCore.DataProtection.KeyManagement.XmlKeyManager</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (3, N'Request starting HTTP/1.1 GET http://localhost:5002/swagger/index.html  ', N'{HostingRequestStartingLog:l}', N'Information', CAST(N'2021-10-23T15:22:41.657' AS DateTime), NULL, N'<properties><property key=''Protocol''>HTTP/1.1</property><property key=''Method''>GET</property><property key=''ContentType''></property><property key=''ContentLength''></property><property key=''Scheme''>http</property><property key=''Host''>localhost:5002</property><property key=''PathBase''></property><property key=''Path''>/swagger/index.html</property><property key=''QueryString''></property><property key=''HostingRequestStartingLog''>Request starting HTTP/1.1 GET http://localhost:5002/swagger/index.html  </property><property key=''EventId''><structure type=''''><property key=''Id''>1</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Hosting.Internal.WebHost</property><property key=''RequestId''>0HMCMCBELVSBF:00000001</property><property key=''RequestPath''>/swagger/index.html</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBF</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (4, N'Request starting HTTP/1.1 DEBUG http://localhost:5002/  0', N'{HostingRequestStartingLog:l}', N'Information', CAST(N'2021-10-23T15:22:41.657' AS DateTime), NULL, N'<properties><property key=''Protocol''>HTTP/1.1</property><property key=''Method''>DEBUG</property><property key=''ContentType''></property><property key=''ContentLength''>0</property><property key=''Scheme''>http</property><property key=''Host''>localhost:5002</property><property key=''PathBase''></property><property key=''Path''>/</property><property key=''QueryString''></property><property key=''HostingRequestStartingLog''>Request starting HTTP/1.1 DEBUG http://localhost:5002/  0</property><property key=''EventId''><structure type=''''><property key=''Id''>1</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Hosting.Internal.WebHost</property><property key=''RequestId''>0HMCMCBELVSBE:00000001</property><property key=''RequestPath''>/</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBE</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (5, N'Request finished in 107.4365ms 200 ', N'{HostingRequestFinishedLog:l}', N'Information', CAST(N'2021-10-23T15:22:41.760' AS DateTime), NULL, N'<properties><property key=''ElapsedMilliseconds''>107,4365</property><property key=''StatusCode''>200</property><property key=''ContentType''></property><property key=''HostingRequestFinishedLog''>Request finished in 107.4365ms 200 </property><property key=''EventId''><structure type=''''><property key=''Id''>2</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Hosting.Internal.WebHost</property><property key=''RequestId''>0HMCMCBELVSBE:00000001</property><property key=''RequestPath''>/</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBE</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (6, N'Request finished in 395.8298ms 200 text/html', N'{HostingRequestFinishedLog:l}', N'Information', CAST(N'2021-10-23T15:22:42.047' AS DateTime), NULL, N'<properties><property key=''ElapsedMilliseconds''>395,8298</property><property key=''StatusCode''>200</property><property key=''ContentType''>text/html</property><property key=''HostingRequestFinishedLog''>Request finished in 395.8298ms 200 text/html</property><property key=''EventId''><structure type=''''><property key=''Id''>2</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Hosting.Internal.WebHost</property><property key=''RequestId''>0HMCMCBELVSBF:00000001</property><property key=''RequestPath''>/swagger/index.html</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBF</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (7, N'Request starting HTTP/1.1 GET http://localhost:5002/swagger/v1/swagger.json  ', N'{HostingRequestStartingLog:l}', N'Information', CAST(N'2021-10-23T15:22:42.970' AS DateTime), NULL, N'<properties><property key=''Protocol''>HTTP/1.1</property><property key=''Method''>GET</property><property key=''ContentType''></property><property key=''ContentLength''></property><property key=''Scheme''>http</property><property key=''Host''>localhost:5002</property><property key=''PathBase''></property><property key=''Path''>/swagger/v1/swagger.json</property><property key=''QueryString''></property><property key=''HostingRequestStartingLog''>Request starting HTTP/1.1 GET http://localhost:5002/swagger/v1/swagger.json  </property><property key=''EventId''><structure type=''''><property key=''Id''>1</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Hosting.Internal.WebHost</property><property key=''RequestId''>0HMCMCBELVSBE:00000002</property><property key=''RequestPath''>/swagger/v1/swagger.json</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBE</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (8, N'Request finished in 921.3736ms 200 application/json;charset=utf-8', N'{HostingRequestFinishedLog:l}', N'Information', CAST(N'2021-10-23T15:22:43.890' AS DateTime), NULL, N'<properties><property key=''ElapsedMilliseconds''>921,3736</property><property key=''StatusCode''>200</property><property key=''ContentType''>application/json;charset=utf-8</property><property key=''HostingRequestFinishedLog''>Request finished in 921.3736ms 200 application/json;charset=utf-8</property><property key=''EventId''><structure type=''''><property key=''Id''>2</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Hosting.Internal.WebHost</property><property key=''RequestId''>0HMCMCBELVSBE:00000002</property><property key=''RequestPath''>/swagger/v1/swagger.json</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBE</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (9, N'Request starting HTTP/1.1 OPTIONS http://localhost:5002/Banks/accountsStatus  ', N'{HostingRequestStartingLog:l}', N'Information', CAST(N'2021-10-23T15:22:53.083' AS DateTime), NULL, N'<properties><property key=''Protocol''>HTTP/1.1</property><property key=''Method''>OPTIONS</property><property key=''ContentType''></property><property key=''ContentLength''></property><property key=''Scheme''>http</property><property key=''Host''>localhost:5002</property><property key=''PathBase''></property><property key=''Path''>/Banks/accountsStatus</property><property key=''QueryString''></property><property key=''HostingRequestStartingLog''>Request starting HTTP/1.1 OPTIONS http://localhost:5002/Banks/accountsStatus  </property><property key=''EventId''><structure type=''''><property key=''Id''>1</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Hosting.Internal.WebHost</property><property key=''RequestId''>0HMCMCBELVSBF:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBF</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (10, N'Policy execution successful.', N'Policy execution successful.', N'Information', CAST(N'2021-10-23T15:22:53.097' AS DateTime), NULL, N'<properties><property key=''EventId''><structure type=''''><property key=''Id''>4</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Cors.Infrastructure.CorsService</property><property key=''RequestId''>0HMCMCBELVSBF:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBF</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (11, N'Request finished in 15.5848ms 204 ', N'{HostingRequestFinishedLog:l}', N'Information', CAST(N'2021-10-23T15:22:53.097' AS DateTime), NULL, N'<properties><property key=''ElapsedMilliseconds''>15,5848</property><property key=''StatusCode''>204</property><property key=''ContentType''></property><property key=''HostingRequestFinishedLog''>Request finished in 15.5848ms 204 </property><property key=''EventId''><structure type=''''><property key=''Id''>2</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Hosting.Internal.WebHost</property><property key=''RequestId''>0HMCMCBELVSBF:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBF</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (12, N'Request starting HTTP/1.1 GET http://localhost:5002/Banks/accountsStatus  ', N'{HostingRequestStartingLog:l}', N'Information', CAST(N'2021-10-23T15:22:53.103' AS DateTime), NULL, N'<properties><property key=''Protocol''>HTTP/1.1</property><property key=''Method''>GET</property><property key=''ContentType''></property><property key=''ContentLength''></property><property key=''Scheme''>http</property><property key=''Host''>localhost:5002</property><property key=''PathBase''></property><property key=''Path''>/Banks/accountsStatus</property><property key=''QueryString''></property><property key=''HostingRequestStartingLog''>Request starting HTTP/1.1 GET http://localhost:5002/Banks/accountsStatus  </property><property key=''EventId''><structure type=''''><property key=''Id''>1</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Hosting.Internal.WebHost</property><property key=''RequestId''>0HMCMCBELVSBE:00000003</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBE</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (13, N'Policy execution successful.', N'Policy execution successful.', N'Information', CAST(N'2021-10-23T15:22:53.103' AS DateTime), NULL, N'<properties><property key=''EventId''><structure type=''''><property key=''Id''>4</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Cors.Infrastructure.CorsService</property><property key=''RequestId''>0HMCMCBELVSBE:00000003</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBE</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (14, N'Successfully validated the token.', N'Successfully validated the token.', N'Information', CAST(N'2021-10-23T15:22:53.323' AS DateTime), NULL, N'<properties><property key=''EventId''><structure type=''''><property key=''Id''>2</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Authentication.JwtBearer.JwtBearerHandler</property><property key=''RequestId''>0HMCMCBELVSBE:00000003</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBE</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (15, N'Route matched with "{action = \"GetAccountsStatus\", controller = \"AccountsStatus\"}". Executing controller action with signature "System.Threading.Tasks.Task`1[Microsoft.AspNetCore.Mvc.IActionResult] GetAccountsStatus(System.Nullable`1[System.Int32], System.String)" on controller "API.Controllers.AccountsStatusController" ("API").', N'Route matched with {RouteData}. Executing controller action with signature {MethodInfo} on controller {Controller} ({AssemblyName}).', N'Information', CAST(N'2021-10-23T15:22:53.450' AS DateTime), NULL, N'<properties><property key=''RouteData''>{action = "GetAccountsStatus", controller = "AccountsStatus"}</property><property key=''MethodInfo''>System.Threading.Tasks.Task`1[Microsoft.AspNetCore.Mvc.IActionResult] GetAccountsStatus(System.Nullable`1[System.Int32], System.String)</property><property key=''Controller''>API.Controllers.AccountsStatusController</property><property key=''AssemblyName''>API</property><property key=''EventId''><structure type=''''><property key=''Id''>3</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCBELVSBE:00000003</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBE</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (16, N'Authorization was successful.', N'Authorization was successful.', N'Information', CAST(N'2021-10-23T15:22:53.463' AS DateTime), NULL, N'<properties><property key=''EventId''><structure type=''''><property key=''Id''>1</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Authorization.DefaultAuthorizationService</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCBELVSBE:00000003</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBE</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (17, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToPayContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:22:54.047' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToPayContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCBELVSBE:00000003</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBE</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (18, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToReceivableContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:22:54.047' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToReceivableContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCBELVSBE:00000003</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBE</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (19, N'No type was specified for the decimal column ''"Total"'' on entity type ''"BankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:22:54.047' AS DateTime), NULL, N'<properties><property key=''property''>Total</property><property key=''entityType''>BankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCBELVSBE:00000003</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBE</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (20, N'No type was specified for the decimal column ''"RentalFeeForOwner"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:22:54.047' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForOwner</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCBELVSBE:00000003</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBE</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (21, N'No type was specified for the decimal column ''"RentalFeeForTennat"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:22:54.047' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForTennat</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCBELVSBE:00000003</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBE</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (22, N'No type was specified for the decimal column ''"Value"'' on entity type ''"HistoryBankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:22:54.047' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>HistoryBankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCBELVSBE:00000003</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBE</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (23, N'No type was specified for the decimal column ''"Area"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:22:54.047' AS DateTime), NULL, N'<properties><property key=''property''>Area</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCBELVSBE:00000003</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBE</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (24, N'No type was specified for the decimal column ''"FeeCompany"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:22:54.047' AS DateTime), NULL, N'<properties><property key=''property''>FeeCompany</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCBELVSBE:00000003</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBE</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (25, N'No type was specified for the decimal column ''"FinalPrice"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:22:54.047' AS DateTime), NULL, N'<properties><property key=''property''>FinalPrice</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCBELVSBE:00000003</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBE</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (26, N'No type was specified for the decimal column ''"Percentage"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:22:54.047' AS DateTime), NULL, N'<properties><property key=''property''>Percentage</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCBELVSBE:00000003</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBE</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (27, N'No type was specified for the decimal column ''"PriceOwner"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:22:54.047' AS DateTime), NULL, N'<properties><property key=''property''>PriceOwner</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCBELVSBE:00000003</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBE</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (28, N'Entity Framework Core "2.1.14-servicing-32113" initialized ''"InmmoAppContext"'' using provider ''"Microsoft.EntityFrameworkCore.SqlServer"'' with options: "None"', N'Entity Framework Core {version} initialized ''{contextType}'' using provider ''{provider}'' with options: {options}', N'Information', CAST(N'2021-10-23T15:22:54.107' AS DateTime), NULL, N'<properties><property key=''version''>2.1.14-servicing-32113</property><property key=''contextType''>InmmoAppContext</property><property key=''provider''>Microsoft.EntityFrameworkCore.SqlServer</property><property key=''options''>None</property><property key=''EventId''><structure type=''''><property key=''Id''>10403</property><property key=''Name''>Microsoft.EntityFrameworkCore.Infrastructure.ContextInitialized</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Infrastructure</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCBELVSBE:00000003</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBE</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (29, N'Executing action method "API.Controllers.AccountsStatusController.GetAccountsStatus (API)" - Validation state: Valid', N'Executing action method {ActionName} - Validation state: {ValidationState}', N'Information', CAST(N'2021-10-23T15:22:54.513' AS DateTime), NULL, N'<properties><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''ValidationState''>Valid</property><property key=''EventId''><structure type=''''><property key=''Id''>1</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''RequestId''>0HMCMCBELVSBE:00000003</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBE</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (30, N'Holaa1111', N'Holaa1111', N'Information', CAST(N'2021-10-23T15:22:56.580' AS DateTime), NULL, N'<properties><property key=''SourceContext''>API.Controllers.AccountsStatusController</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCBELVSBE:00000003</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBE</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (31, N'Holaa1111', N'Holaa1111', N'Error', CAST(N'2021-10-23T15:22:56.643' AS DateTime), NULL, N'<properties><property key=''SourceContext''>API.Controllers.AccountsStatusController</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCBELVSBE:00000003</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBE</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (32, N'Hola', N'Hola', N'Error', CAST(N'2021-10-23T15:22:56.703' AS DateTime), N'System.Exception: Hola
   at API.Controllers.AccountsStatusController.GetAccountsStatus(Nullable`1 AccountsStatusId, String AccountsStatusName) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\API\Controllers\Banks\AccountsStatusController.cs:line 62', N'<properties><property key=''SourceContext''>API.Controllers.AccountsStatusController</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCBELVSBE:00000003</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBE</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (33, N'Executed action method "API.Controllers.AccountsStatusController.GetAccountsStatus (API)", returned result "Microsoft.AspNetCore.Mvc.BadRequestObjectResult" in 2190.9274ms.', N'Executed action method {ActionName}, returned result {ActionResult} in {ElapsedMilliseconds}ms.', N'Information', CAST(N'2021-10-23T15:22:56.707' AS DateTime), NULL, N'<properties><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''ActionResult''>Microsoft.AspNetCore.Mvc.BadRequestObjectResult</property><property key=''ElapsedMilliseconds''>2190,9274</property><property key=''EventId''><structure type=''''><property key=''Id''>2</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''RequestId''>0HMCMCBELVSBE:00000003</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBE</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (34, N'Executing ObjectResult, writing value of type ''"Commons.DTOs.ResponseMDTO"''.', N'Executing ObjectResult, writing value of type ''{Type}''.', N'Information', CAST(N'2021-10-23T15:22:56.713' AS DateTime), NULL, N'<properties><property key=''Type''>Commons.DTOs.ResponseMDTO</property><property key=''EventId''><structure type=''''><property key=''Id''>1</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Mvc.Infrastructure.ObjectResultExecutor</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCBELVSBE:00000003</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBE</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (35, N'Executed action "API.Controllers.AccountsStatusController.GetAccountsStatus (API)" in 3274.0336ms', N'Executed action {ActionName} in {ElapsedMilliseconds}ms', N'Information', CAST(N'2021-10-23T15:22:56.727' AS DateTime), NULL, N'<properties><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''ElapsedMilliseconds''>3274,0336</property><property key=''EventId''><structure type=''''><property key=''Id''>2</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''RequestId''>0HMCMCBELVSBE:00000003</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBE</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (36, N'Request finished in 3626.613ms 400 application/json; charset=utf-8', N'{HostingRequestFinishedLog:l}', N'Information', CAST(N'2021-10-23T15:22:56.730' AS DateTime), NULL, N'<properties><property key=''ElapsedMilliseconds''>3626,613</property><property key=''StatusCode''>400</property><property key=''ContentType''>application/json; charset=utf-8</property><property key=''HostingRequestFinishedLog''>Request finished in 3626.613ms 400 application/json; charset=utf-8</property><property key=''EventId''><structure type=''''><property key=''Id''>2</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Hosting.Internal.WebHost</property><property key=''RequestId''>0HMCMCBELVSBE:00000003</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBE</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (37, N'Request starting HTTP/1.1 OPTIONS http://localhost:5002/Banks/accountsStatus  ', N'{HostingRequestStartingLog:l}', N'Information', CAST(N'2021-10-23T15:25:52.740' AS DateTime), NULL, N'<properties><property key=''Protocol''>HTTP/1.1</property><property key=''Method''>OPTIONS</property><property key=''ContentType''></property><property key=''ContentLength''></property><property key=''Scheme''>http</property><property key=''Host''>localhost:5002</property><property key=''PathBase''></property><property key=''Path''>/Banks/accountsStatus</property><property key=''QueryString''></property><property key=''HostingRequestStartingLog''>Request starting HTTP/1.1 OPTIONS http://localhost:5002/Banks/accountsStatus  </property><property key=''EventId''><structure type=''''><property key=''Id''>1</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Hosting.Internal.WebHost</property><property key=''RequestId''>0HMCMCBELVSBG:00000001</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBG</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (38, N'Policy execution successful.', N'Policy execution successful.', N'Information', CAST(N'2021-10-23T15:25:52.743' AS DateTime), NULL, N'<properties><property key=''EventId''><structure type=''''><property key=''Id''>4</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Cors.Infrastructure.CorsService</property><property key=''RequestId''>0HMCMCBELVSBG:00000001</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBG</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (39, N'Request finished in 0.3347ms 204 ', N'{HostingRequestFinishedLog:l}', N'Information', CAST(N'2021-10-23T15:25:52.743' AS DateTime), NULL, N'<properties><property key=''ElapsedMilliseconds''>0,3347</property><property key=''StatusCode''>204</property><property key=''ContentType''></property><property key=''HostingRequestFinishedLog''>Request finished in 0.3347ms 204 </property><property key=''EventId''><structure type=''''><property key=''Id''>2</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Hosting.Internal.WebHost</property><property key=''RequestId''>0HMCMCBELVSBG:00000001</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBG</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (40, N'Request starting HTTP/1.1 GET http://localhost:5002/Banks/accountsStatus  ', N'{HostingRequestStartingLog:l}', N'Information', CAST(N'2021-10-23T15:25:52.747' AS DateTime), NULL, N'<properties><property key=''Protocol''>HTTP/1.1</property><property key=''Method''>GET</property><property key=''ContentType''></property><property key=''ContentLength''></property><property key=''Scheme''>http</property><property key=''Host''>localhost:5002</property><property key=''PathBase''></property><property key=''Path''>/Banks/accountsStatus</property><property key=''QueryString''></property><property key=''HostingRequestStartingLog''>Request starting HTTP/1.1 GET http://localhost:5002/Banks/accountsStatus  </property><property key=''EventId''><structure type=''''><property key=''Id''>1</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Hosting.Internal.WebHost</property><property key=''RequestId''>0HMCMCBELVSBG:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBG</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (41, N'Policy execution successful.', N'Policy execution successful.', N'Information', CAST(N'2021-10-23T15:25:52.747' AS DateTime), NULL, N'<properties><property key=''EventId''><structure type=''''><property key=''Id''>4</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Cors.Infrastructure.CorsService</property><property key=''RequestId''>0HMCMCBELVSBG:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBG</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (42, N'Successfully validated the token.', N'Successfully validated the token.', N'Information', CAST(N'2021-10-23T15:25:52.757' AS DateTime), NULL, N'<properties><property key=''EventId''><structure type=''''><property key=''Id''>2</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Authentication.JwtBearer.JwtBearerHandler</property><property key=''RequestId''>0HMCMCBELVSBG:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBG</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (43, N'Route matched with "{action = \"GetAccountsStatus\", controller = \"AccountsStatus\"}". Executing controller action with signature "System.Threading.Tasks.Task`1[Microsoft.AspNetCore.Mvc.IActionResult] GetAccountsStatus(System.Nullable`1[System.Int32], System.String)" on controller "API.Controllers.AccountsStatusController" ("API").', N'Route matched with {RouteData}. Executing controller action with signature {MethodInfo} on controller {Controller} ({AssemblyName}).', N'Information', CAST(N'2021-10-23T15:25:52.767' AS DateTime), NULL, N'<properties><property key=''RouteData''>{action = "GetAccountsStatus", controller = "AccountsStatus"}</property><property key=''MethodInfo''>System.Threading.Tasks.Task`1[Microsoft.AspNetCore.Mvc.IActionResult] GetAccountsStatus(System.Nullable`1[System.Int32], System.String)</property><property key=''Controller''>API.Controllers.AccountsStatusController</property><property key=''AssemblyName''>API</property><property key=''EventId''><structure type=''''><property key=''Id''>3</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCBELVSBG:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBG</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (44, N'Authorization was successful.', N'Authorization was successful.', N'Information', CAST(N'2021-10-23T15:25:52.770' AS DateTime), NULL, N'<properties><property key=''EventId''><structure type=''''><property key=''Id''>1</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Authorization.DefaultAuthorizationService</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCBELVSBG:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBG</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (45, N'Entity Framework Core "2.1.14-servicing-32113" initialized ''"InmmoAppContext"'' using provider ''"Microsoft.EntityFrameworkCore.SqlServer"'' with options: "None"', N'Entity Framework Core {version} initialized ''{contextType}'' using provider ''{provider}'' with options: {options}', N'Information', CAST(N'2021-10-23T15:25:52.773' AS DateTime), NULL, N'<properties><property key=''version''>2.1.14-servicing-32113</property><property key=''contextType''>InmmoAppContext</property><property key=''provider''>Microsoft.EntityFrameworkCore.SqlServer</property><property key=''options''>None</property><property key=''EventId''><structure type=''''><property key=''Id''>10403</property><property key=''Name''>Microsoft.EntityFrameworkCore.Infrastructure.ContextInitialized</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Infrastructure</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCBELVSBG:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBG</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (46, N'Executing action method "API.Controllers.AccountsStatusController.GetAccountsStatus (API)" - Validation state: Valid', N'Executing action method {ActionName} - Validation state: {ValidationState}', N'Information', CAST(N'2021-10-23T15:25:52.773' AS DateTime), NULL, N'<properties><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''ValidationState''>Valid</property><property key=''EventId''><structure type=''''><property key=''Id''>1</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''RequestId''>0HMCMCBELVSBG:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBG</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (47, N'Holaa1111', N'Holaa1111', N'Information', CAST(N'2021-10-23T15:25:55.943' AS DateTime), NULL, N'<properties><property key=''SourceContext''>API.Controllers.AccountsStatusController</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCBELVSBG:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBG</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (48, N'Holaa1111', N'Holaa1111', N'Error', CAST(N'2021-10-23T15:25:55.943' AS DateTime), NULL, N'<properties><property key=''SourceContext''>API.Controllers.AccountsStatusController</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCBELVSBG:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBG</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (49, N'Hola', N'Hola', N'Error', CAST(N'2021-10-23T15:25:56.023' AS DateTime), N'System.Exception: Hola
   at API.Controllers.AccountsStatusController.GetAccountsStatus(Nullable`1 AccountsStatusId, String AccountsStatusName) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\API\Controllers\Banks\AccountsStatusController.cs:line 62', N'<properties><property key=''SourceContext''>API.Controllers.AccountsStatusController</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCBELVSBG:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBG</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (50, N'Executed action method "API.Controllers.AccountsStatusController.GetAccountsStatus (API)", returned result "Microsoft.AspNetCore.Mvc.BadRequestObjectResult" in 3248.633ms.', N'Executed action method {ActionName}, returned result {ActionResult} in {ElapsedMilliseconds}ms.', N'Information', CAST(N'2021-10-23T15:25:56.023' AS DateTime), NULL, N'<properties><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''ActionResult''>Microsoft.AspNetCore.Mvc.BadRequestObjectResult</property><property key=''ElapsedMilliseconds''>3248,633</property><property key=''EventId''><structure type=''''><property key=''Id''>2</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''RequestId''>0HMCMCBELVSBG:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBG</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (51, N'Executing ObjectResult, writing value of type ''"Commons.DTOs.ResponseMDTO"''.', N'Executing ObjectResult, writing value of type ''{Type}''.', N'Information', CAST(N'2021-10-23T15:25:56.023' AS DateTime), NULL, N'<properties><property key=''Type''>Commons.DTOs.ResponseMDTO</property><property key=''EventId''><structure type=''''><property key=''Id''>1</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Mvc.Infrastructure.ObjectResultExecutor</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCBELVSBG:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBG</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (52, N'Executed action "API.Controllers.AccountsStatusController.GetAccountsStatus (API)" in 3254.5642ms', N'Executed action {ActionName} in {ElapsedMilliseconds}ms', N'Information', CAST(N'2021-10-23T15:25:56.023' AS DateTime), NULL, N'<properties><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''ElapsedMilliseconds''>3254,5642</property><property key=''EventId''><structure type=''''><property key=''Id''>2</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker</property><property key=''ActionId''>3ffc67cf-f7c2-4c61-bb17-b542b96e0992</property><property key=''RequestId''>0HMCMCBELVSBG:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBG</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (53, N'Request finished in 3276.1813ms 400 application/json; charset=utf-8', N'{HostingRequestFinishedLog:l}', N'Information', CAST(N'2021-10-23T15:25:56.023' AS DateTime), NULL, N'<properties><property key=''ElapsedMilliseconds''>3276,1813</property><property key=''StatusCode''>400</property><property key=''ContentType''>application/json; charset=utf-8</property><property key=''HostingRequestFinishedLog''>Request finished in 3276.1813ms 400 application/json; charset=utf-8</property><property key=''EventId''><structure type=''''><property key=''Id''>2</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Hosting.Internal.WebHost</property><property key=''RequestId''>0HMCMCBELVSBG:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCBELVSBG</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (54, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToPayContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:30:42.853' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToPayContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>74f38ea3-6e82-46a3-ba96-8f00737a1747</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCESTMBP7:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCESTMBP7</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (55, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToReceivableContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:30:42.863' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToReceivableContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>74f38ea3-6e82-46a3-ba96-8f00737a1747</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCESTMBP7:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCESTMBP7</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (56, N'No type was specified for the decimal column ''"Total"'' on entity type ''"BankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:30:42.863' AS DateTime), NULL, N'<properties><property key=''property''>Total</property><property key=''entityType''>BankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>74f38ea3-6e82-46a3-ba96-8f00737a1747</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCESTMBP7:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCESTMBP7</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (57, N'No type was specified for the decimal column ''"RentalFeeForOwner"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:30:42.863' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForOwner</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>74f38ea3-6e82-46a3-ba96-8f00737a1747</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCESTMBP7:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCESTMBP7</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (58, N'No type was specified for the decimal column ''"RentalFeeForTennat"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:30:42.863' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForTennat</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>74f38ea3-6e82-46a3-ba96-8f00737a1747</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCESTMBP7:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCESTMBP7</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (59, N'No type was specified for the decimal column ''"Value"'' on entity type ''"HistoryBankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:30:42.863' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>HistoryBankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>74f38ea3-6e82-46a3-ba96-8f00737a1747</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCESTMBP7:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCESTMBP7</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (60, N'No type was specified for the decimal column ''"Area"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:30:42.863' AS DateTime), NULL, N'<properties><property key=''property''>Area</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>74f38ea3-6e82-46a3-ba96-8f00737a1747</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCESTMBP7:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCESTMBP7</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (61, N'No type was specified for the decimal column ''"FeeCompany"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:30:42.863' AS DateTime), NULL, N'<properties><property key=''property''>FeeCompany</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>74f38ea3-6e82-46a3-ba96-8f00737a1747</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCESTMBP7:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCESTMBP7</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (62, N'No type was specified for the decimal column ''"FinalPrice"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:30:42.863' AS DateTime), NULL, N'<properties><property key=''property''>FinalPrice</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>74f38ea3-6e82-46a3-ba96-8f00737a1747</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCESTMBP7:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCESTMBP7</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (63, N'No type was specified for the decimal column ''"Percentage"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:30:42.863' AS DateTime), NULL, N'<properties><property key=''property''>Percentage</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>74f38ea3-6e82-46a3-ba96-8f00737a1747</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCESTMBP7:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCESTMBP7</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (64, N'No type was specified for the decimal column ''"PriceOwner"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:30:42.863' AS DateTime), NULL, N'<properties><property key=''property''>PriceOwner</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>74f38ea3-6e82-46a3-ba96-8f00737a1747</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCESTMBP7:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCESTMBP7</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (65, N'Holaa1111', N'Holaa1111', N'Error', CAST(N'2021-10-23T15:30:43.250' AS DateTime), NULL, N'<properties><property key=''SourceContext''>API.Controllers.AccountsStatusController</property><property key=''ActionId''>74f38ea3-6e82-46a3-ba96-8f00737a1747</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCESTMBP7:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCESTMBP7</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (66, N'Hola', N'Hola', N'Error', CAST(N'2021-10-23T15:30:43.343' AS DateTime), N'System.Exception: Hola
   at API.Controllers.AccountsStatusController.GetAccountsStatus(Nullable`1 AccountsStatusId, String AccountsStatusName) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\API\Controllers\Banks\AccountsStatusController.cs:line 62', N'<properties><property key=''SourceContext''>API.Controllers.AccountsStatusController</property><property key=''ActionId''>74f38ea3-6e82-46a3-ba96-8f00737a1747</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCESTMBP7:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCESTMBP7</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (67, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2021-10-23T15:58:12.057' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (68, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToPayContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:58:33.533' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToPayContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>d849bee8-8b4d-451c-8641-afe4f0ed34ac</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCMCVADVMV3:00000005</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCVADVMV3</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (69, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToReceivableContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:58:33.540' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToReceivableContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>d849bee8-8b4d-451c-8641-afe4f0ed34ac</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCMCVADVMV3:00000005</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCVADVMV3</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (70, N'No type was specified for the decimal column ''"Total"'' on entity type ''"BankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:58:33.540' AS DateTime), NULL, N'<properties><property key=''property''>Total</property><property key=''entityType''>BankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>d849bee8-8b4d-451c-8641-afe4f0ed34ac</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCMCVADVMV3:00000005</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCVADVMV3</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (71, N'No type was specified for the decimal column ''"RentalFeeForOwner"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:58:33.540' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForOwner</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>d849bee8-8b4d-451c-8641-afe4f0ed34ac</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCMCVADVMV3:00000005</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCVADVMV3</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (72, N'No type was specified for the decimal column ''"RentalFeeForTennat"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:58:33.540' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForTennat</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>d849bee8-8b4d-451c-8641-afe4f0ed34ac</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCMCVADVMV3:00000005</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCVADVMV3</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (73, N'No type was specified for the decimal column ''"Value"'' on entity type ''"HistoryBankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:58:33.540' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>HistoryBankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>d849bee8-8b4d-451c-8641-afe4f0ed34ac</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCMCVADVMV3:00000005</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCVADVMV3</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (74, N'No type was specified for the decimal column ''"Area"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:58:33.540' AS DateTime), NULL, N'<properties><property key=''property''>Area</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>d849bee8-8b4d-451c-8641-afe4f0ed34ac</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCMCVADVMV3:00000005</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCVADVMV3</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (75, N'No type was specified for the decimal column ''"FeeCompany"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:58:33.540' AS DateTime), NULL, N'<properties><property key=''property''>FeeCompany</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>d849bee8-8b4d-451c-8641-afe4f0ed34ac</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCMCVADVMV3:00000005</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCVADVMV3</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (76, N'No type was specified for the decimal column ''"FinalPrice"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:58:33.540' AS DateTime), NULL, N'<properties><property key=''property''>FinalPrice</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>d849bee8-8b4d-451c-8641-afe4f0ed34ac</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCMCVADVMV3:00000005</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCVADVMV3</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (77, N'No type was specified for the decimal column ''"Percentage"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:58:33.540' AS DateTime), NULL, N'<properties><property key=''property''>Percentage</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>d849bee8-8b4d-451c-8641-afe4f0ed34ac</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCMCVADVMV3:00000005</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCVADVMV3</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (78, N'No type was specified for the decimal column ''"PriceOwner"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T15:58:33.540' AS DateTime), NULL, N'<properties><property key=''property''>PriceOwner</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>d849bee8-8b4d-451c-8641-afe4f0ed34ac</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCMCVADVMV3:00000005</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCVADVMV3</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (79, N'Hola HJON', N'Hola HJON', N'Error', CAST(N'2021-10-23T15:58:49.480' AS DateTime), N'System.Exception: Hola HJON
   at API.Controllers.AccountsStatusController.GetAccountsStatus(Nullable`1 AccountsStatusId, String AccountsStatusName) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\API\Controllers\Banks\AccountsStatusController.cs:line 55', N'<properties><property key=''SourceContext''>API.Controllers.AccountsStatusController</property><property key=''ActionId''>775f99b6-fe04-42b4-9ddd-7965446774d9</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMCVADVMV4:00000004</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMCVADVMV4</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (80, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2021-10-23T16:36:35.590' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (81, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToPayContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T16:36:37.333' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToPayContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>ae7a37ba-3e57-45d2-a645-02a593d9bf78</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMDKOAJNR3:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMDKOAJNR3</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (82, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToReceivableContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T16:36:37.340' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToReceivableContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>ae7a37ba-3e57-45d2-a645-02a593d9bf78</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMDKOAJNR3:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMDKOAJNR3</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (83, N'No type was specified for the decimal column ''"Total"'' on entity type ''"BankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T16:36:37.340' AS DateTime), NULL, N'<properties><property key=''property''>Total</property><property key=''entityType''>BankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>ae7a37ba-3e57-45d2-a645-02a593d9bf78</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMDKOAJNR3:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMDKOAJNR3</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (84, N'No type was specified for the decimal column ''"RentalFeeForOwner"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T16:36:37.340' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForOwner</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>ae7a37ba-3e57-45d2-a645-02a593d9bf78</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMDKOAJNR3:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMDKOAJNR3</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (85, N'No type was specified for the decimal column ''"RentalFeeForTennat"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T16:36:37.340' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForTennat</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>ae7a37ba-3e57-45d2-a645-02a593d9bf78</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMDKOAJNR3:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMDKOAJNR3</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (86, N'No type was specified for the decimal column ''"Value"'' on entity type ''"HistoryBankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T16:36:37.340' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>HistoryBankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>ae7a37ba-3e57-45d2-a645-02a593d9bf78</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMDKOAJNR3:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMDKOAJNR3</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (87, N'No type was specified for the decimal column ''"Area"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T16:36:37.340' AS DateTime), NULL, N'<properties><property key=''property''>Area</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>ae7a37ba-3e57-45d2-a645-02a593d9bf78</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMDKOAJNR3:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMDKOAJNR3</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (88, N'No type was specified for the decimal column ''"FeeCompany"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T16:36:37.340' AS DateTime), NULL, N'<properties><property key=''property''>FeeCompany</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>ae7a37ba-3e57-45d2-a645-02a593d9bf78</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMDKOAJNR3:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMDKOAJNR3</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (89, N'No type was specified for the decimal column ''"FinalPrice"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T16:36:37.340' AS DateTime), NULL, N'<properties><property key=''property''>FinalPrice</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>ae7a37ba-3e57-45d2-a645-02a593d9bf78</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMDKOAJNR3:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMDKOAJNR3</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (90, N'No type was specified for the decimal column ''"Percentage"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T16:36:37.340' AS DateTime), NULL, N'<properties><property key=''property''>Percentage</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>ae7a37ba-3e57-45d2-a645-02a593d9bf78</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMDKOAJNR3:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMDKOAJNR3</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (91, N'No type was specified for the decimal column ''"PriceOwner"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T16:36:37.340' AS DateTime), NULL, N'<properties><property key=''property''>PriceOwner</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>ae7a37ba-3e57-45d2-a645-02a593d9bf78</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCMDKOAJNR3:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMDKOAJNR3</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (92, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2021-10-23T16:37:00.797' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (93, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2021-10-23T16:51:51.190' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (94, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToPayContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T16:52:52.007' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToPayContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>bebdbf26-889b-4e7d-928d-3d562723d120</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCMDT967HVT:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMDT967HVT</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (95, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToReceivableContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T16:52:52.013' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToReceivableContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>bebdbf26-889b-4e7d-928d-3d562723d120</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCMDT967HVT:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMDT967HVT</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (96, N'No type was specified for the decimal column ''"Total"'' on entity type ''"BankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T16:52:52.013' AS DateTime), NULL, N'<properties><property key=''property''>Total</property><property key=''entityType''>BankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>bebdbf26-889b-4e7d-928d-3d562723d120</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCMDT967HVT:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMDT967HVT</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (97, N'No type was specified for the decimal column ''"RentalFeeForOwner"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T16:52:52.013' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForOwner</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>bebdbf26-889b-4e7d-928d-3d562723d120</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCMDT967HVT:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMDT967HVT</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (98, N'No type was specified for the decimal column ''"RentalFeeForTennat"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T16:52:52.013' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForTennat</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>bebdbf26-889b-4e7d-928d-3d562723d120</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCMDT967HVT:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMDT967HVT</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (99, N'No type was specified for the decimal column ''"Value"'' on entity type ''"HistoryBankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T16:52:52.013' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>HistoryBankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>bebdbf26-889b-4e7d-928d-3d562723d120</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCMDT967HVT:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMDT967HVT</property></properties>')
GO
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (100, N'No type was specified for the decimal column ''"Area"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T16:52:52.013' AS DateTime), NULL, N'<properties><property key=''property''>Area</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>bebdbf26-889b-4e7d-928d-3d562723d120</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCMDT967HVT:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMDT967HVT</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (101, N'No type was specified for the decimal column ''"FeeCompany"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T16:52:52.013' AS DateTime), NULL, N'<properties><property key=''property''>FeeCompany</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>bebdbf26-889b-4e7d-928d-3d562723d120</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCMDT967HVT:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMDT967HVT</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (102, N'No type was specified for the decimal column ''"FinalPrice"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T16:52:52.013' AS DateTime), NULL, N'<properties><property key=''property''>FinalPrice</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>bebdbf26-889b-4e7d-928d-3d562723d120</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCMDT967HVT:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMDT967HVT</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (103, N'No type was specified for the decimal column ''"Percentage"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T16:52:52.013' AS DateTime), NULL, N'<properties><property key=''property''>Percentage</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>bebdbf26-889b-4e7d-928d-3d562723d120</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCMDT967HVT:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMDT967HVT</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (104, N'No type was specified for the decimal column ''"PriceOwner"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-23T16:52:52.013' AS DateTime), NULL, N'<properties><property key=''property''>PriceOwner</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>bebdbf26-889b-4e7d-928d-3d562723d120</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCMDT967HVT:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCMDT967HVT</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (105, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2021-10-23T23:20:29.450' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (106, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2021-10-24T12:14:13.083' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (107, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToPayContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T12:17:48.340' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToPayContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>ebcb759d-c6fc-4e1c-a284-2b72f0ac5eca</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCN26QQB4VC:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCN26QQB4VC</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (108, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToReceivableContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T12:17:48.357' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToReceivableContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>ebcb759d-c6fc-4e1c-a284-2b72f0ac5eca</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCN26QQB4VC:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCN26QQB4VC</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (109, N'No type was specified for the decimal column ''"Total"'' on entity type ''"BankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T12:17:48.360' AS DateTime), NULL, N'<properties><property key=''property''>Total</property><property key=''entityType''>BankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>ebcb759d-c6fc-4e1c-a284-2b72f0ac5eca</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCN26QQB4VC:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCN26QQB4VC</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (110, N'No type was specified for the decimal column ''"RentalFeeForOwner"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T12:17:48.360' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForOwner</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>ebcb759d-c6fc-4e1c-a284-2b72f0ac5eca</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCN26QQB4VC:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCN26QQB4VC</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (111, N'No type was specified for the decimal column ''"RentalFeeForTennat"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T12:17:48.360' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForTennat</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>ebcb759d-c6fc-4e1c-a284-2b72f0ac5eca</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCN26QQB4VC:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCN26QQB4VC</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (112, N'No type was specified for the decimal column ''"Value"'' on entity type ''"HistoryBankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T12:17:48.360' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>HistoryBankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>ebcb759d-c6fc-4e1c-a284-2b72f0ac5eca</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCN26QQB4VC:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCN26QQB4VC</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (113, N'No type was specified for the decimal column ''"Area"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T12:17:48.360' AS DateTime), NULL, N'<properties><property key=''property''>Area</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>ebcb759d-c6fc-4e1c-a284-2b72f0ac5eca</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCN26QQB4VC:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCN26QQB4VC</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (114, N'No type was specified for the decimal column ''"FeeCompany"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T12:17:48.360' AS DateTime), NULL, N'<properties><property key=''property''>FeeCompany</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>ebcb759d-c6fc-4e1c-a284-2b72f0ac5eca</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCN26QQB4VC:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCN26QQB4VC</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (115, N'No type was specified for the decimal column ''"FinalPrice"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T12:17:48.360' AS DateTime), NULL, N'<properties><property key=''property''>FinalPrice</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>ebcb759d-c6fc-4e1c-a284-2b72f0ac5eca</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCN26QQB4VC:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCN26QQB4VC</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (116, N'No type was specified for the decimal column ''"Percentage"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T12:17:48.360' AS DateTime), NULL, N'<properties><property key=''property''>Percentage</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>ebcb759d-c6fc-4e1c-a284-2b72f0ac5eca</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCN26QQB4VC:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCN26QQB4VC</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (117, N'No type was specified for the decimal column ''"PriceOwner"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T12:17:48.360' AS DateTime), NULL, N'<properties><property key=''property''>PriceOwner</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>ebcb759d-c6fc-4e1c-a284-2b72f0ac5eca</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCN26QQB4VC:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCN26QQB4VC</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (118, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2021-10-24T12:47:54.497' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (119, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2021-10-24T12:48:07.317' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (120, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToPayContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T12:48:09.040' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToPayContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>cf82fccd-7238-4976-860a-a6d5ed3f18d3</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCN2PO5BGT9:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCN2PO5BGT9</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (121, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToReceivableContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T12:48:09.047' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToReceivableContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>cf82fccd-7238-4976-860a-a6d5ed3f18d3</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCN2PO5BGT9:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCN2PO5BGT9</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (122, N'No type was specified for the decimal column ''"Total"'' on entity type ''"BankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T12:48:09.047' AS DateTime), NULL, N'<properties><property key=''property''>Total</property><property key=''entityType''>BankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>cf82fccd-7238-4976-860a-a6d5ed3f18d3</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCN2PO5BGT9:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCN2PO5BGT9</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (123, N'No type was specified for the decimal column ''"RentalFeeForOwner"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T12:48:09.047' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForOwner</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>cf82fccd-7238-4976-860a-a6d5ed3f18d3</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCN2PO5BGT9:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCN2PO5BGT9</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (124, N'No type was specified for the decimal column ''"RentalFeeForTennat"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T12:48:09.047' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForTennat</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>cf82fccd-7238-4976-860a-a6d5ed3f18d3</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCN2PO5BGT9:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCN2PO5BGT9</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (125, N'No type was specified for the decimal column ''"Value"'' on entity type ''"HistoryBankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T12:48:09.047' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>HistoryBankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>cf82fccd-7238-4976-860a-a6d5ed3f18d3</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCN2PO5BGT9:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCN2PO5BGT9</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (126, N'No type was specified for the decimal column ''"Area"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T12:48:09.047' AS DateTime), NULL, N'<properties><property key=''property''>Area</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>cf82fccd-7238-4976-860a-a6d5ed3f18d3</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCN2PO5BGT9:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCN2PO5BGT9</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (127, N'No type was specified for the decimal column ''"FeeCompany"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T12:48:09.047' AS DateTime), NULL, N'<properties><property key=''property''>FeeCompany</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>cf82fccd-7238-4976-860a-a6d5ed3f18d3</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCN2PO5BGT9:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCN2PO5BGT9</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (128, N'No type was specified for the decimal column ''"FinalPrice"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T12:48:09.047' AS DateTime), NULL, N'<properties><property key=''property''>FinalPrice</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>cf82fccd-7238-4976-860a-a6d5ed3f18d3</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCN2PO5BGT9:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCN2PO5BGT9</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (129, N'No type was specified for the decimal column ''"Percentage"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T12:48:09.047' AS DateTime), NULL, N'<properties><property key=''property''>Percentage</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>cf82fccd-7238-4976-860a-a6d5ed3f18d3</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCN2PO5BGT9:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCN2PO5BGT9</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (130, N'No type was specified for the decimal column ''"PriceOwner"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T12:48:09.047' AS DateTime), NULL, N'<properties><property key=''property''>PriceOwner</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>cf82fccd-7238-4976-860a-a6d5ed3f18d3</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCN2PO5BGT9:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCN2PO5BGT9</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (131, N'Could not find stored procedure ''Banks.PaymentTypes_LIST''.', N'Could not find stored procedure ''Banks.PaymentTypes_LIST''.', N'Error', CAST(N'2021-10-24T22:52:58.967' AS DateTime), N'System.Data.SqlClient.SqlException (0x80131904): Could not find stored procedure ''Banks.PaymentTypes_LIST''.
   at System.Data.SqlClient.SqlCommand.<>c.<ExecuteDbDataReaderAsync>b__126_0(Task`1 result)
   at System.Threading.Tasks.ContinuationResultTaskFromResultTask`2.InnerInvoke()
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
--- End of stack trace from previous location where exception was thrown ---
   at System.Threading.Tasks.Task.ExecuteWithThreadLocal(Task& currentTaskSlot)
--- End of stack trace from previous location where exception was thrown ---
   at Dapper.SqlMapper.QueryAsync[T](IDbConnection cnn, Type effectiveType, CommandDefinition command) in C:\projects\dapper\Dapper\SqlMapper.Async.cs:line 419
   at CodeMono.DataAccess.DBConnection.DBConnectionMSSQL.QueryAsync[T](Dictionary`2 P, String SP) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\DataAccess\_CodeMono\Base\DBConnectionMSSQL.cs:line 51
   at DataAccess.BaseStoreProcedureModel.ExecStoreProcedure[T](Dictionary`2 parameters, String spName) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\DataAccess\BaseStoreProcedureModel.cs:line 29
   at Business.BaseService`1.ExecStoreProcedure[T](Dictionary`2 parameters, String spName) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\Business\BaseService.cs:line 110
   at API.Controllers.PaymentTypeController.GetListPaymentType(Nullable`1 PaymentTypeId, String PaymentTypeName, Nullable`1 CompayId) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\API\Controllers\Banks\PaymentTypeController.cs:line 100
ClientConnectionId:322d79a9-ada9-48ee-93e3-ba9589d4aa01
Error Number:2812,State:62,Class:16', N'<properties><property key=''SourceContext''>API.Controllers.PaymentTypeController</property><property key=''ActionId''>3d4d1bd0-2a39-471e-a019-6996991d541a</property><property key=''ActionName''>API.Controllers.PaymentTypeController.GetListPaymentType (API)</property><property key=''RequestId''>0HMCN2PO5BGUD:00000001</property><property key=''RequestPath''>/Banks/paymentType/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCN2PO5BGUD</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (132, N'Se ha presentado un error de autorización', N'Se ha presentado un error de autorización', N'Error', CAST(N'2021-10-24T22:56:25.360' AS DateTime), N'System.Exception: Se ha presentado un error de autorización
   at Business.BaseService`1.ValidateUserId(Int32 companyId) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\Business\BaseService.cs:line 91
   at API.Controllers.UserController.PutUser(UserDTO model) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\API\Controllers\Users\UserController.cs:line 202', N'<properties><property key=''SourceContext''>API.Controllers.UserController</property><property key=''ActionId''>eea975ca-671a-40aa-81f8-c7359fbf4a9f</property><property key=''ActionName''>API.Controllers.UserController.PutUser (API)</property><property key=''RequestId''>0HMCN2PO5BGUB:00000016</property><property key=''RequestPath''>/user</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCN2PO5BGUB</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (133, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2021-10-24T23:14:56.953' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (134, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToPayContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:20:47.373' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToPayContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>36979435-8f4c-4408-9824-30e9fd17199d</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDO147JUO:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDO147JUO</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (135, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToReceivableContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:20:47.383' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToReceivableContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>36979435-8f4c-4408-9824-30e9fd17199d</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDO147JUO:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDO147JUO</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (136, N'No type was specified for the decimal column ''"Total"'' on entity type ''"BankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:20:47.383' AS DateTime), NULL, N'<properties><property key=''property''>Total</property><property key=''entityType''>BankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>36979435-8f4c-4408-9824-30e9fd17199d</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDO147JUO:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDO147JUO</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (137, N'No type was specified for the decimal column ''"RentalFeeForOwner"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:20:47.387' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForOwner</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>36979435-8f4c-4408-9824-30e9fd17199d</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDO147JUO:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDO147JUO</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (138, N'No type was specified for the decimal column ''"RentalFeeForTennat"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:20:47.387' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForTennat</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>36979435-8f4c-4408-9824-30e9fd17199d</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDO147JUO:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDO147JUO</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (139, N'No type was specified for the decimal column ''"Value"'' on entity type ''"HistoryBankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:20:47.387' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>HistoryBankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>36979435-8f4c-4408-9824-30e9fd17199d</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDO147JUO:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDO147JUO</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (140, N'No type was specified for the decimal column ''"Area"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:20:47.387' AS DateTime), NULL, N'<properties><property key=''property''>Area</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>36979435-8f4c-4408-9824-30e9fd17199d</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDO147JUO:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDO147JUO</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (141, N'No type was specified for the decimal column ''"FeeCompany"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:20:47.387' AS DateTime), NULL, N'<properties><property key=''property''>FeeCompany</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>36979435-8f4c-4408-9824-30e9fd17199d</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDO147JUO:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDO147JUO</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (142, N'No type was specified for the decimal column ''"FinalPrice"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:20:47.387' AS DateTime), NULL, N'<properties><property key=''property''>FinalPrice</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>36979435-8f4c-4408-9824-30e9fd17199d</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDO147JUO:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDO147JUO</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (143, N'No type was specified for the decimal column ''"Percentage"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:20:47.387' AS DateTime), NULL, N'<properties><property key=''property''>Percentage</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>36979435-8f4c-4408-9824-30e9fd17199d</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDO147JUO:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDO147JUO</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (144, N'No type was specified for the decimal column ''"PriceOwner"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:20:47.387' AS DateTime), NULL, N'<properties><property key=''property''>PriceOwner</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>36979435-8f4c-4408-9824-30e9fd17199d</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDO147JUO:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDO147JUO</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (145, N'Error parsing column 9 (CompanyName=RealState - String)', N'Error parsing column 9 (CompanyName=RealState - String)', N'Fatal', CAST(N'2021-10-24T23:20:50.160' AS DateTime), N'System.Data.DataException: Error parsing column 9 (CompanyName=RealState - String) ---> System.FormatException: Input string was not in a correct format.
   at System.Number.StringToNumber(ReadOnlySpan`1 str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(ReadOnlySpan`1 s, NumberStyles style, NumberFormatInfo info)
   at System.String.System.IConvertible.ToInt32(IFormatProvider provider)
   at System.Convert.ChangeType(Object value, Type conversionType, IFormatProvider provider)
   at Deserialize457bc88f-df5d-43d5-a150-00ade88497e0(IDataReader )
   --- End of inner exception stack trace ---
   at Dapper.SqlMapper.ThrowDataException(Exception ex, Int32 index, IDataReader reader, Object value) in C:\projects\dapper\Dapper\SqlMapper.cs:line 3633
   at Deserialize457bc88f-df5d-43d5-a150-00ade88497e0(IDataReader )
   at Dapper.SqlMapper.QueryAsync[T](IDbConnection cnn, Type effectiveType, CommandDefinition command)
   at CodeMono.DataAccess.DBConnection.DBConnectionMSSQL.QueryAsync[T](Dictionary`2 P, String SP)
   at DataAccess.BaseStoreProcedureModel.ExecStoreProcedure[T](Dictionary`2 parameters, String spName)
   at Business.Users.AuthenticationServices.Validate(Dictionary`2 parameters)
   at API.Controllers.AuthenticationController.Validate(AuthenticationDTO data)', N'<properties><property key=''SourceContext''>API.Controllers.AuthenticationController</property><property key=''ActionId''>36979435-8f4c-4408-9824-30e9fd17199d</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDO147JUO:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDO147JUO</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (146, N'Error parsing column 9 (CompanyName=erererer - String)', N'Error parsing column 9 (CompanyName=erererer - String)', N'Fatal', CAST(N'2021-10-24T23:20:57.447' AS DateTime), N'System.Data.DataException: Error parsing column 9 (CompanyName=erererer - String) ---> System.FormatException: Input string was not in a correct format.
   at System.Number.StringToNumber(ReadOnlySpan`1 str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(ReadOnlySpan`1 s, NumberStyles style, NumberFormatInfo info)
   at System.String.System.IConvertible.ToInt32(IFormatProvider provider)
   at System.Convert.ChangeType(Object value, Type conversionType, IFormatProvider provider)
   at Deserialize457bc88f-df5d-43d5-a150-00ade88497e0(IDataReader )
   --- End of inner exception stack trace ---
   at Dapper.SqlMapper.ThrowDataException(Exception ex, Int32 index, IDataReader reader, Object value) in C:\projects\dapper\Dapper\SqlMapper.cs:line 3633
   at Deserialize457bc88f-df5d-43d5-a150-00ade88497e0(IDataReader )
   at Dapper.SqlMapper.QueryAsync[T](IDbConnection cnn, Type effectiveType, CommandDefinition command)
   at CodeMono.DataAccess.DBConnection.DBConnectionMSSQL.QueryAsync[T](Dictionary`2 P, String SP)
   at DataAccess.BaseStoreProcedureModel.ExecStoreProcedure[T](Dictionary`2 parameters, String spName)
   at Business.Users.AuthenticationServices.Validate(Dictionary`2 parameters)
   at API.Controllers.AuthenticationController.Validate(AuthenticationDTO data)', N'<properties><property key=''SourceContext''>API.Controllers.AuthenticationController</property><property key=''ActionId''>36979435-8f4c-4408-9824-30e9fd17199d</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDO147JUO:00000004</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDO147JUO</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (147, N'Error parsing column 9 (CompanyName=RealState - String)', N'Error parsing column 9 (CompanyName=RealState - String)', N'Fatal', CAST(N'2021-10-24T23:21:03.960' AS DateTime), N'System.Data.DataException: Error parsing column 9 (CompanyName=RealState - String) ---> System.FormatException: Input string was not in a correct format.
   at System.Number.StringToNumber(ReadOnlySpan`1 str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(ReadOnlySpan`1 s, NumberStyles style, NumberFormatInfo info)
   at System.String.System.IConvertible.ToInt32(IFormatProvider provider)
   at System.Convert.ChangeType(Object value, Type conversionType, IFormatProvider provider)
   at Deserialize457bc88f-df5d-43d5-a150-00ade88497e0(IDataReader )
   --- End of inner exception stack trace ---
   at Dapper.SqlMapper.ThrowDataException(Exception ex, Int32 index, IDataReader reader, Object value) in C:\projects\dapper\Dapper\SqlMapper.cs:line 3633
   at Deserialize457bc88f-df5d-43d5-a150-00ade88497e0(IDataReader )
   at Dapper.SqlMapper.QueryAsync[T](IDbConnection cnn, Type effectiveType, CommandDefinition command)
   at CodeMono.DataAccess.DBConnection.DBConnectionMSSQL.QueryAsync[T](Dictionary`2 P, String SP)
   at DataAccess.BaseStoreProcedureModel.ExecStoreProcedure[T](Dictionary`2 parameters, String spName)
   at Business.Users.AuthenticationServices.Validate(Dictionary`2 parameters)
   at API.Controllers.AuthenticationController.Validate(AuthenticationDTO data)', N'<properties><property key=''SourceContext''>API.Controllers.AuthenticationController</property><property key=''ActionId''>36979435-8f4c-4408-9824-30e9fd17199d</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDO147JUO:00000006</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDO147JUO</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (148, N'Error parsing column 9 (CompanyName=RealState - String)', N'Error parsing column 9 (CompanyName=RealState - String)', N'Fatal', CAST(N'2021-10-24T23:21:25.567' AS DateTime), N'System.Data.DataException: Error parsing column 9 (CompanyName=RealState - String) ---> System.FormatException: Input string was not in a correct format.
   at System.Number.StringToNumber(ReadOnlySpan`1 str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(ReadOnlySpan`1 s, NumberStyles style, NumberFormatInfo info)
   at System.String.System.IConvertible.ToInt32(IFormatProvider provider)
   at System.Convert.ChangeType(Object value, Type conversionType, IFormatProvider provider)
   at Deserialize457bc88f-df5d-43d5-a150-00ade88497e0(IDataReader )
   --- End of inner exception stack trace ---
   at Dapper.SqlMapper.ThrowDataException(Exception ex, Int32 index, IDataReader reader, Object value) in C:\projects\dapper\Dapper\SqlMapper.cs:line 3633
   at Deserialize457bc88f-df5d-43d5-a150-00ade88497e0(IDataReader )
   at Dapper.SqlMapper.QueryAsync[T](IDbConnection cnn, Type effectiveType, CommandDefinition command)
   at CodeMono.DataAccess.DBConnection.DBConnectionMSSQL.QueryAsync[T](Dictionary`2 P, String SP)
   at DataAccess.BaseStoreProcedureModel.ExecStoreProcedure[T](Dictionary`2 parameters, String spName)
   at Business.Users.AuthenticationServices.Validate(Dictionary`2 parameters)
   at API.Controllers.AuthenticationController.Validate(AuthenticationDTO data)', N'<properties><property key=''SourceContext''>API.Controllers.AuthenticationController</property><property key=''ActionId''>36979435-8f4c-4408-9824-30e9fd17199d</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDO147JUO:00000008</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDO147JUO</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (149, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2021-10-24T23:23:27.910' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (150, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2021-10-24T23:23:51.153' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (151, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToPayContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:24:21.740' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToPayContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>c91b7e9c-bd82-40e2-a3e1-ee8d6855789b</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDT0HMIM2:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDT0HMIM2</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (152, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToReceivableContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:24:21.747' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToReceivableContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>c91b7e9c-bd82-40e2-a3e1-ee8d6855789b</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDT0HMIM2:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDT0HMIM2</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (153, N'No type was specified for the decimal column ''"Total"'' on entity type ''"BankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:24:21.747' AS DateTime), NULL, N'<properties><property key=''property''>Total</property><property key=''entityType''>BankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>c91b7e9c-bd82-40e2-a3e1-ee8d6855789b</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDT0HMIM2:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDT0HMIM2</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (154, N'No type was specified for the decimal column ''"RentalFeeForOwner"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:24:21.747' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForOwner</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>c91b7e9c-bd82-40e2-a3e1-ee8d6855789b</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDT0HMIM2:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDT0HMIM2</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (155, N'No type was specified for the decimal column ''"RentalFeeForTennat"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:24:21.747' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForTennat</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>c91b7e9c-bd82-40e2-a3e1-ee8d6855789b</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDT0HMIM2:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDT0HMIM2</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (156, N'No type was specified for the decimal column ''"Value"'' on entity type ''"HistoryBankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:24:21.747' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>HistoryBankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>c91b7e9c-bd82-40e2-a3e1-ee8d6855789b</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDT0HMIM2:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDT0HMIM2</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (157, N'No type was specified for the decimal column ''"Area"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:24:21.747' AS DateTime), NULL, N'<properties><property key=''property''>Area</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>c91b7e9c-bd82-40e2-a3e1-ee8d6855789b</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDT0HMIM2:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDT0HMIM2</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (158, N'No type was specified for the decimal column ''"FeeCompany"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:24:21.747' AS DateTime), NULL, N'<properties><property key=''property''>FeeCompany</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>c91b7e9c-bd82-40e2-a3e1-ee8d6855789b</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDT0HMIM2:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDT0HMIM2</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (159, N'No type was specified for the decimal column ''"FinalPrice"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:24:21.747' AS DateTime), NULL, N'<properties><property key=''property''>FinalPrice</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>c91b7e9c-bd82-40e2-a3e1-ee8d6855789b</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDT0HMIM2:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDT0HMIM2</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (160, N'No type was specified for the decimal column ''"Percentage"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:24:21.747' AS DateTime), NULL, N'<properties><property key=''property''>Percentage</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>c91b7e9c-bd82-40e2-a3e1-ee8d6855789b</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDT0HMIM2:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDT0HMIM2</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (161, N'No type was specified for the decimal column ''"PriceOwner"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:24:21.747' AS DateTime), NULL, N'<properties><property key=''property''>PriceOwner</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>c91b7e9c-bd82-40e2-a3e1-ee8d6855789b</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDT0HMIM2:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDT0HMIM2</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (162, N'Error parsing column 9 (CompanyName=RealState - String)', N'Error parsing column 9 (CompanyName=RealState - String)', N'Fatal', CAST(N'2021-10-24T23:24:57.780' AS DateTime), N'System.Data.DataException: Error parsing column 9 (CompanyName=RealState - String) ---> System.FormatException: Input string was not in a correct format.
   at System.Number.StringToNumber(ReadOnlySpan`1 str, NumberStyles options, NumberBuffer& number, NumberFormatInfo info, Boolean parseDecimal)
   at System.Number.ParseInt32(ReadOnlySpan`1 s, NumberStyles style, NumberFormatInfo info)
   at System.String.System.IConvertible.ToInt32(IFormatProvider provider)
   at System.Convert.ChangeType(Object value, Type conversionType, IFormatProvider provider)
   at Deserializeca370623-ebe5-4cbb-b85f-2cc716de216d(IDataReader )
   --- End of inner exception stack trace ---
   at Dapper.SqlMapper.ThrowDataException(Exception ex, Int32 index, IDataReader reader, Object value) in C:\projects\dapper\Dapper\SqlMapper.cs:line 3633
   at Deserializeca370623-ebe5-4cbb-b85f-2cc716de216d(IDataReader )
   at Dapper.SqlMapper.QueryAsync[T](IDbConnection cnn, Type effectiveType, CommandDefinition command)
   at CodeMono.DataAccess.DBConnection.DBConnectionMSSQL.QueryAsync[T](Dictionary`2 P, String SP)
   at DataAccess.BaseStoreProcedureModel.ExecStoreProcedure[T](Dictionary`2 parameters, String spName)
   at Business.Users.AuthenticationServices.Validate(Dictionary`2 parameters)
   at API.Controllers.AuthenticationController.Validate(AuthenticationDTO data)', N'<properties><property key=''SourceContext''>API.Controllers.AuthenticationController</property><property key=''ActionId''>c91b7e9c-bd82-40e2-a3e1-ee8d6855789b</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDT0HMIM2:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDT0HMIM2</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (163, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2021-10-24T23:26:51.760' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (164, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToPayContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:27:03.850' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToPayContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>54b0d83e-9eff-45a3-9835-0b88c7354279</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDUM884OA:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDUM884OA</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (165, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToReceivableContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:27:03.863' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToReceivableContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>54b0d83e-9eff-45a3-9835-0b88c7354279</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDUM884OA:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDUM884OA</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (166, N'No type was specified for the decimal column ''"Total"'' on entity type ''"BankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:27:03.863' AS DateTime), NULL, N'<properties><property key=''property''>Total</property><property key=''entityType''>BankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>54b0d83e-9eff-45a3-9835-0b88c7354279</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDUM884OA:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDUM884OA</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (167, N'No type was specified for the decimal column ''"RentalFeeForOwner"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:27:03.863' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForOwner</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>54b0d83e-9eff-45a3-9835-0b88c7354279</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDUM884OA:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDUM884OA</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (168, N'No type was specified for the decimal column ''"RentalFeeForTennat"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:27:03.863' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForTennat</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>54b0d83e-9eff-45a3-9835-0b88c7354279</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDUM884OA:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDUM884OA</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (169, N'No type was specified for the decimal column ''"Value"'' on entity type ''"HistoryBankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:27:03.863' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>HistoryBankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>54b0d83e-9eff-45a3-9835-0b88c7354279</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDUM884OA:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDUM884OA</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (170, N'No type was specified for the decimal column ''"Area"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:27:03.863' AS DateTime), NULL, N'<properties><property key=''property''>Area</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>54b0d83e-9eff-45a3-9835-0b88c7354279</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDUM884OA:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDUM884OA</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (171, N'No type was specified for the decimal column ''"FeeCompany"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:27:03.863' AS DateTime), NULL, N'<properties><property key=''property''>FeeCompany</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>54b0d83e-9eff-45a3-9835-0b88c7354279</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDUM884OA:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDUM884OA</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (172, N'No type was specified for the decimal column ''"FinalPrice"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:27:03.863' AS DateTime), NULL, N'<properties><property key=''property''>FinalPrice</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>54b0d83e-9eff-45a3-9835-0b88c7354279</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDUM884OA:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDUM884OA</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (173, N'No type was specified for the decimal column ''"Percentage"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:27:03.863' AS DateTime), NULL, N'<properties><property key=''property''>Percentage</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>54b0d83e-9eff-45a3-9835-0b88c7354279</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDUM884OA:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDUM884OA</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (174, N'No type was specified for the decimal column ''"PriceOwner"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:27:03.863' AS DateTime), NULL, N'<properties><property key=''property''>PriceOwner</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>54b0d83e-9eff-45a3-9835-0b88c7354279</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNDUM884OA:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNDUM884OA</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (175, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2021-10-24T23:29:27.033' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (176, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToPayContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:29:28.790' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToPayContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>0a429670-3a8c-4658-8e95-b4ecf0813cc4</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNE040M64B:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNE040M64B</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (177, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToReceivableContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:29:28.797' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToReceivableContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>0a429670-3a8c-4658-8e95-b4ecf0813cc4</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNE040M64B:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNE040M64B</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (178, N'No type was specified for the decimal column ''"Total"'' on entity type ''"BankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:29:28.797' AS DateTime), NULL, N'<properties><property key=''property''>Total</property><property key=''entityType''>BankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>0a429670-3a8c-4658-8e95-b4ecf0813cc4</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNE040M64B:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNE040M64B</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (179, N'No type was specified for the decimal column ''"RentalFeeForOwner"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:29:28.797' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForOwner</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>0a429670-3a8c-4658-8e95-b4ecf0813cc4</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNE040M64B:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNE040M64B</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (180, N'No type was specified for the decimal column ''"RentalFeeForTennat"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:29:28.797' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForTennat</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>0a429670-3a8c-4658-8e95-b4ecf0813cc4</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNE040M64B:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNE040M64B</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (181, N'No type was specified for the decimal column ''"Value"'' on entity type ''"HistoryBankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:29:28.797' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>HistoryBankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>0a429670-3a8c-4658-8e95-b4ecf0813cc4</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNE040M64B:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNE040M64B</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (182, N'No type was specified for the decimal column ''"Area"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:29:28.797' AS DateTime), NULL, N'<properties><property key=''property''>Area</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>0a429670-3a8c-4658-8e95-b4ecf0813cc4</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNE040M64B:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNE040M64B</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (183, N'No type was specified for the decimal column ''"FeeCompany"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:29:28.797' AS DateTime), NULL, N'<properties><property key=''property''>FeeCompany</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>0a429670-3a8c-4658-8e95-b4ecf0813cc4</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNE040M64B:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNE040M64B</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (184, N'No type was specified for the decimal column ''"FinalPrice"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:29:28.797' AS DateTime), NULL, N'<properties><property key=''property''>FinalPrice</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>0a429670-3a8c-4658-8e95-b4ecf0813cc4</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNE040M64B:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNE040M64B</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (185, N'No type was specified for the decimal column ''"Percentage"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:29:28.797' AS DateTime), NULL, N'<properties><property key=''property''>Percentage</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>0a429670-3a8c-4658-8e95-b4ecf0813cc4</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNE040M64B:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNE040M64B</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (186, N'No type was specified for the decimal column ''"PriceOwner"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-24T23:29:28.797' AS DateTime), NULL, N'<properties><property key=''property''>PriceOwner</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>0a429670-3a8c-4658-8e95-b4ecf0813cc4</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCNE040M64B:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNE040M64B</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (187, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2021-10-24T23:49:50.977' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (188, N'Could not find stored procedure ''Banks.PaymentTypes_LIST''.', N'Could not find stored procedure ''Banks.PaymentTypes_LIST''.', N'Error', CAST(N'2021-10-25T16:56:59.043' AS DateTime), N'System.Data.SqlClient.SqlException (0x80131904): Could not find stored procedure ''Banks.PaymentTypes_LIST''.
   at System.Data.SqlClient.SqlCommand.<>c.<ExecuteDbDataReaderAsync>b__126_0(Task`1 result)
   at System.Threading.Tasks.ContinuationResultTaskFromResultTask`2.InnerInvoke()
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
--- End of stack trace from previous location where exception was thrown ---
   at System.Threading.Tasks.Task.ExecuteWithThreadLocal(Task& currentTaskSlot)
--- End of stack trace from previous location where exception was thrown ---
   at Dapper.SqlMapper.QueryAsync[T](IDbConnection cnn, Type effectiveType, CommandDefinition command) in C:\projects\dapper\Dapper\SqlMapper.Async.cs:line 419
   at CodeMono.DataAccess.DBConnection.DBConnectionMSSQL.QueryAsync[T](Dictionary`2 P, String SP) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\DataAccess\_CodeMono\Base\DBConnectionMSSQL.cs:line 51
   at DataAccess.BaseStoreProcedureModel.ExecStoreProcedure[T](Dictionary`2 parameters, String spName) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\DataAccess\BaseStoreProcedureModel.cs:line 29
   at Business.BaseService`1.ExecStoreProcedure[T](Dictionary`2 parameters, String spName) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\Business\BaseService.cs:line 110
   at API.Controllers.PaymentTypeController.GetListPaymentType(Nullable`1 PaymentTypeId, String PaymentTypeName, Nullable`1 CompayId) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\API\Controllers\Banks\PaymentTypeController.cs:line 100
ClientConnectionId:831d8cad-283f-44f5-a5da-66a0e2df2f0b
Error Number:2812,State:62,Class:16', N'<properties><property key=''SourceContext''>API.Controllers.PaymentTypeController</property><property key=''ActionId''>c1380f61-0272-4a9f-94fa-8bd030517db3</property><property key=''ActionName''>API.Controllers.PaymentTypeController.GetListPaymentType (API)</property><property key=''RequestId''>0HMCNEBHA0SBP:00000006</property><property key=''RequestPath''>/Banks/paymentType/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCNEBHA0SBP</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (189, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2021-10-25T19:53:24.633' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (190, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToPayContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-25T21:52:39.607' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToPayContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>46e3648a-dbe8-4203-8120-688b538a3be9</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCO3C2VJMF7:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO3C2VJMF7</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (191, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToReceivableContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-25T21:52:39.613' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToReceivableContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>46e3648a-dbe8-4203-8120-688b538a3be9</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCO3C2VJMF7:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO3C2VJMF7</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (192, N'No type was specified for the decimal column ''"Total"'' on entity type ''"BankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-25T21:52:39.613' AS DateTime), NULL, N'<properties><property key=''property''>Total</property><property key=''entityType''>BankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>46e3648a-dbe8-4203-8120-688b538a3be9</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCO3C2VJMF7:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO3C2VJMF7</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (193, N'No type was specified for the decimal column ''"RentalFeeForOwner"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-25T21:52:39.617' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForOwner</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>46e3648a-dbe8-4203-8120-688b538a3be9</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCO3C2VJMF7:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO3C2VJMF7</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (194, N'No type was specified for the decimal column ''"RentalFeeForTennat"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-25T21:52:39.617' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForTennat</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>46e3648a-dbe8-4203-8120-688b538a3be9</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCO3C2VJMF7:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO3C2VJMF7</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (195, N'No type was specified for the decimal column ''"Value"'' on entity type ''"HistoryBankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-25T21:52:39.617' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>HistoryBankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>46e3648a-dbe8-4203-8120-688b538a3be9</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCO3C2VJMF7:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO3C2VJMF7</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (196, N'No type was specified for the decimal column ''"Area"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-25T21:52:39.617' AS DateTime), NULL, N'<properties><property key=''property''>Area</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>46e3648a-dbe8-4203-8120-688b538a3be9</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCO3C2VJMF7:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO3C2VJMF7</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (197, N'No type was specified for the decimal column ''"FeeCompany"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-25T21:52:39.617' AS DateTime), NULL, N'<properties><property key=''property''>FeeCompany</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>46e3648a-dbe8-4203-8120-688b538a3be9</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCO3C2VJMF7:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO3C2VJMF7</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (198, N'No type was specified for the decimal column ''"FinalPrice"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-25T21:52:39.617' AS DateTime), NULL, N'<properties><property key=''property''>FinalPrice</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>46e3648a-dbe8-4203-8120-688b538a3be9</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCO3C2VJMF7:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO3C2VJMF7</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (199, N'No type was specified for the decimal column ''"Percentage"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-25T21:52:39.617' AS DateTime), NULL, N'<properties><property key=''property''>Percentage</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>46e3648a-dbe8-4203-8120-688b538a3be9</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCO3C2VJMF7:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO3C2VJMF7</property></properties>')
GO
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (200, N'No type was specified for the decimal column ''"PriceOwner"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-25T21:52:39.617' AS DateTime), NULL, N'<properties><property key=''property''>PriceOwner</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>46e3648a-dbe8-4203-8120-688b538a3be9</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCO3C2VJMF7:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO3C2VJMF7</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (201, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2021-10-25T22:49:01.370' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (202, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToPayContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-25T22:49:03.203' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToPayContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>53e0360d-6956-4e20-bd2a-5549e0fe4777</property><property key=''ActionName''>API.Controllers.BankAccountController.GetBankAccount (API)</property><property key=''RequestId''>0HMCO6E69NUU2:00000002</property><property key=''RequestPath''>/Banks/bankAccount</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO6E69NUU2</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (203, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToReceivableContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-25T22:49:03.207' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToReceivableContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>53e0360d-6956-4e20-bd2a-5549e0fe4777</property><property key=''ActionName''>API.Controllers.BankAccountController.GetBankAccount (API)</property><property key=''RequestId''>0HMCO6E69NUU2:00000002</property><property key=''RequestPath''>/Banks/bankAccount</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO6E69NUU2</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (204, N'No type was specified for the decimal column ''"Total"'' on entity type ''"BankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-25T22:49:03.207' AS DateTime), NULL, N'<properties><property key=''property''>Total</property><property key=''entityType''>BankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>53e0360d-6956-4e20-bd2a-5549e0fe4777</property><property key=''ActionName''>API.Controllers.BankAccountController.GetBankAccount (API)</property><property key=''RequestId''>0HMCO6E69NUU2:00000002</property><property key=''RequestPath''>/Banks/bankAccount</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO6E69NUU2</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (205, N'No type was specified for the decimal column ''"RentalFeeForOwner"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-25T22:49:03.207' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForOwner</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>53e0360d-6956-4e20-bd2a-5549e0fe4777</property><property key=''ActionName''>API.Controllers.BankAccountController.GetBankAccount (API)</property><property key=''RequestId''>0HMCO6E69NUU2:00000002</property><property key=''RequestPath''>/Banks/bankAccount</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO6E69NUU2</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (206, N'No type was specified for the decimal column ''"RentalFeeForTennat"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-25T22:49:03.207' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForTennat</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>53e0360d-6956-4e20-bd2a-5549e0fe4777</property><property key=''ActionName''>API.Controllers.BankAccountController.GetBankAccount (API)</property><property key=''RequestId''>0HMCO6E69NUU2:00000002</property><property key=''RequestPath''>/Banks/bankAccount</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO6E69NUU2</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (207, N'No type was specified for the decimal column ''"Value"'' on entity type ''"HistoryBankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-25T22:49:03.207' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>HistoryBankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>53e0360d-6956-4e20-bd2a-5549e0fe4777</property><property key=''ActionName''>API.Controllers.BankAccountController.GetBankAccount (API)</property><property key=''RequestId''>0HMCO6E69NUU2:00000002</property><property key=''RequestPath''>/Banks/bankAccount</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO6E69NUU2</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (208, N'No type was specified for the decimal column ''"Area"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-25T22:49:03.207' AS DateTime), NULL, N'<properties><property key=''property''>Area</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>53e0360d-6956-4e20-bd2a-5549e0fe4777</property><property key=''ActionName''>API.Controllers.BankAccountController.GetBankAccount (API)</property><property key=''RequestId''>0HMCO6E69NUU2:00000002</property><property key=''RequestPath''>/Banks/bankAccount</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO6E69NUU2</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (209, N'No type was specified for the decimal column ''"FeeCompany"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-25T22:49:03.207' AS DateTime), NULL, N'<properties><property key=''property''>FeeCompany</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>53e0360d-6956-4e20-bd2a-5549e0fe4777</property><property key=''ActionName''>API.Controllers.BankAccountController.GetBankAccount (API)</property><property key=''RequestId''>0HMCO6E69NUU2:00000002</property><property key=''RequestPath''>/Banks/bankAccount</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO6E69NUU2</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (210, N'No type was specified for the decimal column ''"FinalPrice"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-25T22:49:03.207' AS DateTime), NULL, N'<properties><property key=''property''>FinalPrice</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>53e0360d-6956-4e20-bd2a-5549e0fe4777</property><property key=''ActionName''>API.Controllers.BankAccountController.GetBankAccount (API)</property><property key=''RequestId''>0HMCO6E69NUU2:00000002</property><property key=''RequestPath''>/Banks/bankAccount</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO6E69NUU2</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (211, N'No type was specified for the decimal column ''"Percentage"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-25T22:49:03.207' AS DateTime), NULL, N'<properties><property key=''property''>Percentage</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>53e0360d-6956-4e20-bd2a-5549e0fe4777</property><property key=''ActionName''>API.Controllers.BankAccountController.GetBankAccount (API)</property><property key=''RequestId''>0HMCO6E69NUU2:00000002</property><property key=''RequestPath''>/Banks/bankAccount</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO6E69NUU2</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (212, N'No type was specified for the decimal column ''"PriceOwner"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-25T22:49:03.207' AS DateTime), NULL, N'<properties><property key=''property''>PriceOwner</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>53e0360d-6956-4e20-bd2a-5549e0fe4777</property><property key=''ActionName''>API.Controllers.BankAccountController.GetBankAccount (API)</property><property key=''RequestId''>0HMCO6E69NUU2:00000002</property><property key=''RequestPath''>/Banks/bankAccount</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO6E69NUU2</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (213, N'A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections. (provider: TCP Provider, error: 0 - Host desconocido.)', N'A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections. (provider: TCP Provider, error: 0 - Host desconocido.)', N'Error', CAST(N'2021-10-27T20:07:43.393' AS DateTime), N'System.Data.SqlClient.SqlException (0x80131904): A network-related or instance-specific error occurred while establishing a connection to SQL Server. The server was not found or was not accessible. Verify that the instance name is correct and that SQL Server is configured to allow remote connections. (provider: TCP Provider, error: 0 - Host desconocido.) ---> System.ComponentModel.Win32Exception (11001): Host desconocido
   at System.Data.ProviderBase.DbConnectionPool.CheckPoolBlockingPeriod(Exception e)
   at System.Data.ProviderBase.DbConnectionPool.CreateObject(DbConnection owningObject, DbConnectionOptions userOptions, DbConnectionInternal oldConnection)
   at System.Data.ProviderBase.DbConnectionPool.UserCreateRequest(DbConnection owningObject, DbConnectionOptions userOptions, DbConnectionInternal oldConnection)
   at System.Data.ProviderBase.DbConnectionPool.TryGetConnection(DbConnection owningObject, UInt32 waitForMultipleObjectsTimeout, Boolean allowCreate, Boolean onlyOneCheckConnection, DbConnectionOptions userOptions, DbConnectionInternal& connection)
   at System.Data.ProviderBase.DbConnectionPool.WaitForPendingOpen()
--- End of stack trace from previous location where exception was thrown ---
   at Dapper.SqlMapper.QueryAsync[T](IDbConnection cnn, Type effectiveType, CommandDefinition command) in C:\projects\dapper\Dapper\SqlMapper.Async.cs:line 419
   at CodeMono.DataAccess.DBConnection.DBConnectionMSSQL.QueryAsync[T](Dictionary`2 P, String SP) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\DataAccess\_CodeMono\Base\DBConnectionMSSQL.cs:line 51
   at DataAccess.BaseStoreProcedureModel.ExecStoreProcedure[T](Dictionary`2 parameters, String spName) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\DataAccess\BaseStoreProcedureModel.cs:line 29
   at Business.BaseService`1.ExecStoreProcedure[T](Dictionary`2 parameters, String spName) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\Business\BaseService.cs:line 110
   at API.Controllers.AccountsStatusController.GetAccountsStatus(Nullable`1 AccountsStatusId, String AccountsStatusName) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\API\Controllers\Banks\AccountsStatusController.cs:line 63
ClientConnectionId:00000000-0000-0000-0000-000000000000
Error Number:11001,State:0,Class:20', N'<properties><property key=''SourceContext''>API.Controllers.AccountsStatusController</property><property key=''ActionId''>42aef9bc-ce3a-44eb-8ca3-3330ba8e1bdb</property><property key=''ActionName''>API.Controllers.AccountsStatusController.GetAccountsStatus (API)</property><property key=''RequestId''>0HMCO6E69NUVR:00000002</property><property key=''RequestPath''>/Banks/accountsStatus</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO6E69NUVR</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (214, N'Could not find stored procedure ''Banks.PaymentTypes_LIST''.', N'Could not find stored procedure ''Banks.PaymentTypes_LIST''.', N'Error', CAST(N'2021-10-28T11:22:12.263' AS DateTime), N'System.Data.SqlClient.SqlException (0x80131904): Could not find stored procedure ''Banks.PaymentTypes_LIST''.
   at System.Data.SqlClient.SqlCommand.<>c.<ExecuteDbDataReaderAsync>b__126_0(Task`1 result)
   at System.Threading.Tasks.ContinuationResultTaskFromResultTask`2.InnerInvoke()
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
--- End of stack trace from previous location where exception was thrown ---
   at System.Threading.Tasks.Task.ExecuteWithThreadLocal(Task& currentTaskSlot)
--- End of stack trace from previous location where exception was thrown ---
   at Dapper.SqlMapper.QueryAsync[T](IDbConnection cnn, Type effectiveType, CommandDefinition command) in C:\projects\dapper\Dapper\SqlMapper.Async.cs:line 419
   at CodeMono.DataAccess.DBConnection.DBConnectionMSSQL.QueryAsync[T](Dictionary`2 P, String SP) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\DataAccess\_CodeMono\Base\DBConnectionMSSQL.cs:line 51
   at DataAccess.BaseStoreProcedureModel.ExecStoreProcedure[T](Dictionary`2 parameters, String spName) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\DataAccess\BaseStoreProcedureModel.cs:line 29
   at Business.BaseService`1.ExecStoreProcedure[T](Dictionary`2 parameters, String spName) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\Business\BaseService.cs:line 110
   at API.Controllers.PaymentTypeController.GetListPaymentType(Nullable`1 PaymentTypeId, String PaymentTypeName, Nullable`1 CompayId) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\API\Controllers\Banks\PaymentTypeController.cs:line 100
ClientConnectionId:9595ae38-fa70-4f05-8b65-40f8b6850f7f
Error Number:2812,State:62,Class:16', N'<properties><property key=''SourceContext''>API.Controllers.PaymentTypeController</property><property key=''ActionId''>2eeb1c94-783b-4a19-a35d-145f158e240a</property><property key=''ActionName''>API.Controllers.PaymentTypeController.GetListPaymentType (API)</property><property key=''RequestId''>0HMCO6E69NV0F:0000000C</property><property key=''RequestPath''>/Banks/paymentType/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO6E69NV0F</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (215, N'Could not find stored procedure ''Banks.PaymentTypes_LIST''.', N'Could not find stored procedure ''Banks.PaymentTypes_LIST''.', N'Error', CAST(N'2021-10-28T12:10:01.847' AS DateTime), N'System.Data.SqlClient.SqlException (0x80131904): Could not find stored procedure ''Banks.PaymentTypes_LIST''.
   at System.Data.SqlClient.SqlCommand.<>c.<ExecuteDbDataReaderAsync>b__126_0(Task`1 result)
   at System.Threading.Tasks.ContinuationResultTaskFromResultTask`2.InnerInvoke()
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
--- End of stack trace from previous location where exception was thrown ---
   at System.Threading.Tasks.Task.ExecuteWithThreadLocal(Task& currentTaskSlot)
--- End of stack trace from previous location where exception was thrown ---
   at Dapper.SqlMapper.QueryAsync[T](IDbConnection cnn, Type effectiveType, CommandDefinition command) in C:\projects\dapper\Dapper\SqlMapper.Async.cs:line 419
   at CodeMono.DataAccess.DBConnection.DBConnectionMSSQL.QueryAsync[T](Dictionary`2 P, String SP) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\DataAccess\_CodeMono\Base\DBConnectionMSSQL.cs:line 51
   at DataAccess.BaseStoreProcedureModel.ExecStoreProcedure[T](Dictionary`2 parameters, String spName) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\DataAccess\BaseStoreProcedureModel.cs:line 29
   at Business.BaseService`1.ExecStoreProcedure[T](Dictionary`2 parameters, String spName) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\Business\BaseService.cs:line 110
   at API.Controllers.PaymentTypeController.GetListPaymentType(Nullable`1 PaymentTypeId, String PaymentTypeName, Nullable`1 CompayId) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\API\Controllers\Banks\PaymentTypeController.cs:line 100
ClientConnectionId:32b370cf-3d24-4fab-b05a-67c887038a87
Error Number:2812,State:62,Class:16', N'<properties><property key=''SourceContext''>API.Controllers.PaymentTypeController</property><property key=''ActionId''>2eeb1c94-783b-4a19-a35d-145f158e240a</property><property key=''ActionName''>API.Controllers.PaymentTypeController.GetListPaymentType (API)</property><property key=''RequestId''>0HMCO6E69NV1H:00000010</property><property key=''RequestPath''>/Banks/paymentType/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO6E69NV1H</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (216, N'Could not find stored procedure ''Banks.PaymentTypes_LIST''.', N'Could not find stored procedure ''Banks.PaymentTypes_LIST''.', N'Error', CAST(N'2021-10-28T12:11:05.847' AS DateTime), N'System.Data.SqlClient.SqlException (0x80131904): Could not find stored procedure ''Banks.PaymentTypes_LIST''.
   at System.Data.SqlClient.SqlCommand.<>c.<ExecuteDbDataReaderAsync>b__126_0(Task`1 result)
   at System.Threading.Tasks.ContinuationResultTaskFromResultTask`2.InnerInvoke()
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
--- End of stack trace from previous location where exception was thrown ---
   at System.Threading.Tasks.Task.ExecuteWithThreadLocal(Task& currentTaskSlot)
--- End of stack trace from previous location where exception was thrown ---
   at Dapper.SqlMapper.QueryAsync[T](IDbConnection cnn, Type effectiveType, CommandDefinition command) in C:\projects\dapper\Dapper\SqlMapper.Async.cs:line 419
   at CodeMono.DataAccess.DBConnection.DBConnectionMSSQL.QueryAsync[T](Dictionary`2 P, String SP) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\DataAccess\_CodeMono\Base\DBConnectionMSSQL.cs:line 51
   at DataAccess.BaseStoreProcedureModel.ExecStoreProcedure[T](Dictionary`2 parameters, String spName) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\DataAccess\BaseStoreProcedureModel.cs:line 29
   at Business.BaseService`1.ExecStoreProcedure[T](Dictionary`2 parameters, String spName) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\Business\BaseService.cs:line 110
   at API.Controllers.PaymentTypeController.GetListPaymentType(Nullable`1 PaymentTypeId, String PaymentTypeName, Nullable`1 CompayId) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\API\Controllers\Banks\PaymentTypeController.cs:line 100
ClientConnectionId:09d30c4a-50ec-468d-8c21-40800af05000
Error Number:2812,State:62,Class:16', N'<properties><property key=''SourceContext''>API.Controllers.PaymentTypeController</property><property key=''ActionId''>2eeb1c94-783b-4a19-a35d-145f158e240a</property><property key=''ActionName''>API.Controllers.PaymentTypeController.GetListPaymentType (API)</property><property key=''RequestId''>0HMCO6E69NV1E:00000047</property><property key=''RequestPath''>/Banks/paymentType/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO6E69NV1E</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (217, N'Could not find stored procedure ''Banks.PaymentTypes_LIST''.', N'Could not find stored procedure ''Banks.PaymentTypes_LIST''.', N'Error', CAST(N'2021-10-28T12:11:17.537' AS DateTime), N'System.Data.SqlClient.SqlException (0x80131904): Could not find stored procedure ''Banks.PaymentTypes_LIST''.
   at System.Data.SqlClient.SqlCommand.<>c.<ExecuteDbDataReaderAsync>b__126_0(Task`1 result)
   at System.Threading.Tasks.ContinuationResultTaskFromResultTask`2.InnerInvoke()
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
--- End of stack trace from previous location where exception was thrown ---
   at System.Threading.Tasks.Task.ExecuteWithThreadLocal(Task& currentTaskSlot)
--- End of stack trace from previous location where exception was thrown ---
   at Dapper.SqlMapper.QueryAsync[T](IDbConnection cnn, Type effectiveType, CommandDefinition command) in C:\projects\dapper\Dapper\SqlMapper.Async.cs:line 419
   at CodeMono.DataAccess.DBConnection.DBConnectionMSSQL.QueryAsync[T](Dictionary`2 P, String SP) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\DataAccess\_CodeMono\Base\DBConnectionMSSQL.cs:line 51
   at DataAccess.BaseStoreProcedureModel.ExecStoreProcedure[T](Dictionary`2 parameters, String spName) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\DataAccess\BaseStoreProcedureModel.cs:line 29
   at Business.BaseService`1.ExecStoreProcedure[T](Dictionary`2 parameters, String spName) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\Business\BaseService.cs:line 110
   at API.Controllers.PaymentTypeController.GetListPaymentType(Nullable`1 PaymentTypeId, String PaymentTypeName, Nullable`1 CompayId) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\API\Controllers\Banks\PaymentTypeController.cs:line 100
ClientConnectionId:3941f121-1f44-47b5-92c1-f597709d22fe
Error Number:2812,State:62,Class:16', N'<properties><property key=''SourceContext''>API.Controllers.PaymentTypeController</property><property key=''ActionId''>2eeb1c94-783b-4a19-a35d-145f158e240a</property><property key=''ActionName''>API.Controllers.PaymentTypeController.GetListPaymentType (API)</property><property key=''RequestId''>0HMCO6E69NV1G:0000001B</property><property key=''RequestPath''>/Banks/paymentType/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO6E69NV1G</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (218, N'Could not find stored procedure ''Banks.PaymentTypes_LIST''.', N'Could not find stored procedure ''Banks.PaymentTypes_LIST''.', N'Error', CAST(N'2021-10-28T12:11:30.663' AS DateTime), N'System.Data.SqlClient.SqlException (0x80131904): Could not find stored procedure ''Banks.PaymentTypes_LIST''.
   at System.Data.SqlClient.SqlCommand.<>c.<ExecuteDbDataReaderAsync>b__126_0(Task`1 result)
   at System.Threading.Tasks.ContinuationResultTaskFromResultTask`2.InnerInvoke()
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
--- End of stack trace from previous location where exception was thrown ---
   at System.Threading.Tasks.Task.ExecuteWithThreadLocal(Task& currentTaskSlot)
--- End of stack trace from previous location where exception was thrown ---
   at Dapper.SqlMapper.QueryAsync[T](IDbConnection cnn, Type effectiveType, CommandDefinition command) in C:\projects\dapper\Dapper\SqlMapper.Async.cs:line 419
   at CodeMono.DataAccess.DBConnection.DBConnectionMSSQL.QueryAsync[T](Dictionary`2 P, String SP) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\DataAccess\_CodeMono\Base\DBConnectionMSSQL.cs:line 51
   at DataAccess.BaseStoreProcedureModel.ExecStoreProcedure[T](Dictionary`2 parameters, String spName) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\DataAccess\BaseStoreProcedureModel.cs:line 29
   at Business.BaseService`1.ExecStoreProcedure[T](Dictionary`2 parameters, String spName) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\Business\BaseService.cs:line 110
   at API.Controllers.PaymentTypeController.GetListPaymentType(Nullable`1 PaymentTypeId, String PaymentTypeName, Nullable`1 CompayId) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\API\Controllers\Banks\PaymentTypeController.cs:line 100
ClientConnectionId:32b370cf-3d24-4fab-b05a-67c887038a87
Error Number:2812,State:62,Class:16', N'<properties><property key=''SourceContext''>API.Controllers.PaymentTypeController</property><property key=''ActionId''>2eeb1c94-783b-4a19-a35d-145f158e240a</property><property key=''ActionName''>API.Controllers.PaymentTypeController.GetListPaymentType (API)</property><property key=''RequestId''>0HMCO6E69NV1E:0000004C</property><property key=''RequestPath''>/Banks/paymentType/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO6E69NV1E</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (219, N'Could not find stored procedure ''Banks.PaymentTypes_LIST''.', N'Could not find stored procedure ''Banks.PaymentTypes_LIST''.', N'Error', CAST(N'2021-10-28T12:11:58.137' AS DateTime), N'System.Data.SqlClient.SqlException (0x80131904): Could not find stored procedure ''Banks.PaymentTypes_LIST''.
   at System.Data.SqlClient.SqlCommand.<>c.<ExecuteDbDataReaderAsync>b__126_0(Task`1 result)
   at System.Threading.Tasks.ContinuationResultTaskFromResultTask`2.InnerInvoke()
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
--- End of stack trace from previous location where exception was thrown ---
   at System.Threading.Tasks.Task.ExecuteWithThreadLocal(Task& currentTaskSlot)
--- End of stack trace from previous location where exception was thrown ---
   at Dapper.SqlMapper.QueryAsync[T](IDbConnection cnn, Type effectiveType, CommandDefinition command) in C:\projects\dapper\Dapper\SqlMapper.Async.cs:line 419
   at CodeMono.DataAccess.DBConnection.DBConnectionMSSQL.QueryAsync[T](Dictionary`2 P, String SP) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\DataAccess\_CodeMono\Base\DBConnectionMSSQL.cs:line 51
   at DataAccess.BaseStoreProcedureModel.ExecStoreProcedure[T](Dictionary`2 parameters, String spName) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\DataAccess\BaseStoreProcedureModel.cs:line 29
   at Business.BaseService`1.ExecStoreProcedure[T](Dictionary`2 parameters, String spName) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\Business\BaseService.cs:line 110
   at API.Controllers.PaymentTypeController.GetListPaymentType(Nullable`1 PaymentTypeId, String PaymentTypeName, Nullable`1 CompayId) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\API\Controllers\Banks\PaymentTypeController.cs:line 100
ClientConnectionId:32b370cf-3d24-4fab-b05a-67c887038a87
Error Number:2812,State:62,Class:16', N'<properties><property key=''SourceContext''>API.Controllers.PaymentTypeController</property><property key=''ActionId''>2eeb1c94-783b-4a19-a35d-145f158e240a</property><property key=''ActionName''>API.Controllers.PaymentTypeController.GetListPaymentType (API)</property><property key=''RequestId''>0HMCO6E69NV1J:00000021</property><property key=''RequestPath''>/Banks/paymentType/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO6E69NV1J</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (220, N'Could not find stored procedure ''Banks.PaymentTypes_LIST''.', N'Could not find stored procedure ''Banks.PaymentTypes_LIST''.', N'Error', CAST(N'2021-10-28T12:12:16.890' AS DateTime), N'System.Data.SqlClient.SqlException (0x80131904): Could not find stored procedure ''Banks.PaymentTypes_LIST''.
   at System.Data.SqlClient.SqlCommand.<>c.<ExecuteDbDataReaderAsync>b__126_0(Task`1 result)
   at System.Threading.Tasks.ContinuationResultTaskFromResultTask`2.InnerInvoke()
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
--- End of stack trace from previous location where exception was thrown ---
   at System.Threading.Tasks.Task.ExecuteWithThreadLocal(Task& currentTaskSlot)
--- End of stack trace from previous location where exception was thrown ---
   at Dapper.SqlMapper.QueryAsync[T](IDbConnection cnn, Type effectiveType, CommandDefinition command) in C:\projects\dapper\Dapper\SqlMapper.Async.cs:line 419
   at CodeMono.DataAccess.DBConnection.DBConnectionMSSQL.QueryAsync[T](Dictionary`2 P, String SP) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\DataAccess\_CodeMono\Base\DBConnectionMSSQL.cs:line 51
   at DataAccess.BaseStoreProcedureModel.ExecStoreProcedure[T](Dictionary`2 parameters, String spName) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\DataAccess\BaseStoreProcedureModel.cs:line 29
   at Business.BaseService`1.ExecStoreProcedure[T](Dictionary`2 parameters, String spName) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\Business\BaseService.cs:line 110
   at API.Controllers.PaymentTypeController.GetListPaymentType(Nullable`1 PaymentTypeId, String PaymentTypeName, Nullable`1 CompayId) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\API\Controllers\Banks\PaymentTypeController.cs:line 100
ClientConnectionId:09d30c4a-50ec-468d-8c21-40800af05000
Error Number:2812,State:62,Class:16', N'<properties><property key=''SourceContext''>API.Controllers.PaymentTypeController</property><property key=''ActionId''>2eeb1c94-783b-4a19-a35d-145f158e240a</property><property key=''ActionName''>API.Controllers.PaymentTypeController.GetListPaymentType (API)</property><property key=''RequestId''>0HMCO6E69NV1J:00000023</property><property key=''RequestPath''>/Banks/paymentType/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO6E69NV1J</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (221, N'Could not find stored procedure ''Banks.PaymentTypes_LIST''.', N'Could not find stored procedure ''Banks.PaymentTypes_LIST''.', N'Error', CAST(N'2021-10-28T12:12:41.550' AS DateTime), N'System.Data.SqlClient.SqlException (0x80131904): Could not find stored procedure ''Banks.PaymentTypes_LIST''.
   at System.Data.SqlClient.SqlCommand.<>c.<ExecuteDbDataReaderAsync>b__126_0(Task`1 result)
   at System.Threading.Tasks.ContinuationResultTaskFromResultTask`2.InnerInvoke()
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
--- End of stack trace from previous location where exception was thrown ---
   at System.Threading.Tasks.Task.ExecuteWithThreadLocal(Task& currentTaskSlot)
--- End of stack trace from previous location where exception was thrown ---
   at Dapper.SqlMapper.QueryAsync[T](IDbConnection cnn, Type effectiveType, CommandDefinition command) in C:\projects\dapper\Dapper\SqlMapper.Async.cs:line 419
   at CodeMono.DataAccess.DBConnection.DBConnectionMSSQL.QueryAsync[T](Dictionary`2 P, String SP) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\DataAccess\_CodeMono\Base\DBConnectionMSSQL.cs:line 51
   at DataAccess.BaseStoreProcedureModel.ExecStoreProcedure[T](Dictionary`2 parameters, String spName) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\DataAccess\BaseStoreProcedureModel.cs:line 29
   at Business.BaseService`1.ExecStoreProcedure[T](Dictionary`2 parameters, String spName) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\Business\BaseService.cs:line 110
   at API.Controllers.PaymentTypeController.GetListPaymentType(Nullable`1 PaymentTypeId, String PaymentTypeName, Nullable`1 CompayId) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\API\Controllers\Banks\PaymentTypeController.cs:line 100
ClientConnectionId:651cd1dc-a3e6-4521-8739-7a74460ba528
Error Number:2812,State:62,Class:16', N'<properties><property key=''SourceContext''>API.Controllers.PaymentTypeController</property><property key=''ActionId''>2eeb1c94-783b-4a19-a35d-145f158e240a</property><property key=''ActionName''>API.Controllers.PaymentTypeController.GetListPaymentType (API)</property><property key=''RequestId''>0HMCO6E69NV1G:00000022</property><property key=''RequestPath''>/Banks/paymentType/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO6E69NV1G</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (222, N'Could not find stored procedure ''Banks.PaymentTypes_LIST''.', N'Could not find stored procedure ''Banks.PaymentTypes_LIST''.', N'Error', CAST(N'2021-10-28T12:13:07.513' AS DateTime), N'System.Data.SqlClient.SqlException (0x80131904): Could not find stored procedure ''Banks.PaymentTypes_LIST''.
   at System.Data.SqlClient.SqlCommand.<>c.<ExecuteDbDataReaderAsync>b__126_0(Task`1 result)
   at System.Threading.Tasks.ContinuationResultTaskFromResultTask`2.InnerInvoke()
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
--- End of stack trace from previous location where exception was thrown ---
   at System.Threading.Tasks.Task.ExecuteWithThreadLocal(Task& currentTaskSlot)
--- End of stack trace from previous location where exception was thrown ---
   at Dapper.SqlMapper.QueryAsync[T](IDbConnection cnn, Type effectiveType, CommandDefinition command) in C:\projects\dapper\Dapper\SqlMapper.Async.cs:line 419
   at CodeMono.DataAccess.DBConnection.DBConnectionMSSQL.QueryAsync[T](Dictionary`2 P, String SP) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\DataAccess\_CodeMono\Base\DBConnectionMSSQL.cs:line 51
   at DataAccess.BaseStoreProcedureModel.ExecStoreProcedure[T](Dictionary`2 parameters, String spName) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\DataAccess\BaseStoreProcedureModel.cs:line 29
   at Business.BaseService`1.ExecStoreProcedure[T](Dictionary`2 parameters, String spName) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\Business\BaseService.cs:line 110
   at API.Controllers.PaymentTypeController.GetListPaymentType(Nullable`1 PaymentTypeId, String PaymentTypeName, Nullable`1 CompayId) in C:\Users\Admin\Desktop\InnmoApp\Inmoapp\Inmoapp_API\API\Controllers\Banks\PaymentTypeController.cs:line 100
ClientConnectionId:1d05f67d-83d0-4899-b895-246817794a0b
Error Number:2812,State:62,Class:16', N'<properties><property key=''SourceContext''>API.Controllers.PaymentTypeController</property><property key=''ActionId''>2eeb1c94-783b-4a19-a35d-145f158e240a</property><property key=''ActionName''>API.Controllers.PaymentTypeController.GetListPaymentType (API)</property><property key=''RequestId''>0HMCO6E69NV1E:00000055</property><property key=''RequestPath''>/Banks/paymentType/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCO6E69NV1E</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (223, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2021-10-28T16:35:12.307' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (224, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToPayContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-28T16:39:12.043' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToPayContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>058e9ba8-b380-498b-988e-b22ecd31db23</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCQBBD5BLJM:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCQBBD5BLJM</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (225, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToReceivableContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-28T16:39:12.053' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToReceivableContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>058e9ba8-b380-498b-988e-b22ecd31db23</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCQBBD5BLJM:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCQBBD5BLJM</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (226, N'No type was specified for the decimal column ''"Total"'' on entity type ''"BankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-28T16:39:12.053' AS DateTime), NULL, N'<properties><property key=''property''>Total</property><property key=''entityType''>BankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>058e9ba8-b380-498b-988e-b22ecd31db23</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCQBBD5BLJM:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCQBBD5BLJM</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (227, N'No type was specified for the decimal column ''"RentalFeeForOwner"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-28T16:39:12.053' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForOwner</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>058e9ba8-b380-498b-988e-b22ecd31db23</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCQBBD5BLJM:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCQBBD5BLJM</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (228, N'No type was specified for the decimal column ''"RentalFeeForTennat"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-28T16:39:12.053' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForTennat</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>058e9ba8-b380-498b-988e-b22ecd31db23</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCQBBD5BLJM:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCQBBD5BLJM</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (229, N'No type was specified for the decimal column ''"Value"'' on entity type ''"HistoryBankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-28T16:39:12.053' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>HistoryBankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>058e9ba8-b380-498b-988e-b22ecd31db23</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCQBBD5BLJM:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCQBBD5BLJM</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (230, N'No type was specified for the decimal column ''"Area"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-28T16:39:12.053' AS DateTime), NULL, N'<properties><property key=''property''>Area</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>058e9ba8-b380-498b-988e-b22ecd31db23</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCQBBD5BLJM:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCQBBD5BLJM</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (231, N'No type was specified for the decimal column ''"FeeCompany"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-28T16:39:12.053' AS DateTime), NULL, N'<properties><property key=''property''>FeeCompany</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>058e9ba8-b380-498b-988e-b22ecd31db23</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCQBBD5BLJM:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCQBBD5BLJM</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (232, N'No type was specified for the decimal column ''"FinalPrice"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-28T16:39:12.053' AS DateTime), NULL, N'<properties><property key=''property''>FinalPrice</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>058e9ba8-b380-498b-988e-b22ecd31db23</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCQBBD5BLJM:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCQBBD5BLJM</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (233, N'No type was specified for the decimal column ''"Percentage"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-28T16:39:12.053' AS DateTime), NULL, N'<properties><property key=''property''>Percentage</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>058e9ba8-b380-498b-988e-b22ecd31db23</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCQBBD5BLJM:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCQBBD5BLJM</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (234, N'No type was specified for the decimal column ''"PriceOwner"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-28T16:39:12.053' AS DateTime), NULL, N'<properties><property key=''property''>PriceOwner</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>058e9ba8-b380-498b-988e-b22ecd31db23</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMCQBBD5BLJM:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCQBBD5BLJM</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (235, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2021-10-29T14:17:08.793' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (236, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToPayContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-29T14:17:21.923' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToPayContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>be96640d-36b4-4175-966a-0fb55f255483</property><property key=''ActionName''>API.Controllers.CompanyController.GetListCompany (API)</property><property key=''RequestId''>0HMCR22QFJA77:00000002</property><property key=''RequestPath''>/Companies/company/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCR22QFJA77</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (237, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToReceivableContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-29T14:17:21.933' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToReceivableContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>be96640d-36b4-4175-966a-0fb55f255483</property><property key=''ActionName''>API.Controllers.CompanyController.GetListCompany (API)</property><property key=''RequestId''>0HMCR22QFJA77:00000002</property><property key=''RequestPath''>/Companies/company/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCR22QFJA77</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (238, N'No type was specified for the decimal column ''"Total"'' on entity type ''"BankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-29T14:17:21.933' AS DateTime), NULL, N'<properties><property key=''property''>Total</property><property key=''entityType''>BankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>be96640d-36b4-4175-966a-0fb55f255483</property><property key=''ActionName''>API.Controllers.CompanyController.GetListCompany (API)</property><property key=''RequestId''>0HMCR22QFJA77:00000002</property><property key=''RequestPath''>/Companies/company/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCR22QFJA77</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (239, N'No type was specified for the decimal column ''"RentalFeeForOwner"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-29T14:17:21.933' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForOwner</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>be96640d-36b4-4175-966a-0fb55f255483</property><property key=''ActionName''>API.Controllers.CompanyController.GetListCompany (API)</property><property key=''RequestId''>0HMCR22QFJA77:00000002</property><property key=''RequestPath''>/Companies/company/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCR22QFJA77</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (240, N'No type was specified for the decimal column ''"RentalFeeForTennat"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-29T14:17:21.933' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForTennat</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>be96640d-36b4-4175-966a-0fb55f255483</property><property key=''ActionName''>API.Controllers.CompanyController.GetListCompany (API)</property><property key=''RequestId''>0HMCR22QFJA77:00000002</property><property key=''RequestPath''>/Companies/company/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCR22QFJA77</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (241, N'No type was specified for the decimal column ''"Value"'' on entity type ''"HistoryBankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-29T14:17:21.933' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>HistoryBankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>be96640d-36b4-4175-966a-0fb55f255483</property><property key=''ActionName''>API.Controllers.CompanyController.GetListCompany (API)</property><property key=''RequestId''>0HMCR22QFJA77:00000002</property><property key=''RequestPath''>/Companies/company/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCR22QFJA77</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (242, N'No type was specified for the decimal column ''"Area"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-29T14:17:21.933' AS DateTime), NULL, N'<properties><property key=''property''>Area</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>be96640d-36b4-4175-966a-0fb55f255483</property><property key=''ActionName''>API.Controllers.CompanyController.GetListCompany (API)</property><property key=''RequestId''>0HMCR22QFJA77:00000002</property><property key=''RequestPath''>/Companies/company/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCR22QFJA77</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (243, N'No type was specified for the decimal column ''"FeeCompany"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-29T14:17:21.933' AS DateTime), NULL, N'<properties><property key=''property''>FeeCompany</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>be96640d-36b4-4175-966a-0fb55f255483</property><property key=''ActionName''>API.Controllers.CompanyController.GetListCompany (API)</property><property key=''RequestId''>0HMCR22QFJA77:00000002</property><property key=''RequestPath''>/Companies/company/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCR22QFJA77</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (244, N'No type was specified for the decimal column ''"FinalPrice"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-29T14:17:21.933' AS DateTime), NULL, N'<properties><property key=''property''>FinalPrice</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>be96640d-36b4-4175-966a-0fb55f255483</property><property key=''ActionName''>API.Controllers.CompanyController.GetListCompany (API)</property><property key=''RequestId''>0HMCR22QFJA77:00000002</property><property key=''RequestPath''>/Companies/company/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCR22QFJA77</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (245, N'No type was specified for the decimal column ''"Percentage"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-29T14:17:21.933' AS DateTime), NULL, N'<properties><property key=''property''>Percentage</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>be96640d-36b4-4175-966a-0fb55f255483</property><property key=''ActionName''>API.Controllers.CompanyController.GetListCompany (API)</property><property key=''RequestId''>0HMCR22QFJA77:00000002</property><property key=''RequestPath''>/Companies/company/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCR22QFJA77</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (246, N'No type was specified for the decimal column ''"PriceOwner"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-29T14:17:21.933' AS DateTime), NULL, N'<properties><property key=''property''>PriceOwner</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>be96640d-36b4-4175-966a-0fb55f255483</property><property key=''ActionName''>API.Controllers.CompanyController.GetListCompany (API)</property><property key=''RequestId''>0HMCR22QFJA77:00000002</property><property key=''RequestPath''>/Companies/company/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCR22QFJA77</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (247, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2021-10-29T14:23:52.993' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (248, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToPayContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-29T14:23:54.617' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToPayContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>293cc100-4551-486a-bb30-91ee0fa9b3ce</property><property key=''ActionName''>API.Controllers.CompanyController.GetListCompany (API)</property><property key=''RequestId''>0HMCR26IHO39I:00000002</property><property key=''RequestPath''>/Companies/company/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCR26IHO39I</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (249, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToReceivableContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-29T14:23:54.623' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToReceivableContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>293cc100-4551-486a-bb30-91ee0fa9b3ce</property><property key=''ActionName''>API.Controllers.CompanyController.GetListCompany (API)</property><property key=''RequestId''>0HMCR26IHO39I:00000002</property><property key=''RequestPath''>/Companies/company/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCR26IHO39I</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (250, N'No type was specified for the decimal column ''"Total"'' on entity type ''"BankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-29T14:23:54.623' AS DateTime), NULL, N'<properties><property key=''property''>Total</property><property key=''entityType''>BankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>293cc100-4551-486a-bb30-91ee0fa9b3ce</property><property key=''ActionName''>API.Controllers.CompanyController.GetListCompany (API)</property><property key=''RequestId''>0HMCR26IHO39I:00000002</property><property key=''RequestPath''>/Companies/company/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCR26IHO39I</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (251, N'No type was specified for the decimal column ''"RentalFeeForOwner"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-29T14:23:54.623' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForOwner</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>293cc100-4551-486a-bb30-91ee0fa9b3ce</property><property key=''ActionName''>API.Controllers.CompanyController.GetListCompany (API)</property><property key=''RequestId''>0HMCR26IHO39I:00000002</property><property key=''RequestPath''>/Companies/company/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCR26IHO39I</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (252, N'No type was specified for the decimal column ''"RentalFeeForTennat"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-29T14:23:54.623' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForTennat</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>293cc100-4551-486a-bb30-91ee0fa9b3ce</property><property key=''ActionName''>API.Controllers.CompanyController.GetListCompany (API)</property><property key=''RequestId''>0HMCR26IHO39I:00000002</property><property key=''RequestPath''>/Companies/company/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCR26IHO39I</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (253, N'No type was specified for the decimal column ''"Value"'' on entity type ''"HistoryBankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-29T14:23:54.623' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>HistoryBankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>293cc100-4551-486a-bb30-91ee0fa9b3ce</property><property key=''ActionName''>API.Controllers.CompanyController.GetListCompany (API)</property><property key=''RequestId''>0HMCR26IHO39I:00000002</property><property key=''RequestPath''>/Companies/company/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCR26IHO39I</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (254, N'No type was specified for the decimal column ''"Area"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-29T14:23:54.623' AS DateTime), NULL, N'<properties><property key=''property''>Area</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>293cc100-4551-486a-bb30-91ee0fa9b3ce</property><property key=''ActionName''>API.Controllers.CompanyController.GetListCompany (API)</property><property key=''RequestId''>0HMCR26IHO39I:00000002</property><property key=''RequestPath''>/Companies/company/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCR26IHO39I</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (255, N'No type was specified for the decimal column ''"FeeCompany"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-29T14:23:54.623' AS DateTime), NULL, N'<properties><property key=''property''>FeeCompany</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>293cc100-4551-486a-bb30-91ee0fa9b3ce</property><property key=''ActionName''>API.Controllers.CompanyController.GetListCompany (API)</property><property key=''RequestId''>0HMCR26IHO39I:00000002</property><property key=''RequestPath''>/Companies/company/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCR26IHO39I</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (256, N'No type was specified for the decimal column ''"FinalPrice"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-29T14:23:54.623' AS DateTime), NULL, N'<properties><property key=''property''>FinalPrice</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>293cc100-4551-486a-bb30-91ee0fa9b3ce</property><property key=''ActionName''>API.Controllers.CompanyController.GetListCompany (API)</property><property key=''RequestId''>0HMCR26IHO39I:00000002</property><property key=''RequestPath''>/Companies/company/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCR26IHO39I</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (257, N'No type was specified for the decimal column ''"Percentage"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-29T14:23:54.623' AS DateTime), NULL, N'<properties><property key=''property''>Percentage</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>293cc100-4551-486a-bb30-91ee0fa9b3ce</property><property key=''ActionName''>API.Controllers.CompanyController.GetListCompany (API)</property><property key=''RequestId''>0HMCR26IHO39I:00000002</property><property key=''RequestPath''>/Companies/company/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCR26IHO39I</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (258, N'No type was specified for the decimal column ''"PriceOwner"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-10-29T14:23:54.623' AS DateTime), NULL, N'<properties><property key=''property''>PriceOwner</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>293cc100-4551-486a-bb30-91ee0fa9b3ce</property><property key=''ActionName''>API.Controllers.CompanyController.GetListCompany (API)</property><property key=''RequestId''>0HMCR26IHO39I:00000002</property><property key=''RequestPath''>/Companies/company/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMCR26IHO39I</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (259, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2021-12-17T20:05:47.633' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (260, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToPayContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T20:20:59.210' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToPayContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>0ad9f5e3-956b-4ea1-84ca-087c834d2a44</property><property key=''ActionName''>API.Controllers.AuthenticationController.Register (API)</property><property key=''RequestId''>0HME1OA40T5B0:00000002</property><property key=''RequestPath''>/authentication/Register</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1OA40T5B0</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (261, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToReceivableContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T20:20:59.217' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToReceivableContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>0ad9f5e3-956b-4ea1-84ca-087c834d2a44</property><property key=''ActionName''>API.Controllers.AuthenticationController.Register (API)</property><property key=''RequestId''>0HME1OA40T5B0:00000002</property><property key=''RequestPath''>/authentication/Register</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1OA40T5B0</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (262, N'No type was specified for the decimal column ''"Total"'' on entity type ''"BankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T20:20:59.217' AS DateTime), NULL, N'<properties><property key=''property''>Total</property><property key=''entityType''>BankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>0ad9f5e3-956b-4ea1-84ca-087c834d2a44</property><property key=''ActionName''>API.Controllers.AuthenticationController.Register (API)</property><property key=''RequestId''>0HME1OA40T5B0:00000002</property><property key=''RequestPath''>/authentication/Register</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1OA40T5B0</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (263, N'No type was specified for the decimal column ''"RentalFeeForOwner"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T20:20:59.217' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForOwner</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>0ad9f5e3-956b-4ea1-84ca-087c834d2a44</property><property key=''ActionName''>API.Controllers.AuthenticationController.Register (API)</property><property key=''RequestId''>0HME1OA40T5B0:00000002</property><property key=''RequestPath''>/authentication/Register</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1OA40T5B0</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (264, N'No type was specified for the decimal column ''"RentalFeeForTennat"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T20:20:59.217' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForTennat</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>0ad9f5e3-956b-4ea1-84ca-087c834d2a44</property><property key=''ActionName''>API.Controllers.AuthenticationController.Register (API)</property><property key=''RequestId''>0HME1OA40T5B0:00000002</property><property key=''RequestPath''>/authentication/Register</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1OA40T5B0</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (265, N'No type was specified for the decimal column ''"Value"'' on entity type ''"HistoryBankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T20:20:59.217' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>HistoryBankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>0ad9f5e3-956b-4ea1-84ca-087c834d2a44</property><property key=''ActionName''>API.Controllers.AuthenticationController.Register (API)</property><property key=''RequestId''>0HME1OA40T5B0:00000002</property><property key=''RequestPath''>/authentication/Register</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1OA40T5B0</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (266, N'No type was specified for the decimal column ''"Area"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T20:20:59.217' AS DateTime), NULL, N'<properties><property key=''property''>Area</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>0ad9f5e3-956b-4ea1-84ca-087c834d2a44</property><property key=''ActionName''>API.Controllers.AuthenticationController.Register (API)</property><property key=''RequestId''>0HME1OA40T5B0:00000002</property><property key=''RequestPath''>/authentication/Register</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1OA40T5B0</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (267, N'No type was specified for the decimal column ''"FeeCompany"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T20:20:59.217' AS DateTime), NULL, N'<properties><property key=''property''>FeeCompany</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>0ad9f5e3-956b-4ea1-84ca-087c834d2a44</property><property key=''ActionName''>API.Controllers.AuthenticationController.Register (API)</property><property key=''RequestId''>0HME1OA40T5B0:00000002</property><property key=''RequestPath''>/authentication/Register</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1OA40T5B0</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (268, N'No type was specified for the decimal column ''"FinalPrice"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T20:20:59.217' AS DateTime), NULL, N'<properties><property key=''property''>FinalPrice</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>0ad9f5e3-956b-4ea1-84ca-087c834d2a44</property><property key=''ActionName''>API.Controllers.AuthenticationController.Register (API)</property><property key=''RequestId''>0HME1OA40T5B0:00000002</property><property key=''RequestPath''>/authentication/Register</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1OA40T5B0</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (269, N'No type was specified for the decimal column ''"Percentage"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T20:20:59.217' AS DateTime), NULL, N'<properties><property key=''property''>Percentage</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>0ad9f5e3-956b-4ea1-84ca-087c834d2a44</property><property key=''ActionName''>API.Controllers.AuthenticationController.Register (API)</property><property key=''RequestId''>0HME1OA40T5B0:00000002</property><property key=''RequestPath''>/authentication/Register</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1OA40T5B0</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (270, N'No type was specified for the decimal column ''"PriceOwner"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T20:20:59.217' AS DateTime), NULL, N'<properties><property key=''property''>PriceOwner</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>0ad9f5e3-956b-4ea1-84ca-087c834d2a44</property><property key=''ActionName''>API.Controllers.AuthenticationController.Register (API)</property><property key=''RequestId''>0HME1OA40T5B0:00000002</property><property key=''RequestPath''>/authentication/Register</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1OA40T5B0</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (271, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2021-12-17T21:00:44.483' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (272, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToPayContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:00:45.613' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToPayContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>6387aee7-ebfa-4f3d-a284-d47a5359f30b</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HME1P8Q0F666:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1P8Q0F666</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (273, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToReceivableContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:00:45.617' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToReceivableContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>6387aee7-ebfa-4f3d-a284-d47a5359f30b</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HME1P8Q0F666:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1P8Q0F666</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (274, N'No type was specified for the decimal column ''"Total"'' on entity type ''"BankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:00:45.620' AS DateTime), NULL, N'<properties><property key=''property''>Total</property><property key=''entityType''>BankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>6387aee7-ebfa-4f3d-a284-d47a5359f30b</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HME1P8Q0F666:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1P8Q0F666</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (275, N'No type was specified for the decimal column ''"RentalFeeForOwner"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:00:45.620' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForOwner</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>6387aee7-ebfa-4f3d-a284-d47a5359f30b</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HME1P8Q0F666:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1P8Q0F666</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (276, N'No type was specified for the decimal column ''"RentalFeeForTennat"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:00:45.620' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForTennat</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>6387aee7-ebfa-4f3d-a284-d47a5359f30b</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HME1P8Q0F666:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1P8Q0F666</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (277, N'No type was specified for the decimal column ''"Value"'' on entity type ''"HistoryBankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:00:45.620' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>HistoryBankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>6387aee7-ebfa-4f3d-a284-d47a5359f30b</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HME1P8Q0F666:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1P8Q0F666</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (278, N'No type was specified for the decimal column ''"Area"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:00:45.620' AS DateTime), NULL, N'<properties><property key=''property''>Area</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>6387aee7-ebfa-4f3d-a284-d47a5359f30b</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HME1P8Q0F666:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1P8Q0F666</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (279, N'No type was specified for the decimal column ''"FeeCompany"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:00:45.620' AS DateTime), NULL, N'<properties><property key=''property''>FeeCompany</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>6387aee7-ebfa-4f3d-a284-d47a5359f30b</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HME1P8Q0F666:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1P8Q0F666</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (280, N'No type was specified for the decimal column ''"FinalPrice"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:00:45.620' AS DateTime), NULL, N'<properties><property key=''property''>FinalPrice</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>6387aee7-ebfa-4f3d-a284-d47a5359f30b</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HME1P8Q0F666:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1P8Q0F666</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (281, N'No type was specified for the decimal column ''"Percentage"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:00:45.620' AS DateTime), NULL, N'<properties><property key=''property''>Percentage</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>6387aee7-ebfa-4f3d-a284-d47a5359f30b</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HME1P8Q0F666:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1P8Q0F666</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (282, N'No type was specified for the decimal column ''"PriceOwner"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:00:45.620' AS DateTime), NULL, N'<properties><property key=''property''>PriceOwner</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>6387aee7-ebfa-4f3d-a284-d47a5359f30b</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HME1P8Q0F666:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1P8Q0F666</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (283, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2021-12-17T21:01:06.703' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (284, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToPayContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:01:33.867' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToPayContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>21aec339-fe7c-434d-9dc3-762c161e7c6c</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HME1P90T0BGA:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1P90T0BGA</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (285, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToReceivableContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:01:33.870' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToReceivableContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>21aec339-fe7c-434d-9dc3-762c161e7c6c</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HME1P90T0BGA:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1P90T0BGA</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (286, N'No type was specified for the decimal column ''"Total"'' on entity type ''"BankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:01:33.870' AS DateTime), NULL, N'<properties><property key=''property''>Total</property><property key=''entityType''>BankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>21aec339-fe7c-434d-9dc3-762c161e7c6c</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HME1P90T0BGA:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1P90T0BGA</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (287, N'No type was specified for the decimal column ''"RentalFeeForOwner"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:01:33.870' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForOwner</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>21aec339-fe7c-434d-9dc3-762c161e7c6c</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HME1P90T0BGA:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1P90T0BGA</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (288, N'No type was specified for the decimal column ''"RentalFeeForTennat"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:01:33.870' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForTennat</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>21aec339-fe7c-434d-9dc3-762c161e7c6c</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HME1P90T0BGA:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1P90T0BGA</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (289, N'No type was specified for the decimal column ''"Value"'' on entity type ''"HistoryBankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:01:33.870' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>HistoryBankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>21aec339-fe7c-434d-9dc3-762c161e7c6c</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HME1P90T0BGA:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1P90T0BGA</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (290, N'No type was specified for the decimal column ''"Area"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:01:33.870' AS DateTime), NULL, N'<properties><property key=''property''>Area</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>21aec339-fe7c-434d-9dc3-762c161e7c6c</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HME1P90T0BGA:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1P90T0BGA</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (291, N'No type was specified for the decimal column ''"FeeCompany"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:01:33.870' AS DateTime), NULL, N'<properties><property key=''property''>FeeCompany</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>21aec339-fe7c-434d-9dc3-762c161e7c6c</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HME1P90T0BGA:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1P90T0BGA</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (292, N'No type was specified for the decimal column ''"FinalPrice"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:01:33.870' AS DateTime), NULL, N'<properties><property key=''property''>FinalPrice</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>21aec339-fe7c-434d-9dc3-762c161e7c6c</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HME1P90T0BGA:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1P90T0BGA</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (293, N'No type was specified for the decimal column ''"Percentage"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:01:33.870' AS DateTime), NULL, N'<properties><property key=''property''>Percentage</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>21aec339-fe7c-434d-9dc3-762c161e7c6c</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HME1P90T0BGA:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1P90T0BGA</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (294, N'No type was specified for the decimal column ''"PriceOwner"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:01:33.870' AS DateTime), NULL, N'<properties><property key=''property''>PriceOwner</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>21aec339-fe7c-434d-9dc3-762c161e7c6c</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HME1P90T0BGA:00000003</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1P90T0BGA</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (295, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2021-12-17T21:26:18.373' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (296, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToPayContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:27:28.297' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToPayContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>93b1bcb1-734d-45e8-97f1-d26fa69ea5d1</property><property key=''ActionName''>API.Controllers.AuthenticationController.Register (API)</property><property key=''RequestId''>0HME1PN3C4GJ1:00000002</property><property key=''RequestPath''>/authentication/Register</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1PN3C4GJ1</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (297, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToReceivableContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:27:28.307' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToReceivableContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>93b1bcb1-734d-45e8-97f1-d26fa69ea5d1</property><property key=''ActionName''>API.Controllers.AuthenticationController.Register (API)</property><property key=''RequestId''>0HME1PN3C4GJ1:00000002</property><property key=''RequestPath''>/authentication/Register</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1PN3C4GJ1</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (298, N'No type was specified for the decimal column ''"Total"'' on entity type ''"BankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:27:28.307' AS DateTime), NULL, N'<properties><property key=''property''>Total</property><property key=''entityType''>BankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>93b1bcb1-734d-45e8-97f1-d26fa69ea5d1</property><property key=''ActionName''>API.Controllers.AuthenticationController.Register (API)</property><property key=''RequestId''>0HME1PN3C4GJ1:00000002</property><property key=''RequestPath''>/authentication/Register</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1PN3C4GJ1</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (299, N'No type was specified for the decimal column ''"RentalFeeForOwner"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:27:28.307' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForOwner</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>93b1bcb1-734d-45e8-97f1-d26fa69ea5d1</property><property key=''ActionName''>API.Controllers.AuthenticationController.Register (API)</property><property key=''RequestId''>0HME1PN3C4GJ1:00000002</property><property key=''RequestPath''>/authentication/Register</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1PN3C4GJ1</property></properties>')
GO
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (300, N'No type was specified for the decimal column ''"RentalFeeForTennat"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:27:28.307' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForTennat</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>93b1bcb1-734d-45e8-97f1-d26fa69ea5d1</property><property key=''ActionName''>API.Controllers.AuthenticationController.Register (API)</property><property key=''RequestId''>0HME1PN3C4GJ1:00000002</property><property key=''RequestPath''>/authentication/Register</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1PN3C4GJ1</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (301, N'No type was specified for the decimal column ''"Value"'' on entity type ''"HistoryBankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:27:28.307' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>HistoryBankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>93b1bcb1-734d-45e8-97f1-d26fa69ea5d1</property><property key=''ActionName''>API.Controllers.AuthenticationController.Register (API)</property><property key=''RequestId''>0HME1PN3C4GJ1:00000002</property><property key=''RequestPath''>/authentication/Register</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1PN3C4GJ1</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (302, N'No type was specified for the decimal column ''"Area"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:27:28.307' AS DateTime), NULL, N'<properties><property key=''property''>Area</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>93b1bcb1-734d-45e8-97f1-d26fa69ea5d1</property><property key=''ActionName''>API.Controllers.AuthenticationController.Register (API)</property><property key=''RequestId''>0HME1PN3C4GJ1:00000002</property><property key=''RequestPath''>/authentication/Register</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1PN3C4GJ1</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (303, N'No type was specified for the decimal column ''"FeeCompany"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:27:28.307' AS DateTime), NULL, N'<properties><property key=''property''>FeeCompany</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>93b1bcb1-734d-45e8-97f1-d26fa69ea5d1</property><property key=''ActionName''>API.Controllers.AuthenticationController.Register (API)</property><property key=''RequestId''>0HME1PN3C4GJ1:00000002</property><property key=''RequestPath''>/authentication/Register</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1PN3C4GJ1</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (304, N'No type was specified for the decimal column ''"FinalPrice"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:27:28.307' AS DateTime), NULL, N'<properties><property key=''property''>FinalPrice</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>93b1bcb1-734d-45e8-97f1-d26fa69ea5d1</property><property key=''ActionName''>API.Controllers.AuthenticationController.Register (API)</property><property key=''RequestId''>0HME1PN3C4GJ1:00000002</property><property key=''RequestPath''>/authentication/Register</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1PN3C4GJ1</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (305, N'No type was specified for the decimal column ''"Percentage"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:27:28.307' AS DateTime), NULL, N'<properties><property key=''property''>Percentage</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>93b1bcb1-734d-45e8-97f1-d26fa69ea5d1</property><property key=''ActionName''>API.Controllers.AuthenticationController.Register (API)</property><property key=''RequestId''>0HME1PN3C4GJ1:00000002</property><property key=''RequestPath''>/authentication/Register</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1PN3C4GJ1</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (306, N'No type was specified for the decimal column ''"PriceOwner"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T21:27:28.307' AS DateTime), NULL, N'<properties><property key=''property''>PriceOwner</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>93b1bcb1-734d-45e8-97f1-d26fa69ea5d1</property><property key=''ActionName''>API.Controllers.AuthenticationController.Register (API)</property><property key=''RequestId''>0HME1PN3C4GJ1:00000002</property><property key=''RequestPath''>/authentication/Register</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1PN3C4GJ1</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (307, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2021-12-17T22:25:58.167' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (308, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToPayContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T22:25:59.973' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToPayContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>034c2ec9-69e2-4758-8fc5-d75449493615</property><property key=''ActionName''>API.Controllers.PropertyController.GetProperty (API)</property><property key=''RequestId''>0HME1QOE2Q1IU:00000003</property><property key=''RequestPath''>/Properties/property</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1QOE2Q1IU</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (309, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToReceivableContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T22:25:59.980' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToReceivableContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>034c2ec9-69e2-4758-8fc5-d75449493615</property><property key=''ActionName''>API.Controllers.PropertyController.GetProperty (API)</property><property key=''RequestId''>0HME1QOE2Q1IU:00000003</property><property key=''RequestPath''>/Properties/property</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1QOE2Q1IU</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (310, N'No type was specified for the decimal column ''"Total"'' on entity type ''"BankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T22:25:59.980' AS DateTime), NULL, N'<properties><property key=''property''>Total</property><property key=''entityType''>BankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>034c2ec9-69e2-4758-8fc5-d75449493615</property><property key=''ActionName''>API.Controllers.PropertyController.GetProperty (API)</property><property key=''RequestId''>0HME1QOE2Q1IU:00000003</property><property key=''RequestPath''>/Properties/property</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1QOE2Q1IU</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (311, N'No type was specified for the decimal column ''"RentalFeeForOwner"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T22:25:59.980' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForOwner</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>034c2ec9-69e2-4758-8fc5-d75449493615</property><property key=''ActionName''>API.Controllers.PropertyController.GetProperty (API)</property><property key=''RequestId''>0HME1QOE2Q1IU:00000003</property><property key=''RequestPath''>/Properties/property</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1QOE2Q1IU</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (312, N'No type was specified for the decimal column ''"RentalFeeForTennat"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T22:25:59.980' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForTennat</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>034c2ec9-69e2-4758-8fc5-d75449493615</property><property key=''ActionName''>API.Controllers.PropertyController.GetProperty (API)</property><property key=''RequestId''>0HME1QOE2Q1IU:00000003</property><property key=''RequestPath''>/Properties/property</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1QOE2Q1IU</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (313, N'No type was specified for the decimal column ''"Value"'' on entity type ''"HistoryBankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T22:25:59.980' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>HistoryBankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>034c2ec9-69e2-4758-8fc5-d75449493615</property><property key=''ActionName''>API.Controllers.PropertyController.GetProperty (API)</property><property key=''RequestId''>0HME1QOE2Q1IU:00000003</property><property key=''RequestPath''>/Properties/property</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1QOE2Q1IU</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (314, N'No type was specified for the decimal column ''"Area"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T22:25:59.980' AS DateTime), NULL, N'<properties><property key=''property''>Area</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>034c2ec9-69e2-4758-8fc5-d75449493615</property><property key=''ActionName''>API.Controllers.PropertyController.GetProperty (API)</property><property key=''RequestId''>0HME1QOE2Q1IU:00000003</property><property key=''RequestPath''>/Properties/property</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1QOE2Q1IU</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (315, N'No type was specified for the decimal column ''"FeeCompany"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T22:25:59.980' AS DateTime), NULL, N'<properties><property key=''property''>FeeCompany</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>034c2ec9-69e2-4758-8fc5-d75449493615</property><property key=''ActionName''>API.Controllers.PropertyController.GetProperty (API)</property><property key=''RequestId''>0HME1QOE2Q1IU:00000003</property><property key=''RequestPath''>/Properties/property</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1QOE2Q1IU</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (316, N'No type was specified for the decimal column ''"FinalPrice"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T22:25:59.980' AS DateTime), NULL, N'<properties><property key=''property''>FinalPrice</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>034c2ec9-69e2-4758-8fc5-d75449493615</property><property key=''ActionName''>API.Controllers.PropertyController.GetProperty (API)</property><property key=''RequestId''>0HME1QOE2Q1IU:00000003</property><property key=''RequestPath''>/Properties/property</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1QOE2Q1IU</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (317, N'No type was specified for the decimal column ''"Percentage"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T22:25:59.980' AS DateTime), NULL, N'<properties><property key=''property''>Percentage</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>034c2ec9-69e2-4758-8fc5-d75449493615</property><property key=''ActionName''>API.Controllers.PropertyController.GetProperty (API)</property><property key=''RequestId''>0HME1QOE2Q1IU:00000003</property><property key=''RequestPath''>/Properties/property</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1QOE2Q1IU</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (318, N'No type was specified for the decimal column ''"PriceOwner"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2021-12-17T22:25:59.980' AS DateTime), NULL, N'<properties><property key=''property''>PriceOwner</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>034c2ec9-69e2-4758-8fc5-d75449493615</property><property key=''ActionName''>API.Controllers.PropertyController.GetProperty (API)</property><property key=''RequestId''>0HME1QOE2Q1IU:00000003</property><property key=''RequestPath''>/Properties/property</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HME1QOE2Q1IU</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (319, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2022-02-16T14:30:05.397' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (320, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2022-02-16T15:26:43.310' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (321, N'An unhandled exception has occurred while executing the request.', N'An unhandled exception has occurred while executing the request.', N'Error', CAST(N'2022-02-16T15:27:50.683' AS DateTime), N'System.InvalidOperationException: Unable to resolve service for type ''DataAccess.BaseModel`1[DataAccess.Data.Customer]'' while attempting to activate ''Business.BaseService`1[DataAccess.Data.Customer]''.
   at Microsoft.Extensions.DependencyInjection.ServiceLookup.CallSiteFactory.CreateArgumentCallSites(Type serviceType, Type implementationType, CallSiteChain callSiteChain, ParameterInfo[] parameters, Boolean throwIfCallSiteNotFound)
   at Microsoft.Extensions.DependencyInjection.ServiceLookup.CallSiteFactory.CreateConstructorCallSite(Type serviceType, Type implementationType, CallSiteChain callSiteChain)
   at Microsoft.Extensions.DependencyInjection.ServiceLookup.CallSiteFactory.TryCreateExact(ServiceDescriptor descriptor, Type serviceType, CallSiteChain callSiteChain)
   at Microsoft.Extensions.DependencyInjection.ServiceLookup.CallSiteFactory.TryCreateExact(Type serviceType, CallSiteChain callSiteChain)
   at Microsoft.Extensions.DependencyInjection.ServiceLookup.CallSiteFactory.CreateCallSite(Type serviceType, CallSiteChain callSiteChain)
   at Microsoft.Extensions.DependencyInjection.ServiceLookup.ServiceProviderEngine.CreateServiceAccessor(Type serviceType)
   at System.Collections.Concurrent.ConcurrentDictionary`2.GetOrAdd(TKey key, Func`2 valueFactory)
   at Microsoft.Extensions.DependencyInjection.ServiceLookup.ServiceProviderEngine.GetService(Type serviceType, ServiceProviderEngineScope serviceProviderEngineScope)
   at Microsoft.Extensions.DependencyInjection.ServiceLookup.ServiceProviderEngineScope.GetService(Type serviceType)
   at Microsoft.Extensions.DependencyInjection.ActivatorUtilities.GetService(IServiceProvider sp, Type type, Type requiredBy, Boolean isDefaultParameterRequired)
   at lambda_method(Closure , IServiceProvider , Object[] )
   at Microsoft.AspNetCore.Mvc.Controllers.ControllerActivatorProvider.<>c__DisplayClass4_0.<CreateActivator>b__0(ControllerContext controllerContext)
   at Microsoft.AspNetCore.Mvc.Controllers.ControllerFactoryProvider.<>c__DisplayClass5_0.<CreateControllerFactory>g__CreateController|0(ControllerContext controllerContext)
   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.InvokeInnerFilterAsync()
   at Microsoft.AspNetCore.Mvc.Internal.ResourceInvoker.InvokeNextResourceFilter()
   at Microsoft.AspNetCore.Mvc.Internal.ResourceInvoker.Rethrow(ResourceExecutedContext context)
   at Microsoft.AspNetCore.Mvc.Internal.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Internal.ResourceInvoker.InvokeFilterPipelineAsync()
   at Microsoft.AspNetCore.Mvc.Internal.ResourceInvoker.InvokeAsync()
   at Microsoft.AspNetCore.Builder.RouterMiddleware.Invoke(HttpContext httpContext)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Cors.Infrastructure.CorsMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.StaticFiles.StaticFileMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware.Invoke(HttpContext context)', N'<properties><property key=''EventId''><structure type=''''><property key=''Id''>1</property><property key=''Name''>UnhandledException</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware</property><property key=''RequestId''>0HMFHHAJGP9FM:00000001</property><property key=''RequestPath''>/Customer/Customer</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFHHAJGP9FM</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (322, N'An unhandled exception has occurred while executing the request.', N'An unhandled exception has occurred while executing the request.', N'Error', CAST(N'2022-02-16T15:28:42.827' AS DateTime), N'System.InvalidOperationException: Unable to resolve service for type ''DataAccess.BaseModel`1[DataAccess.Data.Customer]'' while attempting to activate ''Business.BaseService`1[DataAccess.Data.Customer]''.
   at Microsoft.Extensions.DependencyInjection.ServiceLookup.CallSiteFactory.CreateArgumentCallSites(Type serviceType, Type implementationType, CallSiteChain callSiteChain, ParameterInfo[] parameters, Boolean throwIfCallSiteNotFound)
   at Microsoft.Extensions.DependencyInjection.ServiceLookup.CallSiteFactory.CreateConstructorCallSite(Type serviceType, Type implementationType, CallSiteChain callSiteChain)
   at Microsoft.Extensions.DependencyInjection.ServiceLookup.CallSiteFactory.TryCreateExact(ServiceDescriptor descriptor, Type serviceType, CallSiteChain callSiteChain)
   at Microsoft.Extensions.DependencyInjection.ServiceLookup.CallSiteFactory.TryCreateExact(Type serviceType, CallSiteChain callSiteChain)
   at Microsoft.Extensions.DependencyInjection.ServiceLookup.CallSiteFactory.CreateCallSite(Type serviceType, CallSiteChain callSiteChain)
   at Microsoft.Extensions.DependencyInjection.ServiceLookup.ServiceProviderEngine.CreateServiceAccessor(Type serviceType)
   at System.Collections.Concurrent.ConcurrentDictionary`2.GetOrAdd(TKey key, Func`2 valueFactory)
   at Microsoft.Extensions.DependencyInjection.ServiceLookup.ServiceProviderEngine.GetService(Type serviceType, ServiceProviderEngineScope serviceProviderEngineScope)
   at Microsoft.Extensions.DependencyInjection.ServiceLookup.ServiceProviderEngineScope.GetService(Type serviceType)
   at Microsoft.Extensions.DependencyInjection.ActivatorUtilities.GetService(IServiceProvider sp, Type type, Type requiredBy, Boolean isDefaultParameterRequired)
   at lambda_method(Closure , IServiceProvider , Object[] )
   at Microsoft.AspNetCore.Mvc.Controllers.ControllerActivatorProvider.<>c__DisplayClass4_0.<CreateActivator>b__0(ControllerContext controllerContext)
   at Microsoft.AspNetCore.Mvc.Controllers.ControllerFactoryProvider.<>c__DisplayClass5_0.<CreateControllerFactory>g__CreateController|0(ControllerContext controllerContext)
   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker.InvokeInnerFilterAsync()
   at Microsoft.AspNetCore.Mvc.Internal.ResourceInvoker.InvokeNextResourceFilter()
   at Microsoft.AspNetCore.Mvc.Internal.ResourceInvoker.Rethrow(ResourceExecutedContext context)
   at Microsoft.AspNetCore.Mvc.Internal.ResourceInvoker.Next(State& next, Scope& scope, Object& state, Boolean& isCompleted)
   at Microsoft.AspNetCore.Mvc.Internal.ResourceInvoker.InvokeFilterPipelineAsync()
   at Microsoft.AspNetCore.Mvc.Internal.ResourceInvoker.InvokeAsync()
   at Microsoft.AspNetCore.Builder.RouterMiddleware.Invoke(HttpContext httpContext)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Session.SessionMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Authentication.AuthenticationMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.Cors.Infrastructure.CorsMiddleware.Invoke(HttpContext context)
   at Microsoft.AspNetCore.StaticFiles.StaticFileMiddleware.Invoke(HttpContext context)
   at Swashbuckle.AspNetCore.SwaggerUI.SwaggerUIMiddleware.Invoke(HttpContext httpContext)
   at Swashbuckle.AspNetCore.Swagger.SwaggerMiddleware.Invoke(HttpContext httpContext, ISwaggerProvider swaggerProvider)
   at Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware.Invoke(HttpContext context)', N'<properties><property key=''EventId''><structure type=''''><property key=''Id''>1</property><property key=''Name''>UnhandledException</property></structure></property><property key=''SourceContext''>Microsoft.AspNetCore.Diagnostics.DeveloperExceptionPageMiddleware</property><property key=''RequestId''>0HMFHHAJGP9FM:00000003</property><property key=''RequestPath''>/Customer/Customer</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFHHAJGP9FM</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (323, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2022-02-16T15:31:16.053' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (324, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2022-02-16T15:39:53.670' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (325, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2022-02-16T15:41:00.493' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (326, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2022-02-16T18:36:22.953' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (327, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2022-02-16T18:36:32.883' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (328, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2022-02-16T18:37:08.043' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (329, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2022-02-16T18:37:22.187' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (330, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2022-02-16T22:52:35.710' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (331, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2022-02-16T22:53:48.623' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (332, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToPayContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-16T23:20:50.110' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToPayContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>c4a1293d-d84e-4d43-bcb1-d631a5c9f414</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFHP4VVQMI8:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFHP4VVQMI8</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (333, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToReceivableContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-16T23:20:50.117' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToReceivableContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>c4a1293d-d84e-4d43-bcb1-d631a5c9f414</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFHP4VVQMI8:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFHP4VVQMI8</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (334, N'No type was specified for the decimal column ''"Total"'' on entity type ''"BankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-16T23:20:50.117' AS DateTime), NULL, N'<properties><property key=''property''>Total</property><property key=''entityType''>BankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>c4a1293d-d84e-4d43-bcb1-d631a5c9f414</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFHP4VVQMI8:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFHP4VVQMI8</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (335, N'No type was specified for the decimal column ''"RentalFeeForOwner"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-16T23:20:50.117' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForOwner</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>c4a1293d-d84e-4d43-bcb1-d631a5c9f414</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFHP4VVQMI8:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFHP4VVQMI8</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (336, N'No type was specified for the decimal column ''"RentalFeeForTennat"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-16T23:20:50.117' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForTennat</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>c4a1293d-d84e-4d43-bcb1-d631a5c9f414</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFHP4VVQMI8:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFHP4VVQMI8</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (337, N'No type was specified for the decimal column ''"Value"'' on entity type ''"HistoryBankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-16T23:20:50.117' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>HistoryBankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>c4a1293d-d84e-4d43-bcb1-d631a5c9f414</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFHP4VVQMI8:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFHP4VVQMI8</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (338, N'No type was specified for the decimal column ''"Area"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-16T23:20:50.117' AS DateTime), NULL, N'<properties><property key=''property''>Area</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>c4a1293d-d84e-4d43-bcb1-d631a5c9f414</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFHP4VVQMI8:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFHP4VVQMI8</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (339, N'No type was specified for the decimal column ''"FeeCompany"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-16T23:20:50.117' AS DateTime), NULL, N'<properties><property key=''property''>FeeCompany</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>c4a1293d-d84e-4d43-bcb1-d631a5c9f414</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFHP4VVQMI8:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFHP4VVQMI8</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (340, N'No type was specified for the decimal column ''"FinalPrice"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-16T23:20:50.117' AS DateTime), NULL, N'<properties><property key=''property''>FinalPrice</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>c4a1293d-d84e-4d43-bcb1-d631a5c9f414</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFHP4VVQMI8:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFHP4VVQMI8</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (341, N'No type was specified for the decimal column ''"Percentage"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-16T23:20:50.117' AS DateTime), NULL, N'<properties><property key=''property''>Percentage</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>c4a1293d-d84e-4d43-bcb1-d631a5c9f414</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFHP4VVQMI8:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFHP4VVQMI8</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (342, N'No type was specified for the decimal column ''"PriceOwner"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-16T23:20:50.117' AS DateTime), NULL, N'<properties><property key=''property''>PriceOwner</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>c4a1293d-d84e-4d43-bcb1-d631a5c9f414</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFHP4VVQMI8:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFHP4VVQMI8</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (343, N'Could not find stored procedure ''Banks.PaymentTypes_LIST''.', N'Could not find stored procedure ''Banks.PaymentTypes_LIST''.', N'Error', CAST(N'2022-02-16T23:26:40.697' AS DateTime), N'System.Data.SqlClient.SqlException (0x80131904): Could not find stored procedure ''Banks.PaymentTypes_LIST''.
   at System.Data.SqlClient.SqlCommand.<>c.<ExecuteDbDataReaderAsync>b__126_0(Task`1 result)
   at System.Threading.Tasks.ContinuationResultTaskFromResultTask`2.InnerInvoke()
   at System.Threading.ExecutionContext.RunInternal(ExecutionContext executionContext, ContextCallback callback, Object state)
--- End of stack trace from previous location where exception was thrown ---
   at System.Threading.Tasks.Task.ExecuteWithThreadLocal(Task& currentTaskSlot)
--- End of stack trace from previous location where exception was thrown ---
   at Dapper.SqlMapper.QueryAsync[T](IDbConnection cnn, Type effectiveType, CommandDefinition command) in C:\projects\dapper\Dapper\SqlMapper.Async.cs:line 419
   at CodeMono.DataAccess.DBConnection.DBConnectionMSSQL.QueryAsync[T](Dictionary`2 P, String SP) in C:\Users\lidersoft\source\repos\jhoncastrillon9\ProjectAPI\DataAccess\_CodeMono\Base\DBConnectionMSSQL.cs:line 51
   at DataAccess.BaseStoreProcedureModel.ExecStoreProcedure[T](Dictionary`2 parameters, String spName) in C:\Users\lidersoft\source\repos\jhoncastrillon9\ProjectAPI\DataAccess\BaseStoreProcedureModel.cs:line 29
   at Business.BaseService`1.ExecStoreProcedure[T](Dictionary`2 parameters, String spName) in C:\Users\lidersoft\source\repos\jhoncastrillon9\ProjectAPI\Business\BaseService.cs:line 110
   at API.Controllers.PaymentTypeController.GetListPaymentType(Nullable`1 PaymentTypeId, String PaymentTypeName, Nullable`1 CompayId) in C:\Users\lidersoft\source\repos\jhoncastrillon9\ProjectAPI\API\Controllers\Banks\PaymentTypeController.cs:line 100
ClientConnectionId:64208b1a-ec3e-4ce5-98c1-78ee71bdbaaf
Error Number:2812,State:62,Class:16', N'<properties><property key=''SourceContext''>API.Controllers.PaymentTypeController</property><property key=''ActionId''>ed18e031-5af0-48fe-b65d-8d0f92021435</property><property key=''ActionName''>API.Controllers.PaymentTypeController.GetListPaymentType (API)</property><property key=''RequestId''>0HMFHP4VVQMIM:0000000D</property><property key=''RequestPath''>/Banks/paymentType/list</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFHP4VVQMIM</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (344, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2022-02-18T18:58:41.400' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (345, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToPayContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-18T19:06:24.743' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToPayContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>e7fe59f6-fcae-4d7a-bf07-70fe563dd7d7</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFJ7B32CR0K:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7B32CR0K</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (346, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToReceivableContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-18T19:06:24.750' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToReceivableContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>e7fe59f6-fcae-4d7a-bf07-70fe563dd7d7</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFJ7B32CR0K:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7B32CR0K</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (347, N'No type was specified for the decimal column ''"Total"'' on entity type ''"BankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-18T19:06:24.750' AS DateTime), NULL, N'<properties><property key=''property''>Total</property><property key=''entityType''>BankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>e7fe59f6-fcae-4d7a-bf07-70fe563dd7d7</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFJ7B32CR0K:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7B32CR0K</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (348, N'No type was specified for the decimal column ''"RentalFeeForOwner"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-18T19:06:24.750' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForOwner</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>e7fe59f6-fcae-4d7a-bf07-70fe563dd7d7</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFJ7B32CR0K:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7B32CR0K</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (349, N'No type was specified for the decimal column ''"RentalFeeForTennat"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-18T19:06:24.750' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForTennat</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>e7fe59f6-fcae-4d7a-bf07-70fe563dd7d7</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFJ7B32CR0K:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7B32CR0K</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (350, N'No type was specified for the decimal column ''"Value"'' on entity type ''"HistoryBankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-18T19:06:24.750' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>HistoryBankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>e7fe59f6-fcae-4d7a-bf07-70fe563dd7d7</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFJ7B32CR0K:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7B32CR0K</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (351, N'No type was specified for the decimal column ''"Area"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-18T19:06:24.750' AS DateTime), NULL, N'<properties><property key=''property''>Area</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>e7fe59f6-fcae-4d7a-bf07-70fe563dd7d7</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFJ7B32CR0K:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7B32CR0K</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (352, N'No type was specified for the decimal column ''"FeeCompany"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-18T19:06:24.750' AS DateTime), NULL, N'<properties><property key=''property''>FeeCompany</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>e7fe59f6-fcae-4d7a-bf07-70fe563dd7d7</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFJ7B32CR0K:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7B32CR0K</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (353, N'No type was specified for the decimal column ''"FinalPrice"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-18T19:06:24.750' AS DateTime), NULL, N'<properties><property key=''property''>FinalPrice</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>e7fe59f6-fcae-4d7a-bf07-70fe563dd7d7</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFJ7B32CR0K:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7B32CR0K</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (354, N'No type was specified for the decimal column ''"Percentage"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-18T19:06:24.750' AS DateTime), NULL, N'<properties><property key=''property''>Percentage</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>e7fe59f6-fcae-4d7a-bf07-70fe563dd7d7</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFJ7B32CR0K:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7B32CR0K</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (355, N'No type was specified for the decimal column ''"PriceOwner"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-18T19:06:24.750' AS DateTime), NULL, N'<properties><property key=''property''>PriceOwner</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>e7fe59f6-fcae-4d7a-bf07-70fe563dd7d7</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFJ7B32CR0K:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7B32CR0K</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (356, N'Se ha presentado un error de autorización', N'Se ha presentado un error de autorización', N'Error', CAST(N'2022-02-18T19:23:05.167' AS DateTime), N'System.Exception: Se ha presentado un error de autorización
   at Business.BaseService`1.ValidateCompany(Int32 companyId) in C:\Users\lidersoft\source\repos\jhoncastrillon9\ProjectAPI\Business\BaseService.cs:line 66
   at API.Controllers.CompanyController.PutCompany(CompanyDTO model) in C:\Users\lidersoft\source\repos\jhoncastrillon9\ProjectAPI\API\Controllers\Companies\CompanyController.cs:line 227', N'<properties><property key=''SourceContext''>API.Controllers.CompanyController</property><property key=''ActionId''>1790c4c3-8821-4a40-b5b4-6e8681fb460a</property><property key=''ActionName''>API.Controllers.CompanyController.PutCompany (API)</property><property key=''RequestId''>0HMFJ7B32CR0R:0000000E</property><property key=''RequestPath''>/Companies/company</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7B32CR0R</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (357, N'Se ha presentado un error de autorización', N'Se ha presentado un error de autorización', N'Error', CAST(N'2022-02-18T19:23:21.550' AS DateTime), N'System.Exception: Se ha presentado un error de autorización
   at Business.BaseService`1.ValidateCompany(Int32 companyId) in C:\Users\lidersoft\source\repos\jhoncastrillon9\ProjectAPI\Business\BaseService.cs:line 66
   at API.Controllers.CompanyController.PutCompany(CompanyDTO model) in C:\Users\lidersoft\source\repos\jhoncastrillon9\ProjectAPI\API\Controllers\Companies\CompanyController.cs:line 227', N'<properties><property key=''SourceContext''>API.Controllers.CompanyController</property><property key=''ActionId''>1790c4c3-8821-4a40-b5b4-6e8681fb460a</property><property key=''ActionName''>API.Controllers.CompanyController.PutCompany (API)</property><property key=''RequestId''>0HMFJ7B32CR0R:00000010</property><property key=''RequestPath''>/Companies/company</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7B32CR0R</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (358, N'Se ha presentado un error de autorización', N'Se ha presentado un error de autorización', N'Error', CAST(N'2022-02-18T19:24:38.967' AS DateTime), N'System.Exception: Se ha presentado un error de autorización
   at Business.BaseService`1.ValidateCompany(Int32 companyId) in C:\Users\lidersoft\source\repos\jhoncastrillon9\ProjectAPI\Business\BaseService.cs:line 66
   at API.Controllers.CompanyController.PutCompany(CompanyDTO model) in C:\Users\lidersoft\source\repos\jhoncastrillon9\ProjectAPI\API\Controllers\Companies\CompanyController.cs:line 227', N'<properties><property key=''SourceContext''>API.Controllers.CompanyController</property><property key=''ActionId''>1790c4c3-8821-4a40-b5b4-6e8681fb460a</property><property key=''ActionName''>API.Controllers.CompanyController.PutCompany (API)</property><property key=''RequestId''>0HMFJ7B32CR0R:0000001C</property><property key=''RequestPath''>/Companies/company</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7B32CR0R</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (359, N'Se ha presentado un error de autorización', N'Se ha presentado un error de autorización', N'Error', CAST(N'2022-02-18T19:26:59.397' AS DateTime), N'System.Exception: Se ha presentado un error de autorización
   at Business.BaseService`1.ValidateCompany(Int32 companyId) in C:\Users\lidersoft\source\repos\jhoncastrillon9\ProjectAPI\Business\BaseService.cs:line 66
   at API.Controllers.CompanyController.PutCompany(CompanyDTO model) in C:\Users\lidersoft\source\repos\jhoncastrillon9\ProjectAPI\API\Controllers\Companies\CompanyController.cs:line 227', N'<properties><property key=''SourceContext''>API.Controllers.CompanyController</property><property key=''ActionId''>1790c4c3-8821-4a40-b5b4-6e8681fb460a</property><property key=''ActionName''>API.Controllers.CompanyController.PutCompany (API)</property><property key=''RequestId''>0HMFJ7B32CR0S:00000004</property><property key=''RequestPath''>/Companies/company</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7B32CR0S</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (360, N'Se ha presentado un error de autorización', N'Se ha presentado un error de autorización', N'Error', CAST(N'2022-02-18T19:27:10.170' AS DateTime), N'System.Exception: Se ha presentado un error de autorización
   at Business.BaseService`1.ValidateCompany(Int32 companyId) in C:\Users\lidersoft\source\repos\jhoncastrillon9\ProjectAPI\Business\BaseService.cs:line 66
   at API.Controllers.CompanyController.PutCompany(CompanyDTO model) in C:\Users\lidersoft\source\repos\jhoncastrillon9\ProjectAPI\API\Controllers\Companies\CompanyController.cs:line 227', N'<properties><property key=''SourceContext''>API.Controllers.CompanyController</property><property key=''ActionId''>1790c4c3-8821-4a40-b5b4-6e8681fb460a</property><property key=''ActionName''>API.Controllers.CompanyController.PutCompany (API)</property><property key=''RequestId''>0HMFJ7B32CR0S:00000006</property><property key=''RequestPath''>/Companies/company</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7B32CR0S</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (361, N'Se ha presentado un error de autorización', N'Se ha presentado un error de autorización', N'Error', CAST(N'2022-02-18T19:27:39.577' AS DateTime), N'System.Exception: Se ha presentado un error de autorización
   at Business.BaseService`1.ValidateCompany(Int32 companyId) in C:\Users\lidersoft\source\repos\jhoncastrillon9\ProjectAPI\Business\BaseService.cs:line 66
   at API.Controllers.CompanyController.PutCompany(CompanyDTO model) in C:\Users\lidersoft\source\repos\jhoncastrillon9\ProjectAPI\API\Controllers\Companies\CompanyController.cs:line 227', N'<properties><property key=''SourceContext''>API.Controllers.CompanyController</property><property key=''ActionId''>1790c4c3-8821-4a40-b5b4-6e8681fb460a</property><property key=''ActionName''>API.Controllers.CompanyController.PutCompany (API)</property><property key=''RequestId''>0HMFJ7B32CR0S:00000008</property><property key=''RequestPath''>/Companies/company</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7B32CR0S</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (362, N'Se ha presentado un error de autorización', N'Se ha presentado un error de autorización', N'Error', CAST(N'2022-02-18T19:28:42.647' AS DateTime), N'System.Exception: Se ha presentado un error de autorización
   at Business.BaseService`1.ValidateCompany(Int32 companyId) in C:\Users\lidersoft\source\repos\jhoncastrillon9\ProjectAPI\Business\BaseService.cs:line 66
   at API.Controllers.CompanyController.PutCompany(CompanyDTO model)', N'<properties><property key=''SourceContext''>API.Controllers.CompanyController</property><property key=''ActionId''>1790c4c3-8821-4a40-b5b4-6e8681fb460a</property><property key=''ActionName''>API.Controllers.CompanyController.PutCompany (API)</property><property key=''RequestId''>0HMFJ7B32CR0S:0000000A</property><property key=''RequestPath''>/Companies/company</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7B32CR0S</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (363, N'Se ha presentado un error de autorización', N'Se ha presentado un error de autorización', N'Error', CAST(N'2022-02-18T19:28:53.777' AS DateTime), N'System.Exception: Se ha presentado un error de autorización
   at Business.BaseService`1.ValidateCompany(Int32 companyId) in C:\Users\lidersoft\source\repos\jhoncastrillon9\ProjectAPI\Business\BaseService.cs:line 66
   at API.Controllers.CompanyController.PutCompany(CompanyDTO model)', N'<properties><property key=''SourceContext''>API.Controllers.CompanyController</property><property key=''ActionId''>1790c4c3-8821-4a40-b5b4-6e8681fb460a</property><property key=''ActionName''>API.Controllers.CompanyController.PutCompany (API)</property><property key=''RequestId''>0HMFJ7B32CR0S:0000000C</property><property key=''RequestPath''>/Companies/company</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7B32CR0S</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (364, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2022-02-18T19:30:32.267' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (365, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToPayContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-18T19:30:33.820' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToPayContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>891bd083-3946-4ac9-baf8-0f846e091852</property><property key=''ActionName''>API.Controllers.CompanyController.PutCompany (API)</property><property key=''RequestId''>0HMFJ7S531P8N:00000002</property><property key=''RequestPath''>/Companies/company</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7S531P8N</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (366, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToReceivableContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-18T19:30:33.823' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToReceivableContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>891bd083-3946-4ac9-baf8-0f846e091852</property><property key=''ActionName''>API.Controllers.CompanyController.PutCompany (API)</property><property key=''RequestId''>0HMFJ7S531P8N:00000002</property><property key=''RequestPath''>/Companies/company</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7S531P8N</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (367, N'No type was specified for the decimal column ''"Total"'' on entity type ''"BankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-18T19:30:33.823' AS DateTime), NULL, N'<properties><property key=''property''>Total</property><property key=''entityType''>BankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>891bd083-3946-4ac9-baf8-0f846e091852</property><property key=''ActionName''>API.Controllers.CompanyController.PutCompany (API)</property><property key=''RequestId''>0HMFJ7S531P8N:00000002</property><property key=''RequestPath''>/Companies/company</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7S531P8N</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (368, N'No type was specified for the decimal column ''"RentalFeeForOwner"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-18T19:30:33.823' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForOwner</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>891bd083-3946-4ac9-baf8-0f846e091852</property><property key=''ActionName''>API.Controllers.CompanyController.PutCompany (API)</property><property key=''RequestId''>0HMFJ7S531P8N:00000002</property><property key=''RequestPath''>/Companies/company</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7S531P8N</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (369, N'No type was specified for the decimal column ''"RentalFeeForTennat"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-18T19:30:33.823' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForTennat</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>891bd083-3946-4ac9-baf8-0f846e091852</property><property key=''ActionName''>API.Controllers.CompanyController.PutCompany (API)</property><property key=''RequestId''>0HMFJ7S531P8N:00000002</property><property key=''RequestPath''>/Companies/company</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7S531P8N</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (370, N'No type was specified for the decimal column ''"Value"'' on entity type ''"HistoryBankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-18T19:30:33.823' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>HistoryBankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>891bd083-3946-4ac9-baf8-0f846e091852</property><property key=''ActionName''>API.Controllers.CompanyController.PutCompany (API)</property><property key=''RequestId''>0HMFJ7S531P8N:00000002</property><property key=''RequestPath''>/Companies/company</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7S531P8N</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (371, N'No type was specified for the decimal column ''"Area"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-18T19:30:33.823' AS DateTime), NULL, N'<properties><property key=''property''>Area</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>891bd083-3946-4ac9-baf8-0f846e091852</property><property key=''ActionName''>API.Controllers.CompanyController.PutCompany (API)</property><property key=''RequestId''>0HMFJ7S531P8N:00000002</property><property key=''RequestPath''>/Companies/company</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7S531P8N</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (372, N'No type was specified for the decimal column ''"FeeCompany"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-18T19:30:33.823' AS DateTime), NULL, N'<properties><property key=''property''>FeeCompany</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>891bd083-3946-4ac9-baf8-0f846e091852</property><property key=''ActionName''>API.Controllers.CompanyController.PutCompany (API)</property><property key=''RequestId''>0HMFJ7S531P8N:00000002</property><property key=''RequestPath''>/Companies/company</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7S531P8N</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (373, N'No type was specified for the decimal column ''"FinalPrice"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-18T19:30:33.823' AS DateTime), NULL, N'<properties><property key=''property''>FinalPrice</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>891bd083-3946-4ac9-baf8-0f846e091852</property><property key=''ActionName''>API.Controllers.CompanyController.PutCompany (API)</property><property key=''RequestId''>0HMFJ7S531P8N:00000002</property><property key=''RequestPath''>/Companies/company</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7S531P8N</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (374, N'No type was specified for the decimal column ''"Percentage"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-18T19:30:33.823' AS DateTime), NULL, N'<properties><property key=''property''>Percentage</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>891bd083-3946-4ac9-baf8-0f846e091852</property><property key=''ActionName''>API.Controllers.CompanyController.PutCompany (API)</property><property key=''RequestId''>0HMFJ7S531P8N:00000002</property><property key=''RequestPath''>/Companies/company</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7S531P8N</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (375, N'No type was specified for the decimal column ''"PriceOwner"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-18T19:30:33.823' AS DateTime), NULL, N'<properties><property key=''property''>PriceOwner</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>891bd083-3946-4ac9-baf8-0f846e091852</property><property key=''ActionName''>API.Controllers.CompanyController.PutCompany (API)</property><property key=''RequestId''>0HMFJ7S531P8N:00000002</property><property key=''RequestPath''>/Companies/company</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7S531P8N</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (376, N'Se ha presentado un error de autorización', N'Se ha presentado un error de autorización', N'Error', CAST(N'2022-02-18T19:30:34.130' AS DateTime), N'System.Exception: Se ha presentado un error de autorización
   at Business.BaseService`1.ValidateCompany(Int32 companyId) in C:\Users\lidersoft\source\repos\jhoncastrillon9\ProjectAPI\Business\BaseService.cs:line 66
   at API.Controllers.CompanyController.PutCompany(CompanyDTO model) in C:\Users\lidersoft\source\repos\jhoncastrillon9\ProjectAPI\API\Controllers\Companies\CompanyController.cs:line 227', N'<properties><property key=''SourceContext''>API.Controllers.CompanyController</property><property key=''ActionId''>891bd083-3946-4ac9-baf8-0f846e091852</property><property key=''ActionName''>API.Controllers.CompanyController.PutCompany (API)</property><property key=''RequestId''>0HMFJ7S531P8N:00000002</property><property key=''RequestPath''>/Companies/company</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFJ7S531P8N</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (377, N'Host starting...', N'Host starting...', N'Warning', CAST(N'2022-02-21T19:14:15.820' AS DateTime), NULL, N'<properties></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (378, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToPayContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-21T19:28:58.220' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToPayContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>231dea2e-016c-4fa2-8432-8ad23d765eb6</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFLJ1MPCTUP:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFLJ1MPCTUP</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (379, N'No type was specified for the decimal column ''"Value"'' on entity type ''"AccountsToReceivableContract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-21T19:28:58.227' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>AccountsToReceivableContract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>231dea2e-016c-4fa2-8432-8ad23d765eb6</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFLJ1MPCTUP:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFLJ1MPCTUP</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (380, N'No type was specified for the decimal column ''"Total"'' on entity type ''"BankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-21T19:28:58.227' AS DateTime), NULL, N'<properties><property key=''property''>Total</property><property key=''entityType''>BankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>231dea2e-016c-4fa2-8432-8ad23d765eb6</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFLJ1MPCTUP:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFLJ1MPCTUP</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (381, N'No type was specified for the decimal column ''"RentalFeeForOwner"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-21T19:28:58.227' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForOwner</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>231dea2e-016c-4fa2-8432-8ad23d765eb6</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFLJ1MPCTUP:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFLJ1MPCTUP</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (382, N'No type was specified for the decimal column ''"RentalFeeForTennat"'' on entity type ''"Contract"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-21T19:28:58.227' AS DateTime), NULL, N'<properties><property key=''property''>RentalFeeForTennat</property><property key=''entityType''>Contract</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>231dea2e-016c-4fa2-8432-8ad23d765eb6</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFLJ1MPCTUP:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFLJ1MPCTUP</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (383, N'No type was specified for the decimal column ''"Value"'' on entity type ''"HistoryBankAccount"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-21T19:28:58.227' AS DateTime), NULL, N'<properties><property key=''property''>Value</property><property key=''entityType''>HistoryBankAccount</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>231dea2e-016c-4fa2-8432-8ad23d765eb6</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFLJ1MPCTUP:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFLJ1MPCTUP</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (384, N'No type was specified for the decimal column ''"Area"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-21T19:28:58.227' AS DateTime), NULL, N'<properties><property key=''property''>Area</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>231dea2e-016c-4fa2-8432-8ad23d765eb6</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFLJ1MPCTUP:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFLJ1MPCTUP</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (385, N'No type was specified for the decimal column ''"FeeCompany"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-21T19:28:58.227' AS DateTime), NULL, N'<properties><property key=''property''>FeeCompany</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>231dea2e-016c-4fa2-8432-8ad23d765eb6</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFLJ1MPCTUP:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFLJ1MPCTUP</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (386, N'No type was specified for the decimal column ''"FinalPrice"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-21T19:28:58.227' AS DateTime), NULL, N'<properties><property key=''property''>FinalPrice</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>231dea2e-016c-4fa2-8432-8ad23d765eb6</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFLJ1MPCTUP:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFLJ1MPCTUP</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (387, N'No type was specified for the decimal column ''"Percentage"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-21T19:28:58.227' AS DateTime), NULL, N'<properties><property key=''property''>Percentage</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>231dea2e-016c-4fa2-8432-8ad23d765eb6</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFLJ1MPCTUP:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFLJ1MPCTUP</property></properties>')
INSERT [dbo].[Logs] ([Id], [Message], [MessageTemplate], [Level], [TimeStamp], [Exception], [Properties]) VALUES (388, N'No type was specified for the decimal column ''"PriceOwner"'' on entity type ''"Property"''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'No type was specified for the decimal column ''{property}'' on entity type ''{entityType}''. This will cause values to be silently truncated if they do not fit in the default precision and scale. Explicitly specify the SQL server column type that can accommodate all the values using ''ForHasColumnType()''.', N'Warning', CAST(N'2022-02-21T19:28:58.227' AS DateTime), NULL, N'<properties><property key=''property''>PriceOwner</property><property key=''entityType''>Property</property><property key=''EventId''><structure type=''''><property key=''Id''>30000</property><property key=''Name''>Microsoft.EntityFrameworkCore.Model.Validation.DecimalTypeDefaultWarning</property></structure></property><property key=''SourceContext''>Microsoft.EntityFrameworkCore.Model.Validation</property><property key=''ActionId''>231dea2e-016c-4fa2-8432-8ad23d765eb6</property><property key=''ActionName''>API.Controllers.AuthenticationController.Validate (API)</property><property key=''RequestId''>0HMFLJ1MPCTUP:00000002</property><property key=''RequestPath''>/authentication</property><property key=''CorrelationId''></property><property key=''ConnectionId''>0HMFLJ1MPCTUP</property></properties>')
SET IDENTITY_INSERT [dbo].[Logs] OFF
GO
SET IDENTITY_INSERT [Users].[Role] ON 

INSERT [Users].[Role] ([RoleId], [Name]) VALUES (1, N'SuperAdmin')
INSERT [Users].[Role] ([RoleId], [Name]) VALUES (2, N'CompanyAdmin')
INSERT [Users].[Role] ([RoleId], [Name]) VALUES (3, N'PostUser')
INSERT [Users].[Role] ([RoleId], [Name]) VALUES (4, N'FinanceUser')
INSERT [Users].[Role] ([RoleId], [Name]) VALUES (5, N'ContractUser')
INSERT [Users].[Role] ([RoleId], [Name]) VALUES (6, N'OwnerUser')
INSERT [Users].[Role] ([RoleId], [Name]) VALUES (7, N'PropertyUser')
INSERT [Users].[Role] ([RoleId], [Name]) VALUES (8, N'TennatUser')
INSERT [Users].[Role] ([RoleId], [Name]) VALUES (9, N'SensitiveInfoViewer')
SET IDENTITY_INSERT [Users].[Role] OFF
GO
SET IDENTITY_INSERT [Users].[UserByRole] ON 

INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (1, 6, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (2, 7, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (3, 8, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (4, 9, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (5, 10, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (6, 11, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (7, 12, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (8, 13, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (9, 14, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (10, 15, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (11, 16, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (12, 17, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (13, 18, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (14, 19, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (15, 20, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (16, 21, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (17, 22, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (18, 23, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (19, 24, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (20, 25, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (21, 26, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (22, 27, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (23, 28, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (24, 29, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (25, 30, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (26, 31, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (27, 32, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (28, 33, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (29, 34, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (30, 35, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (31, 36, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (32, 37, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (33, 38, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (34, 39, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (35, 40, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (36, 41, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (37, 42, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (38, 43, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (39, 44, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (40, 45, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (41, 46, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (42, 47, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (43, 48, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (44, 49, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (45, 50, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (46, 51, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (47, 52, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (48, 53, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (49, 54, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (50, 55, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (52, 56, 1)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (53, 57, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (54, 58, 2)
INSERT [Users].[UserByRole] ([UserByRoleId], [UserId], [RoleId]) VALUES (55, 59, 2)
SET IDENTITY_INSERT [Users].[UserByRole] OFF
GO
ALTER TABLE [CodeMono].[User] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [CodeMono].[User] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [CodeMono].[User] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [CodeMono].[UserType] ADD  DEFAULT ((0)) FOR [CreatedBy]
GO
ALTER TABLE [CodeMono].[UserType] ADD  DEFAULT (getdate()) FOR [CreatedAt]
GO
ALTER TABLE [CodeMono].[UserType] ADD  DEFAULT ((1)) FOR [Active]
GO
ALTER TABLE [Altv].[History]  WITH CHECK ADD FOREIGN KEY([LoanId])
REFERENCES [Altv].[Loan] ([LoanId])
GO
ALTER TABLE [Banks].[AccountsToPayContract]  WITH CHECK ADD FOREIGN KEY([AccountsStatusId])
REFERENCES [Banks].[AccountsStatus] ([AccountsStatusId])
GO
ALTER TABLE [Banks].[AccountsToPayContract]  WITH CHECK ADD FOREIGN KEY([CompayId])
REFERENCES [Companies].[Company] ([CompayId])
GO
ALTER TABLE [Banks].[AccountsToPayContract]  WITH CHECK ADD FOREIGN KEY([ContractId])
REFERENCES [Contracts].[Contract] ([ContractId])
GO
ALTER TABLE [Banks].[AccountsToReceivableContract]  WITH CHECK ADD FOREIGN KEY([AccountsStatusId])
REFERENCES [Banks].[AccountsStatus] ([AccountsStatusId])
GO
ALTER TABLE [Banks].[AccountsToReceivableContract]  WITH CHECK ADD FOREIGN KEY([CompayId])
REFERENCES [Companies].[Company] ([CompayId])
GO
ALTER TABLE [Banks].[AccountsToReceivableContract]  WITH CHECK ADD FOREIGN KEY([ContractId])
REFERENCES [Contracts].[Contract] ([ContractId])
GO
ALTER TABLE [Banks].[BankAccount]  WITH CHECK ADD FOREIGN KEY([CompayId])
REFERENCES [Companies].[Company] ([CompayId])
GO
ALTER TABLE [Banks].[HistoryBankAccount]  WITH CHECK ADD FOREIGN KEY([AccountsToPayContractsId])
REFERENCES [Banks].[AccountsToPayContract] ([AccountsToPayContractId])
GO
ALTER TABLE [Banks].[HistoryBankAccount]  WITH CHECK ADD FOREIGN KEY([AccountsToReceivableContractsId])
REFERENCES [Banks].[AccountsToReceivableContract] ([AccountsToReceivableContractId])
GO
ALTER TABLE [Banks].[HistoryBankAccount]  WITH CHECK ADD FOREIGN KEY([BankAccountId])
REFERENCES [Banks].[BankAccount] ([BankAccountId])
GO
ALTER TABLE [Banks].[HistoryBankAccount]  WITH CHECK ADD FOREIGN KEY([CompayId])
REFERENCES [Companies].[Company] ([CompayId])
GO
ALTER TABLE [Banks].[HistoryBankAccount]  WITH CHECK ADD FOREIGN KEY([PaymentTypeId])
REFERENCES [Banks].[PaymentType] ([PaymentTypeId])
GO
ALTER TABLE [Banks].[PaymentType]  WITH CHECK ADD FOREIGN KEY([CompayId])
REFERENCES [Companies].[Company] ([CompayId])
GO
ALTER TABLE [CodeMono].[User]  WITH CHECK ADD FOREIGN KEY([CompanyId])
REFERENCES [Companies].[Company] ([CompayId])
GO
ALTER TABLE [CodeMono].[User]  WITH CHECK ADD  CONSTRAINT [FK_CodeMono_UserTypeId] FOREIGN KEY([UserTypeId])
REFERENCES [CodeMono].[UserType] ([UserTypeId])
GO
ALTER TABLE [CodeMono].[User] CHECK CONSTRAINT [FK_CodeMono_UserTypeId]
GO
ALTER TABLE [Commons].[City]  WITH CHECK ADD FOREIGN KEY([StateId])
REFERENCES [Commons].[State] ([StateId])
GO
ALTER TABLE [Commons].[Neighborhood]  WITH CHECK ADD FOREIGN KEY([ZoneId])
REFERENCES [Commons].[Zone] ([ZoneId])
GO
ALTER TABLE [Commons].[Zone]  WITH CHECK ADD FOREIGN KEY([CityId])
REFERENCES [Commons].[City] ([CityId])
GO
ALTER TABLE [Contracts].[Contract]  WITH CHECK ADD FOREIGN KEY([CompayId])
REFERENCES [Companies].[Company] ([CompayId])
GO
ALTER TABLE [Contracts].[Contract]  WITH CHECK ADD FOREIGN KEY([PropertyId])
REFERENCES [Properties].[Property] ([PropertyId])
GO
ALTER TABLE [Contracts].[Contract]  WITH CHECK ADD FOREIGN KEY([StatusId])
REFERENCES [Contracts].[ContractsStatus] ([ContractsStatusId])
GO
ALTER TABLE [Contracts].[Contract]  WITH CHECK ADD FOREIGN KEY([TenantId])
REFERENCES [Tenants].[Tenant] ([TenantId])
GO
ALTER TABLE [Contracts].[TenantsByContract]  WITH CHECK ADD FOREIGN KEY([TenantId])
REFERENCES [Tenants].[Tenant] ([TenantId])
GO
ALTER TABLE [Owners].[Owner]  WITH CHECK ADD FOREIGN KEY([CompayId])
REFERENCES [Companies].[Company] ([CompayId])
GO
ALTER TABLE [Properties].[Images]  WITH CHECK ADD FOREIGN KEY([PropertyId])
REFERENCES [Properties].[Property] ([PropertyId])
GO
ALTER TABLE [Properties].[Property]  WITH CHECK ADD FOREIGN KEY([CityId])
REFERENCES [Commons].[City] ([CityId])
GO
ALTER TABLE [Properties].[Property]  WITH CHECK ADD FOREIGN KEY([CompayId])
REFERENCES [Companies].[Company] ([CompayId])
GO
ALTER TABLE [Properties].[Property]  WITH CHECK ADD FOREIGN KEY([IdIva])
REFERENCES [Properties].[Iva] ([IvaId])
GO
ALTER TABLE [Properties].[Property]  WITH CHECK ADD FOREIGN KEY([OwnerId])
REFERENCES [Owners].[Owner] ([OwnerId])
GO
ALTER TABLE [Properties].[Property]  WITH CHECK ADD FOREIGN KEY([PropertyStatusId])
REFERENCES [Properties].[PropertyStatus] ([PropertyStatusId])
GO
ALTER TABLE [Properties].[Property]  WITH CHECK ADD FOREIGN KEY([PropertyCategoryId])
REFERENCES [Properties].[PropertyCategory] ([PropertyCategoryId])
GO
ALTER TABLE [Properties].[Property]  WITH CHECK ADD FOREIGN KEY([TypeOfferId])
REFERENCES [Properties].[TypeOffer] ([TypeOfferId])
GO
ALTER TABLE [Properties].[Property]  WITH CHECK ADD FOREIGN KEY([ZoneId])
REFERENCES [Commons].[Zone] ([ZoneId])
GO
ALTER TABLE [Tenants].[Tenant]  WITH CHECK ADD FOREIGN KEY([CompayId])
REFERENCES [Companies].[Company] ([CompayId])
GO
ALTER TABLE [Users].[UserByRole]  WITH CHECK ADD FOREIGN KEY([RoleId])
REFERENCES [Users].[Role] ([RoleId])
GO
ALTER TABLE [Users].[UserByRole]  WITH CHECK ADD FOREIGN KEY([UserId])
REFERENCES [CodeMono].[User] ([UserId])
GO
/****** Object:  StoredProcedure [Banks].[AccountsStatus_CREATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[AccountsStatus_CREATE]
	@Option             TINYINT = NULL,
	@AccountsStatusName NVARCHAR(50)
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedAccountsStatusId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Banks.AccountsStatus (AccountsStatusName)
							VALUES (@AccountsStatusName)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedAccountsStatusId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedAccountsStatusId AccountsStatusId
	-- EXEC Banks.AccountsStatus_CREATE @Option = null, @AccountsStatusName = null
END
GO
/****** Object:  StoredProcedure [Banks].[AccountsStatus_DELETE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[AccountsStatus_DELETE]
	@AccountsStatusId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Banks.AccountsStatus WHERE AccountsStatusId = @AccountsStatusId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Banks.AccountsStatus
		WHERE  AccountsStatusId = @AccountsStatusId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @AccountsStatusId AccountsStatusId
	-- EXEC Banks.AccountsStatus_DELETE @AccountsStatusId = null
END
GO
/****** Object:  StoredProcedure [Banks].[AccountsStatus_DISABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[AccountsStatus_DISABLE]
	@AccountsStatusId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Banks.AccountsStatus WHERE AccountsStatusId = @AccountsStatusId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Banks.AccountsStatus WHERE AccountsStatusId = @AccountsStatusId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Banks.AccountsStatus
		SET		
		WHERE	Active = 1
		  AND 	AccountsStatusId = @AccountsStatusId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @AccountsStatusId AccountsStatusId
	-- EXEC Banks.AccountsStatus_DISABLE @AccountsStatusId = null
END
GO
/****** Object:  StoredProcedure [Banks].[AccountsStatus_ENABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[AccountsStatus_ENABLE]
	@AccountsStatusId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Banks.AccountsStatus WHERE AccountsStatusId = @AccountsStatusId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Banks.AccountsStatus WHERE AccountsStatusId = @AccountsStatusId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Banks.AccountsStatus
		SET		
		WHERE	Active = 0
		  AND 	AccountsStatusId = @AccountsStatusId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @AccountsStatusId AccountsStatusId
	-- EXEC Banks.AccountsStatus_ENABLE @AccountsStatusId = null
END
GO
/****** Object:  StoredProcedure [Banks].[AccountsStatus_LIST]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[AccountsStatus_LIST]
	@Option             TINYINT = NULL,
	@AccountsStatusId   INT = NULL,
	@AccountsStatusName NVARCHAR(50) = ''
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.AccountsStatusId AccountsStatusId, a.AccountsStatusName AccountsStatusName
		FROM 	Banks.AccountsStatus a
		WHERE 	(@AccountsStatusId   IS NULL OR a.AccountsStatusId = @AccountsStatusId)
		  AND 	(ISNULL(@AccountsStatusName, '') = ''    OR a.AccountsStatusName LIKE '%' + TRIM(@AccountsStatusName) + '%')
	END

	-- EXEC Banks.AccountsStatus_LIST @Option = null, @AccountsStatusId = null, @AccountsStatusName = ''
END
GO
/****** Object:  StoredProcedure [Banks].[AccountsStatus_READ]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	IF OBJECT_ID('Banks.AccountsStatus_READ', 'P') IS NOT NULL DROP PROCEDURE Banks.AccountsStatus_READ
	IF OBJECT_ID('Banks.AccountsStatus_LIST', 'P') IS NOT NULL DROP PROCEDURE Banks.AccountsStatus_LIST
	IF OBJECT_ID('Banks.AccountsStatus_CREATE', 'P') IS NOT NULL DROP PROCEDURE Banks.AccountsStatus_CREATE
	IF OBJECT_ID('Banks.AccountsStatus_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Banks.AccountsStatus_UPDATE
	IF OBJECT_ID('Banks.AccountsStatus_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Banks.AccountsStatus_ENABLE
	IF OBJECT_ID('Banks.AccountsStatus_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Banks.AccountsStatus_DISABLE
	IF OBJECT_ID('Banks.AccountsStatus_DELETE', 'P') IS NOT NULL DROP PROCEDURE Banks.AccountsStatus_DELETE
*/

CREATE PROCEDURE [Banks].[AccountsStatus_READ]
	@Option             TINYINT = NULL,
	@AccountsStatusId   INT = NULL,
	@AccountsStatusName NVARCHAR(50) = ''
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.AccountsStatusId, a.AccountsStatusName
		FROM 	Banks.AccountsStatus a
		WHERE 	(@AccountsStatusId   IS NULL OR a.AccountsStatusId = @AccountsStatusId)
		  AND 	(ISNULL(@AccountsStatusName, '') = ''    OR a.AccountsStatusName LIKE '%' + TRIM(@AccountsStatusName) + '%')
	END

	-- EXEC Banks.AccountsStatus_READ @Option = null, @AccountsStatusId = null, @AccountsStatusName = ''
END
GO
/****** Object:  StoredProcedure [Banks].[AccountsStatus_UPDATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[AccountsStatus_UPDATE]
	@Option             TINYINT = NULL,
	@AccountsStatusId   INT,
	@AccountsStatusName NVARCHAR(50)
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	
	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			IF NOT EXISTS(SELECT 1 FROM Banks.AccountsStatus WHERE AccountsStatusId = @AccountsStatusId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Banks.AccountsStatus
			SET 	AccountsStatusName = @AccountsStatusName
			WHERE 	AccountsStatusId = @AccountsStatusId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @AccountsStatusId AccountsStatusId
	-- EXEC Banks.AccountsStatus_UPDATE @Option = null, @AccountsStatusId = null, @AccountsStatusName = null
END
GO
/****** Object:  StoredProcedure [Banks].[AccountsToPayContract_CREATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[AccountsToPayContract_CREATE]
	@Option           TINYINT = NULL,
	@QuotaNumber      INT,
	@Value            DECIMAL,
	@ExpirationDate   DATE,
	@AccountsStatusId INT,
	@ContractId       INT,
	@CompayId         INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedAccountsToPayContractId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Banks.AccountsToPayContract (QuotaNumber, Value, ExpirationDate, AccountsStatusId, ContractId,
								CompayId)
							VALUES (@QuotaNumber, @Value, @ExpirationDate, @AccountsStatusId, @ContractId,
								@CompayId)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedAccountsToPayContractId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedAccountsToPayContractId AccountsToPayContractId
	-- EXEC Banks.AccountsToPayContract_CREATE @Option = null, @QuotaNumber = null, @Value = null, @ExpirationDate = null, @AccountsStatusId = null, @ContractId = null, @CompayId = null
END
GO
/****** Object:  StoredProcedure [Banks].[AccountsToPayContract_DELETE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[AccountsToPayContract_DELETE]
	@AccountsToPayContractId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Banks.AccountsToPayContract WHERE AccountsToPayContractId = @AccountsToPayContractId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Banks.AccountsToPayContract
		WHERE  AccountsToPayContractId = @AccountsToPayContractId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @AccountsToPayContractId AccountsToPayContractId
	-- EXEC Banks.AccountsToPayContract_DELETE @AccountsToPayContractId = null
END
GO
/****** Object:  StoredProcedure [Banks].[AccountsToPayContract_DISABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[AccountsToPayContract_DISABLE]
	@AccountsToPayContractId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Banks.AccountsToPayContract WHERE AccountsToPayContractId = @AccountsToPayContractId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Banks.AccountsToPayContract WHERE AccountsToPayContractId = @AccountsToPayContractId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Banks.AccountsToPayContract
		SET		
		WHERE	Active = 1
		  AND 	AccountsToPayContractId = @AccountsToPayContractId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @AccountsToPayContractId AccountsToPayContractId
	-- EXEC Banks.AccountsToPayContract_DISABLE @AccountsToPayContractId = null
END
GO
/****** Object:  StoredProcedure [Banks].[AccountsToPayContract_ENABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[AccountsToPayContract_ENABLE]
	@AccountsToPayContractId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Banks.AccountsToPayContract WHERE AccountsToPayContractId = @AccountsToPayContractId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Banks.AccountsToPayContract WHERE AccountsToPayContractId = @AccountsToPayContractId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Banks.AccountsToPayContract
		SET		
		WHERE	Active = 0
		  AND 	AccountsToPayContractId = @AccountsToPayContractId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @AccountsToPayContractId AccountsToPayContractId
	-- EXEC Banks.AccountsToPayContract_ENABLE @AccountsToPayContractId = null
END
GO
/****** Object:  StoredProcedure [Banks].[AccountsToPayContract_LIST]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[AccountsToPayContract_LIST]
	@Option                  TINYINT = NULL,
	@AccountsToPayContractId INT = NULL,
	@AccountsStatusId        INT = NULL,
	@ContractId              INT = NULL,
	@CompayId                INT = NULL
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.AccountsToPayContractId AccountsToPayContractId, a.AccountsToPayContractId AccountsToPayContractName
		FROM 	Banks.AccountsToPayContract a
		WHERE 	(@AccountsToPayContractId IS NULL OR a.AccountsToPayContractId = @AccountsToPayContractId)
		  AND 	(@AccountsStatusId        IS NULL OR a.AccountsStatusId = @AccountsStatusId)
		  AND 	(@ContractId              IS NULL OR a.ContractId = @ContractId)
		  AND 	(@CompayId                IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Banks.AccountsToPayContract_LIST @Option = null, @AccountsToPayContractId = null, @AccountsStatusId = null, @ContractId = null, @CompayId = null
END
GO
/****** Object:  StoredProcedure [Banks].[AccountsToPayContract_READ]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	IF OBJECT_ID('Banks.AccountsToPayContract_READ', 'P') IS NOT NULL DROP PROCEDURE Banks.AccountsToPayContract_READ
	IF OBJECT_ID('Banks.AccountsToPayContract_LIST', 'P') IS NOT NULL DROP PROCEDURE Banks.AccountsToPayContract_LIST
	IF OBJECT_ID('Banks.AccountsToPayContract_CREATE', 'P') IS NOT NULL DROP PROCEDURE Banks.AccountsToPayContract_CREATE
	IF OBJECT_ID('Banks.AccountsToPayContract_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Banks.AccountsToPayContract_UPDATE
	IF OBJECT_ID('Banks.AccountsToPayContract_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Banks.AccountsToPayContract_ENABLE
	IF OBJECT_ID('Banks.AccountsToPayContract_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Banks.AccountsToPayContract_DISABLE
	IF OBJECT_ID('Banks.AccountsToPayContract_DELETE', 'P') IS NOT NULL DROP PROCEDURE Banks.AccountsToPayContract_DELETE
*/

CREATE PROCEDURE [Banks].[AccountsToPayContract_READ]
	@Option                  TINYINT = NULL,
	@AccountsToPayContractId INT = NULL,
	@AccountsStatusId        INT = NULL,
	@ContractId              INT = NULL,
	@CompayId                INT = NULL
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.AccountsToPayContractId, a.QuotaNumber, a.Value, a.ExpirationDate, a.AccountsStatusId, 
				a.ContractId, a.CompayId
		FROM 	Banks.AccountsToPayContract a
		WHERE 	(@AccountsToPayContractId IS NULL OR a.AccountsToPayContractId = @AccountsToPayContractId)
		  AND 	(@AccountsStatusId        IS NULL OR a.AccountsStatusId = @AccountsStatusId)
		  AND 	(@ContractId              IS NULL OR a.ContractId = @ContractId)
		  AND 	(@CompayId                IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Banks.AccountsToPayContract_READ @Option = null, @AccountsToPayContractId = null, @AccountsStatusId = null, @ContractId = null, @CompayId = null
END
GO
/****** Object:  StoredProcedure [Banks].[AccountsToPayContract_UPDATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[AccountsToPayContract_UPDATE]
	@Option                  TINYINT = NULL,
	@AccountsToPayContractId INT,
	@QuotaNumber             INT,
	@Value                   DECIMAL,
	@ExpirationDate          DATE,
	@AccountsStatusId        INT,
	@ContractId              INT,
	@CompayId                INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	
	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			IF NOT EXISTS(SELECT 1 FROM Banks.AccountsToPayContract WHERE AccountsToPayContractId = @AccountsToPayContractId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Banks.AccountsToPayContract
			SET 	QuotaNumber             = @QuotaNumber,
					Value                   = @Value,
					ExpirationDate          = @ExpirationDate,
					AccountsStatusId        = @AccountsStatusId,
					ContractId              = @ContractId,
					CompayId                = @CompayId
			WHERE 	AccountsToPayContractId = @AccountsToPayContractId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @AccountsToPayContractId AccountsToPayContractId
	-- EXEC Banks.AccountsToPayContract_UPDATE @Option = null, @AccountsToPayContractId = null, @QuotaNumber = null, @Value = null, @ExpirationDate = null, @AccountsStatusId = null, @ContractId = null, @CompayId = null
END
GO
/****** Object:  StoredProcedure [Banks].[AccountsToReceivableContract_CREATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[AccountsToReceivableContract_CREATE]
	@Option           TINYINT = NULL,
	@QuotaNumber      INT,
	@Value            DECIMAL,
	@ExpirationDate   DATE,
	@AccountsStatusId INT,
	@ContractId       INT,
	@CompayId         INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedAccountsToReceivableContractId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Banks.AccountsToReceivableContract (QuotaNumber, Value, ExpirationDate, AccountsStatusId, ContractId,
								CompayId)
							VALUES (@QuotaNumber, @Value, @ExpirationDate, @AccountsStatusId, @ContractId,
								@CompayId)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedAccountsToReceivableContractId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedAccountsToReceivableContractId AccountsToReceivableContractId
	-- EXEC Banks.AccountsToReceivableContract_CREATE @Option = null, @QuotaNumber = null, @Value = null, @ExpirationDate = null, @AccountsStatusId = null, @ContractId = null, @CompayId = null
END
GO
/****** Object:  StoredProcedure [Banks].[AccountsToReceivableContract_DELETE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[AccountsToReceivableContract_DELETE]
	@AccountsToReceivableContractId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Banks.AccountsToReceivableContract WHERE AccountsToReceivableContractId = @AccountsToReceivableContractId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Banks.AccountsToReceivableContract
		WHERE  AccountsToReceivableContractId = @AccountsToReceivableContractId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @AccountsToReceivableContractId AccountsToReceivableContractId
	-- EXEC Banks.AccountsToReceivableContract_DELETE @AccountsToReceivableContractId = null
END
GO
/****** Object:  StoredProcedure [Banks].[AccountsToReceivableContract_DISABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[AccountsToReceivableContract_DISABLE]
	@AccountsToReceivableContractId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Banks.AccountsToReceivableContract WHERE AccountsToReceivableContractId = @AccountsToReceivableContractId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Banks.AccountsToReceivableContract WHERE AccountsToReceivableContractId = @AccountsToReceivableContractId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Banks.AccountsToReceivableContract
		SET		
		WHERE	Active = 1
		  AND 	AccountsToReceivableContractId = @AccountsToReceivableContractId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @AccountsToReceivableContractId AccountsToReceivableContractId
	-- EXEC Banks.AccountsToReceivableContract_DISABLE @AccountsToReceivableContractId = null
END
GO
/****** Object:  StoredProcedure [Banks].[AccountsToReceivableContract_ENABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[AccountsToReceivableContract_ENABLE]
	@AccountsToReceivableContractId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Banks.AccountsToReceivableContract WHERE AccountsToReceivableContractId = @AccountsToReceivableContractId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Banks.AccountsToReceivableContract WHERE AccountsToReceivableContractId = @AccountsToReceivableContractId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Banks.AccountsToReceivableContract
		SET		
		WHERE	Active = 0
		  AND 	AccountsToReceivableContractId = @AccountsToReceivableContractId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @AccountsToReceivableContractId AccountsToReceivableContractId
	-- EXEC Banks.AccountsToReceivableContract_ENABLE @AccountsToReceivableContractId = null
END
GO
/****** Object:  StoredProcedure [Banks].[AccountsToReceivableContract_LIST]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[AccountsToReceivableContract_LIST]
	@Option                         TINYINT = NULL,
	@AccountsToReceivableContractId INT = NULL,
	@AccountsStatusId               INT = NULL,
	@ContractId                     INT = NULL,
	@CompayId                       INT = NULL
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.AccountsToReceivableContractId AccountsToReceivableContractId, a.AccountsToReceivableContractId AccountsToReceivableContractName
		FROM 	Banks.AccountsToReceivableContract a
		WHERE 	(@AccountsToReceivableContractId IS NULL OR a.AccountsToReceivableContractId = @AccountsToReceivableContractId)
		  AND 	(@AccountsStatusId               IS NULL OR a.AccountsStatusId = @AccountsStatusId)
		  AND 	(@ContractId                     IS NULL OR a.ContractId = @ContractId)
		  AND 	(@CompayId                       IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Banks.AccountsToReceivableContract_LIST @Option = null, @AccountsToReceivableContractId = null, @AccountsStatusId = null, @ContractId = null, @CompayId = null
END
GO
/****** Object:  StoredProcedure [Banks].[AccountsToReceivableContract_READ]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
	IF OBJECT_ID('Banks.AccountsToReceivableContract_READ', 'P') IS NOT NULL DROP PROCEDURE Banks.AccountsToReceivableContract_READ
	IF OBJECT_ID('Banks.AccountsToReceivableContract_LIST', 'P') IS NOT NULL DROP PROCEDURE Banks.AccountsToReceivableContract_LIST
	IF OBJECT_ID('Banks.AccountsToReceivableContract_CREATE', 'P') IS NOT NULL DROP PROCEDURE Banks.AccountsToReceivableContract_CREATE
	IF OBJECT_ID('Banks.AccountsToReceivableContract_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Banks.AccountsToReceivableContract_UPDATE
	IF OBJECT_ID('Banks.AccountsToReceivableContract_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Banks.AccountsToReceivableContract_ENABLE
	IF OBJECT_ID('Banks.AccountsToReceivableContract_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Banks.AccountsToReceivableContract_DISABLE
	IF OBJECT_ID('Banks.AccountsToReceivableContract_DELETE', 'P') IS NOT NULL DROP PROCEDURE Banks.AccountsToReceivableContract_DELETE
*/

CREATE PROCEDURE [Banks].[AccountsToReceivableContract_READ]
	@Option                         TINYINT = NULL,
	@AccountsToReceivableContractId INT = NULL,
	@AccountsStatusId               INT = NULL,
	@ContractId                     INT = NULL,
	@CompayId                       INT = NULL
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.AccountsToReceivableContractId, a.QuotaNumber, a.Value, a.ExpirationDate, a.AccountsStatusId, 
				a.ContractId, a.CompayId
		FROM 	Banks.AccountsToReceivableContract a
		WHERE 	(@AccountsToReceivableContractId IS NULL OR a.AccountsToReceivableContractId = @AccountsToReceivableContractId)
		  AND 	(@AccountsStatusId               IS NULL OR a.AccountsStatusId = @AccountsStatusId)
		  AND 	(@ContractId                     IS NULL OR a.ContractId = @ContractId)
		  AND 	(@CompayId                       IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Banks.AccountsToReceivableContract_READ @Option = null, @AccountsToReceivableContractId = null, @AccountsStatusId = null, @ContractId = null, @CompayId = null
END
GO
/****** Object:  StoredProcedure [Banks].[AccountsToReceivableContract_UPDATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[AccountsToReceivableContract_UPDATE]
	@Option                         TINYINT = NULL,
	@AccountsToReceivableContractId INT,
	@QuotaNumber                    INT,
	@Value                          DECIMAL,
	@ExpirationDate                 DATE,
	@AccountsStatusId               INT,
	@ContractId                     INT,
	@CompayId                       INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	
	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			IF NOT EXISTS(SELECT 1 FROM Banks.AccountsToReceivableContract WHERE AccountsToReceivableContractId = @AccountsToReceivableContractId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Banks.AccountsToReceivableContract
			SET 	QuotaNumber                    = @QuotaNumber,
					Value                          = @Value,
					ExpirationDate                 = @ExpirationDate,
					AccountsStatusId               = @AccountsStatusId,
					ContractId                     = @ContractId,
					CompayId                       = @CompayId
			WHERE 	AccountsToReceivableContractId = @AccountsToReceivableContractId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @AccountsToReceivableContractId AccountsToReceivableContractId
	-- EXEC Banks.AccountsToReceivableContract_UPDATE @Option = null, @AccountsToReceivableContractId = null, @QuotaNumber = null, @Value = null, @ExpirationDate = null, @AccountsStatusId = null, @ContractId = null, @CompayId = null
END
GO
/****** Object:  StoredProcedure [Banks].[BankAccount_CREATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[BankAccount_CREATE]
	@Option          TINYINT = NULL,
	@BankAccountName NVARCHAR(50),
	@Total           DECIMAL,
	@CompayId        INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedBankAccountId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Banks.BankAccount (BankAccountName, Total, CompayId)
							VALUES (@BankAccountName, @Total, @CompayId)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedBankAccountId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedBankAccountId BankAccountId
	-- EXEC Banks.BankAccount_CREATE @Option = null, @BankAccountName = null, @Total = null, @CompayId = null
END
GO
/****** Object:  StoredProcedure [Banks].[BankAccount_DELETE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[BankAccount_DELETE]
	@BankAccountId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Banks.BankAccount WHERE BankAccountId = @BankAccountId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Banks.BankAccount
		WHERE  BankAccountId = @BankAccountId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @BankAccountId BankAccountId
	-- EXEC Banks.BankAccount_DELETE @BankAccountId = null
END
GO
/****** Object:  StoredProcedure [Banks].[BankAccount_DISABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[BankAccount_DISABLE]
	@BankAccountId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Banks.BankAccount WHERE BankAccountId = @BankAccountId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Banks.BankAccount WHERE BankAccountId = @BankAccountId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Banks.BankAccount
		SET		
		WHERE	Active = 1
		  AND 	BankAccountId = @BankAccountId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @BankAccountId BankAccountId
	-- EXEC Banks.BankAccount_DISABLE @BankAccountId = null
END
GO
/****** Object:  StoredProcedure [Banks].[BankAccount_ENABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[BankAccount_ENABLE]
	@BankAccountId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Banks.BankAccount WHERE BankAccountId = @BankAccountId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Banks.BankAccount WHERE BankAccountId = @BankAccountId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Banks.BankAccount
		SET		
		WHERE	Active = 0
		  AND 	BankAccountId = @BankAccountId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @BankAccountId BankAccountId
	-- EXEC Banks.BankAccount_ENABLE @BankAccountId = null
END
GO
/****** Object:  StoredProcedure [Banks].[BankAccount_LIST]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[BankAccount_LIST]
	@Option          TINYINT = NULL,
	@BankAccountId   INT = NULL,
	@BankAccountName NVARCHAR(50) = '',
	@CompayId        INT = NULL
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.BankAccountId BankAccountId, a.BankAccountName BankAccountName
		FROM 	Banks.BankAccount a
		WHERE 	(@BankAccountId   IS NULL OR a.BankAccountId = @BankAccountId)
		  AND 	(ISNULL(@BankAccountName, '') = ''    OR a.BankAccountName LIKE '%' + TRIM(@BankAccountName) + '%')
		  AND 	(@CompayId        IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Banks.BankAccount_LIST @Option = null, @BankAccountId = null, @BankAccountName = '', @CompayId = null
END
GO
/****** Object:  StoredProcedure [Banks].[BankAccount_READ]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	IF OBJECT_ID('Banks.BankAccount_READ', 'P') IS NOT NULL DROP PROCEDURE Banks.BankAccount_READ
	IF OBJECT_ID('Banks.BankAccount_LIST', 'P') IS NOT NULL DROP PROCEDURE Banks.BankAccount_LIST
	IF OBJECT_ID('Banks.BankAccount_CREATE', 'P') IS NOT NULL DROP PROCEDURE Banks.BankAccount_CREATE
	IF OBJECT_ID('Banks.BankAccount_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Banks.BankAccount_UPDATE
	IF OBJECT_ID('Banks.BankAccount_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Banks.BankAccount_ENABLE
	IF OBJECT_ID('Banks.BankAccount_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Banks.BankAccount_DISABLE
	IF OBJECT_ID('Banks.BankAccount_DELETE', 'P') IS NOT NULL DROP PROCEDURE Banks.BankAccount_DELETE
*/

CREATE PROCEDURE [Banks].[BankAccount_READ]
	@Option          TINYINT = NULL,
	@BankAccountId   INT = NULL,
	@BankAccountName NVARCHAR(50) = '',
	@CompayId        INT = NULL
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.BankAccountId, a.BankAccountName, a.Total, a.CompayId
		FROM 	Banks.BankAccount a
		WHERE 	(@BankAccountId   IS NULL OR a.BankAccountId = @BankAccountId)
		  AND 	(ISNULL(@BankAccountName, '') = ''    OR a.BankAccountName LIKE '%' + TRIM(@BankAccountName) + '%')
		  AND 	(@CompayId        IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Banks.BankAccount_READ @Option = null, @BankAccountId = null, @BankAccountName = '', @CompayId = null
END
GO
/****** Object:  StoredProcedure [Banks].[BankAccount_UPDATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[BankAccount_UPDATE]
	@Option          TINYINT = NULL,
	@BankAccountId   INT,
	@BankAccountName NVARCHAR(50),
	@Total           DECIMAL,
	@CompayId        INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	
	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			IF NOT EXISTS(SELECT 1 FROM Banks.BankAccount WHERE BankAccountId = @BankAccountId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Banks.BankAccount
			SET 	BankAccountName = @BankAccountName,
					Total           = @Total,
					CompayId        = @CompayId
			WHERE 	BankAccountId = @BankAccountId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @BankAccountId BankAccountId
	-- EXEC Banks.BankAccount_UPDATE @Option = null, @BankAccountId = null, @BankAccountName = null, @Total = null, @CompayId = null
END
GO
/****** Object:  StoredProcedure [Banks].[HistoryBankAccount_CREATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[HistoryBankAccount_CREATE]
	@Option                          TINYINT = NULL,
	@PaymentTypeId                   INT,
	@Value                           DECIMAL,
	@BankAccountId                   INT,
	@AccountsToPayContractsId        INT,
	@AccountsToReceivableContractsId INT,
	@Obervation                      NVARCHAR(500),
	@CompayId                        INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedHistoryBankAccountId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Banks.HistoryBankAccount (PaymentTypeId, Value, BankAccountId, AccountsToPayContractsId, AccountsToReceivableContractsId,
								Obervation, CompayId)
							VALUES (@PaymentTypeId, @Value, @BankAccountId, @AccountsToPayContractsId, @AccountsToReceivableContractsId,
								@Obervation, @CompayId)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedHistoryBankAccountId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedHistoryBankAccountId HistoryBankAccountId
	-- EXEC Banks.HistoryBankAccount_CREATE @Option = null, @PaymentTypeId = null, @Value = null, @BankAccountId = null, @AccountsToPayContractsId = null, @AccountsToReceivableContractsId = null, @Obervation = null, @CompayId = null
END
GO
/****** Object:  StoredProcedure [Banks].[HistoryBankAccount_DELETE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[HistoryBankAccount_DELETE]
	@HistoryBankAccountId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Banks.HistoryBankAccount WHERE HistoryBankAccountId = @HistoryBankAccountId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Banks.HistoryBankAccount
		WHERE  HistoryBankAccountId = @HistoryBankAccountId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @HistoryBankAccountId HistoryBankAccountId
	-- EXEC Banks.HistoryBankAccount_DELETE @HistoryBankAccountId = null
END
GO
/****** Object:  StoredProcedure [Banks].[HistoryBankAccount_DISABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[HistoryBankAccount_DISABLE]
	@HistoryBankAccountId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Banks.HistoryBankAccount WHERE HistoryBankAccountId = @HistoryBankAccountId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Banks.HistoryBankAccount WHERE HistoryBankAccountId = @HistoryBankAccountId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Banks.HistoryBankAccount
		SET		
		WHERE	Active = 1
		  AND 	HistoryBankAccountId = @HistoryBankAccountId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @HistoryBankAccountId HistoryBankAccountId
	-- EXEC Banks.HistoryBankAccount_DISABLE @HistoryBankAccountId = null
END
GO
/****** Object:  StoredProcedure [Banks].[HistoryBankAccount_ENABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[HistoryBankAccount_ENABLE]
	@HistoryBankAccountId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Banks.HistoryBankAccount WHERE HistoryBankAccountId = @HistoryBankAccountId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Banks.HistoryBankAccount WHERE HistoryBankAccountId = @HistoryBankAccountId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Banks.HistoryBankAccount
		SET		
		WHERE	Active = 0
		  AND 	HistoryBankAccountId = @HistoryBankAccountId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @HistoryBankAccountId HistoryBankAccountId
	-- EXEC Banks.HistoryBankAccount_ENABLE @HistoryBankAccountId = null
END
GO
/****** Object:  StoredProcedure [Banks].[HistoryBankAccount_LIST]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[HistoryBankAccount_LIST]
	@Option                          TINYINT = NULL,
	@HistoryBankAccountId            INT = NULL,
	@PaymentTypeId                   INT = NULL,
	@BankAccountId                   INT = NULL,
	@AccountsToPayContractsId        INT = NULL,
	@AccountsToReceivableContractsId INT = NULL,
	@Obervation                      NVARCHAR(500) = '',
	@CompayId                        INT = NULL
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.HistoryBankAccountId HistoryBankAccountId, a.HistoryBankAccountId HistoryBankAccountName
		FROM 	Banks.HistoryBankAccount a
		WHERE 	(@HistoryBankAccountId            IS NULL OR a.HistoryBankAccountId = @HistoryBankAccountId)
		  AND 	(@PaymentTypeId                   IS NULL OR a.PaymentTypeId = @PaymentTypeId)
		  AND 	(@BankAccountId                   IS NULL OR a.BankAccountId = @BankAccountId)
		  AND 	(@AccountsToPayContractsId        IS NULL OR a.AccountsToPayContractsId = @AccountsToPayContractsId)
		  AND 	(@AccountsToReceivableContractsId IS NULL OR a.AccountsToReceivableContractsId = @AccountsToReceivableContractsId)
		  AND 	(ISNULL(@Obervation, '')                      = ''    OR a.Obervation LIKE '%' + TRIM(@Obervation) + '%')
		  AND 	(@CompayId                        IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Banks.HistoryBankAccount_LIST @Option = null, @HistoryBankAccountId = null, @PaymentTypeId = null, @BankAccountId = null, @AccountsToPayContractsId = null, @AccountsToReceivableContractsId = null, @Obervation = '', @CompayId = null
END
GO
/****** Object:  StoredProcedure [Banks].[HistoryBankAccount_READ]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
	IF OBJECT_ID('Banks.HistoryBankAccount_READ', 'P') IS NOT NULL DROP PROCEDURE Banks.HistoryBankAccount_READ
	IF OBJECT_ID('Banks.HistoryBankAccount_LIST', 'P') IS NOT NULL DROP PROCEDURE Banks.HistoryBankAccount_LIST
	IF OBJECT_ID('Banks.HistoryBankAccount_CREATE', 'P') IS NOT NULL DROP PROCEDURE Banks.HistoryBankAccount_CREATE
	IF OBJECT_ID('Banks.HistoryBankAccount_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Banks.HistoryBankAccount_UPDATE
	IF OBJECT_ID('Banks.HistoryBankAccount_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Banks.HistoryBankAccount_ENABLE
	IF OBJECT_ID('Banks.HistoryBankAccount_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Banks.HistoryBankAccount_DISABLE
	IF OBJECT_ID('Banks.HistoryBankAccount_DELETE', 'P') IS NOT NULL DROP PROCEDURE Banks.HistoryBankAccount_DELETE
*/

CREATE PROCEDURE [Banks].[HistoryBankAccount_READ]
	@Option                          TINYINT = NULL,
	@HistoryBankAccountId            INT = NULL,
	@PaymentTypeId                   INT = NULL,
	@BankAccountId                   INT = NULL,
	@AccountsToPayContractsId        INT = NULL,
	@AccountsToReceivableContractsId INT = NULL,
	@Obervation                      NVARCHAR(500) = '',
	@CompayId                        INT = NULL
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.HistoryBankAccountId, a.PaymentTypeId, a.Value, a.BankAccountId, a.AccountsToPayContractsId, 
				a.AccountsToReceivableContractsId, a.Obervation, a.CompayId
		FROM 	Banks.HistoryBankAccount a
		WHERE 	(@HistoryBankAccountId            IS NULL OR a.HistoryBankAccountId = @HistoryBankAccountId)
		  AND 	(@PaymentTypeId                   IS NULL OR a.PaymentTypeId = @PaymentTypeId)
		  AND 	(@BankAccountId                   IS NULL OR a.BankAccountId = @BankAccountId)
		  AND 	(@AccountsToPayContractsId        IS NULL OR a.AccountsToPayContractsId = @AccountsToPayContractsId)
		  AND 	(@AccountsToReceivableContractsId IS NULL OR a.AccountsToReceivableContractsId = @AccountsToReceivableContractsId)
		  AND 	(ISNULL(@Obervation, '')                      = ''    OR a.Obervation LIKE '%' + TRIM(@Obervation) + '%')
		  AND 	(@CompayId                        IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Banks.HistoryBankAccount_READ @Option = null, @HistoryBankAccountId = null, @PaymentTypeId = null, @BankAccountId = null, @AccountsToPayContractsId = null, @AccountsToReceivableContractsId = null, @Obervation = '', @CompayId = null
END
GO
/****** Object:  StoredProcedure [Banks].[HistoryBankAccount_UPDATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[HistoryBankAccount_UPDATE]
	@Option                          TINYINT = NULL,
	@HistoryBankAccountId            INT,
	@PaymentTypeId                   INT,
	@Value                           DECIMAL,
	@BankAccountId                   INT,
	@AccountsToPayContractsId        INT,
	@AccountsToReceivableContractsId INT,
	@Obervation                      NVARCHAR(500),
	@CompayId                        INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	
	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			IF NOT EXISTS(SELECT 1 FROM Banks.HistoryBankAccount WHERE HistoryBankAccountId = @HistoryBankAccountId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Banks.HistoryBankAccount
			SET 	PaymentTypeId                   = @PaymentTypeId,
					Value                           = @Value,
					BankAccountId                   = @BankAccountId,
					AccountsToPayContractsId        = @AccountsToPayContractsId,
					AccountsToReceivableContractsId = @AccountsToReceivableContractsId,
					Obervation                      = @Obervation,
					CompayId                        = @CompayId
			WHERE 	HistoryBankAccountId = @HistoryBankAccountId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @HistoryBankAccountId HistoryBankAccountId
	-- EXEC Banks.HistoryBankAccount_UPDATE @Option = null, @HistoryBankAccountId = null, @PaymentTypeId = null, @Value = null, @BankAccountId = null, @AccountsToPayContractsId = null, @AccountsToReceivableContractsId = null, @Obervation = null, @CompayId = null
END
GO
/****** Object:  StoredProcedure [Banks].[PaymentType_CREATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[PaymentType_CREATE]
	@Option          TINYINT = NULL,
	@PaymentTypeName NVARCHAR(50),
	@CompayId        INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedPaymentTypeId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Banks.PaymentType (PaymentTypeName, CompayId)
							VALUES (@PaymentTypeName, @CompayId)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedPaymentTypeId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedPaymentTypeId PaymentTypeId
	-- EXEC Banks.PaymentType_CREATE @Option = null, @PaymentTypeName = null, @CompayId = null
END
GO
/****** Object:  StoredProcedure [Banks].[PaymentType_DELETE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[PaymentType_DELETE]
	@PaymentTypeId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Banks.PaymentType WHERE PaymentTypeId = @PaymentTypeId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Banks.PaymentType
		WHERE  PaymentTypeId = @PaymentTypeId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @PaymentTypeId PaymentTypeId
	-- EXEC Banks.PaymentType_DELETE @PaymentTypeId = null
END
GO
/****** Object:  StoredProcedure [Banks].[PaymentType_DISABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[PaymentType_DISABLE]
	@PaymentTypeId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Banks.PaymentType WHERE PaymentTypeId = @PaymentTypeId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Banks.PaymentType WHERE PaymentTypeId = @PaymentTypeId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Banks.PaymentType
		SET		
		WHERE	Active = 1
		  AND 	PaymentTypeId = @PaymentTypeId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @PaymentTypeId PaymentTypeId
	-- EXEC Banks.PaymentType_DISABLE @PaymentTypeId = null
END
GO
/****** Object:  StoredProcedure [Banks].[PaymentType_ENABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[PaymentType_ENABLE]
	@PaymentTypeId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Banks.PaymentType WHERE PaymentTypeId = @PaymentTypeId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Banks.PaymentType WHERE PaymentTypeId = @PaymentTypeId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Banks.PaymentType
		SET		
		WHERE	Active = 0
		  AND 	PaymentTypeId = @PaymentTypeId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @PaymentTypeId PaymentTypeId
	-- EXEC Banks.PaymentType_ENABLE @PaymentTypeId = null
END
GO
/****** Object:  StoredProcedure [Banks].[PaymentType_LIST]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[PaymentType_LIST]
	@Option          TINYINT = NULL,
	@PaymentTypeId   INT = NULL,
	@PaymentTypeName NVARCHAR(50) = '',
	@CompayId        INT = NULL
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.PaymentTypeId PaymentTypeId, a.PaymentTypeName PaymentTypeName
		FROM 	Banks.PaymentType a
		WHERE 	(@PaymentTypeId   IS NULL OR a.PaymentTypeId = @PaymentTypeId)
		  AND 	(ISNULL(@PaymentTypeName, '') = ''    OR a.PaymentTypeName LIKE '%' + TRIM(@PaymentTypeName) + '%')
		  AND 	(@CompayId        IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Banks.PaymentType_LIST @Option = null, @PaymentTypeId = null, @PaymentTypeName = '', @CompayId = null
END
GO
/****** Object:  StoredProcedure [Banks].[PaymentType_READ]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
	IF OBJECT_ID('Banks.PaymentType_READ', 'P') IS NOT NULL DROP PROCEDURE Banks.PaymentType_READ
	IF OBJECT_ID('Banks.PaymentType_LIST', 'P') IS NOT NULL DROP PROCEDURE Banks.PaymentType_LIST
	IF OBJECT_ID('Banks.PaymentType_CREATE', 'P') IS NOT NULL DROP PROCEDURE Banks.PaymentType_CREATE
	IF OBJECT_ID('Banks.PaymentType_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Banks.PaymentType_UPDATE
	IF OBJECT_ID('Banks.PaymentType_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Banks.PaymentType_ENABLE
	IF OBJECT_ID('Banks.PaymentType_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Banks.PaymentType_DISABLE
	IF OBJECT_ID('Banks.PaymentType_DELETE', 'P') IS NOT NULL DROP PROCEDURE Banks.PaymentType_DELETE
*/

CREATE PROCEDURE [Banks].[PaymentType_READ]
	@Option          TINYINT = NULL,
	@PaymentTypeId   INT = NULL,
	@PaymentTypeName NVARCHAR(50) = '',
	@CompayId        INT = NULL
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.PaymentTypeId, a.PaymentTypeName, a.CompayId
		FROM 	Banks.PaymentType a
		WHERE 	(@PaymentTypeId   IS NULL OR a.PaymentTypeId = @PaymentTypeId)
		  AND 	(ISNULL(@PaymentTypeName, '') = ''    OR a.PaymentTypeName LIKE '%' + TRIM(@PaymentTypeName) + '%')
		  AND 	(@CompayId        IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Banks.PaymentType_READ @Option = null, @PaymentTypeId = null, @PaymentTypeName = '', @CompayId = null
END
GO
/****** Object:  StoredProcedure [Banks].[PaymentType_UPDATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Banks].[PaymentType_UPDATE]
	@Option          TINYINT = NULL,
	@PaymentTypeId   INT,
	@PaymentTypeName NVARCHAR(50),
	@CompayId        INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	
	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			IF NOT EXISTS(SELECT 1 FROM Banks.PaymentType WHERE PaymentTypeId = @PaymentTypeId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Banks.PaymentType
			SET 	PaymentTypeName = @PaymentTypeName,
					CompayId        = @CompayId
			WHERE 	PaymentTypeId = @PaymentTypeId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @PaymentTypeId PaymentTypeId
	-- EXEC Banks.PaymentType_UPDATE @Option = null, @PaymentTypeId = null, @PaymentTypeName = null, @CompayId = null
END
GO
/****** Object:  StoredProcedure [CodeMono].[User_AUTHENTICATION]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [CodeMono].[User_AUTHENTICATION]
	@Username  VARCHAR(45) = '',
	@Password  VARCHAR(45) = ''
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	-- Code 10: INVALID PARAMETERS
	IF @ErrorId = 0
	BEGIN
		IF (@Username = '' OR @Password = '')
		BEGIN
			-- SET @ErrorId = 10
			-- SET @Message = 'Invalid parameters'
			SET @ErrorId = 10
			SET @Message = 'Username or invalid password'
		END
	END

	-- Code 10: EXISTING USER
	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM [CodeMono].[User] WHERE Username = @Username)
		BEGIN
			-- SET @ErrorId = 20
			-- SET @Message = 'Username not found'
			SET @ErrorId = 10
			SET @Message = 'Username or invalid password'
		END
	END

	-- Code 10: ENABLED USER
	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM [CodeMono].[User] WHERE Username = @Username AND Active = 1)
		BEGIN
			-- SET @ErrorId = 30
			-- SET @Message = 'Username disabled'
			SET @ErrorId = 10
			SET @Message = 'Username or invalid password'
		END
	END

	-- Code 10: INCORRECT PASSWORD
	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM [CodeMono].[User] WHERE Username = @Username AND Password = @Password AND Active = 1)
		BEGIN
			-- SET @ErrorId = 40
			-- SET @Message = 'Invalid password'
			SET @ErrorId = 10
			SET @Message = 'Username or invalid password'
		END
	END


	IF @ErrorId = 0
	BEGIN
		SELECT 	1 Authenticated, 'Success' Message, a.UserId, a.FirstName, a.LastName, a.UserTypeId, a.Username, a.Avatar, a.CompanyId, C.CompanyName
		FROM 	[CodeMono].[User] a LEFT JOIN 
				Companies.Company C ON a.CompanyId = C.CompayId
		WHERE 	a.Username = @Username
		  AND 	a.[Password] = @Password
		  AND 	a.Active = 1
	END
	ELSE
	BEGIN
		SELECT 	0 Authenticated, @Message Message
	END

	-- EXEC [CodeMono].[User_AUTHENTICATION] @Username = '', @Password = ''
END
GO
/****** Object:  StoredProcedure [CodeMono].[User_CREATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [CodeMono].[User_CREATE]
	@FirstName  VARCHAR(45),
	@LastName   VARCHAR(45),
	@UserTypeId SMALLINT,
	@Username   VARCHAR(45),
	@Password   VARCHAR(45),
	@Avatar     VARCHAR(45),
	@CreatedBy  INT
AS
BEGIN

DECLARE @ErrorId    TINYINT
DECLARE @Message    VARCHAR(100)
DECLARE @InsertedId INT

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM [CodeMono].[User] WHERE Username = @Username)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Username already exists'
		END
	END

	IF @ErrorId = 0
	BEGIN
		INSERT INTO [CodeMono].[User] (FirstName, LastName, UserTypeId, Username, [Password], 
									Avatar, CreatedBy, CreatedAt, Active)
							VALUES (@FirstName, @LastName, @UserTypeId, @Username, @Password, 
									@Avatar, @CreatedBy, CURRENT_TIMESTAMP, 1)

		SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedId = @@IDENTITY
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedId UserId
	-- EXEC [CodeMono].[User_CREATE] @FirstName = null, @LastName = null, @UserTypeId = null, @Username = null, @Password = null, @Avatar = null, @CreatedBy = null
END
GO
/****** Object:  StoredProcedure [CodeMono].[User_DELETE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [CodeMono].[User_DELETE]
	@UserId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM [CodeMono].[User] WHERE UserId = @UserId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   [CodeMono].[User]
		WHERE  UserId = @UserId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @UserId UserId
	-- EXEC [CodeMono].[User_DELETE] @UserId = null
END
GO
/****** Object:  StoredProcedure [CodeMono].[User_DISABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [CodeMono].[User_DISABLE]
	@UserId INT,
	@DisabledBy INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM [CodeMono].[User] WHERE UserId = @UserId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM [CodeMono].[User] WHERE UserId = @UserId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	[CodeMono].[User]
		SET		Active = 0,
				DisabledBy = @DisabledBy,
				DisabledAt = CURRENT_TIMESTAMP
		WHERE	Active = 1
		  AND 	UserId = @UserId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @UserId UserId
	-- EXEC [CodeMono].[User_DISABLE] @UserId = null, @DisabledBy = null
END
GO
/****** Object:  StoredProcedure [CodeMono].[User_ENABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [CodeMono].[User_ENABLE]
	@UserId INT,
	@UpdatedBy INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM [CodeMono].[User] WHERE UserId = @UserId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM [CodeMono].[User] WHERE UserId = @UserId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	[CodeMono].[User]
		SET		Active = 1,
				UpdatedBy = @UpdatedBy,
				UpdatedAt = CURRENT_TIMESTAMP
		WHERE	Active = 0
		  AND 	UserId = @UserId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @UserId UserId
	-- EXEC [CodeMono].[User_ENABLE] @UserId = null, @UpdatedBy = null
END
GO
/****** Object:  StoredProcedure [CodeMono].[User_LIST]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [CodeMono].[User_LIST]
	@UserId     INT = NULL,
	@FirstName  VARCHAR(45) = '',
	@LastName   VARCHAR(45) = '',
	@UserTypeId SMALLINT = NULL,
	@Username   VARCHAR(45) = '',
	@Active     BIT = NULL
AS
BEGIN

	SELECT 	a.UserId, a.LastName + ', ' + a.FirstName + ' (' + a.Username + ')' UserName
	FROM 	[CodeMono].[User] a
	WHERE 	(@UserId     IS NULL OR a.UserId = @UserId)
	  AND 	(@FirstName  IS NULL OR a.FirstName LIKE '%' + @FirstName + '%')
	  AND 	(@LastName   IS NULL OR a.LastName LIKE '%' + @LastName + '%')
	  AND 	(@UserTypeId IS NULL OR a.UserTypeId = @UserTypeId)
	  AND 	(@Username   IS NULL OR a.Username LIKE '%' + @Username + '%')
	  AND 	(@Active     IS NULL OR a.Active = @Active)

	-- EXEC [CodeMono].[User_LIST] @UserId = null, @FirstName = '', @LastName = '', @UserTypeId = null, @Username = '', @Active = null
END
GO
/****** Object:  StoredProcedure [CodeMono].[User_READ]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [CodeMono].[User_READ]
	@UserId     INT = NULL,
	@FirstName  VARCHAR(45) = '',
	@LastName   VARCHAR(45) = '',
	@UserTypeId SMALLINT = NULL,
	@Username   VARCHAR(45) = '',
	@Active     BIT = NULL
AS
BEGIN

	SELECT 	a.UserId, a.FirstName, a.LastName, a.UserTypeId, b.UserTypeName,
			a.Username, a.[Password], a.Avatar, a.CreatedBy, a.CreatedAt, 
			a.UpdatedBy, a.UpdatedAt, a.DisabledBy, a.DisabledAt, a.Active
	FROM 	[CodeMono].[User] a
			INNER JOIN [CodeMono].[UserType] b ON a.UserTypeId = b.UserTypeId
	WHERE 	(@UserId     IS NULL OR a.UserId = @UserId)
	  AND 	(@FirstName  IS NULL OR a.FirstName LIKE '%' + @FirstName + '%')
	  AND 	(@LastName   IS NULL OR a.LastName LIKE '%' + @LastName + '%')
	  AND 	(@UserTypeId IS NULL OR a.UserTypeId = @UserTypeId)
	  AND 	(@Username   IS NULL OR a.Username LIKE '%' + @Username + '%')
	  AND 	(@Active     IS NULL OR a.Active = @Active)

	-- EXEC [CodeMono].[User_READ] @UserId = null, @FirstName = '', @LastName = '', @UserTypeId = null, @Username = '', @Active = null
END
GO
/****** Object:  StoredProcedure [CodeMono].[User_UPDATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [CodeMono].[User_UPDATE]
	@UserId     INT,
	@FirstName  VARCHAR(45),
	@LastName   VARCHAR(45),
	@UserTypeId SMALLINT,
	@Username   VARCHAR(45),
	@Password   VARCHAR(45),
	@Avatar     VARCHAR(45),
	@UpdatedBy  INT
AS
BEGIN

DECLARE @ErrorId TINYINT;
DECLARE @Message VARCHAR(100);

SET @ErrorId = 0;
SET @Message = '';

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM [CodeMono].[User] WHERE UserId = @UserId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE  [CodeMono].[User]
		SET 	FirstName  = @FirstName,
				LastName   = @LastName,
				UserTypeId = @UserTypeId,
				Username   = @Username,
				Password   = @Password,
				Avatar     = @Avatar,
				UpdatedBy  = @UpdatedBy,
				UpdatedAt  = CURRENT_TIMESTAMP
		WHERE 	UserId = @UserId

		SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @UserId UserId
	-- EXEC [CodeMono].[User_UPDATE] @UserId = null, @FirstName = null, @LastName = null, @UserTypeId = null, @Username = null, @Password = null, @Avatar = null, @UpdatedBy = null, @Active = null
END
GO
/****** Object:  StoredProcedure [CodeMono].[UserType_CREATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [CodeMono].[UserType_CREATE]
	@UserTypeId   SMALLINT,
	@UserTypeName VARCHAR(50),
	@CreatedBy    INT
AS
BEGIN

DECLARE @ErrorId    TINYINT
DECLARE @Message    VARCHAR(100)
DECLARE @InsertedId SMALLINT

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM CodeMono.UserType WHERE UserTypeId = @UserTypeId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record already exist'
		END
	END

	IF @ErrorId = 0
	BEGIN
		INSERT INTO CodeMono.UserType (UserTypeId, UserTypeName, CreatedBy, CreatedAt, Active)
						VALUES (@UserTypeId, @UserTypeName, @CreatedBy, GETDATE(), 1)

		SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedId = @UserTypeId
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedId UserTypeId
	-- EXEC CodeMono.UserType_CREATE @UserTypeId = null, @UserTypeName = null, @CreatedBy = null
END
GO
/****** Object:  StoredProcedure [CodeMono].[UserType_DELETE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [CodeMono].[UserType_DELETE]
	@UserTypeId SMALLINT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM CodeMono.UserType WHERE UserTypeId = @UserTypeId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   CodeMono.UserType
		WHERE  UserTypeId = @UserTypeId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @UserTypeId UserTypeId
	-- EXEC CodeMono.UserType_DELETE @UserTypeId = null
END
GO
/****** Object:  StoredProcedure [CodeMono].[UserType_DISABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [CodeMono].[UserType_DISABLE]
	@UserTypeId SMALLINT,
	@DisabledBy INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM CodeMono.UserType WHERE UserTypeId = @UserTypeId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM CodeMono.UserType WHERE UserTypeId = @UserTypeId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	CodeMono.UserType
		SET		Active = 0,
				DisabledBy = @DisabledBy,
				DisabledAt = CURRENT_TIMESTAMP
		WHERE	Active = 1
		  AND 	UserTypeId = @UserTypeId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @UserTypeId UserTypeId
	-- EXEC CodeMono.UserType_DISABLE @UserTypeId = null, @DisabledBy = null
END
GO
/****** Object:  StoredProcedure [CodeMono].[UserType_ENABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [CodeMono].[UserType_ENABLE]
	@UserTypeId SMALLINT,
	@UpdatedBy INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM CodeMono.UserType WHERE UserTypeId = @UserTypeId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM CodeMono.UserType WHERE UserTypeId = @UserTypeId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	CodeMono.UserType
		SET		Active = 1,
				UpdatedBy = @UpdatedBy,
				UpdatedAt = CURRENT_TIMESTAMP
		WHERE	Active = 0
		  AND 	UserTypeId = @UserTypeId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @UserTypeId UserTypeId
	-- EXEC CodeMono.UserType_ENABLE @UserTypeId = null, @UpdatedBy = null
END
GO
/****** Object:  StoredProcedure [CodeMono].[UserType_LIST]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [CodeMono].[UserType_LIST]
	@UserTypeId   SMALLINT = NULL,
	@UserTypeName VARCHAR(50) = '',
	@Active       BIT = NULL
AS
BEGIN

	SELECT 	a.UserTypeId UserTypeId, a.UserTypeName UserTypeName
	FROM 	CodeMono.UserType a
	WHERE 	(@UserTypeId   IS NULL OR a.UserTypeId = @UserTypeId)
	  AND 	(@UserTypeName IS NULL OR a.UserTypeName LIKE '%' + @UserTypeName + '%')
	  AND 	(@Active       IS NULL OR a.Active = @Active)

	-- EXEC CodeMono.UserType_LIST @UserTypeId = null, @UserTypeName = null, @Active = null
END
GO
/****** Object:  StoredProcedure [CodeMono].[UserType_READ]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
********************************************
	CodeMono.UserType SPs
********************************************
*/

CREATE PROCEDURE [CodeMono].[UserType_READ]
	@UserTypeId   SMALLINT = NULL,
	@UserTypeName VARCHAR(50) = '',
	@Active       BIT = NULL
AS
BEGIN

	SELECT 	a.UserTypeId, a.UserTypeName, a.CreatedBy, a.CreatedAt, a.UpdatedBy, 
			a.UpdatedAt, a.DisabledBy, a.DisabledAt, a.Active
	FROM 	CodeMono.UserType a
	WHERE 	(@UserTypeId   IS NULL OR a.UserTypeId = @UserTypeId)
	  AND 	(@UserTypeName IS NULL OR a.UserTypeName LIKE '%' + @UserTypeName + '%')
	  AND 	(@Active       IS NULL OR a.Active = @Active)

	-- EXEC CodeMono.UserType_READ @UserTypeId = null, @UserTypeName = null, @Active = null
END
GO
/****** Object:  StoredProcedure [CodeMono].[UserType_UPDATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [CodeMono].[UserType_UPDATE]
	@UserTypeId   SMALLINT,
	@UserTypeName VARCHAR(50),
	@UpdatedBy    INT
AS
BEGIN

DECLARE @ErrorId TINYINT;
DECLARE @Message VARCHAR(100);

SET @ErrorId = 0;
SET @Message = '';

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM CodeMono.UserType WHERE UserTypeId = @UserTypeId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE  CodeMono.UserType
		SET 	UserTypeName = @UserTypeName,
				UpdatedBy    = @UpdatedBy,
				UpdatedAt    = GETDATE()
		WHERE 	UserTypeId = @UserTypeId

		SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @UserTypeId UserTypeId
	-- EXEC CodeMono.UserType_UPDATE @UserTypeId = null, @UserTypeName = null, @UpdatedBy = null
END
GO
/****** Object:  StoredProcedure [Commons].[City_CREATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Commons].[City_CREATE]
	@Option    TINYINT = NULL,
	@CityName  NVARCHAR(100),
	@StateId   INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedCityId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Commons.City (CityName, StateId)
							VALUES (@CityName, @StateId)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedCityId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedCityId CityId
	-- EXEC Commons.City_CREATE @Option = null, @CityName = null, @StateId = null
END
GO
/****** Object:  StoredProcedure [Commons].[City_DELETE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Commons].[City_DELETE]
	@CityId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Commons.City WHERE CityId = @CityId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Commons.City
		WHERE  CityId = @CityId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @CityId CityId
	-- EXEC Commons.City_DELETE @CityId = null
END
GO
/****** Object:  StoredProcedure [Commons].[City_DISABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Commons].[City_DISABLE]
	@CityId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Commons.City WHERE CityId = @CityId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Commons.City WHERE CityId = @CityId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Commons.City
		SET		
		WHERE	Active = 1
		  AND 	CityId = @CityId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @CityId CityId
	-- EXEC Commons.City_DISABLE @CityId = null
END
GO
/****** Object:  StoredProcedure [Commons].[City_ENABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Commons].[City_ENABLE]
	@CityId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Commons.City WHERE CityId = @CityId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Commons.City WHERE CityId = @CityId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Commons.City
		SET		
		WHERE	Active = 0
		  AND 	CityId = @CityId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @CityId CityId
	-- EXEC Commons.City_ENABLE @CityId = null
END
GO
/****** Object:  StoredProcedure [Commons].[City_LIST]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Commons].[City_LIST]
	@Option   TINYINT = NULL,
	@CityId   INT = NULL,
	@CityName NVARCHAR(100) = '',
	@StateId  INT = NULL
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.CityId CityId, a.CityName CityName
		FROM 	Commons.City a
		WHERE 	(@CityId   IS NULL OR a.CityId = @CityId)
		  AND 	(ISNULL(@CityName, '') = ''    OR a.CityName LIKE '%' + TRIM(@CityName) + '%')
		  AND 	(@StateId  IS NULL OR a.StateId = @StateId)
	END

	-- EXEC Commons.City_LIST @Option = null, @CityId = null, @CityName = '', @StateId = null
END
GO
/****** Object:  StoredProcedure [Commons].[City_READ]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	IF OBJECT_ID('Commons.City_READ', 'P') IS NOT NULL DROP PROCEDURE Commons.City_READ
	IF OBJECT_ID('Commons.City_LIST', 'P') IS NOT NULL DROP PROCEDURE Commons.City_LIST
	IF OBJECT_ID('Commons.City_CREATE', 'P') IS NOT NULL DROP PROCEDURE Commons.City_CREATE
	IF OBJECT_ID('Commons.City_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Commons.City_UPDATE
	IF OBJECT_ID('Commons.City_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Commons.City_ENABLE
	IF OBJECT_ID('Commons.City_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Commons.City_DISABLE
	IF OBJECT_ID('Commons.City_DELETE', 'P') IS NOT NULL DROP PROCEDURE Commons.City_DELETE
*/

CREATE PROCEDURE [Commons].[City_READ]
	@Option   TINYINT = NULL,
	@CityId   INT = NULL,
	@CityName NVARCHAR(100) = '',
	@StateId  INT = NULL
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.CityId, a.CityName, a.StateId
		FROM 	Commons.City a
		WHERE 	(@CityId   IS NULL OR a.CityId = @CityId)
		  AND 	(ISNULL(@CityName, '') = ''    OR a.CityName LIKE '%' + TRIM(@CityName) + '%')
		  AND 	(@StateId  IS NULL OR a.StateId = @StateId)
	END

	-- EXEC Commons.City_READ @Option = null, @CityId = null, @CityName = '', @StateId = null
END
GO
/****** Object:  StoredProcedure [Commons].[City_UPDATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Commons].[City_UPDATE]
	@Option    TINYINT = NULL,
	@CityId    INT,
	@CityName  NVARCHAR(100),
	@StateId   INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	
	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			IF NOT EXISTS(SELECT 1 FROM Commons.City WHERE CityId = @CityId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Commons.City
			SET 	CityName  = @CityName,
					StateId   = @StateId
			WHERE 	CityId = @CityId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @CityId CityId
	-- EXEC Commons.City_UPDATE @Option = null, @CityId = null, @CityName = null, @StateId = null
END
GO
/****** Object:  StoredProcedure [Commons].[Neighborhood_CREATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Commons].[Neighborhood_CREATE]
	@Option           TINYINT = NULL,
	@NeighborhoodName NVARCHAR(200),
	@ZoneId           INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedNeighborhoodId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Commons.Neighborhood (NeighborhoodName, ZoneId)
							VALUES (@NeighborhoodName, @ZoneId)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedNeighborhoodId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedNeighborhoodId NeighborhoodId
	-- EXEC Commons.Neighborhood_CREATE @Option = null, @NeighborhoodName = null, @ZoneId = null
END
GO
/****** Object:  StoredProcedure [Commons].[Neighborhood_DELETE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Commons].[Neighborhood_DELETE]
	@NeighborhoodId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Commons.Neighborhood WHERE NeighborhoodId = @NeighborhoodId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Commons.Neighborhood
		WHERE  NeighborhoodId = @NeighborhoodId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @NeighborhoodId NeighborhoodId
	-- EXEC Commons.Neighborhood_DELETE @NeighborhoodId = null
END
GO
/****** Object:  StoredProcedure [Commons].[Neighborhood_DISABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Commons].[Neighborhood_DISABLE]
	@NeighborhoodId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Commons.Neighborhood WHERE NeighborhoodId = @NeighborhoodId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Commons.Neighborhood WHERE NeighborhoodId = @NeighborhoodId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Commons.Neighborhood
		SET		
		WHERE	Active = 1
		  AND 	NeighborhoodId = @NeighborhoodId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @NeighborhoodId NeighborhoodId
	-- EXEC Commons.Neighborhood_DISABLE @NeighborhoodId = null
END
GO
/****** Object:  StoredProcedure [Commons].[Neighborhood_ENABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Commons].[Neighborhood_ENABLE]
	@NeighborhoodId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Commons.Neighborhood WHERE NeighborhoodId = @NeighborhoodId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Commons.Neighborhood WHERE NeighborhoodId = @NeighborhoodId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Commons.Neighborhood
		SET		
		WHERE	Active = 0
		  AND 	NeighborhoodId = @NeighborhoodId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @NeighborhoodId NeighborhoodId
	-- EXEC Commons.Neighborhood_ENABLE @NeighborhoodId = null
END
GO
/****** Object:  StoredProcedure [Commons].[Neighborhood_LIST]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Commons].[Neighborhood_LIST]
	@Option           TINYINT = NULL,
	@NeighborhoodId   INT = NULL,
	@NeighborhoodName NVARCHAR(200) = '',
	@ZoneId           INT = NULL
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.NeighborhoodId NeighborhoodId, a.NeighborhoodName NeighborhoodName
		FROM 	Commons.Neighborhood a
		WHERE 	(@NeighborhoodId   IS NULL OR a.NeighborhoodId = @NeighborhoodId)
		  AND 	(ISNULL(@NeighborhoodName, '') = ''    OR a.NeighborhoodName LIKE '%' + TRIM(@NeighborhoodName) + '%')
		  AND 	(@ZoneId           IS NULL OR a.ZoneId = @ZoneId)
	END

	-- EXEC Commons.Neighborhood_LIST @Option = null, @NeighborhoodId = null, @NeighborhoodName = '', @ZoneId = null
END
GO
/****** Object:  StoredProcedure [Commons].[Neighborhood_READ]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	IF OBJECT_ID('Commons.Neighborhood_READ', 'P') IS NOT NULL DROP PROCEDURE Commons.Neighborhood_READ
	IF OBJECT_ID('Commons.Neighborhood_LIST', 'P') IS NOT NULL DROP PROCEDURE Commons.Neighborhood_LIST
	IF OBJECT_ID('Commons.Neighborhood_CREATE', 'P') IS NOT NULL DROP PROCEDURE Commons.Neighborhood_CREATE
	IF OBJECT_ID('Commons.Neighborhood_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Commons.Neighborhood_UPDATE
	IF OBJECT_ID('Commons.Neighborhood_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Commons.Neighborhood_ENABLE
	IF OBJECT_ID('Commons.Neighborhood_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Commons.Neighborhood_DISABLE
	IF OBJECT_ID('Commons.Neighborhood_DELETE', 'P') IS NOT NULL DROP PROCEDURE Commons.Neighborhood_DELETE
*/

CREATE PROCEDURE [Commons].[Neighborhood_READ]
	@Option           TINYINT = NULL,
	@NeighborhoodId   INT = NULL,
	@NeighborhoodName NVARCHAR(200) = '',
	@ZoneId           INT = NULL
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.NeighborhoodId, a.NeighborhoodName, a.ZoneId
		FROM 	Commons.Neighborhood a
		WHERE 	(@NeighborhoodId   IS NULL OR a.NeighborhoodId = @NeighborhoodId)
		  AND 	(ISNULL(@NeighborhoodName, '') = ''    OR a.NeighborhoodName LIKE '%' + TRIM(@NeighborhoodName) + '%')
		  AND 	(@ZoneId           IS NULL OR a.ZoneId = @ZoneId)
	END

	-- EXEC Commons.Neighborhood_READ @Option = null, @NeighborhoodId = null, @NeighborhoodName = '', @ZoneId = null
END
GO
/****** Object:  StoredProcedure [Commons].[Neighborhood_UPDATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Commons].[Neighborhood_UPDATE]
	@Option           TINYINT = NULL,
	@NeighborhoodId   INT,
	@NeighborhoodName NVARCHAR(200),
	@ZoneId           INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	
	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			IF NOT EXISTS(SELECT 1 FROM Commons.Neighborhood WHERE NeighborhoodId = @NeighborhoodId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Commons.Neighborhood
			SET 	NeighborhoodName = @NeighborhoodName,
					ZoneId           = @ZoneId
			WHERE 	NeighborhoodId = @NeighborhoodId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @NeighborhoodId NeighborhoodId
	-- EXEC Commons.Neighborhood_UPDATE @Option = null, @NeighborhoodId = null, @NeighborhoodName = null, @ZoneId = null
END
GO
/****** Object:  StoredProcedure [Commons].[State_CREATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Commons].[State_CREATE]
	@Option    TINYINT = NULL,
	@StateName NVARCHAR(100)
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedStateId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Commons.State (StateName)
							VALUES (@StateName)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedStateId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedStateId StateId
	-- EXEC Commons.State_CREATE @Option = null, @StateName = null
END
GO
/****** Object:  StoredProcedure [Commons].[State_DELETE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Commons].[State_DELETE]
	@StateId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Commons.State WHERE StateId = @StateId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Commons.State
		WHERE  StateId = @StateId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @StateId StateId
	-- EXEC Commons.State_DELETE @StateId = null
END
GO
/****** Object:  StoredProcedure [Commons].[State_DISABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Commons].[State_DISABLE]
	@StateId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Commons.State WHERE StateId = @StateId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Commons.State WHERE StateId = @StateId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Commons.State
		SET		
		WHERE	Active = 1
		  AND 	StateId = @StateId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @StateId StateId
	-- EXEC Commons.State_DISABLE @StateId = null
END
GO
/****** Object:  StoredProcedure [Commons].[State_ENABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Commons].[State_ENABLE]
	@StateId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Commons.State WHERE StateId = @StateId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Commons.State WHERE StateId = @StateId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Commons.State
		SET		
		WHERE	Active = 0
		  AND 	StateId = @StateId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @StateId StateId
	-- EXEC Commons.State_ENABLE @StateId = null
END
GO
/****** Object:  StoredProcedure [Commons].[State_LIST]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Commons].[State_LIST]
	@Option    TINYINT = NULL,
	@StateId   INT = NULL,
	@StateName NVARCHAR(100) = ''
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.StateId StateId, a.StateName StateName
		FROM 	Commons.State a
		WHERE 	(@StateId   IS NULL OR a.StateId = @StateId)
		  AND 	(ISNULL(@StateName, '') = ''    OR a.StateName LIKE '%' + TRIM(@StateName) + '%')
	END

	-- EXEC Commons.State_LIST @Option = null, @StateId = null, @StateName = ''
END
GO
/****** Object:  StoredProcedure [Commons].[State_READ]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	IF OBJECT_ID('Commons.State_READ', 'P') IS NOT NULL DROP PROCEDURE Commons.State_READ
	IF OBJECT_ID('Commons.State_LIST', 'P') IS NOT NULL DROP PROCEDURE Commons.State_LIST
	IF OBJECT_ID('Commons.State_CREATE', 'P') IS NOT NULL DROP PROCEDURE Commons.State_CREATE
	IF OBJECT_ID('Commons.State_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Commons.State_UPDATE
	IF OBJECT_ID('Commons.State_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Commons.State_ENABLE
	IF OBJECT_ID('Commons.State_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Commons.State_DISABLE
	IF OBJECT_ID('Commons.State_DELETE', 'P') IS NOT NULL DROP PROCEDURE Commons.State_DELETE
*/

CREATE PROCEDURE [Commons].[State_READ]
	@Option    TINYINT = NULL,
	@StateId   INT = NULL,
	@StateName NVARCHAR(100) = ''
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.StateId, a.StateName
		FROM 	Commons.State a
		WHERE 	(@StateId   IS NULL OR a.StateId = @StateId)
		  AND 	(ISNULL(@StateName, '') = ''    OR a.StateName LIKE '%' + TRIM(@StateName) + '%')
	END

	-- EXEC Commons.State_READ @Option = null, @StateId = null, @StateName = ''
END
GO
/****** Object:  StoredProcedure [Commons].[State_UPDATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Commons].[State_UPDATE]
	@Option    TINYINT = NULL,
	@StateId   INT,
	@StateName NVARCHAR(100)
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	
	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			IF NOT EXISTS(SELECT 1 FROM Commons.State WHERE StateId = @StateId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Commons.State
			SET 	StateName = @StateName
			WHERE 	StateId = @StateId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @StateId StateId
	-- EXEC Commons.State_UPDATE @Option = null, @StateId = null, @StateName = null
END
GO
/****** Object:  StoredProcedure [Commons].[Zone_CREATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Commons].[Zone_CREATE]
	@Option    TINYINT = NULL,
	@ZoneName  NVARCHAR(200),
	@CityId    INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedZoneId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Commons.Zone (ZoneName, CityId)
							VALUES (@ZoneName, @CityId)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedZoneId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedZoneId ZoneId
	-- EXEC Commons.Zone_CREATE @Option = null, @ZoneName = null, @CityId = null
END
GO
/****** Object:  StoredProcedure [Commons].[Zone_DELETE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Commons].[Zone_DELETE]
	@ZoneId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Commons.Zone WHERE ZoneId = @ZoneId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Commons.Zone
		WHERE  ZoneId = @ZoneId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @ZoneId ZoneId
	-- EXEC Commons.Zone_DELETE @ZoneId = null
END
GO
/****** Object:  StoredProcedure [Commons].[Zone_DISABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Commons].[Zone_DISABLE]
	@ZoneId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Commons.Zone WHERE ZoneId = @ZoneId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Commons.Zone WHERE ZoneId = @ZoneId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Commons.Zone
		SET		
		WHERE	Active = 1
		  AND 	ZoneId = @ZoneId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @ZoneId ZoneId
	-- EXEC Commons.Zone_DISABLE @ZoneId = null
END
GO
/****** Object:  StoredProcedure [Commons].[Zone_ENABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Commons].[Zone_ENABLE]
	@ZoneId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Commons.Zone WHERE ZoneId = @ZoneId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Commons.Zone WHERE ZoneId = @ZoneId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Commons.Zone
		SET		
		WHERE	Active = 0
		  AND 	ZoneId = @ZoneId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @ZoneId ZoneId
	-- EXEC Commons.Zone_ENABLE @ZoneId = null
END
GO
/****** Object:  StoredProcedure [Commons].[Zone_LIST]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Commons].[Zone_LIST]
	@Option   TINYINT = NULL,
	@ZoneId   INT = NULL,
	@ZoneName NVARCHAR(200) = '',
	@CityId   INT = NULL
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.ZoneId ZoneId, a.ZoneName ZoneName
		FROM 	Commons.Zone a
		WHERE 	(@ZoneId   IS NULL OR a.ZoneId = @ZoneId)
		  AND 	(ISNULL(@ZoneName, '') = ''    OR a.ZoneName LIKE '%' + TRIM(@ZoneName) + '%')
		  AND 	(@CityId   IS NULL OR a.CityId = @CityId)
	END

	-- EXEC Commons.Zone_LIST @Option = null, @ZoneId = null, @ZoneName = '', @CityId = null
END
GO
/****** Object:  StoredProcedure [Commons].[Zone_READ]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	IF OBJECT_ID('Commons.Zone_READ', 'P') IS NOT NULL DROP PROCEDURE Commons.Zone_READ
	IF OBJECT_ID('Commons.Zone_LIST', 'P') IS NOT NULL DROP PROCEDURE Commons.Zone_LIST
	IF OBJECT_ID('Commons.Zone_CREATE', 'P') IS NOT NULL DROP PROCEDURE Commons.Zone_CREATE
	IF OBJECT_ID('Commons.Zone_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Commons.Zone_UPDATE
	IF OBJECT_ID('Commons.Zone_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Commons.Zone_ENABLE
	IF OBJECT_ID('Commons.Zone_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Commons.Zone_DISABLE
	IF OBJECT_ID('Commons.Zone_DELETE', 'P') IS NOT NULL DROP PROCEDURE Commons.Zone_DELETE
*/

CREATE PROCEDURE [Commons].[Zone_READ]
	@Option   TINYINT = NULL,
	@ZoneId   INT = NULL,
	@ZoneName NVARCHAR(200) = '',
	@CityId   INT = NULL
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.ZoneId, a.ZoneName, a.CityId
		FROM 	Commons.Zone a
		WHERE 	(@ZoneId   IS NULL OR a.ZoneId = @ZoneId)
		  AND 	(ISNULL(@ZoneName, '') = ''    OR a.ZoneName LIKE '%' + TRIM(@ZoneName) + '%')
		  AND 	(@CityId   IS NULL OR a.CityId = @CityId)
	END

	-- EXEC Commons.Zone_READ @Option = null, @ZoneId = null, @ZoneName = '', @CityId = null
END
GO
/****** Object:  StoredProcedure [Commons].[Zone_UPDATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Commons].[Zone_UPDATE]
	@Option    TINYINT = NULL,
	@ZoneId    INT,
	@ZoneName  NVARCHAR(200),
	@CityId    INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	
	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			IF NOT EXISTS(SELECT 1 FROM Commons.Zone WHERE ZoneId = @ZoneId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Commons.Zone
			SET 	ZoneName  = @ZoneName,
					CityId    = @CityId
			WHERE 	ZoneId = @ZoneId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @ZoneId ZoneId
	-- EXEC Commons.Zone_UPDATE @Option = null, @ZoneId = null, @ZoneName = null, @CityId = null
END
GO
/****** Object:  StoredProcedure [Companies].[Company_CREATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Companies].[Company_CREATE]
	@Option      TINYINT = NULL,
	@CompanyName NVARCHAR(200),
	@Document    NVARCHAR(50),
	@Telephone   NVARCHAR(30),
	@Mobile      NVARCHAR(30),
	@Email       NVARCHAR(80),
	@Address     NVARCHAR(200),
	@Observation NVARCHAR(500)
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedCompayId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Companies.Company (CompanyName, Document, Telephone, Mobile, Email,
								Address, Observation)
							VALUES (@CompanyName, @Document, @Telephone, @Mobile, @Email,
								@Address, @Observation)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedCompayId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedCompayId CompayId
	-- EXEC Companies.Company_CREATE @Option = null, @CompanyName = null, @Document = null, @Telephone = null, @Mobile = null, @Email = null, @Address = null, @Observation = null
END
GO
/****** Object:  StoredProcedure [Companies].[Company_DELETE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Companies].[Company_DELETE]
	@CompayId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Companies.Company WHERE CompayId = @CompayId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Companies.Company
		WHERE  CompayId = @CompayId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @CompayId CompayId
	-- EXEC Companies.Company_DELETE @CompayId = null
END
GO
/****** Object:  StoredProcedure [Companies].[Company_DISABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Companies].[Company_DISABLE]
	@CompayId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Companies.Company WHERE CompayId = @CompayId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Companies.Company WHERE CompayId = @CompayId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Companies.Company
		SET		
		WHERE	Active = 1
		  AND 	CompayId = @CompayId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @CompayId CompayId
	-- EXEC Companies.Company_DISABLE @CompayId = null
END
GO
/****** Object:  StoredProcedure [Companies].[Company_ENABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Companies].[Company_ENABLE]
	@CompayId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Companies.Company WHERE CompayId = @CompayId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Companies.Company WHERE CompayId = @CompayId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Companies.Company
		SET		
		WHERE	Active = 0
		  AND 	CompayId = @CompayId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @CompayId CompayId
	-- EXEC Companies.Company_ENABLE @CompayId = null
END
GO
/****** Object:  StoredProcedure [Companies].[Company_LIST]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Companies].[Company_LIST]
	@Option      TINYINT = NULL,
	@CompayId    INT = NULL,
	@CompanyName NVARCHAR(200) = '',
	@Document    NVARCHAR(50) = '',
	@Telephone   NVARCHAR(30) = '',
	@Mobile      NVARCHAR(30) = '',
	@Email       NVARCHAR(80) = '',
	@Address     NVARCHAR(200) = '',
	@Observation NVARCHAR(500) = ''
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.CompayId CompayId, a.CompanyName CompanyName
		FROM 	Companies.Company a
		WHERE 	(@CompayId    IS NULL OR a.CompayId = @CompayId)
		  AND 	(ISNULL(@CompanyName, '') = ''    OR a.CompanyName LIKE '%' + TRIM(@CompanyName) + '%')
		  AND 	(ISNULL(@Document, '')    = ''    OR a.Document LIKE '%' + TRIM(@Document) + '%')
		  AND 	(ISNULL(@Telephone, '')   = ''    OR a.Telephone LIKE '%' + TRIM(@Telephone) + '%')
		  AND 	(ISNULL(@Mobile, '')      = ''    OR a.Mobile LIKE '%' + TRIM(@Mobile) + '%')
		  AND 	(ISNULL(@Email, '')       = ''    OR a.Email LIKE '%' + TRIM(@Email) + '%')
		  AND 	(ISNULL(@Address, '')     = ''    OR a.Address LIKE '%' + TRIM(@Address) + '%')
		  AND 	(ISNULL(@Observation, '') = ''    OR a.Observation LIKE '%' + TRIM(@Observation) + '%')
	END

	-- EXEC Companies.Company_LIST @Option = null, @CompayId = null, @CompanyName = '', @Document = '', @Telephone = '', @Mobile = '', @Email = '', @Address = '', @Observation = ''
END
GO
/****** Object:  StoredProcedure [Companies].[Company_READ]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	IF OBJECT_ID('Companies.Company_READ', 'P') IS NOT NULL DROP PROCEDURE Companies.Company_READ
	IF OBJECT_ID('Companies.Company_LIST', 'P') IS NOT NULL DROP PROCEDURE Companies.Company_LIST
	IF OBJECT_ID('Companies.Company_CREATE', 'P') IS NOT NULL DROP PROCEDURE Companies.Company_CREATE
	IF OBJECT_ID('Companies.Company_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Companies.Company_UPDATE
	IF OBJECT_ID('Companies.Company_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Companies.Company_ENABLE
	IF OBJECT_ID('Companies.Company_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Companies.Company_DISABLE
	IF OBJECT_ID('Companies.Company_DELETE', 'P') IS NOT NULL DROP PROCEDURE Companies.Company_DELETE
*/

CREATE PROCEDURE [Companies].[Company_READ]
	@Option      TINYINT = NULL,
	@CompayId    INT = NULL,
	@CompanyName NVARCHAR(200) = '',
	@Document    NVARCHAR(50) = '',
	@Telephone   NVARCHAR(30) = '',
	@Mobile      NVARCHAR(30) = '',
	@Email       NVARCHAR(80) = '',
	@Address     NVARCHAR(200) = '',
	@Observation NVARCHAR(500) = ''
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.CompayId, a.CompanyName, a.Document, a.Telephone, a.Mobile, 
				a.Email, a.Address, a.Observation
		FROM 	Companies.Company a
		WHERE 	(@CompayId    IS NULL OR a.CompayId = @CompayId)
		  AND 	(ISNULL(@CompanyName, '') = ''    OR a.CompanyName LIKE '%' + TRIM(@CompanyName) + '%')
		  AND 	(ISNULL(@Document, '')    = ''    OR a.Document LIKE '%' + TRIM(@Document) + '%')
		  AND 	(ISNULL(@Telephone, '')   = ''    OR a.Telephone LIKE '%' + TRIM(@Telephone) + '%')
		  AND 	(ISNULL(@Mobile, '')      = ''    OR a.Mobile LIKE '%' + TRIM(@Mobile) + '%')
		  AND 	(ISNULL(@Email, '')       = ''    OR a.Email LIKE '%' + TRIM(@Email) + '%')
		  AND 	(ISNULL(@Address, '')     = ''    OR a.Address LIKE '%' + TRIM(@Address) + '%')
		  AND 	(ISNULL(@Observation, '') = ''    OR a.Observation LIKE '%' + TRIM(@Observation) + '%')
	END

	-- EXEC Companies.Company_READ @Option = null, @CompayId = null, @CompanyName = '', @Document = '', @Telephone = '', @Mobile = '', @Email = '', @Address = '', @Observation = ''
END
GO
/****** Object:  StoredProcedure [Companies].[Company_UPDATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Companies].[Company_UPDATE]
	@Option      TINYINT = NULL,
	@CompayId    INT,
	@CompanyName NVARCHAR(200),
	@Document    NVARCHAR(50),
	@Telephone   NVARCHAR(30),
	@Mobile      NVARCHAR(30),
	@Email       NVARCHAR(80),
	@Address     NVARCHAR(200),
	@Observation NVARCHAR(500)
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	
	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			IF NOT EXISTS(SELECT 1 FROM Companies.Company WHERE CompayId = @CompayId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Companies.Company
			SET 	CompanyName = @CompanyName,
					Document    = @Document,
					Telephone   = @Telephone,
					Mobile      = @Mobile,
					Email       = @Email,
					Address     = @Address,
					Observation = @Observation
			WHERE 	CompayId = @CompayId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @CompayId CompayId
	-- EXEC Companies.Company_UPDATE @Option = null, @CompayId = null, @CompanyName = null, @Document = null, @Telephone = null, @Mobile = null, @Email = null, @Address = null, @Observation = null
END
GO
/****** Object:  StoredProcedure [Contracts].[Contract_CREATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Contracts].[Contract_CREATE]
	@Option             TINYINT = NULL,
	@ContractDate       DATE,
	@InnitialDate       DATE,
	@QuantityMonths     INT,
	@RentalFeeForOwner  DECIMAL,
	@RentalFeeForTennat DECIMAL,
	@Observation        NVARCHAR(300),
	@StatusId           INT,
	@PropertyId         INT,
	@TenantId           INT,
	@CompayId           INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedContractId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Contracts.Contract (ContractDate, InnitialDate, QuantityMonths, RentalFeeForOwner, RentalFeeForTennat,
								Observation, StatusId, PropertyId, TenantId, CompayId)
							VALUES (@ContractDate, @InnitialDate, @QuantityMonths, @RentalFeeForOwner, @RentalFeeForTennat,
								@Observation, @StatusId, @PropertyId, @TenantId, @CompayId)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedContractId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedContractId ContractId
	-- EXEC Contracts.Contract_CREATE @Option = null, @ContractDate = null, @InnitialDate = null, @QuantityMonths = null, @RentalFeeForOwner = null, @RentalFeeForTennat = null, @Observation = null, @StatusId = null, @PropertyId = null, @TenantId = null, @CompayId = null
END
GO
/****** Object:  StoredProcedure [Contracts].[Contract_DELETE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Contracts].[Contract_DELETE]
	@ContractId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Contracts.Contract WHERE ContractId = @ContractId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Contracts.Contract
		WHERE  ContractId = @ContractId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @ContractId ContractId
	-- EXEC Contracts.Contract_DELETE @ContractId = null
END
GO
/****** Object:  StoredProcedure [Contracts].[Contract_DISABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Contracts].[Contract_DISABLE]
	@ContractId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Contracts.Contract WHERE ContractId = @ContractId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Contracts.Contract WHERE ContractId = @ContractId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Contracts.Contract
		SET		
		WHERE	Active = 1
		  AND 	ContractId = @ContractId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @ContractId ContractId
	-- EXEC Contracts.Contract_DISABLE @ContractId = null
END
GO
/****** Object:  StoredProcedure [Contracts].[Contract_ENABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Contracts].[Contract_ENABLE]
	@ContractId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Contracts.Contract WHERE ContractId = @ContractId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Contracts.Contract WHERE ContractId = @ContractId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Contracts.Contract
		SET		
		WHERE	Active = 0
		  AND 	ContractId = @ContractId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @ContractId ContractId
	-- EXEC Contracts.Contract_ENABLE @ContractId = null
END
GO
/****** Object:  StoredProcedure [Contracts].[Contract_LIST]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Contracts].[Contract_LIST]
	@Option      TINYINT = NULL,
	@ContractId  INT = NULL,
	@Observation NVARCHAR(300) = '',
	@StatusId    INT = NULL,
	@PropertyId  INT = NULL,
	@TenantId    INT = NULL,
	@CompayId    INT = NULL
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.ContractId ContractId, a.ContractId ContractName
		FROM 	Contracts.Contract a
		WHERE 	(@ContractId  IS NULL OR a.ContractId = @ContractId)
		  AND 	(ISNULL(@Observation, '') = ''    OR a.Observation LIKE '%' + TRIM(@Observation) + '%')
		  AND 	(@StatusId    IS NULL OR a.StatusId = @StatusId)
		  AND 	(@PropertyId  IS NULL OR a.PropertyId = @PropertyId)
		  AND 	(@TenantId    IS NULL OR a.TenantId = @TenantId)
		  AND 	(@CompayId    IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Contracts.Contract_LIST @Option = null, @ContractId = null, @Observation = '', @StatusId = null, @PropertyId = null, @TenantId = null, @CompayId = null
END
GO
/****** Object:  StoredProcedure [Contracts].[Contract_READ]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	IF OBJECT_ID('Contracts.Contract_READ', 'P') IS NOT NULL DROP PROCEDURE Contracts.Contract_READ
	IF OBJECT_ID('Contracts.Contract_LIST', 'P') IS NOT NULL DROP PROCEDURE Contracts.Contract_LIST
	IF OBJECT_ID('Contracts.Contract_CREATE', 'P') IS NOT NULL DROP PROCEDURE Contracts.Contract_CREATE
	IF OBJECT_ID('Contracts.Contract_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Contracts.Contract_UPDATE
	IF OBJECT_ID('Contracts.Contract_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Contracts.Contract_ENABLE
	IF OBJECT_ID('Contracts.Contract_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Contracts.Contract_DISABLE
	IF OBJECT_ID('Contracts.Contract_DELETE', 'P') IS NOT NULL DROP PROCEDURE Contracts.Contract_DELETE
*/

CREATE PROCEDURE [Contracts].[Contract_READ]
	@Option      TINYINT = NULL,
	@ContractId  INT = NULL,
	@Observation NVARCHAR(300) = '',
	@StatusId    INT = NULL,
	@PropertyId  INT = NULL,
	@TenantId    INT = NULL,
	@CompayId    INT = NULL
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.ContractId, a.ContractDate, a.InnitialDate, a.QuantityMonths, a.RentalFeeForOwner, 
				a.RentalFeeForTennat, a.Observation, a.StatusId, a.PropertyId, a.TenantId, 
				a.CompayId
		FROM 	Contracts.Contract a
		WHERE 	(@ContractId  IS NULL OR a.ContractId = @ContractId)
		  AND 	(ISNULL(@Observation, '') = ''    OR a.Observation LIKE '%' + TRIM(@Observation) + '%')
		  AND 	(@StatusId    IS NULL OR a.StatusId = @StatusId)
		  AND 	(@PropertyId  IS NULL OR a.PropertyId = @PropertyId)
		  AND 	(@TenantId    IS NULL OR a.TenantId = @TenantId)
		  AND 	(@CompayId    IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Contracts.Contract_READ @Option = null, @ContractId = null, @Observation = '', @StatusId = null, @PropertyId = null, @TenantId = null, @CompayId = null
END
GO
/****** Object:  StoredProcedure [Contracts].[Contract_UPDATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Contracts].[Contract_UPDATE]
	@Option             TINYINT = NULL,
	@ContractId         INT,
	@ContractDate       DATE,
	@InnitialDate       DATE,
	@QuantityMonths     INT,
	@RentalFeeForOwner  DECIMAL,
	@RentalFeeForTennat DECIMAL,
	@Observation        NVARCHAR(300),
	@StatusId           INT,
	@PropertyId         INT,
	@TenantId           INT,
	@CompayId           INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	
	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			IF NOT EXISTS(SELECT 1 FROM Contracts.Contract WHERE ContractId = @ContractId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Contracts.Contract
			SET 	ContractDate       = @ContractDate,
					InnitialDate       = @InnitialDate,
					QuantityMonths     = @QuantityMonths,
					RentalFeeForOwner  = @RentalFeeForOwner,
					RentalFeeForTennat = @RentalFeeForTennat,
					Observation        = @Observation,
					StatusId           = @StatusId,
					PropertyId         = @PropertyId,
					TenantId           = @TenantId,
					CompayId           = @CompayId
			WHERE 	ContractId = @ContractId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @ContractId ContractId
	-- EXEC Contracts.Contract_UPDATE @Option = null, @ContractId = null, @ContractDate = null, @InnitialDate = null, @QuantityMonths = null, @RentalFeeForOwner = null, @RentalFeeForTennat = null, @Observation = null, @StatusId = null, @PropertyId = null, @TenantId = null, @CompayId = null
END
GO
/****** Object:  StoredProcedure [Contracts].[ContractsStatus_CREATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Contracts].[ContractsStatus_CREATE]
	@Option              TINYINT = NULL,
	@ContractsStatusName NVARCHAR(200)
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedContractsStatusId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Contracts.ContractsStatus (ContractsStatusName)
							VALUES (@ContractsStatusName)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedContractsStatusId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedContractsStatusId ContractsStatusId
	-- EXEC Contracts.ContractsStatus_CREATE @Option = null, @ContractsStatusName = null
END
GO
/****** Object:  StoredProcedure [Contracts].[ContractsStatus_DELETE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Contracts].[ContractsStatus_DELETE]
	@ContractsStatusId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Contracts.ContractsStatus WHERE ContractsStatusId = @ContractsStatusId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Contracts.ContractsStatus
		WHERE  ContractsStatusId = @ContractsStatusId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @ContractsStatusId ContractsStatusId
	-- EXEC Contracts.ContractsStatus_DELETE @ContractsStatusId = null
END
GO
/****** Object:  StoredProcedure [Contracts].[ContractsStatus_DISABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Contracts].[ContractsStatus_DISABLE]
	@ContractsStatusId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Contracts.ContractsStatus WHERE ContractsStatusId = @ContractsStatusId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Contracts.ContractsStatus WHERE ContractsStatusId = @ContractsStatusId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Contracts.ContractsStatus
		SET		
		WHERE	Active = 1
		  AND 	ContractsStatusId = @ContractsStatusId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @ContractsStatusId ContractsStatusId
	-- EXEC Contracts.ContractsStatus_DISABLE @ContractsStatusId = null
END
GO
/****** Object:  StoredProcedure [Contracts].[ContractsStatus_ENABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Contracts].[ContractsStatus_ENABLE]
	@ContractsStatusId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Contracts.ContractsStatus WHERE ContractsStatusId = @ContractsStatusId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Contracts.ContractsStatus WHERE ContractsStatusId = @ContractsStatusId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Contracts.ContractsStatus
		SET		
		WHERE	Active = 0
		  AND 	ContractsStatusId = @ContractsStatusId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @ContractsStatusId ContractsStatusId
	-- EXEC Contracts.ContractsStatus_ENABLE @ContractsStatusId = null
END
GO
/****** Object:  StoredProcedure [Contracts].[ContractsStatus_LIST]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Contracts].[ContractsStatus_LIST]
	@Option              TINYINT = NULL,
	@ContractsStatusId   INT = NULL,
	@ContractsStatusName NVARCHAR(200) = ''
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.ContractsStatusId ContractsStatusId, a.ContractsStatusName ContractsStatusName
		FROM 	Contracts.ContractsStatus a
		WHERE 	(@ContractsStatusId   IS NULL OR a.ContractsStatusId = @ContractsStatusId)
		  AND 	(ISNULL(@ContractsStatusName, '') = ''    OR a.ContractsStatusName LIKE '%' + TRIM(@ContractsStatusName) + '%')
	END

	-- EXEC Contracts.ContractsStatus_LIST @Option = null, @ContractsStatusId = null, @ContractsStatusName = ''
END
GO
/****** Object:  StoredProcedure [Contracts].[ContractsStatus_READ]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	IF OBJECT_ID('Contracts.ContractsStatus_READ', 'P') IS NOT NULL DROP PROCEDURE Contracts.ContractsStatus_READ
	IF OBJECT_ID('Contracts.ContractsStatus_LIST', 'P') IS NOT NULL DROP PROCEDURE Contracts.ContractsStatus_LIST
	IF OBJECT_ID('Contracts.ContractsStatus_CREATE', 'P') IS NOT NULL DROP PROCEDURE Contracts.ContractsStatus_CREATE
	IF OBJECT_ID('Contracts.ContractsStatus_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Contracts.ContractsStatus_UPDATE
	IF OBJECT_ID('Contracts.ContractsStatus_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Contracts.ContractsStatus_ENABLE
	IF OBJECT_ID('Contracts.ContractsStatus_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Contracts.ContractsStatus_DISABLE
	IF OBJECT_ID('Contracts.ContractsStatus_DELETE', 'P') IS NOT NULL DROP PROCEDURE Contracts.ContractsStatus_DELETE
*/

CREATE PROCEDURE [Contracts].[ContractsStatus_READ]
	@Option              TINYINT = NULL,
	@ContractsStatusId   INT = NULL,
	@ContractsStatusName NVARCHAR(200) = ''
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.ContractsStatusId, a.ContractsStatusName
		FROM 	Contracts.ContractsStatus a
		WHERE 	(@ContractsStatusId   IS NULL OR a.ContractsStatusId = @ContractsStatusId)
		  AND 	(ISNULL(@ContractsStatusName, '') = ''    OR a.ContractsStatusName LIKE '%' + TRIM(@ContractsStatusName) + '%')
	END

	-- EXEC Contracts.ContractsStatus_READ @Option = null, @ContractsStatusId = null, @ContractsStatusName = ''
END
GO
/****** Object:  StoredProcedure [Contracts].[ContractsStatus_UPDATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Contracts].[ContractsStatus_UPDATE]
	@Option              TINYINT = NULL,
	@ContractsStatusId   INT,
	@ContractsStatusName NVARCHAR(200)
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	
	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			IF NOT EXISTS(SELECT 1 FROM Contracts.ContractsStatus WHERE ContractsStatusId = @ContractsStatusId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Contracts.ContractsStatus
			SET 	ContractsStatusName = @ContractsStatusName
			WHERE 	ContractsStatusId = @ContractsStatusId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @ContractsStatusId ContractsStatusId
	-- EXEC Contracts.ContractsStatus_UPDATE @Option = null, @ContractsStatusId = null, @ContractsStatusName = null
END
GO
/****** Object:  StoredProcedure [Contracts].[TenantsByContract_CREATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Contracts].[TenantsByContract_CREATE]
	@Option    TINYINT = NULL,
	@TenantId  INT,
	@Profile   NVARCHAR(300)
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedTenantsByContractId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Contracts.TenantsByContract (TenantId, Profile)
							VALUES (@TenantId, @Profile)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedTenantsByContractId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedTenantsByContractId TenantsByContractId
	-- EXEC Contracts.TenantsByContract_CREATE @Option = null, @TenantId = null, @Profile = null
END
GO
/****** Object:  StoredProcedure [Contracts].[TenantsByContract_DELETE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Contracts].[TenantsByContract_DELETE]
	@TenantsByContractId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Contracts.TenantsByContract WHERE TenantsByContractId = @TenantsByContractId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Contracts.TenantsByContract
		WHERE  TenantsByContractId = @TenantsByContractId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @TenantsByContractId TenantsByContractId
	-- EXEC Contracts.TenantsByContract_DELETE @TenantsByContractId = null
END
GO
/****** Object:  StoredProcedure [Contracts].[TenantsByContract_DISABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Contracts].[TenantsByContract_DISABLE]
	@TenantsByContractId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Contracts.TenantsByContract WHERE TenantsByContractId = @TenantsByContractId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Contracts.TenantsByContract WHERE TenantsByContractId = @TenantsByContractId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Contracts.TenantsByContract
		SET		
		WHERE	Active = 1
		  AND 	TenantsByContractId = @TenantsByContractId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @TenantsByContractId TenantsByContractId
	-- EXEC Contracts.TenantsByContract_DISABLE @TenantsByContractId = null
END
GO
/****** Object:  StoredProcedure [Contracts].[TenantsByContract_ENABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Contracts].[TenantsByContract_ENABLE]
	@TenantsByContractId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Contracts.TenantsByContract WHERE TenantsByContractId = @TenantsByContractId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Contracts.TenantsByContract WHERE TenantsByContractId = @TenantsByContractId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Contracts.TenantsByContract
		SET		
		WHERE	Active = 0
		  AND 	TenantsByContractId = @TenantsByContractId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @TenantsByContractId TenantsByContractId
	-- EXEC Contracts.TenantsByContract_ENABLE @TenantsByContractId = null
END
GO
/****** Object:  StoredProcedure [Contracts].[TenantsByContract_LIST]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Contracts].[TenantsByContract_LIST]
	@Option              TINYINT = NULL,
	@TenantsByContractId INT = NULL,
	@TenantId            INT = NULL,
	@Profile             NVARCHAR(300) = ''
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.TenantsByContractId TenantsByContractId, a.TenantsByContractId TenantsByContractName
		FROM 	Contracts.TenantsByContract a
		WHERE 	(@TenantsByContractId IS NULL OR a.TenantsByContractId = @TenantsByContractId)
		  AND 	(@TenantId            IS NULL OR a.TenantId = @TenantId)
		  AND 	(ISNULL(@Profile, '')             = ''    OR a.Profile LIKE '%' + TRIM(@Profile) + '%')
	END

	-- EXEC Contracts.TenantsByContract_LIST @Option = null, @TenantsByContractId = null, @TenantId = null, @Profile = ''
END
GO
/****** Object:  StoredProcedure [Contracts].[TenantsByContract_READ]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	IF OBJECT_ID('Contracts.TenantsByContract_READ', 'P') IS NOT NULL DROP PROCEDURE Contracts.TenantsByContract_READ
	IF OBJECT_ID('Contracts.TenantsByContract_LIST', 'P') IS NOT NULL DROP PROCEDURE Contracts.TenantsByContract_LIST
	IF OBJECT_ID('Contracts.TenantsByContract_CREATE', 'P') IS NOT NULL DROP PROCEDURE Contracts.TenantsByContract_CREATE
	IF OBJECT_ID('Contracts.TenantsByContract_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Contracts.TenantsByContract_UPDATE
	IF OBJECT_ID('Contracts.TenantsByContract_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Contracts.TenantsByContract_ENABLE
	IF OBJECT_ID('Contracts.TenantsByContract_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Contracts.TenantsByContract_DISABLE
	IF OBJECT_ID('Contracts.TenantsByContract_DELETE', 'P') IS NOT NULL DROP PROCEDURE Contracts.TenantsByContract_DELETE
*/

CREATE PROCEDURE [Contracts].[TenantsByContract_READ]
	@Option              TINYINT = NULL,
	@TenantsByContractId INT = NULL,
	@TenantId            INT = NULL,
	@Profile             NVARCHAR(300) = ''
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.TenantsByContractId, a.TenantId, a.Profile
		FROM 	Contracts.TenantsByContract a
		WHERE 	(@TenantsByContractId IS NULL OR a.TenantsByContractId = @TenantsByContractId)
		  AND 	(@TenantId            IS NULL OR a.TenantId = @TenantId)
		  AND 	(ISNULL(@Profile, '')             = ''    OR a.Profile LIKE '%' + TRIM(@Profile) + '%')
	END

	-- EXEC Contracts.TenantsByContract_READ @Option = null, @TenantsByContractId = null, @TenantId = null, @Profile = ''
END
GO
/****** Object:  StoredProcedure [Contracts].[TenantsByContract_UPDATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Contracts].[TenantsByContract_UPDATE]
	@Option              TINYINT = NULL,
	@TenantsByContractId INT,
	@TenantId            INT,
	@Profile             NVARCHAR(300)
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	
	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			IF NOT EXISTS(SELECT 1 FROM Contracts.TenantsByContract WHERE TenantsByContractId = @TenantsByContractId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Contracts.TenantsByContract
			SET 	TenantId            = @TenantId,
					Profile             = @Profile
			WHERE 	TenantsByContractId = @TenantsByContractId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @TenantsByContractId TenantsByContractId
	-- EXEC Contracts.TenantsByContract_UPDATE @Option = null, @TenantsByContractId = null, @TenantId = null, @Profile = null
END
GO
/****** Object:  StoredProcedure [Owners].[Owner_CREATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Owners].[Owner_CREATE]
	@Option      TINYINT = NULL,
	@OwnerName   NVARCHAR(200),
	@Document    NVARCHAR(50),
	@Telephone   NVARCHAR(30),
	@Mobile      NVARCHAR(30),
	@Email       NVARCHAR(80),
	@Address     NVARCHAR(200),
	@Observation NVARCHAR(500),
	@CompayId    INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedOwnerId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Owners.Owner (OwnerName, Document, Telephone, Mobile, Email,
								Address, Observation, CompayId)
							VALUES (@OwnerName, @Document, @Telephone, @Mobile, @Email,
								@Address, @Observation, @CompayId)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedOwnerId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedOwnerId OwnerId
	-- EXEC Owners.Owner_CREATE @Option = null, @OwnerName = null, @Document = null, @Telephone = null, @Mobile = null, @Email = null, @Address = null, @Observation = null, @CompayId = null
END
GO
/****** Object:  StoredProcedure [Owners].[Owner_DELETE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Owners].[Owner_DELETE]
	@OwnerId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Owners.Owner WHERE OwnerId = @OwnerId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Owners.Owner
		WHERE  OwnerId = @OwnerId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @OwnerId OwnerId
	-- EXEC Owners.Owner_DELETE @OwnerId = null
END
GO
/****** Object:  StoredProcedure [Owners].[Owner_DISABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Owners].[Owner_DISABLE]
	@OwnerId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Owners.Owner WHERE OwnerId = @OwnerId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Owners.Owner WHERE OwnerId = @OwnerId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Owners.Owner
		SET		
		WHERE	Active = 1
		  AND 	OwnerId = @OwnerId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @OwnerId OwnerId
	-- EXEC Owners.Owner_DISABLE @OwnerId = null
END
GO
/****** Object:  StoredProcedure [Owners].[Owner_ENABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Owners].[Owner_ENABLE]
	@OwnerId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Owners.Owner WHERE OwnerId = @OwnerId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Owners.Owner WHERE OwnerId = @OwnerId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Owners.Owner
		SET		
		WHERE	Active = 0
		  AND 	OwnerId = @OwnerId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @OwnerId OwnerId
	-- EXEC Owners.Owner_ENABLE @OwnerId = null
END
GO
/****** Object:  StoredProcedure [Owners].[Owner_LIST]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Owners].[Owner_LIST]
	@Option      TINYINT = NULL,
	@OwnerId     INT = NULL,
	@OwnerName   NVARCHAR(200) = '',
	@Document    NVARCHAR(50) = '',
	@Telephone   NVARCHAR(30) = '',
	@Mobile      NVARCHAR(30) = '',
	@Email       NVARCHAR(80) = '',
	@Address     NVARCHAR(200) = '',
	@Observation NVARCHAR(500) = '',
	@CompayId    INT = NULL
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.OwnerId OwnerId, a.OwnerName OwnerName
		FROM 	Owners.Owner a
		WHERE 	(@OwnerId     IS NULL OR a.OwnerId = @OwnerId)
		  AND 	(ISNULL(@OwnerName, '')   = ''    OR a.OwnerName LIKE '%' + TRIM(@OwnerName) + '%')
		  AND 	(ISNULL(@Document, '')    = ''    OR a.Document LIKE '%' + TRIM(@Document) + '%')
		  AND 	(ISNULL(@Telephone, '')   = ''    OR a.Telephone LIKE '%' + TRIM(@Telephone) + '%')
		  AND 	(ISNULL(@Mobile, '')      = ''    OR a.Mobile LIKE '%' + TRIM(@Mobile) + '%')
		  AND 	(ISNULL(@Email, '')       = ''    OR a.Email LIKE '%' + TRIM(@Email) + '%')
		  AND 	(ISNULL(@Address, '')     = ''    OR a.Address LIKE '%' + TRIM(@Address) + '%')
		  AND 	(ISNULL(@Observation, '') = ''    OR a.Observation LIKE '%' + TRIM(@Observation) + '%')
		  AND 	(@CompayId    IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Owners.Owner_LIST @Option = null, @OwnerId = null, @OwnerName = '', @Document = '', @Telephone = '', @Mobile = '', @Email = '', @Address = '', @Observation = '', @CompayId = null
END
GO
/****** Object:  StoredProcedure [Owners].[Owner_READ]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	IF OBJECT_ID('Owners.Owner_READ', 'P') IS NOT NULL DROP PROCEDURE Owners.Owner_READ
	IF OBJECT_ID('Owners.Owner_LIST', 'P') IS NOT NULL DROP PROCEDURE Owners.Owner_LIST
	IF OBJECT_ID('Owners.Owner_CREATE', 'P') IS NOT NULL DROP PROCEDURE Owners.Owner_CREATE
	IF OBJECT_ID('Owners.Owner_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Owners.Owner_UPDATE
	IF OBJECT_ID('Owners.Owner_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Owners.Owner_ENABLE
	IF OBJECT_ID('Owners.Owner_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Owners.Owner_DISABLE
	IF OBJECT_ID('Owners.Owner_DELETE', 'P') IS NOT NULL DROP PROCEDURE Owners.Owner_DELETE
*/

CREATE PROCEDURE [Owners].[Owner_READ]
	@Option      TINYINT = NULL,
	@OwnerId     INT = NULL,
	@OwnerName   NVARCHAR(200) = '',
	@Document    NVARCHAR(50) = '',
	@Telephone   NVARCHAR(30) = '',
	@Mobile      NVARCHAR(30) = '',
	@Email       NVARCHAR(80) = '',
	@Address     NVARCHAR(200) = '',
	@Observation NVARCHAR(500) = '',
	@CompayId    INT = NULL
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.OwnerId, a.OwnerName, a.Document, a.Telephone, a.Mobile, 
				a.Email, a.Address, a.Observation, a.CompayId
		FROM 	Owners.Owner a
		WHERE 	(@OwnerId     IS NULL OR a.OwnerId = @OwnerId)
		  AND 	(ISNULL(@OwnerName, '')   = ''    OR a.OwnerName LIKE '%' + TRIM(@OwnerName) + '%')
		  AND 	(ISNULL(@Document, '')    = ''    OR a.Document LIKE '%' + TRIM(@Document) + '%')
		  AND 	(ISNULL(@Telephone, '')   = ''    OR a.Telephone LIKE '%' + TRIM(@Telephone) + '%')
		  AND 	(ISNULL(@Mobile, '')      = ''    OR a.Mobile LIKE '%' + TRIM(@Mobile) + '%')
		  AND 	(ISNULL(@Email, '')       = ''    OR a.Email LIKE '%' + TRIM(@Email) + '%')
		  AND 	(ISNULL(@Address, '')     = ''    OR a.Address LIKE '%' + TRIM(@Address) + '%')
		  AND 	(ISNULL(@Observation, '') = ''    OR a.Observation LIKE '%' + TRIM(@Observation) + '%')
		  AND 	(@CompayId    IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Owners.Owner_READ @Option = null, @OwnerId = null, @OwnerName = '', @Document = '', @Telephone = '', @Mobile = '', @Email = '', @Address = '', @Observation = '', @CompayId = null
END
GO
/****** Object:  StoredProcedure [Owners].[Owner_UPDATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Owners].[Owner_UPDATE]
	@Option      TINYINT = NULL,
	@OwnerId     INT,
	@OwnerName   NVARCHAR(200),
	@Document    NVARCHAR(50),
	@Telephone   NVARCHAR(30),
	@Mobile      NVARCHAR(30),
	@Email       NVARCHAR(80),
	@Address     NVARCHAR(200),
	@Observation NVARCHAR(500),
	@CompayId    INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	
	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			IF NOT EXISTS(SELECT 1 FROM Owners.Owner WHERE OwnerId = @OwnerId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Owners.Owner
			SET 	OwnerName   = @OwnerName,
					Document    = @Document,
					Telephone   = @Telephone,
					Mobile      = @Mobile,
					Email       = @Email,
					Address     = @Address,
					Observation = @Observation,
					CompayId    = @CompayId
			WHERE 	OwnerId = @OwnerId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @OwnerId OwnerId
	-- EXEC Owners.Owner_UPDATE @Option = null, @OwnerId = null, @OwnerName = null, @Document = null, @Telephone = null, @Mobile = null, @Email = null, @Address = null, @Observation = null, @CompayId = null
END
GO
/****** Object:  StoredProcedure [Properties].[Images_CREATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[Images_CREATE]
	@Option     TINYINT = NULL,
	@ImageName  NVARCHAR(50),
	@Path       NVARCHAR(150),
	@IsMain     BIT,
	@PropertyId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedImageId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Properties.Images (ImageName, Path, IsMain, PropertyId)
							VALUES (@ImageName, @Path, @IsMain, @PropertyId)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedImageId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedImageId ImageId
	-- EXEC Properties.Images_CREATE @Option = null, @ImageName = null, @Path = null, @IsMain = null, @PropertyId = null
END
GO
/****** Object:  StoredProcedure [Properties].[Images_DELETE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[Images_DELETE]
	@ImageId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Properties.Images WHERE ImageId = @ImageId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Properties.Images
		WHERE  ImageId = @ImageId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @ImageId ImageId
	-- EXEC Properties.Images_DELETE @ImageId = null
END
GO
/****** Object:  StoredProcedure [Properties].[Images_DISABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[Images_DISABLE]
	@ImageId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Properties.Images WHERE ImageId = @ImageId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Properties.Images WHERE ImageId = @ImageId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Properties.Images
		SET		
		WHERE	Active = 1
		  AND 	ImageId = @ImageId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @ImageId ImageId
	-- EXEC Properties.Images_DISABLE @ImageId = null
END
GO
/****** Object:  StoredProcedure [Properties].[Images_ENABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[Images_ENABLE]
	@ImageId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Properties.Images WHERE ImageId = @ImageId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Properties.Images WHERE ImageId = @ImageId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Properties.Images
		SET		
		WHERE	Active = 0
		  AND 	ImageId = @ImageId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @ImageId ImageId
	-- EXEC Properties.Images_ENABLE @ImageId = null
END
GO
/****** Object:  StoredProcedure [Properties].[Images_LIST]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[Images_LIST]
	@Option     TINYINT = NULL,
	@ImageId    INT = NULL,
	@ImageName  NVARCHAR(50) = '',
	@Path       NVARCHAR(150) = '',
	@IsMain     BIT = NULL,
	@PropertyId INT = NULL
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.ImageId ImagesId, a.ImageName ImagesName
		FROM 	Properties.Images a
		WHERE 	(@ImageId    IS NULL OR a.ImageId = @ImageId)
		  AND 	(ISNULL(@ImageName, '')  = ''    OR a.ImageName LIKE '%' + TRIM(@ImageName) + '%')
		  AND 	(ISNULL(@Path, '')       = ''    OR a.Path LIKE '%' + TRIM(@Path) + '%')
		  AND 	(@IsMain     IS NULL OR a.IsMain = @IsMain)
		  AND 	(@PropertyId IS NULL OR a.PropertyId = @PropertyId)
	END

	-- EXEC Properties.Images_LIST @Option = null, @ImageId = null, @ImageName = '', @Path = '', @IsMain = null, @PropertyId = null
END
GO
/****** Object:  StoredProcedure [Properties].[Images_READ]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	IF OBJECT_ID('Properties.Images_READ', 'P') IS NOT NULL DROP PROCEDURE Properties.Images_READ
	IF OBJECT_ID('Properties.Images_LIST', 'P') IS NOT NULL DROP PROCEDURE Properties.Images_LIST
	IF OBJECT_ID('Properties.Images_CREATE', 'P') IS NOT NULL DROP PROCEDURE Properties.Images_CREATE
	IF OBJECT_ID('Properties.Images_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Properties.Images_UPDATE
	IF OBJECT_ID('Properties.Images_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Properties.Images_ENABLE
	IF OBJECT_ID('Properties.Images_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Properties.Images_DISABLE
	IF OBJECT_ID('Properties.Images_DELETE', 'P') IS NOT NULL DROP PROCEDURE Properties.Images_DELETE
*/

CREATE PROCEDURE [Properties].[Images_READ]
	@Option     TINYINT = NULL,
	@ImageId    INT = NULL,
	@ImageName  NVARCHAR(50) = '',
	@Path       NVARCHAR(150) = '',
	@IsMain     BIT = NULL,
	@PropertyId INT = NULL
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.ImageId, a.ImageName, a.Path, a.IsMain, a.PropertyId
		FROM 	Properties.Images a
		WHERE 	(@ImageId    IS NULL OR a.ImageId = @ImageId)
		  AND 	(ISNULL(@ImageName, '')  = ''    OR a.ImageName LIKE '%' + TRIM(@ImageName) + '%')
		  AND 	(ISNULL(@Path, '')       = ''    OR a.Path LIKE '%' + TRIM(@Path) + '%')
		  AND 	(@IsMain     IS NULL OR a.IsMain = @IsMain)
		  AND 	(@PropertyId IS NULL OR a.PropertyId = @PropertyId)
	END

	-- EXEC Properties.Images_READ @Option = null, @ImageId = null, @ImageName = '', @Path = '', @IsMain = null, @PropertyId = null
END
GO
/****** Object:  StoredProcedure [Properties].[Images_UPDATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[Images_UPDATE]
	@Option     TINYINT = NULL,
	@ImageId    INT,
	@ImageName  NVARCHAR(50),
	@Path       NVARCHAR(150),
	@IsMain     BIT,
	@PropertyId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	
	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			IF NOT EXISTS(SELECT 1 FROM Properties.Images WHERE ImageId = @ImageId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Properties.Images
			SET 	ImageName  = @ImageName,
					Path       = @Path,
					IsMain     = @IsMain,
					PropertyId = @PropertyId
			WHERE 	ImageId = @ImageId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @ImageId ImageId
	-- EXEC Properties.Images_UPDATE @Option = null, @ImageId = null, @ImageName = null, @Path = null, @IsMain = null, @PropertyId = null
END
GO
/****** Object:  StoredProcedure [Properties].[Iva_CREATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[Iva_CREATE]
	@Option    TINYINT = NULL,
	@Valor     FLOAT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedIvaId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Properties.Iva (Valor)
							VALUES (@Valor)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedIvaId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedIvaId IvaId
	-- EXEC Properties.Iva_CREATE @Option = null, @Valor = null
END
GO
/****** Object:  StoredProcedure [Properties].[Iva_DELETE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[Iva_DELETE]
	@IvaId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Properties.Iva WHERE IvaId = @IvaId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Properties.Iva
		WHERE  IvaId = @IvaId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @IvaId IvaId
	-- EXEC Properties.Iva_DELETE @IvaId = null
END
GO
/****** Object:  StoredProcedure [Properties].[Iva_DISABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[Iva_DISABLE]
	@IvaId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Properties.Iva WHERE IvaId = @IvaId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Properties.Iva WHERE IvaId = @IvaId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Properties.Iva
		SET		
		WHERE	Active = 1
		  AND 	IvaId = @IvaId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @IvaId IvaId
	-- EXEC Properties.Iva_DISABLE @IvaId = null
END
GO
/****** Object:  StoredProcedure [Properties].[Iva_ENABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[Iva_ENABLE]
	@IvaId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Properties.Iva WHERE IvaId = @IvaId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Properties.Iva WHERE IvaId = @IvaId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Properties.Iva
		SET		
		WHERE	Active = 0
		  AND 	IvaId = @IvaId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @IvaId IvaId
	-- EXEC Properties.Iva_ENABLE @IvaId = null
END
GO
/****** Object:  StoredProcedure [Properties].[Iva_LIST]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[Iva_LIST]
	@Option TINYINT = NULL,
	@IvaId INT = NULL
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.IvaId IvaId, a.IvaId IvaName
		FROM 	Properties.Iva a
		WHERE 	(@IvaId IS NULL OR a.IvaId = @IvaId)
	END

	-- EXEC Properties.Iva_LIST @Option = null, @IvaId = null
END
GO
/****** Object:  StoredProcedure [Properties].[Iva_READ]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	IF OBJECT_ID('Properties.Iva_READ', 'P') IS NOT NULL DROP PROCEDURE Properties.Iva_READ
	IF OBJECT_ID('Properties.Iva_LIST', 'P') IS NOT NULL DROP PROCEDURE Properties.Iva_LIST
	IF OBJECT_ID('Properties.Iva_CREATE', 'P') IS NOT NULL DROP PROCEDURE Properties.Iva_CREATE
	IF OBJECT_ID('Properties.Iva_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Properties.Iva_UPDATE
	IF OBJECT_ID('Properties.Iva_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Properties.Iva_ENABLE
	IF OBJECT_ID('Properties.Iva_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Properties.Iva_DISABLE
	IF OBJECT_ID('Properties.Iva_DELETE', 'P') IS NOT NULL DROP PROCEDURE Properties.Iva_DELETE
*/

CREATE PROCEDURE [Properties].[Iva_READ]
	@Option TINYINT = NULL,
	@IvaId INT = NULL
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.IvaId, a.Valor
		FROM 	Properties.Iva a
		WHERE 	(@IvaId IS NULL OR a.IvaId = @IvaId)
	END

	-- EXEC Properties.Iva_READ @Option = null, @IvaId = null
END
GO
/****** Object:  StoredProcedure [Properties].[Iva_UPDATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[Iva_UPDATE]
	@Option    TINYINT = NULL,
	@IvaId     INT,
	@Valor     FLOAT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	
	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			IF NOT EXISTS(SELECT 1 FROM Properties.Iva WHERE IvaId = @IvaId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Properties.Iva
			SET 	Valor     = @Valor
			WHERE 	IvaId = @IvaId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @IvaId IvaId
	-- EXEC Properties.Iva_UPDATE @Option = null, @IvaId = null, @Valor = null
END
GO
/****** Object:  StoredProcedure [Properties].[Property_CREATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[Property_CREATE]
	@Option             TINYINT = NULL,
	@IdIva              INT,
	@Code               NVARCHAR(100),
	@Title              NVARCHAR(100),
	@Description        NVARCHAR(500),
	@Address            NVARCHAR(200),
	@PriceOwner         DECIMAL,
	@Percentage         DECIMAL,
	@FeeCompany         DECIMAL,
	@RecruitmentDate    DATE,
	@FinalPrice         DECIMAL,
	@Rooms              INT,
	@Toilets            INT,
	@Reception          BIT,
	@Pool               BIT,
	@Area               DECIMAL,
	@Observation        NVARCHAR(500),
	@PropertyStatusId   INT,
	@CityId             INT,
	@ZoneId             INT,
	@OwnerId            INT,
	@PropertyCategoryId INT,
	@TypeOfferId        INT,
	@CompayId           INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedPropertyId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Properties.Property (IdIva, Code, Title, Description, Address,
								PriceOwner, Percentage, FeeCompany, RecruitmentDate, FinalPrice,
								Rooms, Toilets, Reception, Pool, Area,
								Observation, PropertyStatusId, CityId, ZoneId, OwnerId,
								PropertyCategoryId, TypeOfferId, CompayId)
							VALUES (@IdIva, @Code, @Title, @Description, @Address,
								@PriceOwner, @Percentage, @FeeCompany, @RecruitmentDate, @FinalPrice,
								@Rooms, @Toilets, @Reception, @Pool, @Area,
								@Observation, @PropertyStatusId, @CityId, @ZoneId, @OwnerId,
								@PropertyCategoryId, @TypeOfferId, @CompayId)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedPropertyId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedPropertyId PropertyId
	-- EXEC Properties.Property_CREATE @Option = null, @IdIva = null, @Code = null, @Title = null, @Description = null, @Address = null, @PriceOwner = null, @Percentage = null, @FeeCompany = null, @RecruitmentDate = null, @FinalPrice = null, @Rooms = null, @Toilets = null, @Reception = null, @Pool = null, @Area = null, @Observation = null, @PropertyStatusId = null, @CityId = null, @ZoneId = null, @OwnerId = null, @PropertyCategoryId = null, @TypeOfferId = null, @CompayId = null
END
GO
/****** Object:  StoredProcedure [Properties].[Property_DELETE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[Property_DELETE]
	@PropertyId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Properties.Property WHERE PropertyId = @PropertyId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Properties.Property
		WHERE  PropertyId = @PropertyId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @PropertyId PropertyId
	-- EXEC Properties.Property_DELETE @PropertyId = null
END
GO
/****** Object:  StoredProcedure [Properties].[Property_DISABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[Property_DISABLE]
	@PropertyId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Properties.Property WHERE PropertyId = @PropertyId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Properties.Property WHERE PropertyId = @PropertyId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Properties.Property
		SET		
		WHERE	Active = 1
		  AND 	PropertyId = @PropertyId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @PropertyId PropertyId
	-- EXEC Properties.Property_DISABLE @PropertyId = null
END
GO
/****** Object:  StoredProcedure [Properties].[Property_ENABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[Property_ENABLE]
	@PropertyId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Properties.Property WHERE PropertyId = @PropertyId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Properties.Property WHERE PropertyId = @PropertyId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Properties.Property
		SET		
		WHERE	Active = 0
		  AND 	PropertyId = @PropertyId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @PropertyId PropertyId
	-- EXEC Properties.Property_ENABLE @PropertyId = null
END
GO
/****** Object:  StoredProcedure [Properties].[Property_LIST]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[Property_LIST]
	@Option             TINYINT = NULL,
	@PropertyId         INT = NULL,
	@IdIva              INT = NULL,
	@Code               NVARCHAR(100) = '',
	@Title              NVARCHAR(100) = '',
	@Description        NVARCHAR(500) = '',
	@Address            NVARCHAR(200) = '',
	@Reception          BIT = NULL,
	@Pool               BIT = NULL,
	@Observation        NVARCHAR(500) = '',
	@PropertyStatusId   INT = NULL,
	@CityId             INT = NULL,
	@ZoneId             INT = NULL,
	@OwnerId            INT = NULL,
	@PropertyCategoryId INT = NULL,
	@TypeOfferId        INT = NULL,
	@CompayId           INT = NULL
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.PropertyId PropertyId, a.PropertyId PropertyName
		FROM 	Properties.Property a
		WHERE 	(@PropertyId         IS NULL OR a.PropertyId = @PropertyId)
		  AND 	(@IdIva              IS NULL OR a.IdIva = @IdIva)
		  AND 	(ISNULL(@Code, '')               = ''    OR a.Code LIKE '%' + TRIM(@Code) + '%')
		  AND 	(ISNULL(@Title, '')              = ''    OR a.Title LIKE '%' + TRIM(@Title) + '%')
		  AND 	(ISNULL(@Description, '')        = ''    OR a.Description LIKE '%' + TRIM(@Description) + '%')
		  AND 	(ISNULL(@Address, '')            = ''    OR a.Address LIKE '%' + TRIM(@Address) + '%')
		  AND 	(@Reception          IS NULL OR a.Reception = @Reception)
		  AND 	(@Pool               IS NULL OR a.Pool = @Pool)
		  AND 	(ISNULL(@Observation, '')        = ''    OR a.Observation LIKE '%' + TRIM(@Observation) + '%')
		  AND 	(@PropertyStatusId   IS NULL OR a.PropertyStatusId = @PropertyStatusId)
		  AND 	(@CityId             IS NULL OR a.CityId = @CityId)
		  AND 	(@ZoneId             IS NULL OR a.ZoneId = @ZoneId)
		  AND 	(@OwnerId            IS NULL OR a.OwnerId = @OwnerId)
		  AND 	(@PropertyCategoryId IS NULL OR a.PropertyCategoryId = @PropertyCategoryId)
		  AND 	(@TypeOfferId        IS NULL OR a.TypeOfferId = @TypeOfferId)
		  AND 	(@CompayId           IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Properties.Property_LIST @Option = null, @PropertyId = null, @IdIva = null, @Code = '', @Title = '', @Description = '', @Address = '', @Reception = null, @Pool = null, @Observation = '', @PropertyStatusId = null, @CityId = null, @ZoneId = null, @OwnerId = null, @PropertyCategoryId = null, @TypeOfferId = null, @CompayId = null
END
GO
/****** Object:  StoredProcedure [Properties].[Property_READ]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	IF OBJECT_ID('Properties.Property_READ', 'P') IS NOT NULL DROP PROCEDURE Properties.Property_READ
	IF OBJECT_ID('Properties.Property_LIST', 'P') IS NOT NULL DROP PROCEDURE Properties.Property_LIST
	IF OBJECT_ID('Properties.Property_CREATE', 'P') IS NOT NULL DROP PROCEDURE Properties.Property_CREATE
	IF OBJECT_ID('Properties.Property_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Properties.Property_UPDATE
	IF OBJECT_ID('Properties.Property_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Properties.Property_ENABLE
	IF OBJECT_ID('Properties.Property_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Properties.Property_DISABLE
	IF OBJECT_ID('Properties.Property_DELETE', 'P') IS NOT NULL DROP PROCEDURE Properties.Property_DELETE
*/

CREATE PROCEDURE [Properties].[Property_READ]
	@Option             TINYINT = NULL,
	@PropertyId         INT = NULL,
	@IdIva              INT = NULL,
	@Code               NVARCHAR(100) = '',
	@Title              NVARCHAR(100) = '',
	@Description        NVARCHAR(500) = '',
	@Address            NVARCHAR(200) = '',
	@Reception          BIT = NULL,
	@Pool               BIT = NULL,
	@Observation        NVARCHAR(500) = '',
	@PropertyStatusId   INT = NULL,
	@CityId             INT = NULL,
	@ZoneId             INT = NULL,
	@OwnerId            INT = NULL,
	@PropertyCategoryId INT = NULL,
	@TypeOfferId        INT = NULL,
	@CompayId           INT = NULL
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.PropertyId, a.IdIva, a.Code, a.Title, a.Description, 
				a.Address, a.PriceOwner, a.Percentage, a.FeeCompany, a.RecruitmentDate, 
				a.FinalPrice, a.Rooms, a.Toilets, a.Reception, a.Pool, 
				a.Area, a.Observation, a.PropertyStatusId, a.CityId, a.ZoneId, 
				a.OwnerId, a.PropertyCategoryId, a.TypeOfferId, a.CompayId
		FROM 	Properties.Property a
		WHERE 	(@PropertyId         IS NULL OR a.PropertyId = @PropertyId)
		  AND 	(@IdIva              IS NULL OR a.IdIva = @IdIva)
		  AND 	(ISNULL(@Code, '')               = ''    OR a.Code LIKE '%' + TRIM(@Code) + '%')
		  AND 	(ISNULL(@Title, '')              = ''    OR a.Title LIKE '%' + TRIM(@Title) + '%')
		  AND 	(ISNULL(@Description, '')        = ''    OR a.Description LIKE '%' + TRIM(@Description) + '%')
		  AND 	(ISNULL(@Address, '')            = ''    OR a.Address LIKE '%' + TRIM(@Address) + '%')
		  AND 	(@Reception          IS NULL OR a.Reception = @Reception)
		  AND 	(@Pool               IS NULL OR a.Pool = @Pool)
		  AND 	(ISNULL(@Observation, '')        = ''    OR a.Observation LIKE '%' + TRIM(@Observation) + '%')
		  AND 	(@PropertyStatusId   IS NULL OR a.PropertyStatusId = @PropertyStatusId)
		  AND 	(@CityId             IS NULL OR a.CityId = @CityId)
		  AND 	(@ZoneId             IS NULL OR a.ZoneId = @ZoneId)
		  AND 	(@OwnerId            IS NULL OR a.OwnerId = @OwnerId)
		  AND 	(@PropertyCategoryId IS NULL OR a.PropertyCategoryId = @PropertyCategoryId)
		  AND 	(@TypeOfferId        IS NULL OR a.TypeOfferId = @TypeOfferId)
		  AND 	(@CompayId           IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Properties.Property_READ @Option = null, @PropertyId = null, @IdIva = null, @Code = '', @Title = '', @Description = '', @Address = '', @Reception = null, @Pool = null, @Observation = '', @PropertyStatusId = null, @CityId = null, @ZoneId = null, @OwnerId = null, @PropertyCategoryId = null, @TypeOfferId = null, @CompayId = null
END
GO
/****** Object:  StoredProcedure [Properties].[Property_UPDATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[Property_UPDATE]
	@Option             TINYINT = NULL,
	@PropertyId         INT,
	@IdIva              INT,
	@Code               NVARCHAR(100),
	@Title              NVARCHAR(100),
	@Description        NVARCHAR(500),
	@Address            NVARCHAR(200),
	@PriceOwner         DECIMAL,
	@Percentage         DECIMAL,
	@FeeCompany         DECIMAL,
	@RecruitmentDate    DATE,
	@FinalPrice         DECIMAL,
	@Rooms              INT,
	@Toilets            INT,
	@Reception          BIT,
	@Pool               BIT,
	@Area               DECIMAL,
	@Observation        NVARCHAR(500),
	@PropertyStatusId   INT,
	@CityId             INT,
	@ZoneId             INT,
	@OwnerId            INT,
	@PropertyCategoryId INT,
	@TypeOfferId        INT,
	@CompayId           INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	
	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			IF NOT EXISTS(SELECT 1 FROM Properties.Property WHERE PropertyId = @PropertyId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Properties.Property
			SET 	IdIva              = @IdIva,
					Code               = @Code,
					Title              = @Title,
					Description        = @Description,
					Address            = @Address,
					PriceOwner         = @PriceOwner,
					Percentage         = @Percentage,
					FeeCompany         = @FeeCompany,
					RecruitmentDate    = @RecruitmentDate,
					FinalPrice         = @FinalPrice,
					Rooms              = @Rooms,
					Toilets            = @Toilets,
					Reception          = @Reception,
					Pool               = @Pool,
					Area               = @Area,
					Observation        = @Observation,
					PropertyStatusId   = @PropertyStatusId,
					CityId             = @CityId,
					ZoneId             = @ZoneId,
					OwnerId            = @OwnerId,
					PropertyCategoryId = @PropertyCategoryId,
					TypeOfferId        = @TypeOfferId,
					CompayId           = @CompayId
			WHERE 	PropertyId = @PropertyId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @PropertyId PropertyId
	-- EXEC Properties.Property_UPDATE @Option = null, @PropertyId = null, @IdIva = null, @Code = null, @Title = null, @Description = null, @Address = null, @PriceOwner = null, @Percentage = null, @FeeCompany = null, @RecruitmentDate = null, @FinalPrice = null, @Rooms = null, @Toilets = null, @Reception = null, @Pool = null, @Area = null, @Observation = null, @PropertyStatusId = null, @CityId = null, @ZoneId = null, @OwnerId = null, @PropertyCategoryId = null, @TypeOfferId = null, @CompayId = null
END
GO
/****** Object:  StoredProcedure [Properties].[PropertyCategory_CREATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[PropertyCategory_CREATE]
	@Option       TINYINT = NULL,
	@CategoryName NVARCHAR(200)
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedPropertyCategoryId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Properties.PropertyCategory (CategoryName)
							VALUES (@CategoryName)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedPropertyCategoryId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedPropertyCategoryId PropertyCategoryId
	-- EXEC Properties.PropertyCategory_CREATE @Option = null, @CategoryName = null
END
GO
/****** Object:  StoredProcedure [Properties].[PropertyCategory_DELETE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[PropertyCategory_DELETE]
	@PropertyCategoryId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Properties.PropertyCategory WHERE PropertyCategoryId = @PropertyCategoryId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Properties.PropertyCategory
		WHERE  PropertyCategoryId = @PropertyCategoryId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @PropertyCategoryId PropertyCategoryId
	-- EXEC Properties.PropertyCategory_DELETE @PropertyCategoryId = null
END
GO
/****** Object:  StoredProcedure [Properties].[PropertyCategory_DISABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[PropertyCategory_DISABLE]
	@PropertyCategoryId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Properties.PropertyCategory WHERE PropertyCategoryId = @PropertyCategoryId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Properties.PropertyCategory WHERE PropertyCategoryId = @PropertyCategoryId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Properties.PropertyCategory
		SET		
		WHERE	Active = 1
		  AND 	PropertyCategoryId = @PropertyCategoryId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @PropertyCategoryId PropertyCategoryId
	-- EXEC Properties.PropertyCategory_DISABLE @PropertyCategoryId = null
END
GO
/****** Object:  StoredProcedure [Properties].[PropertyCategory_ENABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[PropertyCategory_ENABLE]
	@PropertyCategoryId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Properties.PropertyCategory WHERE PropertyCategoryId = @PropertyCategoryId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Properties.PropertyCategory WHERE PropertyCategoryId = @PropertyCategoryId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Properties.PropertyCategory
		SET		
		WHERE	Active = 0
		  AND 	PropertyCategoryId = @PropertyCategoryId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @PropertyCategoryId PropertyCategoryId
	-- EXEC Properties.PropertyCategory_ENABLE @PropertyCategoryId = null
END
GO
/****** Object:  StoredProcedure [Properties].[PropertyCategory_LIST]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[PropertyCategory_LIST]
	@Option             TINYINT = NULL,
	@PropertyCategoryId INT = NULL,
	@CategoryName       NVARCHAR(200) = ''
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.PropertyCategoryId PropertyCategoryId, a.PropertyCategoryId PropertyCategoryName
		FROM 	Properties.PropertyCategory a
		WHERE 	(@PropertyCategoryId IS NULL OR a.PropertyCategoryId = @PropertyCategoryId)
		  AND 	(ISNULL(@CategoryName, '')       = ''    OR a.CategoryName LIKE '%' + TRIM(@CategoryName) + '%')
	END

	-- EXEC Properties.PropertyCategory_LIST @Option = null, @PropertyCategoryId = null, @CategoryName = ''
END
GO
/****** Object:  StoredProcedure [Properties].[PropertyCategory_READ]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	IF OBJECT_ID('Properties.PropertyCategory_READ', 'P') IS NOT NULL DROP PROCEDURE Properties.PropertyCategory_READ
	IF OBJECT_ID('Properties.PropertyCategory_LIST', 'P') IS NOT NULL DROP PROCEDURE Properties.PropertyCategory_LIST
	IF OBJECT_ID('Properties.PropertyCategory_CREATE', 'P') IS NOT NULL DROP PROCEDURE Properties.PropertyCategory_CREATE
	IF OBJECT_ID('Properties.PropertyCategory_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Properties.PropertyCategory_UPDATE
	IF OBJECT_ID('Properties.PropertyCategory_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Properties.PropertyCategory_ENABLE
	IF OBJECT_ID('Properties.PropertyCategory_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Properties.PropertyCategory_DISABLE
	IF OBJECT_ID('Properties.PropertyCategory_DELETE', 'P') IS NOT NULL DROP PROCEDURE Properties.PropertyCategory_DELETE
*/

CREATE PROCEDURE [Properties].[PropertyCategory_READ]
	@Option             TINYINT = NULL,
	@PropertyCategoryId INT = NULL,
	@CategoryName       NVARCHAR(200) = ''
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.PropertyCategoryId, a.CategoryName
		FROM 	Properties.PropertyCategory a
		WHERE 	(@PropertyCategoryId IS NULL OR a.PropertyCategoryId = @PropertyCategoryId)
		  AND 	(ISNULL(@CategoryName, '')       = ''    OR a.CategoryName LIKE '%' + TRIM(@CategoryName) + '%')
	END

	-- EXEC Properties.PropertyCategory_READ @Option = null, @PropertyCategoryId = null, @CategoryName = ''
END
GO
/****** Object:  StoredProcedure [Properties].[PropertyCategory_UPDATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[PropertyCategory_UPDATE]
	@Option             TINYINT = NULL,
	@PropertyCategoryId INT,
	@CategoryName       NVARCHAR(200)
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	
	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			IF NOT EXISTS(SELECT 1 FROM Properties.PropertyCategory WHERE PropertyCategoryId = @PropertyCategoryId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Properties.PropertyCategory
			SET 	CategoryName       = @CategoryName
			WHERE 	PropertyCategoryId = @PropertyCategoryId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @PropertyCategoryId PropertyCategoryId
	-- EXEC Properties.PropertyCategory_UPDATE @Option = null, @PropertyCategoryId = null, @CategoryName = null
END
GO
/****** Object:  StoredProcedure [Properties].[PropertyStatus_CREATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[PropertyStatus_CREATE]
	@Option             TINYINT = NULL,
	@PropertyStatusName NVARCHAR(200)
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedPropertyStatusId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Properties.PropertyStatus (PropertyStatusName)
							VALUES (@PropertyStatusName)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedPropertyStatusId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedPropertyStatusId PropertyStatusId
	-- EXEC Properties.PropertyStatus_CREATE @Option = null, @PropertyStatusName = null
END
GO
/****** Object:  StoredProcedure [Properties].[PropertyStatus_DELETE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[PropertyStatus_DELETE]
	@PropertyStatusId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Properties.PropertyStatus WHERE PropertyStatusId = @PropertyStatusId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Properties.PropertyStatus
		WHERE  PropertyStatusId = @PropertyStatusId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @PropertyStatusId PropertyStatusId
	-- EXEC Properties.PropertyStatus_DELETE @PropertyStatusId = null
END
GO
/****** Object:  StoredProcedure [Properties].[PropertyStatus_DISABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[PropertyStatus_DISABLE]
	@PropertyStatusId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Properties.PropertyStatus WHERE PropertyStatusId = @PropertyStatusId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Properties.PropertyStatus WHERE PropertyStatusId = @PropertyStatusId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Properties.PropertyStatus
		SET		
		WHERE	Active = 1
		  AND 	PropertyStatusId = @PropertyStatusId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @PropertyStatusId PropertyStatusId
	-- EXEC Properties.PropertyStatus_DISABLE @PropertyStatusId = null
END
GO
/****** Object:  StoredProcedure [Properties].[PropertyStatus_ENABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[PropertyStatus_ENABLE]
	@PropertyStatusId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Properties.PropertyStatus WHERE PropertyStatusId = @PropertyStatusId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Properties.PropertyStatus WHERE PropertyStatusId = @PropertyStatusId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Properties.PropertyStatus
		SET		
		WHERE	Active = 0
		  AND 	PropertyStatusId = @PropertyStatusId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @PropertyStatusId PropertyStatusId
	-- EXEC Properties.PropertyStatus_ENABLE @PropertyStatusId = null
END
GO
/****** Object:  StoredProcedure [Properties].[PropertyStatus_LIST]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[PropertyStatus_LIST]
	@Option             TINYINT = NULL,
	@PropertyStatusId   INT = NULL,
	@PropertyStatusName NVARCHAR(200) = ''
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.PropertyStatusId PropertyStatusId, a.PropertyStatusName PropertyStatusName
		FROM 	Properties.PropertyStatus a
		WHERE 	(@PropertyStatusId   IS NULL OR a.PropertyStatusId = @PropertyStatusId)
		  AND 	(ISNULL(@PropertyStatusName, '') = ''    OR a.PropertyStatusName LIKE '%' + TRIM(@PropertyStatusName) + '%')
	END

	-- EXEC Properties.PropertyStatus_LIST @Option = null, @PropertyStatusId = null, @PropertyStatusName = ''
END
GO
/****** Object:  StoredProcedure [Properties].[PropertyStatus_READ]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	IF OBJECT_ID('Properties.PropertyStatus_READ', 'P') IS NOT NULL DROP PROCEDURE Properties.PropertyStatus_READ
	IF OBJECT_ID('Properties.PropertyStatus_LIST', 'P') IS NOT NULL DROP PROCEDURE Properties.PropertyStatus_LIST
	IF OBJECT_ID('Properties.PropertyStatus_CREATE', 'P') IS NOT NULL DROP PROCEDURE Properties.PropertyStatus_CREATE
	IF OBJECT_ID('Properties.PropertyStatus_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Properties.PropertyStatus_UPDATE
	IF OBJECT_ID('Properties.PropertyStatus_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Properties.PropertyStatus_ENABLE
	IF OBJECT_ID('Properties.PropertyStatus_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Properties.PropertyStatus_DISABLE
	IF OBJECT_ID('Properties.PropertyStatus_DELETE', 'P') IS NOT NULL DROP PROCEDURE Properties.PropertyStatus_DELETE
*/

CREATE PROCEDURE [Properties].[PropertyStatus_READ]
	@Option             TINYINT = NULL,
	@PropertyStatusId   INT = NULL,
	@PropertyStatusName NVARCHAR(200) = ''
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.PropertyStatusId, a.PropertyStatusName
		FROM 	Properties.PropertyStatus a
		WHERE 	(@PropertyStatusId   IS NULL OR a.PropertyStatusId = @PropertyStatusId)
		  AND 	(ISNULL(@PropertyStatusName, '') = ''    OR a.PropertyStatusName LIKE '%' + TRIM(@PropertyStatusName) + '%')
	END

	-- EXEC Properties.PropertyStatus_READ @Option = null, @PropertyStatusId = null, @PropertyStatusName = ''
END
GO
/****** Object:  StoredProcedure [Properties].[PropertyStatus_UPDATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[PropertyStatus_UPDATE]
	@Option             TINYINT = NULL,
	@PropertyStatusId   INT,
	@PropertyStatusName NVARCHAR(200)
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	
	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			IF NOT EXISTS(SELECT 1 FROM Properties.PropertyStatus WHERE PropertyStatusId = @PropertyStatusId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Properties.PropertyStatus
			SET 	PropertyStatusName = @PropertyStatusName
			WHERE 	PropertyStatusId = @PropertyStatusId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @PropertyStatusId PropertyStatusId
	-- EXEC Properties.PropertyStatus_UPDATE @Option = null, @PropertyStatusId = null, @PropertyStatusName = null
END
GO
/****** Object:  StoredProcedure [Properties].[TypeOffer_CREATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[TypeOffer_CREATE]
	@Option        TINYINT = NULL,
	@TypeOfferName NVARCHAR(200)
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedTypeOfferId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Properties.TypeOffer (TypeOfferName)
							VALUES (@TypeOfferName)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedTypeOfferId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedTypeOfferId TypeOfferId
	-- EXEC Properties.TypeOffer_CREATE @Option = null, @TypeOfferName = null
END
GO
/****** Object:  StoredProcedure [Properties].[TypeOffer_DELETE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[TypeOffer_DELETE]
	@TypeOfferId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Properties.TypeOffer WHERE TypeOfferId = @TypeOfferId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Properties.TypeOffer
		WHERE  TypeOfferId = @TypeOfferId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @TypeOfferId TypeOfferId
	-- EXEC Properties.TypeOffer_DELETE @TypeOfferId = null
END
GO
/****** Object:  StoredProcedure [Properties].[TypeOffer_DISABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[TypeOffer_DISABLE]
	@TypeOfferId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Properties.TypeOffer WHERE TypeOfferId = @TypeOfferId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Properties.TypeOffer WHERE TypeOfferId = @TypeOfferId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Properties.TypeOffer
		SET		
		WHERE	Active = 1
		  AND 	TypeOfferId = @TypeOfferId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @TypeOfferId TypeOfferId
	-- EXEC Properties.TypeOffer_DISABLE @TypeOfferId = null
END
GO
/****** Object:  StoredProcedure [Properties].[TypeOffer_ENABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[TypeOffer_ENABLE]
	@TypeOfferId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Properties.TypeOffer WHERE TypeOfferId = @TypeOfferId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Properties.TypeOffer WHERE TypeOfferId = @TypeOfferId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Properties.TypeOffer
		SET		
		WHERE	Active = 0
		  AND 	TypeOfferId = @TypeOfferId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @TypeOfferId TypeOfferId
	-- EXEC Properties.TypeOffer_ENABLE @TypeOfferId = null
END
GO
/****** Object:  StoredProcedure [Properties].[TypeOffer_LIST]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[TypeOffer_LIST]
	@Option        TINYINT = NULL,
	@TypeOfferId   INT = NULL,
	@TypeOfferName NVARCHAR(200) = ''
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.TypeOfferId TypeOfferId, a.TypeOfferName TypeOfferName
		FROM 	Properties.TypeOffer a
		WHERE 	(@TypeOfferId   IS NULL OR a.TypeOfferId = @TypeOfferId)
		  AND 	(ISNULL(@TypeOfferName, '') = ''    OR a.TypeOfferName LIKE '%' + TRIM(@TypeOfferName) + '%')
	END

	-- EXEC Properties.TypeOffer_LIST @Option = null, @TypeOfferId = null, @TypeOfferName = ''
END
GO
/****** Object:  StoredProcedure [Properties].[TypeOffer_READ]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	IF OBJECT_ID('Properties.TypeOffer_READ', 'P') IS NOT NULL DROP PROCEDURE Properties.TypeOffer_READ
	IF OBJECT_ID('Properties.TypeOffer_LIST', 'P') IS NOT NULL DROP PROCEDURE Properties.TypeOffer_LIST
	IF OBJECT_ID('Properties.TypeOffer_CREATE', 'P') IS NOT NULL DROP PROCEDURE Properties.TypeOffer_CREATE
	IF OBJECT_ID('Properties.TypeOffer_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Properties.TypeOffer_UPDATE
	IF OBJECT_ID('Properties.TypeOffer_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Properties.TypeOffer_ENABLE
	IF OBJECT_ID('Properties.TypeOffer_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Properties.TypeOffer_DISABLE
	IF OBJECT_ID('Properties.TypeOffer_DELETE', 'P') IS NOT NULL DROP PROCEDURE Properties.TypeOffer_DELETE
*/

CREATE PROCEDURE [Properties].[TypeOffer_READ]
	@Option        TINYINT = NULL,
	@TypeOfferId   INT = NULL,
	@TypeOfferName NVARCHAR(200) = ''
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.TypeOfferId, a.TypeOfferName
		FROM 	Properties.TypeOffer a
		WHERE 	(@TypeOfferId   IS NULL OR a.TypeOfferId = @TypeOfferId)
		  AND 	(ISNULL(@TypeOfferName, '') = ''    OR a.TypeOfferName LIKE '%' + TRIM(@TypeOfferName) + '%')
	END

	-- EXEC Properties.TypeOffer_READ @Option = null, @TypeOfferId = null, @TypeOfferName = ''
END
GO
/****** Object:  StoredProcedure [Properties].[TypeOffer_UPDATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Properties].[TypeOffer_UPDATE]
	@Option        TINYINT = NULL,
	@TypeOfferId   INT,
	@TypeOfferName NVARCHAR(200)
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	
	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			IF NOT EXISTS(SELECT 1 FROM Properties.TypeOffer WHERE TypeOfferId = @TypeOfferId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Properties.TypeOffer
			SET 	TypeOfferName = @TypeOfferName
			WHERE 	TypeOfferId = @TypeOfferId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @TypeOfferId TypeOfferId
	-- EXEC Properties.TypeOffer_UPDATE @Option = null, @TypeOfferId = null, @TypeOfferName = null
END
GO
/****** Object:  StoredProcedure [Tenants].[Tenant_CREATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Tenants].[Tenant_CREATE]
	@Option      TINYINT = NULL,
	@TenantName  NVARCHAR(200),
	@Document    NVARCHAR(50),
	@Telephone   NVARCHAR(30),
	@Mobile      NVARCHAR(30),
	@Email       NVARCHAR(80),
	@Address     NVARCHAR(200),
	@Observation NVARCHAR(500),
	@CompayId    INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedTenantId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Tenants.Tenant (TenantName, Document, Telephone, Mobile, Email,
								Address, Observation, CompayId)
							VALUES (@TenantName, @Document, @Telephone, @Mobile, @Email,
								@Address, @Observation, @CompayId)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedTenantId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedTenantId TenantId
	-- EXEC Tenants.Tenant_CREATE @Option = null, @TenantName = null, @Document = null, @Telephone = null, @Mobile = null, @Email = null, @Address = null, @Observation = null, @CompayId = null
END
GO
/****** Object:  StoredProcedure [Tenants].[Tenant_DELETE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Tenants].[Tenant_DELETE]
	@TenantId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Tenants.Tenant WHERE TenantId = @TenantId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Tenants.Tenant
		WHERE  TenantId = @TenantId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @TenantId TenantId
	-- EXEC Tenants.Tenant_DELETE @TenantId = null
END
GO
/****** Object:  StoredProcedure [Tenants].[Tenant_DISABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Tenants].[Tenant_DISABLE]
	@TenantId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Tenants.Tenant WHERE TenantId = @TenantId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Tenants.Tenant WHERE TenantId = @TenantId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Tenants.Tenant
		SET		
		WHERE	Active = 1
		  AND 	TenantId = @TenantId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @TenantId TenantId
	-- EXEC Tenants.Tenant_DISABLE @TenantId = null
END
GO
/****** Object:  StoredProcedure [Tenants].[Tenant_ENABLE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Tenants].[Tenant_ENABLE]
	@TenantId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	/*
	-- COMMENTED CODE: Not key column found in the table

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Tenants.Tenant WHERE TenantId = @TenantId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Tenants.Tenant WHERE TenantId = @TenantId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Tenants.Tenant
		SET		
		WHERE	Active = 0
		  AND 	TenantId = @TenantId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @TenantId TenantId
	-- EXEC Tenants.Tenant_ENABLE @TenantId = null
END
GO
/****** Object:  StoredProcedure [Tenants].[Tenant_LIST]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Tenants].[Tenant_LIST]
	@Option      TINYINT = NULL,
	@TenantId    INT = NULL,
	@TenantName  NVARCHAR(200) = '',
	@Document    NVARCHAR(50) = '',
	@Telephone   NVARCHAR(30) = '',
	@Mobile      NVARCHAR(30) = '',
	@Email       NVARCHAR(80) = '',
	@Address     NVARCHAR(200) = '',
	@Observation NVARCHAR(500) = '',
	@CompayId    INT = NULL
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.TenantId TenantId, a.TenantName TenantName
		FROM 	Tenants.Tenant a
		WHERE 	(@TenantId    IS NULL OR a.TenantId = @TenantId)
		  AND 	(ISNULL(@TenantName, '')  = ''    OR a.TenantName LIKE '%' + TRIM(@TenantName) + '%')
		  AND 	(ISNULL(@Document, '')    = ''    OR a.Document LIKE '%' + TRIM(@Document) + '%')
		  AND 	(ISNULL(@Telephone, '')   = ''    OR a.Telephone LIKE '%' + TRIM(@Telephone) + '%')
		  AND 	(ISNULL(@Mobile, '')      = ''    OR a.Mobile LIKE '%' + TRIM(@Mobile) + '%')
		  AND 	(ISNULL(@Email, '')       = ''    OR a.Email LIKE '%' + TRIM(@Email) + '%')
		  AND 	(ISNULL(@Address, '')     = ''    OR a.Address LIKE '%' + TRIM(@Address) + '%')
		  AND 	(ISNULL(@Observation, '') = ''    OR a.Observation LIKE '%' + TRIM(@Observation) + '%')
		  AND 	(@CompayId    IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Tenants.Tenant_LIST @Option = null, @TenantId = null, @TenantName = '', @Document = '', @Telephone = '', @Mobile = '', @Email = '', @Address = '', @Observation = '', @CompayId = null
END
GO
/****** Object:  StoredProcedure [Tenants].[Tenant_READ]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
	IF OBJECT_ID('Tenants.Tenant_READ', 'P') IS NOT NULL DROP PROCEDURE Tenants.Tenant_READ
	IF OBJECT_ID('Tenants.Tenant_LIST', 'P') IS NOT NULL DROP PROCEDURE Tenants.Tenant_LIST
	IF OBJECT_ID('Tenants.Tenant_CREATE', 'P') IS NOT NULL DROP PROCEDURE Tenants.Tenant_CREATE
	IF OBJECT_ID('Tenants.Tenant_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Tenants.Tenant_UPDATE
	IF OBJECT_ID('Tenants.Tenant_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Tenants.Tenant_ENABLE
	IF OBJECT_ID('Tenants.Tenant_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Tenants.Tenant_DISABLE
	IF OBJECT_ID('Tenants.Tenant_DELETE', 'P') IS NOT NULL DROP PROCEDURE Tenants.Tenant_DELETE
*/

CREATE PROCEDURE [Tenants].[Tenant_READ]
	@Option      TINYINT = NULL,
	@TenantId    INT = NULL,
	@TenantName  NVARCHAR(200) = '',
	@Document    NVARCHAR(50) = '',
	@Telephone   NVARCHAR(30) = '',
	@Mobile      NVARCHAR(30) = '',
	@Email       NVARCHAR(80) = '',
	@Address     NVARCHAR(200) = '',
	@Observation NVARCHAR(500) = '',
	@CompayId    INT = NULL
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.TenantId, a.TenantName, a.Document, a.Telephone, a.Mobile, 
				a.Email, a.Address, a.Observation, a.CompayId
		FROM 	Tenants.Tenant a
		WHERE 	(@TenantId    IS NULL OR a.TenantId = @TenantId)
		  AND 	(ISNULL(@TenantName, '')  = ''    OR a.TenantName LIKE '%' + TRIM(@TenantName) + '%')
		  AND 	(ISNULL(@Document, '')    = ''    OR a.Document LIKE '%' + TRIM(@Document) + '%')
		  AND 	(ISNULL(@Telephone, '')   = ''    OR a.Telephone LIKE '%' + TRIM(@Telephone) + '%')
		  AND 	(ISNULL(@Mobile, '')      = ''    OR a.Mobile LIKE '%' + TRIM(@Mobile) + '%')
		  AND 	(ISNULL(@Email, '')       = ''    OR a.Email LIKE '%' + TRIM(@Email) + '%')
		  AND 	(ISNULL(@Address, '')     = ''    OR a.Address LIKE '%' + TRIM(@Address) + '%')
		  AND 	(ISNULL(@Observation, '') = ''    OR a.Observation LIKE '%' + TRIM(@Observation) + '%')
		  AND 	(@CompayId    IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Tenants.Tenant_READ @Option = null, @TenantId = null, @TenantName = '', @Document = '', @Telephone = '', @Mobile = '', @Email = '', @Address = '', @Observation = '', @CompayId = null
END
GO
/****** Object:  StoredProcedure [Tenants].[Tenant_UPDATE]    Script Date: 10/03/2022 9:20:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Tenants].[Tenant_UPDATE]
	@Option      TINYINT = NULL,
	@TenantId    INT,
	@TenantName  NVARCHAR(200),
	@Document    NVARCHAR(50),
	@Telephone   NVARCHAR(30),
	@Mobile      NVARCHAR(30),
	@Email       NVARCHAR(80),
	@Address     NVARCHAR(200),
	@Observation NVARCHAR(500),
	@CompayId    INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	
	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			IF NOT EXISTS(SELECT 1 FROM Tenants.Tenant WHERE TenantId = @TenantId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Tenants.Tenant
			SET 	TenantName  = @TenantName,
					Document    = @Document,
					Telephone   = @Telephone,
					Mobile      = @Mobile,
					Email       = @Email,
					Address     = @Address,
					Observation = @Observation,
					CompayId    = @CompayId
			WHERE 	TenantId = @TenantId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @TenantId TenantId
	-- EXEC Tenants.Tenant_UPDATE @Option = null, @TenantId = null, @TenantName = null, @Document = null, @Telephone = null, @Mobile = null, @Email = null, @Address = null, @Observation = null, @CompayId = null
END
GO
