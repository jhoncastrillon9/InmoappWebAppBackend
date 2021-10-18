USE Inmoapp_dev
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

CREATE PROCEDURE Contracts.TenantsByContract_READ
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


CREATE PROCEDURE Contracts.TenantsByContract_LIST
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


CREATE PROCEDURE Contracts.TenantsByContract_CREATE
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


CREATE PROCEDURE Contracts.TenantsByContract_UPDATE
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


CREATE PROCEDURE Contracts.TenantsByContract_ENABLE
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


CREATE PROCEDURE Contracts.TenantsByContract_DISABLE
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


CREATE PROCEDURE Contracts.TenantsByContract_DELETE
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


