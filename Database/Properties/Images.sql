USE Inmoapp_dev
GO

/*
	IF OBJECT_ID('Properties.Images_READ', 'P') IS NOT NULL DROP PROCEDURE Properties.Images_READ
	IF OBJECT_ID('Properties.Images_LIST', 'P') IS NOT NULL DROP PROCEDURE Properties.Images_LIST
	IF OBJECT_ID('Properties.Images_CREATE', 'P') IS NOT NULL DROP PROCEDURE Properties.Images_CREATE
	IF OBJECT_ID('Properties.Images_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Properties.Images_UPDATE
	IF OBJECT_ID('Properties.Images_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Properties.Images_ENABLE
	IF OBJECT_ID('Properties.Images_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Properties.Images_DISABLE
	IF OBJECT_ID('Properties.Images_DELETE', 'P') IS NOT NULL DROP PROCEDURE Properties.Images_DELETE
*/

CREATE PROCEDURE Properties.Images_READ
	@Option     TINYINT = NULL,
	@ImageId    INT = NULL,
	@ImageName  NVARCHAR(50) = '',
	@Path       NVARCHAR(150) = '',
	@IsMain     BIT = NULL,
	@PropertyId INT = NULL
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.ImageId, a.ImageName, a.Path, a.IsMain, a.PropertyId
		FROM 	Properties.Images a
		WHERE 	(@ImageId    IS NULL OR a.ImageId = @ImageId)
		  AND 	(ISNULL(@ImageName, '')  = ''    OR a.ImageName LIKE '%' + TRIM(@ImageName) + '%')
		  AND 	(ISNULL(@Path, '')       = ''    OR a.Path LIKE '%' + TRIM(@Path) + '%')
		  AND 	(@IsMain     IS NULL OR a.IsMain = @IsMain)
		  AND 	(@PropertyId IS NULL OR a.PropertyId = @PropertyId)
	END

	-- EXEC Properties.Images_READ @Option = null, @ImageId = null, @ImageName = '', @Path = '', @IsMain = null, @PropertyId = null
END
GO


CREATE PROCEDURE Properties.Images_LIST
	@Option     TINYINT = NULL,
	@ImageId    INT = NULL,
	@ImageName  NVARCHAR(50) = '',
	@Path       NVARCHAR(150) = '',
	@IsMain     BIT = NULL,
	@PropertyId INT = NULL
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.ImageId ImagesId, a.ImageName ImagesName
		FROM 	Properties.Images a
		WHERE 	(@ImageId    IS NULL OR a.ImageId = @ImageId)
		  AND 	(ISNULL(@ImageName, '')  = ''    OR a.ImageName LIKE '%' + TRIM(@ImageName) + '%')
		  AND 	(ISNULL(@Path, '')       = ''    OR a.Path LIKE '%' + TRIM(@Path) + '%')
		  AND 	(@IsMain     IS NULL OR a.IsMain = @IsMain)
		  AND 	(@PropertyId IS NULL OR a.PropertyId = @PropertyId)
	END

	-- EXEC Properties.Images_LIST @Option = null, @ImageId = null, @ImageName = '', @Path = '', @IsMain = null, @PropertyId = null
END
GO


CREATE PROCEDURE Properties.Images_CREATE
	@Option     TINYINT = NULL,
	@ImageName  NVARCHAR(50),
	@Path       NVARCHAR(150),
	@IsMain     BIT,
	@PropertyId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedImageId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Properties.Images (ImageName, Path, IsMain, PropertyId)
							VALUES (@ImageName, @Path, @IsMain, @PropertyId)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedImageId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedImageId ImageId
	-- EXEC Properties.Images_CREATE @Option = null, @ImageName = null, @Path = null, @IsMain = null, @PropertyId = null
END
GO


CREATE PROCEDURE Properties.Images_UPDATE
	@Option     TINYINT = NULL,
	@ImageId    INT,
	@ImageName  NVARCHAR(50),
	@Path       NVARCHAR(150),
	@IsMain     BIT,
	@PropertyId INT
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
			IF NOT EXISTS(SELECT 1 FROM Properties.Images WHERE ImageId = @ImageId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Properties.Images
			SET 	ImageName  = @ImageName,
					Path       = @Path,
					IsMain     = @IsMain,
					PropertyId = @PropertyId
			WHERE 	ImageId = @ImageId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @ImageId ImageId
	-- EXEC Properties.Images_UPDATE @Option = null, @ImageId = null, @ImageName = null, @Path = null, @IsMain = null, @PropertyId = null
END
GO


CREATE PROCEDURE Properties.Images_ENABLE
	@ImageId INT
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
		IF NOT EXISTS(SELECT 1 FROM Properties.Images WHERE ImageId = @ImageId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Properties.Images WHERE ImageId = @ImageId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Properties.Images
		SET		
		WHERE	Active = 0
		  AND 	ImageId = @ImageId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @ImageId ImageId
	-- EXEC Properties.Images_ENABLE @ImageId = null
END
GO


CREATE PROCEDURE Properties.Images_DISABLE
	@ImageId INT
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
		IF NOT EXISTS(SELECT 1 FROM Properties.Images WHERE ImageId = @ImageId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Properties.Images WHERE ImageId = @ImageId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Properties.Images
		SET		
		WHERE	Active = 1
		  AND 	ImageId = @ImageId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @ImageId ImageId
	-- EXEC Properties.Images_DISABLE @ImageId = null
END
GO


CREATE PROCEDURE Properties.Images_DELETE
	@ImageId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Properties.Images WHERE ImageId = @ImageId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Properties.Images
		WHERE  ImageId = @ImageId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @ImageId ImageId
	-- EXEC Properties.Images_DELETE @ImageId = null
END
GO


