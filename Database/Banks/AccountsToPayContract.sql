USE Inmoapp_dev
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

CREATE PROCEDURE Banks.AccountsToPayContract_READ
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


CREATE PROCEDURE Banks.AccountsToPayContract_LIST
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


CREATE PROCEDURE Banks.AccountsToPayContract_CREATE
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


CREATE PROCEDURE Banks.AccountsToPayContract_UPDATE
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


CREATE PROCEDURE Banks.AccountsToPayContract_ENABLE
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


CREATE PROCEDURE Banks.AccountsToPayContract_DISABLE
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


CREATE PROCEDURE Banks.AccountsToPayContract_DELETE
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


