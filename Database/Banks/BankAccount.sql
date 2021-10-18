USE Inmoapp_dev
GO

/*
	IF OBJECT_ID('Banks.BankAccount_READ', 'P') IS NOT NULL DROP PROCEDURE Banks.BankAccount_READ
	IF OBJECT_ID('Banks.BankAccount_LIST', 'P') IS NOT NULL DROP PROCEDURE Banks.BankAccount_LIST
	IF OBJECT_ID('Banks.BankAccount_CREATE', 'P') IS NOT NULL DROP PROCEDURE Banks.BankAccount_CREATE
	IF OBJECT_ID('Banks.BankAccount_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Banks.BankAccount_UPDATE
	IF OBJECT_ID('Banks.BankAccount_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Banks.BankAccount_ENABLE
	IF OBJECT_ID('Banks.BankAccount_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Banks.BankAccount_DISABLE
	IF OBJECT_ID('Banks.BankAccount_DELETE', 'P') IS NOT NULL DROP PROCEDURE Banks.BankAccount_DELETE
*/

CREATE PROCEDURE Banks.BankAccount_READ
	@Option          TINYINT = NULL,
	@BankAccountId   INT = NULL,
	@BankAccountName NVARCHAR(50) = '',
	@CompayId        INT = NULL
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.BankAccountId, a.BankAccountName, a.Total, a.CompayId
		FROM 	Banks.BankAccount a
		WHERE 	(@BankAccountId   IS NULL OR a.BankAccountId = @BankAccountId)
		  AND 	(ISNULL(@BankAccountName, '') = ''    OR a.BankAccountName LIKE '%' + TRIM(@BankAccountName) + '%')
		  AND 	(@CompayId        IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Banks.BankAccount_READ @Option = null, @BankAccountId = null, @BankAccountName = '', @CompayId = null
END
GO


CREATE PROCEDURE Banks.BankAccount_LIST
	@Option          TINYINT = NULL,
	@BankAccountId   INT = NULL,
	@BankAccountName NVARCHAR(50) = '',
	@CompayId        INT = NULL
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.BankAccountId BankAccountId, a.BankAccountName BankAccountName
		FROM 	Banks.BankAccount a
		WHERE 	(@BankAccountId   IS NULL OR a.BankAccountId = @BankAccountId)
		  AND 	(ISNULL(@BankAccountName, '') = ''    OR a.BankAccountName LIKE '%' + TRIM(@BankAccountName) + '%')
		  AND 	(@CompayId        IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Banks.BankAccount_LIST @Option = null, @BankAccountId = null, @BankAccountName = '', @CompayId = null
END
GO


CREATE PROCEDURE Banks.BankAccount_CREATE
	@Option          TINYINT = NULL,
	@BankAccountName NVARCHAR(50),
	@Total           DECIMAL,
	@CompayId        INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedBankAccountId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Banks.BankAccount (BankAccountName, Total, CompayId)
							VALUES (@BankAccountName, @Total, @CompayId)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedBankAccountId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedBankAccountId BankAccountId
	-- EXEC Banks.BankAccount_CREATE @Option = null, @BankAccountName = null, @Total = null, @CompayId = null
END
GO


CREATE PROCEDURE Banks.BankAccount_UPDATE
	@Option          TINYINT = NULL,
	@BankAccountId   INT,
	@BankAccountName NVARCHAR(50),
	@Total           DECIMAL,
	@CompayId        INT
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
			IF NOT EXISTS(SELECT 1 FROM Banks.BankAccount WHERE BankAccountId = @BankAccountId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Banks.BankAccount
			SET 	BankAccountName = @BankAccountName,
					Total           = @Total,
					CompayId        = @CompayId
			WHERE 	BankAccountId = @BankAccountId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @BankAccountId BankAccountId
	-- EXEC Banks.BankAccount_UPDATE @Option = null, @BankAccountId = null, @BankAccountName = null, @Total = null, @CompayId = null
END
GO


CREATE PROCEDURE Banks.BankAccount_ENABLE
	@BankAccountId INT
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
		IF NOT EXISTS(SELECT 1 FROM Banks.BankAccount WHERE BankAccountId = @BankAccountId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Banks.BankAccount WHERE BankAccountId = @BankAccountId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Banks.BankAccount
		SET		
		WHERE	Active = 0
		  AND 	BankAccountId = @BankAccountId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @BankAccountId BankAccountId
	-- EXEC Banks.BankAccount_ENABLE @BankAccountId = null
END
GO


CREATE PROCEDURE Banks.BankAccount_DISABLE
	@BankAccountId INT
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
		IF NOT EXISTS(SELECT 1 FROM Banks.BankAccount WHERE BankAccountId = @BankAccountId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Banks.BankAccount WHERE BankAccountId = @BankAccountId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Banks.BankAccount
		SET		
		WHERE	Active = 1
		  AND 	BankAccountId = @BankAccountId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @BankAccountId BankAccountId
	-- EXEC Banks.BankAccount_DISABLE @BankAccountId = null
END
GO


CREATE PROCEDURE Banks.BankAccount_DELETE
	@BankAccountId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Banks.BankAccount WHERE BankAccountId = @BankAccountId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Banks.BankAccount
		WHERE  BankAccountId = @BankAccountId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @BankAccountId BankAccountId
	-- EXEC Banks.BankAccount_DELETE @BankAccountId = null
END
GO


