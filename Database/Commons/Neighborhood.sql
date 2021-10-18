USE Inmoapp_dev
GO

/*
	IF OBJECT_ID('Commons.Neighborhood_READ', 'P') IS NOT NULL DROP PROCEDURE Commons.Neighborhood_READ
	IF OBJECT_ID('Commons.Neighborhood_LIST', 'P') IS NOT NULL DROP PROCEDURE Commons.Neighborhood_LIST
	IF OBJECT_ID('Commons.Neighborhood_CREATE', 'P') IS NOT NULL DROP PROCEDURE Commons.Neighborhood_CREATE
	IF OBJECT_ID('Commons.Neighborhood_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Commons.Neighborhood_UPDATE
	IF OBJECT_ID('Commons.Neighborhood_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Commons.Neighborhood_ENABLE
	IF OBJECT_ID('Commons.Neighborhood_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Commons.Neighborhood_DISABLE
	IF OBJECT_ID('Commons.Neighborhood_DELETE', 'P') IS NOT NULL DROP PROCEDURE Commons.Neighborhood_DELETE
*/

CREATE PROCEDURE Commons.Neighborhood_READ
	@Option           TINYINT = NULL,
	@NeighborhoodId   INT = NULL,
	@NeighborhoodName NVARCHAR(200) = '',
	@ZoneId           INT = NULL
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.NeighborhoodId, a.NeighborhoodName, a.ZoneId
		FROM 	Commons.Neighborhood a
		WHERE 	(@NeighborhoodId   IS NULL OR a.NeighborhoodId = @NeighborhoodId)
		  AND 	(ISNULL(@NeighborhoodName, '') = ''    OR a.NeighborhoodName LIKE '%' + TRIM(@NeighborhoodName) + '%')
		  AND 	(@ZoneId           IS NULL OR a.ZoneId = @ZoneId)
	END

	-- EXEC Commons.Neighborhood_READ @Option = null, @NeighborhoodId = null, @NeighborhoodName = '', @ZoneId = null
END
GO


CREATE PROCEDURE Commons.Neighborhood_LIST
	@Option           TINYINT = NULL,
	@NeighborhoodId   INT = NULL,
	@NeighborhoodName NVARCHAR(200) = '',
	@ZoneId           INT = NULL
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.NeighborhoodId NeighborhoodId, a.NeighborhoodName NeighborhoodName
		FROM 	Commons.Neighborhood a
		WHERE 	(@NeighborhoodId   IS NULL OR a.NeighborhoodId = @NeighborhoodId)
		  AND 	(ISNULL(@NeighborhoodName, '') = ''    OR a.NeighborhoodName LIKE '%' + TRIM(@NeighborhoodName) + '%')
		  AND 	(@ZoneId           IS NULL OR a.ZoneId = @ZoneId)
	END

	-- EXEC Commons.Neighborhood_LIST @Option = null, @NeighborhoodId = null, @NeighborhoodName = '', @ZoneId = null
END
GO


CREATE PROCEDURE Commons.Neighborhood_CREATE
	@Option           TINYINT = NULL,
	@NeighborhoodName NVARCHAR(200),
	@ZoneId           INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedNeighborhoodId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Commons.Neighborhood (NeighborhoodName, ZoneId)
							VALUES (@NeighborhoodName, @ZoneId)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedNeighborhoodId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedNeighborhoodId NeighborhoodId
	-- EXEC Commons.Neighborhood_CREATE @Option = null, @NeighborhoodName = null, @ZoneId = null
END
GO


CREATE PROCEDURE Commons.Neighborhood_UPDATE
	@Option           TINYINT = NULL,
	@NeighborhoodId   INT,
	@NeighborhoodName NVARCHAR(200),
	@ZoneId           INT
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
			IF NOT EXISTS(SELECT 1 FROM Commons.Neighborhood WHERE NeighborhoodId = @NeighborhoodId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Commons.Neighborhood
			SET 	NeighborhoodName = @NeighborhoodName,
					ZoneId           = @ZoneId
			WHERE 	NeighborhoodId = @NeighborhoodId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @NeighborhoodId NeighborhoodId
	-- EXEC Commons.Neighborhood_UPDATE @Option = null, @NeighborhoodId = null, @NeighborhoodName = null, @ZoneId = null
END
GO


CREATE PROCEDURE Commons.Neighborhood_ENABLE
	@NeighborhoodId INT
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
		IF NOT EXISTS(SELECT 1 FROM Commons.Neighborhood WHERE NeighborhoodId = @NeighborhoodId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Commons.Neighborhood WHERE NeighborhoodId = @NeighborhoodId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Commons.Neighborhood
		SET		
		WHERE	Active = 0
		  AND 	NeighborhoodId = @NeighborhoodId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @NeighborhoodId NeighborhoodId
	-- EXEC Commons.Neighborhood_ENABLE @NeighborhoodId = null
END
GO


CREATE PROCEDURE Commons.Neighborhood_DISABLE
	@NeighborhoodId INT
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
		IF NOT EXISTS(SELECT 1 FROM Commons.Neighborhood WHERE NeighborhoodId = @NeighborhoodId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Commons.Neighborhood WHERE NeighborhoodId = @NeighborhoodId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Commons.Neighborhood
		SET		
		WHERE	Active = 1
		  AND 	NeighborhoodId = @NeighborhoodId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @NeighborhoodId NeighborhoodId
	-- EXEC Commons.Neighborhood_DISABLE @NeighborhoodId = null
END
GO


CREATE PROCEDURE Commons.Neighborhood_DELETE
	@NeighborhoodId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Commons.Neighborhood WHERE NeighborhoodId = @NeighborhoodId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Commons.Neighborhood
		WHERE  NeighborhoodId = @NeighborhoodId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @NeighborhoodId NeighborhoodId
	-- EXEC Commons.Neighborhood_DELETE @NeighborhoodId = null
END
GO


