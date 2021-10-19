USE [InmmoApp_DEV]
GO

INSERT INTO [Users].[Role] ([Name])
     VALUES ('SuperAdmin'),
	 ('CompanyAdmin'),
	 ('PostUser'),
	 ('FinanceUser'),
	 ('ContractUser'),
	 ('OwnerUser'),
	 ('PropertyUser'),
	 ('TennatUser'),
	 ('SensitiveInfoViewer')
GO


