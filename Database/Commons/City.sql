USE Inmoapp_dev
GO

/*
	IF OBJECT_ID('Commons.City_READ', 'P') IS NOT NULL DROP PROCEDURE Commons.City_READ
	IF OBJECT_ID('Commons.City_LIST', 'P') IS NOT NULL DROP PROCEDURE Commons.City_LIST
	IF OBJECT_ID('Commons.City_CREATE', 'P') IS NOT NULL DROP PROCEDURE Commons.City_CREATE
	IF OBJECT_ID('Commons.City_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Commons.City_UPDATE
	IF OBJECT_ID('Commons.City_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Commons.City_ENABLE
	IF OBJECT_ID('Commons.City_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Commons.City_DISABLE
	IF OBJECT_ID('Commons.City_DELETE', 'P') IS NOT NULL DROP PROCEDURE Commons.City_DELETE
*/

CREATE PROCEDURE Commons.City_READ
	@Option   TINYINT = NULL,
	@CityId   INT = NULL,
	@CityName NVARCHAR(100) = '',
	@StateId  INT = NULL
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.CityId, a.CityName, a.StateId
		FROM 	Commons.City a
		WHERE 	(@CityId   IS NULL OR a.CityId = @CityId)
		  AND 	(ISNULL(@CityName, '') = ''    OR a.CityName LIKE '%' + TRIM(@CityName) + '%')
		  AND 	(@StateId  IS NULL OR a.StateId = @StateId)
	END

	-- EXEC Commons.City_READ @Option = null, @CityId = null, @CityName = '', @StateId = null
END
GO


CREATE PROCEDURE Commons.City_LIST
	@Option   TINYINT = NULL,
	@CityId   INT = NULL,
	@CityName NVARCHAR(100) = '',
	@StateId  INT = NULL
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.CityId CityId, a.CityName CityName
		FROM 	Commons.City a
		WHERE 	(@CityId   IS NULL OR a.CityId = @CityId)
		  AND 	(ISNULL(@CityName, '') = ''    OR a.CityName LIKE '%' + TRIM(@CityName) + '%')
		  AND 	(@StateId  IS NULL OR a.StateId = @StateId)
	END

	-- EXEC Commons.City_LIST @Option = null, @CityId = null, @CityName = '', @StateId = null
END
GO


CREATE PROCEDURE Commons.City_CREATE
	@Option    TINYINT = NULL,
	@CityName  NVARCHAR(100),
	@StateId   INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedCityId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Commons.City (CityName, StateId)
							VALUES (@CityName, @StateId)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedCityId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedCityId CityId
	-- EXEC Commons.City_CREATE @Option = null, @CityName = null, @StateId = null
END
GO


CREATE PROCEDURE Commons.City_UPDATE
	@Option    TINYINT = NULL,
	@CityId    INT,
	@CityName  NVARCHAR(100),
	@StateId   INT
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
			IF NOT EXISTS(SELECT 1 FROM Commons.City WHERE CityId = @CityId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Commons.City
			SET 	CityName  = @CityName,
					StateId   = @StateId
			WHERE 	CityId = @CityId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @CityId CityId
	-- EXEC Commons.City_UPDATE @Option = null, @CityId = null, @CityName = null, @StateId = null
END
GO


CREATE PROCEDURE Commons.City_ENABLE
	@CityId INT
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
		IF NOT EXISTS(SELECT 1 FROM Commons.City WHERE CityId = @CityId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Commons.City WHERE CityId = @CityId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Commons.City
		SET		
		WHERE	Active = 0
		  AND 	CityId = @CityId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @CityId CityId
	-- EXEC Commons.City_ENABLE @CityId = null
END
GO


CREATE PROCEDURE Commons.City_DISABLE
	@CityId INT
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
		IF NOT EXISTS(SELECT 1 FROM Commons.City WHERE CityId = @CityId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Commons.City WHERE CityId = @CityId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Commons.City
		SET		
		WHERE	Active = 1
		  AND 	CityId = @CityId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @CityId CityId
	-- EXEC Commons.City_DISABLE @CityId = null
END
GO


CREATE PROCEDURE Commons.City_DELETE
	@CityId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Commons.City WHERE CityId = @CityId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Commons.City
		WHERE  CityId = @CityId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @CityId CityId
	-- EXEC Commons.City_DELETE @CityId = null
END
GO


