/****** Object:  StoredProcedure [CodeMono].[User_AUTHENTICATION]    Script Date: 24/10/2021 23:11:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [CodeMono].[User_AUTHENTICATION]
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
