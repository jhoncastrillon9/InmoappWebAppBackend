USE Inmoapp_dev
GO

/*
	IF OBJECT_ID('Commons.State_READ', 'P') IS NOT NULL DROP PROCEDURE Commons.State_READ
	IF OBJECT_ID('Commons.State_LIST', 'P') IS NOT NULL DROP PROCEDURE Commons.State_LIST
	IF OBJECT_ID('Commons.State_CREATE', 'P') IS NOT NULL DROP PROCEDURE Commons.State_CREATE
	IF OBJECT_ID('Commons.State_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Commons.State_UPDATE
	IF OBJECT_ID('Commons.State_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Commons.State_ENABLE
	IF OBJECT_ID('Commons.State_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Commons.State_DISABLE
	IF OBJECT_ID('Commons.State_DELETE', 'P') IS NOT NULL DROP PROCEDURE Commons.State_DELETE
*/

CREATE PROCEDURE Commons.State_READ
	@Option    TINYINT = NULL,
	@StateId   INT = NULL,
	@StateName NVARCHAR(100) = ''
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.StateId, a.StateName
		FROM 	Commons.State a
		WHERE 	(@StateId   IS NULL OR a.StateId = @StateId)
		  AND 	(ISNULL(@StateName, '') = ''    OR a.StateName LIKE '%' + TRIM(@StateName) + '%')
	END

	-- EXEC Commons.State_READ @Option = null, @StateId = null, @StateName = ''
END
GO


CREATE PROCEDURE Commons.State_LIST
	@Option    TINYINT = NULL,
	@StateId   INT = NULL,
	@StateName NVARCHAR(100) = ''
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.StateId StateId, a.StateName StateName
		FROM 	Commons.State a
		WHERE 	(@StateId   IS NULL OR a.StateId = @StateId)
		  AND 	(ISNULL(@StateName, '') = ''    OR a.StateName LIKE '%' + TRIM(@StateName) + '%')
	END

	-- EXEC Commons.State_LIST @Option = null, @StateId = null, @StateName = ''
END
GO


CREATE PROCEDURE Commons.State_CREATE
	@Option    TINYINT = NULL,
	@StateName NVARCHAR(100)
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedStateId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Commons.State (StateName)
							VALUES (@StateName)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedStateId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedStateId StateId
	-- EXEC Commons.State_CREATE @Option = null, @StateName = null
END
GO


CREATE PROCEDURE Commons.State_UPDATE
	@Option    TINYINT = NULL,
	@StateId   INT,
	@StateName NVARCHAR(100)
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
			IF NOT EXISTS(SELECT 1 FROM Commons.State WHERE StateId = @StateId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Commons.State
			SET 	StateName = @StateName
			WHERE 	StateId = @StateId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @StateId StateId
	-- EXEC Commons.State_UPDATE @Option = null, @StateId = null, @StateName = null
END
GO


CREATE PROCEDURE Commons.State_ENABLE
	@StateId INT
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
		IF NOT EXISTS(SELECT 1 FROM Commons.State WHERE StateId = @StateId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Commons.State WHERE StateId = @StateId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Commons.State
		SET		
		WHERE	Active = 0
		  AND 	StateId = @StateId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @StateId StateId
	-- EXEC Commons.State_ENABLE @StateId = null
END
GO


CREATE PROCEDURE Commons.State_DISABLE
	@StateId INT
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
		IF NOT EXISTS(SELECT 1 FROM Commons.State WHERE StateId = @StateId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Commons.State WHERE StateId = @StateId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Commons.State
		SET		
		WHERE	Active = 1
		  AND 	StateId = @StateId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @StateId StateId
	-- EXEC Commons.State_DISABLE @StateId = null
END
GO


CREATE PROCEDURE Commons.State_DELETE
	@StateId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Commons.State WHERE StateId = @StateId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Commons.State
		WHERE  StateId = @StateId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @StateId StateId
	-- EXEC Commons.State_DELETE @StateId = null
END
GO


