
--Validar que la tabla si este vacia
INSERT INTO [CodeMono].[UserType]
           ([UserTypeId]
           ,[UserTypeName]
           ,[CreatedBy]
           ,[CreatedAt]
           ,[UpdatedBy]
           ,[UpdatedAt]
           ,[DisabledBy]
           ,[DisabledAt]
           ,[Active])
     VALUES
	  (1,'Demo',0,GETDATE(),0,GETDATE(),0,GETDATE(),1),
           (2,'Prod',0,GETDATE(),0,GETDATE(),0,GETDATE(),1)
GO


