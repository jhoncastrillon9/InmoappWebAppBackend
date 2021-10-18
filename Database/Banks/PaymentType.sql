USE Inmoapp_dev
GO

/*
	IF OBJECT_ID('Banks.PaymentType_READ', 'P') IS NOT NULL DROP PROCEDURE Banks.PaymentType_READ
	IF OBJECT_ID('Banks.PaymentType_LIST', 'P') IS NOT NULL DROP PROCEDURE Banks.PaymentType_LIST
	IF OBJECT_ID('Banks.PaymentType_CREATE', 'P') IS NOT NULL DROP PROCEDURE Banks.PaymentType_CREATE
	IF OBJECT_ID('Banks.PaymentType_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Banks.PaymentType_UPDATE
	IF OBJECT_ID('Banks.PaymentType_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Banks.PaymentType_ENABLE
	IF OBJECT_ID('Banks.PaymentType_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Banks.PaymentType_DISABLE
	IF OBJECT_ID('Banks.PaymentType_DELETE', 'P') IS NOT NULL DROP PROCEDURE Banks.PaymentType_DELETE
*/

CREATE PROCEDURE Banks.PaymentType_READ
	@Option          TINYINT = NULL,
	@PaymentTypeId   INT = NULL,
	@PaymentTypeName NVARCHAR(50) = '',
	@CompayId        INT = NULL
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.PaymentTypeId, a.PaymentTypeName, a.CompayId
		FROM 	Banks.PaymentType a
		WHERE 	(@PaymentTypeId   IS NULL OR a.PaymentTypeId = @PaymentTypeId)
		  AND 	(ISNULL(@PaymentTypeName, '') = ''    OR a.PaymentTypeName LIKE '%' + TRIM(@PaymentTypeName) + '%')
		  AND 	(@CompayId        IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Banks.PaymentType_READ @Option = null, @PaymentTypeId = null, @PaymentTypeName = '', @CompayId = null
END
GO


CREATE PROCEDURE Banks.PaymentType_LIST
	@Option          TINYINT = NULL,
	@PaymentTypeId   INT = NULL,
	@PaymentTypeName NVARCHAR(50) = '',
	@CompayId        INT = NULL
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.PaymentTypeId PaymentTypeId, a.PaymentTypeName PaymentTypeName
		FROM 	Banks.PaymentType a
		WHERE 	(@PaymentTypeId   IS NULL OR a.PaymentTypeId = @PaymentTypeId)
		  AND 	(ISNULL(@PaymentTypeName, '') = ''    OR a.PaymentTypeName LIKE '%' + TRIM(@PaymentTypeName) + '%')
		  AND 	(@CompayId        IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Banks.PaymentType_LIST @Option = null, @PaymentTypeId = null, @PaymentTypeName = '', @CompayId = null
END
GO


CREATE PROCEDURE Banks.PaymentType_CREATE
	@Option          TINYINT = NULL,
	@PaymentTypeName NVARCHAR(50),
	@CompayId        INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedPaymentTypeId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Banks.PaymentType (PaymentTypeName, CompayId)
							VALUES (@PaymentTypeName, @CompayId)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedPaymentTypeId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedPaymentTypeId PaymentTypeId
	-- EXEC Banks.PaymentType_CREATE @Option = null, @PaymentTypeName = null, @CompayId = null
END
GO


CREATE PROCEDURE Banks.PaymentType_UPDATE
	@Option          TINYINT = NULL,
	@PaymentTypeId   INT,
	@PaymentTypeName NVARCHAR(50),
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
			IF NOT EXISTS(SELECT 1 FROM Banks.PaymentType WHERE PaymentTypeId = @PaymentTypeId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Banks.PaymentType
			SET 	PaymentTypeName = @PaymentTypeName,
					CompayId        = @CompayId
			WHERE 	PaymentTypeId = @PaymentTypeId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @PaymentTypeId PaymentTypeId
	-- EXEC Banks.PaymentType_UPDATE @Option = null, @PaymentTypeId = null, @PaymentTypeName = null, @CompayId = null
END
GO


CREATE PROCEDURE Banks.PaymentType_ENABLE
	@PaymentTypeId INT
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
		IF NOT EXISTS(SELECT 1 FROM Banks.PaymentType WHERE PaymentTypeId = @PaymentTypeId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Banks.PaymentType WHERE PaymentTypeId = @PaymentTypeId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Banks.PaymentType
		SET		
		WHERE	Active = 0
		  AND 	PaymentTypeId = @PaymentTypeId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @PaymentTypeId PaymentTypeId
	-- EXEC Banks.PaymentType_ENABLE @PaymentTypeId = null
END
GO


CREATE PROCEDURE Banks.PaymentType_DISABLE
	@PaymentTypeId INT
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
		IF NOT EXISTS(SELECT 1 FROM Banks.PaymentType WHERE PaymentTypeId = @PaymentTypeId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Banks.PaymentType WHERE PaymentTypeId = @PaymentTypeId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Banks.PaymentType
		SET		
		WHERE	Active = 1
		  AND 	PaymentTypeId = @PaymentTypeId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @PaymentTypeId PaymentTypeId
	-- EXEC Banks.PaymentType_DISABLE @PaymentTypeId = null
END
GO


CREATE PROCEDURE Banks.PaymentType_DELETE
	@PaymentTypeId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Banks.PaymentType WHERE PaymentTypeId = @PaymentTypeId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Banks.PaymentType
		WHERE  PaymentTypeId = @PaymentTypeId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @PaymentTypeId PaymentTypeId
	-- EXEC Banks.PaymentType_DELETE @PaymentTypeId = null
END
GO


