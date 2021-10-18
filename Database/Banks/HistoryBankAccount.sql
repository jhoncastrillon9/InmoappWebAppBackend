USE Inmoapp_dev
GO

/*
	IF OBJECT_ID('Banks.HistoryBankAccount_READ', 'P') IS NOT NULL DROP PROCEDURE Banks.HistoryBankAccount_READ
	IF OBJECT_ID('Banks.HistoryBankAccount_LIST', 'P') IS NOT NULL DROP PROCEDURE Banks.HistoryBankAccount_LIST
	IF OBJECT_ID('Banks.HistoryBankAccount_CREATE', 'P') IS NOT NULL DROP PROCEDURE Banks.HistoryBankAccount_CREATE
	IF OBJECT_ID('Banks.HistoryBankAccount_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Banks.HistoryBankAccount_UPDATE
	IF OBJECT_ID('Banks.HistoryBankAccount_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Banks.HistoryBankAccount_ENABLE
	IF OBJECT_ID('Banks.HistoryBankAccount_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Banks.HistoryBankAccount_DISABLE
	IF OBJECT_ID('Banks.HistoryBankAccount_DELETE', 'P') IS NOT NULL DROP PROCEDURE Banks.HistoryBankAccount_DELETE
*/

CREATE PROCEDURE Banks.HistoryBankAccount_READ
	@Option                          TINYINT = NULL,
	@HistoryBankAccountId            INT = NULL,
	@PaymentTypeId                   INT = NULL,
	@BankAccountId                   INT = NULL,
	@AccountsToPayContractsId        INT = NULL,
	@AccountsToReceivableContractsId INT = NULL,
	@Obervation                      NVARCHAR(500) = '',
	@CompayId                        INT = NULL
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.HistoryBankAccountId, a.PaymentTypeId, a.Value, a.BankAccountId, a.AccountsToPayContractsId, 
				a.AccountsToReceivableContractsId, a.Obervation, a.CompayId
		FROM 	Banks.HistoryBankAccount a
		WHERE 	(@HistoryBankAccountId            IS NULL OR a.HistoryBankAccountId = @HistoryBankAccountId)
		  AND 	(@PaymentTypeId                   IS NULL OR a.PaymentTypeId = @PaymentTypeId)
		  AND 	(@BankAccountId                   IS NULL OR a.BankAccountId = @BankAccountId)
		  AND 	(@AccountsToPayContractsId        IS NULL OR a.AccountsToPayContractsId = @AccountsToPayContractsId)
		  AND 	(@AccountsToReceivableContractsId IS NULL OR a.AccountsToReceivableContractsId = @AccountsToReceivableContractsId)
		  AND 	(ISNULL(@Obervation, '')                      = ''    OR a.Obervation LIKE '%' + TRIM(@Obervation) + '%')
		  AND 	(@CompayId                        IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Banks.HistoryBankAccount_READ @Option = null, @HistoryBankAccountId = null, @PaymentTypeId = null, @BankAccountId = null, @AccountsToPayContractsId = null, @AccountsToReceivableContractsId = null, @Obervation = '', @CompayId = null
END
GO


CREATE PROCEDURE Banks.HistoryBankAccount_LIST
	@Option                          TINYINT = NULL,
	@HistoryBankAccountId            INT = NULL,
	@PaymentTypeId                   INT = NULL,
	@BankAccountId                   INT = NULL,
	@AccountsToPayContractsId        INT = NULL,
	@AccountsToReceivableContractsId INT = NULL,
	@Obervation                      NVARCHAR(500) = '',
	@CompayId                        INT = NULL
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.HistoryBankAccountId HistoryBankAccountId, a.HistoryBankAccountId HistoryBankAccountName
		FROM 	Banks.HistoryBankAccount a
		WHERE 	(@HistoryBankAccountId            IS NULL OR a.HistoryBankAccountId = @HistoryBankAccountId)
		  AND 	(@PaymentTypeId                   IS NULL OR a.PaymentTypeId = @PaymentTypeId)
		  AND 	(@BankAccountId                   IS NULL OR a.BankAccountId = @BankAccountId)
		  AND 	(@AccountsToPayContractsId        IS NULL OR a.AccountsToPayContractsId = @AccountsToPayContractsId)
		  AND 	(@AccountsToReceivableContractsId IS NULL OR a.AccountsToReceivableContractsId = @AccountsToReceivableContractsId)
		  AND 	(ISNULL(@Obervation, '')                      = ''    OR a.Obervation LIKE '%' + TRIM(@Obervation) + '%')
		  AND 	(@CompayId                        IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Banks.HistoryBankAccount_LIST @Option = null, @HistoryBankAccountId = null, @PaymentTypeId = null, @BankAccountId = null, @AccountsToPayContractsId = null, @AccountsToReceivableContractsId = null, @Obervation = '', @CompayId = null
END
GO


CREATE PROCEDURE Banks.HistoryBankAccount_CREATE
	@Option                          TINYINT = NULL,
	@PaymentTypeId                   INT,
	@Value                           DECIMAL,
	@BankAccountId                   INT,
	@AccountsToPayContractsId        INT,
	@AccountsToReceivableContractsId INT,
	@Obervation                      NVARCHAR(500),
	@CompayId                        INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedHistoryBankAccountId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Banks.HistoryBankAccount (PaymentTypeId, Value, BankAccountId, AccountsToPayContractsId, AccountsToReceivableContractsId,
								Obervation, CompayId)
							VALUES (@PaymentTypeId, @Value, @BankAccountId, @AccountsToPayContractsId, @AccountsToReceivableContractsId,
								@Obervation, @CompayId)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedHistoryBankAccountId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedHistoryBankAccountId HistoryBankAccountId
	-- EXEC Banks.HistoryBankAccount_CREATE @Option = null, @PaymentTypeId = null, @Value = null, @BankAccountId = null, @AccountsToPayContractsId = null, @AccountsToReceivableContractsId = null, @Obervation = null, @CompayId = null
END
GO


CREATE PROCEDURE Banks.HistoryBankAccount_UPDATE
	@Option                          TINYINT = NULL,
	@HistoryBankAccountId            INT,
	@PaymentTypeId                   INT,
	@Value                           DECIMAL,
	@BankAccountId                   INT,
	@AccountsToPayContractsId        INT,
	@AccountsToReceivableContractsId INT,
	@Obervation                      NVARCHAR(500),
	@CompayId                        INT
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
			IF NOT EXISTS(SELECT 1 FROM Banks.HistoryBankAccount WHERE HistoryBankAccountId = @HistoryBankAccountId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Banks.HistoryBankAccount
			SET 	PaymentTypeId                   = @PaymentTypeId,
					Value                           = @Value,
					BankAccountId                   = @BankAccountId,
					AccountsToPayContractsId        = @AccountsToPayContractsId,
					AccountsToReceivableContractsId = @AccountsToReceivableContractsId,
					Obervation                      = @Obervation,
					CompayId                        = @CompayId
			WHERE 	HistoryBankAccountId = @HistoryBankAccountId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @HistoryBankAccountId HistoryBankAccountId
	-- EXEC Banks.HistoryBankAccount_UPDATE @Option = null, @HistoryBankAccountId = null, @PaymentTypeId = null, @Value = null, @BankAccountId = null, @AccountsToPayContractsId = null, @AccountsToReceivableContractsId = null, @Obervation = null, @CompayId = null
END
GO


CREATE PROCEDURE Banks.HistoryBankAccount_ENABLE
	@HistoryBankAccountId INT
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
		IF NOT EXISTS(SELECT 1 FROM Banks.HistoryBankAccount WHERE HistoryBankAccountId = @HistoryBankAccountId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Banks.HistoryBankAccount WHERE HistoryBankAccountId = @HistoryBankAccountId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Banks.HistoryBankAccount
		SET		
		WHERE	Active = 0
		  AND 	HistoryBankAccountId = @HistoryBankAccountId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @HistoryBankAccountId HistoryBankAccountId
	-- EXEC Banks.HistoryBankAccount_ENABLE @HistoryBankAccountId = null
END
GO


CREATE PROCEDURE Banks.HistoryBankAccount_DISABLE
	@HistoryBankAccountId INT
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
		IF NOT EXISTS(SELECT 1 FROM Banks.HistoryBankAccount WHERE HistoryBankAccountId = @HistoryBankAccountId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Banks.HistoryBankAccount WHERE HistoryBankAccountId = @HistoryBankAccountId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Banks.HistoryBankAccount
		SET		
		WHERE	Active = 1
		  AND 	HistoryBankAccountId = @HistoryBankAccountId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @HistoryBankAccountId HistoryBankAccountId
	-- EXEC Banks.HistoryBankAccount_DISABLE @HistoryBankAccountId = null
END
GO


CREATE PROCEDURE Banks.HistoryBankAccount_DELETE
	@HistoryBankAccountId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Banks.HistoryBankAccount WHERE HistoryBankAccountId = @HistoryBankAccountId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Banks.HistoryBankAccount
		WHERE  HistoryBankAccountId = @HistoryBankAccountId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @HistoryBankAccountId HistoryBankAccountId
	-- EXEC Banks.HistoryBankAccount_DELETE @HistoryBankAccountId = null
END
GO


