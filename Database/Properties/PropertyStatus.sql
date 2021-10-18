USE Inmoapp_dev
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

CREATE PROCEDURE Properties.PropertyStatus_READ
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


CREATE PROCEDURE Properties.PropertyStatus_LIST
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


CREATE PROCEDURE Properties.PropertyStatus_CREATE
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


CREATE PROCEDURE Properties.PropertyStatus_UPDATE
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


CREATE PROCEDURE Properties.PropertyStatus_ENABLE
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


CREATE PROCEDURE Properties.PropertyStatus_DISABLE
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


CREATE PROCEDURE Properties.PropertyStatus_DELETE
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


