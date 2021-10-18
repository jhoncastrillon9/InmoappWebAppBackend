USE Inmoapp_dev
GO

/*
	IF OBJECT_ID('Commons.Zone_READ', 'P') IS NOT NULL DROP PROCEDURE Commons.Zone_READ
	IF OBJECT_ID('Commons.Zone_LIST', 'P') IS NOT NULL DROP PROCEDURE Commons.Zone_LIST
	IF OBJECT_ID('Commons.Zone_CREATE', 'P') IS NOT NULL DROP PROCEDURE Commons.Zone_CREATE
	IF OBJECT_ID('Commons.Zone_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Commons.Zone_UPDATE
	IF OBJECT_ID('Commons.Zone_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Commons.Zone_ENABLE
	IF OBJECT_ID('Commons.Zone_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Commons.Zone_DISABLE
	IF OBJECT_ID('Commons.Zone_DELETE', 'P') IS NOT NULL DROP PROCEDURE Commons.Zone_DELETE
*/

CREATE PROCEDURE Commons.Zone_READ
	@Option   TINYINT = NULL,
	@ZoneId   INT = NULL,
	@ZoneName NVARCHAR(200) = '',
	@CityId   INT = NULL
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.ZoneId, a.ZoneName, a.CityId
		FROM 	Commons.Zone a
		WHERE 	(@ZoneId   IS NULL OR a.ZoneId = @ZoneId)
		  AND 	(ISNULL(@ZoneName, '') = ''    OR a.ZoneName LIKE '%' + TRIM(@ZoneName) + '%')
		  AND 	(@CityId   IS NULL OR a.CityId = @CityId)
	END

	-- EXEC Commons.Zone_READ @Option = null, @ZoneId = null, @ZoneName = '', @CityId = null
END
GO


CREATE PROCEDURE Commons.Zone_LIST
	@Option   TINYINT = NULL,
	@ZoneId   INT = NULL,
	@ZoneName NVARCHAR(200) = '',
	@CityId   INT = NULL
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.ZoneId ZoneId, a.ZoneName ZoneName
		FROM 	Commons.Zone a
		WHERE 	(@ZoneId   IS NULL OR a.ZoneId = @ZoneId)
		  AND 	(ISNULL(@ZoneName, '') = ''    OR a.ZoneName LIKE '%' + TRIM(@ZoneName) + '%')
		  AND 	(@CityId   IS NULL OR a.CityId = @CityId)
	END

	-- EXEC Commons.Zone_LIST @Option = null, @ZoneId = null, @ZoneName = '', @CityId = null
END
GO


CREATE PROCEDURE Commons.Zone_CREATE
	@Option    TINYINT = NULL,
	@ZoneName  NVARCHAR(200),
	@CityId    INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedZoneId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Commons.Zone (ZoneName, CityId)
							VALUES (@ZoneName, @CityId)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedZoneId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedZoneId ZoneId
	-- EXEC Commons.Zone_CREATE @Option = null, @ZoneName = null, @CityId = null
END
GO


CREATE PROCEDURE Commons.Zone_UPDATE
	@Option    TINYINT = NULL,
	@ZoneId    INT,
	@ZoneName  NVARCHAR(200),
	@CityId    INT
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
			IF NOT EXISTS(SELECT 1 FROM Commons.Zone WHERE ZoneId = @ZoneId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Commons.Zone
			SET 	ZoneName  = @ZoneName,
					CityId    = @CityId
			WHERE 	ZoneId = @ZoneId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @ZoneId ZoneId
	-- EXEC Commons.Zone_UPDATE @Option = null, @ZoneId = null, @ZoneName = null, @CityId = null
END
GO


CREATE PROCEDURE Commons.Zone_ENABLE
	@ZoneId INT
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
		IF NOT EXISTS(SELECT 1 FROM Commons.Zone WHERE ZoneId = @ZoneId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Commons.Zone WHERE ZoneId = @ZoneId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Commons.Zone
		SET		
		WHERE	Active = 0
		  AND 	ZoneId = @ZoneId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @ZoneId ZoneId
	-- EXEC Commons.Zone_ENABLE @ZoneId = null
END
GO


CREATE PROCEDURE Commons.Zone_DISABLE
	@ZoneId INT
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
		IF NOT EXISTS(SELECT 1 FROM Commons.Zone WHERE ZoneId = @ZoneId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Commons.Zone WHERE ZoneId = @ZoneId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Commons.Zone
		SET		
		WHERE	Active = 1
		  AND 	ZoneId = @ZoneId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @ZoneId ZoneId
	-- EXEC Commons.Zone_DISABLE @ZoneId = null
END
GO


CREATE PROCEDURE Commons.Zone_DELETE
	@ZoneId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Commons.Zone WHERE ZoneId = @ZoneId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Commons.Zone
		WHERE  ZoneId = @ZoneId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @ZoneId ZoneId
	-- EXEC Commons.Zone_DELETE @ZoneId = null
END
GO


