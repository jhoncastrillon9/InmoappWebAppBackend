USE Inmoapp_dev
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

CREATE PROCEDURE Contracts.ContractsStatus_READ
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


CREATE PROCEDURE Contracts.ContractsStatus_LIST
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


CREATE PROCEDURE Contracts.ContractsStatus_CREATE
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


CREATE PROCEDURE Contracts.ContractsStatus_UPDATE
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


CREATE PROCEDURE Contracts.ContractsStatus_ENABLE
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


CREATE PROCEDURE Contracts.ContractsStatus_DISABLE
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


CREATE PROCEDURE Contracts.ContractsStatus_DELETE
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


