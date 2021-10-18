USE Inmoapp_dev
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

CREATE PROCEDURE Properties.PropertyCategory_READ
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


CREATE PROCEDURE Properties.PropertyCategory_LIST
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


CREATE PROCEDURE Properties.PropertyCategory_CREATE
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


CREATE PROCEDURE Properties.PropertyCategory_UPDATE
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


CREATE PROCEDURE Properties.PropertyCategory_ENABLE
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


CREATE PROCEDURE Properties.PropertyCategory_DISABLE
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


CREATE PROCEDURE Properties.PropertyCategory_DELETE
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


