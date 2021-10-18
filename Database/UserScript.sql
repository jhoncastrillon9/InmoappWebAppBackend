USE Inmoapp_dev
GO

/*

	IF OBJECT_ID('[CodeMono].[User_AUTHENTICATION]', 'P') IS NOT NULL DROP PROCEDURE [CodeMono].[User_AUTHENTICATION]
	IF OBJECT_ID('[CodeMono].[User_READ]', 'P') IS NOT NULL DROP PROCEDURE [CodeMono].[User_READ]
	IF OBJECT_ID('[CodeMono].[User_LIST]', 'P') IS NOT NULL DROP PROCEDURE [CodeMono].[User_LIST]
	IF OBJECT_ID('[CodeMono].[User_CREATE]', 'P') IS NOT NULL DROP PROCEDURE [CodeMono].[User_CREATE]
	IF OBJECT_ID('[CodeMono].[User_UPDATE]', 'P') IS NOT NULL DROP PROCEDURE [CodeMono].[User_UPDATE]
	IF OBJECT_ID('[CodeMono].[User_ENABLE]', 'P') IS NOT NULL DROP PROCEDURE [CodeMono].[User_ENABLE]
	IF OBJECT_ID('[CodeMono].[User_DISABLE]', 'P') IS NOT NULL DROP PROCEDURE [CodeMono].[User_DISABLE]
	IF OBJECT_ID('[CodeMono].[User_DELETE]', 'P') IS NOT NULL DROP PROCEDURE [CodeMono].[User_DELETE]

	IF OBJECT_ID('CodeMono.UserType_READ', 'P') IS NOT NULL DROP PROCEDURE CodeMono.UserType_READ
	IF OBJECT_ID('CodeMono.UserType_LIST', 'P') IS NOT NULL DROP PROCEDURE CodeMono.UserType_LIST
	IF OBJECT_ID('CodeMono.UserType_CREATE', 'P') IS NOT NULL DROP PROCEDURE CodeMono.UserType_CREATE
	IF OBJECT_ID('CodeMono.UserType_UPDATE', 'P') IS NOT NULL DROP PROCEDURE CodeMono.UserType_UPDATE
	IF OBJECT_ID('CodeMono.UserType_ENABLE', 'P') IS NOT NULL DROP PROCEDURE CodeMono.UserType_ENABLE
	IF OBJECT_ID('CodeMono.UserType_DISABLE', 'P') IS NOT NULL DROP PROCEDURE CodeMono.UserType_DISABLE
	IF OBJECT_ID('CodeMono.UserType_DELETE', 'P') IS NOT NULL DROP PROCEDURE CodeMono.UserType_DELETE

	DROP TABLE [CodeMono].[User]
	GO

	DROP TABLE [CodeMono].[UserType]
	GO

	DROP SCHEMA CodeMono
	GO

*/

	CREATE SCHEMA CodeMono
	GO

	CREATE TABLE [CodeMono].[UserType]
	(
		[UserTypeId]   [smallint] NOT NULL PRIMARY KEY,
		[UserTypeName] [varchar](50) NOT NULL,
		[CreatedBy]    [int] NOT NULL DEFAULT(0),
		[CreatedAt]    [datetime] NOT NULL DEFAULT(GETDATE()),
		[UpdatedBy]    [int] NULL,
		[UpdatedAt]    [datetime] NULL,
		[DisabledBy]   [int] NULL,
		[DisabledAt]   [datetime] NULL,
		[Active]       [bit] NOT NULL DEFAULT(1)
	)

	CREATE TABLE [CodeMono].[User](
		[UserId]     [int] PRIMARY KEY IDENTITY(1,1) NOT NULL,
		[FirstName]  [varchar](45) NOT NULL,
		[LastName]   [varchar](45) NOT NULL,
		[UserTypeId] [smallint] NOT NULL,
		[Username]   [varchar](45) NOT NULL,
		[Password]   [varchar](45) NOT NULL,
		[Avatar]     [varchar](45) NULL,
		[CreatedBy]  [int] NOT NULL DEFAULT(0),
		[CreatedAt]  [datetime] NOT NULL DEFAULT(GETDATE()),
		[UpdatedBy]  [int] NULL,
		[UpdatedAt]  [datetime] NULL,
		[DisabledBy] [int] NULL,
		[DisabledAt] [datetime] NULL,
		[Active]     [bit] NOT NULL DEFAULT(1)
	)
	
	ALTER TABLE [CodeMono].[User]  WITH CHECK ADD  CONSTRAINT [FK_CodeMono_UserTypeId] FOREIGN KEY([UserTypeId])
	REFERENCES [CodeMono].[UserType] ([UserTypeId])
	GO

	ALTER TABLE [CodeMono].[User] CHECK CONSTRAINT [FK_CodeMono_UserTypeId]
	GO



	INSERT INTO CodeMono.UserType (UserTypeId, UserTypeName) VALUES(1, 'UserTypeDemo')
	INSERT INTO [CodeMono].[User] (FirstName, LastName, UserTypeId, Username, [Password], Avatar) VALUES ('Demo', 'User', 1, 'DemoUser', '12345', '')
	GO



/****** Object:  StoredProcedure [CodeMono].[User_AUTHENTICATION] ******/
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
		SELECT 	1 Authenticated, 'Success' Message, a.UserId, a.FirstName, a.LastName, a.UserTypeId, a.Username, a.Avatar
		FROM 	[CodeMono].[User] a
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


/****** Object:  StoredProcedure [CodeMono].[User_READ] ******/
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


/****** Object:  StoredProcedure [CodeMono].[User_LIST] ******/
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


/****** Object:  StoredProcedure [CodeMono].[User_CREATE] ******/
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


/****** Object:  StoredProcedure [CodeMono].[User_UPDATE] ******/
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


/****** Object:  StoredProcedure [CodeMono].[User_ENABLE] ******/
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


/****** Object:  StoredProcedure [CodeMono].[User_DISABLE] ******/
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


/****** Object:  StoredProcedure [CodeMono].[User_DELETE] ******/
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


/*
********************************************
	CodeMono.UserType SPs
********************************************
*/

CREATE PROCEDURE CodeMono.UserType_READ
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


CREATE PROCEDURE CodeMono.UserType_LIST
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


CREATE PROCEDURE CodeMono.UserType_CREATE
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


CREATE PROCEDURE CodeMono.UserType_UPDATE
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


CREATE PROCEDURE CodeMono.UserType_ENABLE
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


CREATE PROCEDURE CodeMono.UserType_DISABLE
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


CREATE PROCEDURE CodeMono.UserType_DELETE
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

