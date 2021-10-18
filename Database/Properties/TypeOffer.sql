USE Inmoapp_dev
GO

/*
	IF OBJECT_ID('Properties.TypeOffer_READ', 'P') IS NOT NULL DROP PROCEDURE Properties.TypeOffer_READ
	IF OBJECT_ID('Properties.TypeOffer_LIST', 'P') IS NOT NULL DROP PROCEDURE Properties.TypeOffer_LIST
	IF OBJECT_ID('Properties.TypeOffer_CREATE', 'P') IS NOT NULL DROP PROCEDURE Properties.TypeOffer_CREATE
	IF OBJECT_ID('Properties.TypeOffer_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Properties.TypeOffer_UPDATE
	IF OBJECT_ID('Properties.TypeOffer_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Properties.TypeOffer_ENABLE
	IF OBJECT_ID('Properties.TypeOffer_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Properties.TypeOffer_DISABLE
	IF OBJECT_ID('Properties.TypeOffer_DELETE', 'P') IS NOT NULL DROP PROCEDURE Properties.TypeOffer_DELETE
*/

CREATE PROCEDURE Properties.TypeOffer_READ
	@Option        TINYINT = NULL,
	@TypeOfferId   INT = NULL,
	@TypeOfferName NVARCHAR(200) = ''
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.TypeOfferId, a.TypeOfferName
		FROM 	Properties.TypeOffer a
		WHERE 	(@TypeOfferId   IS NULL OR a.TypeOfferId = @TypeOfferId)
		  AND 	(ISNULL(@TypeOfferName, '') = ''    OR a.TypeOfferName LIKE '%' + TRIM(@TypeOfferName) + '%')
	END

	-- EXEC Properties.TypeOffer_READ @Option = null, @TypeOfferId = null, @TypeOfferName = ''
END
GO


CREATE PROCEDURE Properties.TypeOffer_LIST
	@Option        TINYINT = NULL,
	@TypeOfferId   INT = NULL,
	@TypeOfferName NVARCHAR(200) = ''
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.TypeOfferId TypeOfferId, a.TypeOfferName TypeOfferName
		FROM 	Properties.TypeOffer a
		WHERE 	(@TypeOfferId   IS NULL OR a.TypeOfferId = @TypeOfferId)
		  AND 	(ISNULL(@TypeOfferName, '') = ''    OR a.TypeOfferName LIKE '%' + TRIM(@TypeOfferName) + '%')
	END

	-- EXEC Properties.TypeOffer_LIST @Option = null, @TypeOfferId = null, @TypeOfferName = ''
END
GO


CREATE PROCEDURE Properties.TypeOffer_CREATE
	@Option        TINYINT = NULL,
	@TypeOfferName NVARCHAR(200)
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedTypeOfferId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Properties.TypeOffer (TypeOfferName)
							VALUES (@TypeOfferName)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedTypeOfferId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedTypeOfferId TypeOfferId
	-- EXEC Properties.TypeOffer_CREATE @Option = null, @TypeOfferName = null
END
GO


CREATE PROCEDURE Properties.TypeOffer_UPDATE
	@Option        TINYINT = NULL,
	@TypeOfferId   INT,
	@TypeOfferName NVARCHAR(200)
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
			IF NOT EXISTS(SELECT 1 FROM Properties.TypeOffer WHERE TypeOfferId = @TypeOfferId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Properties.TypeOffer
			SET 	TypeOfferName = @TypeOfferName
			WHERE 	TypeOfferId = @TypeOfferId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @TypeOfferId TypeOfferId
	-- EXEC Properties.TypeOffer_UPDATE @Option = null, @TypeOfferId = null, @TypeOfferName = null
END
GO


CREATE PROCEDURE Properties.TypeOffer_ENABLE
	@TypeOfferId INT
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
		IF NOT EXISTS(SELECT 1 FROM Properties.TypeOffer WHERE TypeOfferId = @TypeOfferId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Properties.TypeOffer WHERE TypeOfferId = @TypeOfferId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Properties.TypeOffer
		SET		
		WHERE	Active = 0
		  AND 	TypeOfferId = @TypeOfferId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @TypeOfferId TypeOfferId
	-- EXEC Properties.TypeOffer_ENABLE @TypeOfferId = null
END
GO


CREATE PROCEDURE Properties.TypeOffer_DISABLE
	@TypeOfferId INT
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
		IF NOT EXISTS(SELECT 1 FROM Properties.TypeOffer WHERE TypeOfferId = @TypeOfferId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Properties.TypeOffer WHERE TypeOfferId = @TypeOfferId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Properties.TypeOffer
		SET		
		WHERE	Active = 1
		  AND 	TypeOfferId = @TypeOfferId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @TypeOfferId TypeOfferId
	-- EXEC Properties.TypeOffer_DISABLE @TypeOfferId = null
END
GO


CREATE PROCEDURE Properties.TypeOffer_DELETE
	@TypeOfferId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Properties.TypeOffer WHERE TypeOfferId = @TypeOfferId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Properties.TypeOffer
		WHERE  TypeOfferId = @TypeOfferId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @TypeOfferId TypeOfferId
	-- EXEC Properties.TypeOffer_DELETE @TypeOfferId = null
END
GO


