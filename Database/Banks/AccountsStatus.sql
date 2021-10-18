USE Inmoapp_dev
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

CREATE PROCEDURE Banks.AccountsStatus_READ
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


CREATE PROCEDURE Banks.AccountsStatus_LIST
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


CREATE PROCEDURE Banks.AccountsStatus_CREATE
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


CREATE PROCEDURE Banks.AccountsStatus_UPDATE
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


CREATE PROCEDURE Banks.AccountsStatus_ENABLE
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


CREATE PROCEDURE Banks.AccountsStatus_DISABLE
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


CREATE PROCEDURE Banks.AccountsStatus_DELETE
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


