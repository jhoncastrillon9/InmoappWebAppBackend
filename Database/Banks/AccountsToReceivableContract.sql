USE Inmoapp_dev
GO

/*
	IF OBJECT_ID('Banks.AccountsToReceivableContract_READ', 'P') IS NOT NULL DROP PROCEDURE Banks.AccountsToReceivableContract_READ
	IF OBJECT_ID('Banks.AccountsToReceivableContract_LIST', 'P') IS NOT NULL DROP PROCEDURE Banks.AccountsToReceivableContract_LIST
	IF OBJECT_ID('Banks.AccountsToReceivableContract_CREATE', 'P') IS NOT NULL DROP PROCEDURE Banks.AccountsToReceivableContract_CREATE
	IF OBJECT_ID('Banks.AccountsToReceivableContract_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Banks.AccountsToReceivableContract_UPDATE
	IF OBJECT_ID('Banks.AccountsToReceivableContract_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Banks.AccountsToReceivableContract_ENABLE
	IF OBJECT_ID('Banks.AccountsToReceivableContract_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Banks.AccountsToReceivableContract_DISABLE
	IF OBJECT_ID('Banks.AccountsToReceivableContract_DELETE', 'P') IS NOT NULL DROP PROCEDURE Banks.AccountsToReceivableContract_DELETE
*/

CREATE PROCEDURE Banks.AccountsToReceivableContract_READ
	@Option                         TINYINT = NULL,
	@AccountsToReceivableContractId INT = NULL,
	@AccountsStatusId               INT = NULL,
	@ContractId                     INT = NULL,
	@CompayId                       INT = NULL
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.AccountsToReceivableContractId, a.QuotaNumber, a.Value, a.ExpirationDate, a.AccountsStatusId, 
				a.ContractId, a.CompayId
		FROM 	Banks.AccountsToReceivableContract a
		WHERE 	(@AccountsToReceivableContractId IS NULL OR a.AccountsToReceivableContractId = @AccountsToReceivableContractId)
		  AND 	(@AccountsStatusId               IS NULL OR a.AccountsStatusId = @AccountsStatusId)
		  AND 	(@ContractId                     IS NULL OR a.ContractId = @ContractId)
		  AND 	(@CompayId                       IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Banks.AccountsToReceivableContract_READ @Option = null, @AccountsToReceivableContractId = null, @AccountsStatusId = null, @ContractId = null, @CompayId = null
END
GO


CREATE PROCEDURE Banks.AccountsToReceivableContract_LIST
	@Option                         TINYINT = NULL,
	@AccountsToReceivableContractId INT = NULL,
	@AccountsStatusId               INT = NULL,
	@ContractId                     INT = NULL,
	@CompayId                       INT = NULL
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.AccountsToReceivableContractId AccountsToReceivableContractId, a.AccountsToReceivableContractId AccountsToReceivableContractName
		FROM 	Banks.AccountsToReceivableContract a
		WHERE 	(@AccountsToReceivableContractId IS NULL OR a.AccountsToReceivableContractId = @AccountsToReceivableContractId)
		  AND 	(@AccountsStatusId               IS NULL OR a.AccountsStatusId = @AccountsStatusId)
		  AND 	(@ContractId                     IS NULL OR a.ContractId = @ContractId)
		  AND 	(@CompayId                       IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Banks.AccountsToReceivableContract_LIST @Option = null, @AccountsToReceivableContractId = null, @AccountsStatusId = null, @ContractId = null, @CompayId = null
END
GO


CREATE PROCEDURE Banks.AccountsToReceivableContract_CREATE
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
DECLARE @InsertedAccountsToReceivableContractId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Banks.AccountsToReceivableContract (QuotaNumber, Value, ExpirationDate, AccountsStatusId, ContractId,
								CompayId)
							VALUES (@QuotaNumber, @Value, @ExpirationDate, @AccountsStatusId, @ContractId,
								@CompayId)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedAccountsToReceivableContractId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedAccountsToReceivableContractId AccountsToReceivableContractId
	-- EXEC Banks.AccountsToReceivableContract_CREATE @Option = null, @QuotaNumber = null, @Value = null, @ExpirationDate = null, @AccountsStatusId = null, @ContractId = null, @CompayId = null
END
GO


CREATE PROCEDURE Banks.AccountsToReceivableContract_UPDATE
	@Option                         TINYINT = NULL,
	@AccountsToReceivableContractId INT,
	@QuotaNumber                    INT,
	@Value                          DECIMAL,
	@ExpirationDate                 DATE,
	@AccountsStatusId               INT,
	@ContractId                     INT,
	@CompayId                       INT
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
			IF NOT EXISTS(SELECT 1 FROM Banks.AccountsToReceivableContract WHERE AccountsToReceivableContractId = @AccountsToReceivableContractId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Banks.AccountsToReceivableContract
			SET 	QuotaNumber                    = @QuotaNumber,
					Value                          = @Value,
					ExpirationDate                 = @ExpirationDate,
					AccountsStatusId               = @AccountsStatusId,
					ContractId                     = @ContractId,
					CompayId                       = @CompayId
			WHERE 	AccountsToReceivableContractId = @AccountsToReceivableContractId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @AccountsToReceivableContractId AccountsToReceivableContractId
	-- EXEC Banks.AccountsToReceivableContract_UPDATE @Option = null, @AccountsToReceivableContractId = null, @QuotaNumber = null, @Value = null, @ExpirationDate = null, @AccountsStatusId = null, @ContractId = null, @CompayId = null
END
GO


CREATE PROCEDURE Banks.AccountsToReceivableContract_ENABLE
	@AccountsToReceivableContractId INT
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
		IF NOT EXISTS(SELECT 1 FROM Banks.AccountsToReceivableContract WHERE AccountsToReceivableContractId = @AccountsToReceivableContractId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Banks.AccountsToReceivableContract WHERE AccountsToReceivableContractId = @AccountsToReceivableContractId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Banks.AccountsToReceivableContract
		SET		
		WHERE	Active = 0
		  AND 	AccountsToReceivableContractId = @AccountsToReceivableContractId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @AccountsToReceivableContractId AccountsToReceivableContractId
	-- EXEC Banks.AccountsToReceivableContract_ENABLE @AccountsToReceivableContractId = null
END
GO


CREATE PROCEDURE Banks.AccountsToReceivableContract_DISABLE
	@AccountsToReceivableContractId INT
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
		IF NOT EXISTS(SELECT 1 FROM Banks.AccountsToReceivableContract WHERE AccountsToReceivableContractId = @AccountsToReceivableContractId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Banks.AccountsToReceivableContract WHERE AccountsToReceivableContractId = @AccountsToReceivableContractId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Banks.AccountsToReceivableContract
		SET		
		WHERE	Active = 1
		  AND 	AccountsToReceivableContractId = @AccountsToReceivableContractId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @AccountsToReceivableContractId AccountsToReceivableContractId
	-- EXEC Banks.AccountsToReceivableContract_DISABLE @AccountsToReceivableContractId = null
END
GO


CREATE PROCEDURE Banks.AccountsToReceivableContract_DELETE
	@AccountsToReceivableContractId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Banks.AccountsToReceivableContract WHERE AccountsToReceivableContractId = @AccountsToReceivableContractId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Banks.AccountsToReceivableContract
		WHERE  AccountsToReceivableContractId = @AccountsToReceivableContractId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @AccountsToReceivableContractId AccountsToReceivableContractId
	-- EXEC Banks.AccountsToReceivableContract_DELETE @AccountsToReceivableContractId = null
END
GO


