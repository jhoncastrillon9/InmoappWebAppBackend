USE Inmoapp_dev
GO

/*
	IF OBJECT_ID('Properties.Iva_READ', 'P') IS NOT NULL DROP PROCEDURE Properties.Iva_READ
	IF OBJECT_ID('Properties.Iva_LIST', 'P') IS NOT NULL DROP PROCEDURE Properties.Iva_LIST
	IF OBJECT_ID('Properties.Iva_CREATE', 'P') IS NOT NULL DROP PROCEDURE Properties.Iva_CREATE
	IF OBJECT_ID('Properties.Iva_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Properties.Iva_UPDATE
	IF OBJECT_ID('Properties.Iva_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Properties.Iva_ENABLE
	IF OBJECT_ID('Properties.Iva_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Properties.Iva_DISABLE
	IF OBJECT_ID('Properties.Iva_DELETE', 'P') IS NOT NULL DROP PROCEDURE Properties.Iva_DELETE
*/

CREATE PROCEDURE Properties.Iva_READ
	@Option TINYINT = NULL,
	@IvaId INT = NULL
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.IvaId, a.Valor
		FROM 	Properties.Iva a
		WHERE 	(@IvaId IS NULL OR a.IvaId = @IvaId)
	END

	-- EXEC Properties.Iva_READ @Option = null, @IvaId = null
END
GO


CREATE PROCEDURE Properties.Iva_LIST
	@Option TINYINT = NULL,
	@IvaId INT = NULL
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.IvaId IvaId, a.IvaId IvaName
		FROM 	Properties.Iva a
		WHERE 	(@IvaId IS NULL OR a.IvaId = @IvaId)
	END

	-- EXEC Properties.Iva_LIST @Option = null, @IvaId = null
END
GO


CREATE PROCEDURE Properties.Iva_CREATE
	@Option    TINYINT = NULL,
	@Valor     FLOAT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedIvaId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Properties.Iva (Valor)
							VALUES (@Valor)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedIvaId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedIvaId IvaId
	-- EXEC Properties.Iva_CREATE @Option = null, @Valor = null
END
GO


CREATE PROCEDURE Properties.Iva_UPDATE
	@Option    TINYINT = NULL,
	@IvaId     INT,
	@Valor     FLOAT
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
			IF NOT EXISTS(SELECT 1 FROM Properties.Iva WHERE IvaId = @IvaId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Properties.Iva
			SET 	Valor     = @Valor
			WHERE 	IvaId = @IvaId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @IvaId IvaId
	-- EXEC Properties.Iva_UPDATE @Option = null, @IvaId = null, @Valor = null
END
GO


CREATE PROCEDURE Properties.Iva_ENABLE
	@IvaId INT
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
		IF NOT EXISTS(SELECT 1 FROM Properties.Iva WHERE IvaId = @IvaId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Properties.Iva WHERE IvaId = @IvaId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Properties.Iva
		SET		
		WHERE	Active = 0
		  AND 	IvaId = @IvaId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @IvaId IvaId
	-- EXEC Properties.Iva_ENABLE @IvaId = null
END
GO


CREATE PROCEDURE Properties.Iva_DISABLE
	@IvaId INT
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
		IF NOT EXISTS(SELECT 1 FROM Properties.Iva WHERE IvaId = @IvaId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Properties.Iva WHERE IvaId = @IvaId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Properties.Iva
		SET		
		WHERE	Active = 1
		  AND 	IvaId = @IvaId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @IvaId IvaId
	-- EXEC Properties.Iva_DISABLE @IvaId = null
END
GO


CREATE PROCEDURE Properties.Iva_DELETE
	@IvaId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Properties.Iva WHERE IvaId = @IvaId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Properties.Iva
		WHERE  IvaId = @IvaId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @IvaId IvaId
	-- EXEC Properties.Iva_DELETE @IvaId = null
END
GO


