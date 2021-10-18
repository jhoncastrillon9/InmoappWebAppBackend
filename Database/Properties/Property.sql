USE Inmoapp_dev
GO

/*
	IF OBJECT_ID('Properties.Property_READ', 'P') IS NOT NULL DROP PROCEDURE Properties.Property_READ
	IF OBJECT_ID('Properties.Property_LIST', 'P') IS NOT NULL DROP PROCEDURE Properties.Property_LIST
	IF OBJECT_ID('Properties.Property_CREATE', 'P') IS NOT NULL DROP PROCEDURE Properties.Property_CREATE
	IF OBJECT_ID('Properties.Property_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Properties.Property_UPDATE
	IF OBJECT_ID('Properties.Property_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Properties.Property_ENABLE
	IF OBJECT_ID('Properties.Property_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Properties.Property_DISABLE
	IF OBJECT_ID('Properties.Property_DELETE', 'P') IS NOT NULL DROP PROCEDURE Properties.Property_DELETE
*/

CREATE PROCEDURE Properties.Property_READ
	@Option             TINYINT = NULL,
	@PropertyId         INT = NULL,
	@IdIva              INT = NULL,
	@Code               NVARCHAR(100) = '',
	@Title              NVARCHAR(100) = '',
	@Description        NVARCHAR(500) = '',
	@Address            NVARCHAR(200) = '',
	@Reception          BIT = NULL,
	@Pool               BIT = NULL,
	@Observation        NVARCHAR(500) = '',
	@PropertyStatusId   INT = NULL,
	@CityId             INT = NULL,
	@ZoneId             INT = NULL,
	@OwnerId            INT = NULL,
	@PropertyCategoryId INT = NULL,
	@TypeOfferId        INT = NULL,
	@CompayId           INT = NULL
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.PropertyId, a.IdIva, a.Code, a.Title, a.Description, 
				a.Address, a.PriceOwner, a.Percentage, a.FeeCompany, a.RecruitmentDate, 
				a.FinalPrice, a.Rooms, a.Toilets, a.Reception, a.Pool, 
				a.Area, a.Observation, a.PropertyStatusId, a.CityId, a.ZoneId, 
				a.OwnerId, a.PropertyCategoryId, a.TypeOfferId, a.CompayId
		FROM 	Properties.Property a
		WHERE 	(@PropertyId         IS NULL OR a.PropertyId = @PropertyId)
		  AND 	(@IdIva              IS NULL OR a.IdIva = @IdIva)
		  AND 	(ISNULL(@Code, '')               = ''    OR a.Code LIKE '%' + TRIM(@Code) + '%')
		  AND 	(ISNULL(@Title, '')              = ''    OR a.Title LIKE '%' + TRIM(@Title) + '%')
		  AND 	(ISNULL(@Description, '')        = ''    OR a.Description LIKE '%' + TRIM(@Description) + '%')
		  AND 	(ISNULL(@Address, '')            = ''    OR a.Address LIKE '%' + TRIM(@Address) + '%')
		  AND 	(@Reception          IS NULL OR a.Reception = @Reception)
		  AND 	(@Pool               IS NULL OR a.Pool = @Pool)
		  AND 	(ISNULL(@Observation, '')        = ''    OR a.Observation LIKE '%' + TRIM(@Observation) + '%')
		  AND 	(@PropertyStatusId   IS NULL OR a.PropertyStatusId = @PropertyStatusId)
		  AND 	(@CityId             IS NULL OR a.CityId = @CityId)
		  AND 	(@ZoneId             IS NULL OR a.ZoneId = @ZoneId)
		  AND 	(@OwnerId            IS NULL OR a.OwnerId = @OwnerId)
		  AND 	(@PropertyCategoryId IS NULL OR a.PropertyCategoryId = @PropertyCategoryId)
		  AND 	(@TypeOfferId        IS NULL OR a.TypeOfferId = @TypeOfferId)
		  AND 	(@CompayId           IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Properties.Property_READ @Option = null, @PropertyId = null, @IdIva = null, @Code = '', @Title = '', @Description = '', @Address = '', @Reception = null, @Pool = null, @Observation = '', @PropertyStatusId = null, @CityId = null, @ZoneId = null, @OwnerId = null, @PropertyCategoryId = null, @TypeOfferId = null, @CompayId = null
END
GO


CREATE PROCEDURE Properties.Property_LIST
	@Option             TINYINT = NULL,
	@PropertyId         INT = NULL,
	@IdIva              INT = NULL,
	@Code               NVARCHAR(100) = '',
	@Title              NVARCHAR(100) = '',
	@Description        NVARCHAR(500) = '',
	@Address            NVARCHAR(200) = '',
	@Reception          BIT = NULL,
	@Pool               BIT = NULL,
	@Observation        NVARCHAR(500) = '',
	@PropertyStatusId   INT = NULL,
	@CityId             INT = NULL,
	@ZoneId             INT = NULL,
	@OwnerId            INT = NULL,
	@PropertyCategoryId INT = NULL,
	@TypeOfferId        INT = NULL,
	@CompayId           INT = NULL
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.PropertyId PropertyId, a.PropertyId PropertyName
		FROM 	Properties.Property a
		WHERE 	(@PropertyId         IS NULL OR a.PropertyId = @PropertyId)
		  AND 	(@IdIva              IS NULL OR a.IdIva = @IdIva)
		  AND 	(ISNULL(@Code, '')               = ''    OR a.Code LIKE '%' + TRIM(@Code) + '%')
		  AND 	(ISNULL(@Title, '')              = ''    OR a.Title LIKE '%' + TRIM(@Title) + '%')
		  AND 	(ISNULL(@Description, '')        = ''    OR a.Description LIKE '%' + TRIM(@Description) + '%')
		  AND 	(ISNULL(@Address, '')            = ''    OR a.Address LIKE '%' + TRIM(@Address) + '%')
		  AND 	(@Reception          IS NULL OR a.Reception = @Reception)
		  AND 	(@Pool               IS NULL OR a.Pool = @Pool)
		  AND 	(ISNULL(@Observation, '')        = ''    OR a.Observation LIKE '%' + TRIM(@Observation) + '%')
		  AND 	(@PropertyStatusId   IS NULL OR a.PropertyStatusId = @PropertyStatusId)
		  AND 	(@CityId             IS NULL OR a.CityId = @CityId)
		  AND 	(@ZoneId             IS NULL OR a.ZoneId = @ZoneId)
		  AND 	(@OwnerId            IS NULL OR a.OwnerId = @OwnerId)
		  AND 	(@PropertyCategoryId IS NULL OR a.PropertyCategoryId = @PropertyCategoryId)
		  AND 	(@TypeOfferId        IS NULL OR a.TypeOfferId = @TypeOfferId)
		  AND 	(@CompayId           IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Properties.Property_LIST @Option = null, @PropertyId = null, @IdIva = null, @Code = '', @Title = '', @Description = '', @Address = '', @Reception = null, @Pool = null, @Observation = '', @PropertyStatusId = null, @CityId = null, @ZoneId = null, @OwnerId = null, @PropertyCategoryId = null, @TypeOfferId = null, @CompayId = null
END
GO


CREATE PROCEDURE Properties.Property_CREATE
	@Option             TINYINT = NULL,
	@IdIva              INT,
	@Code               NVARCHAR(100),
	@Title              NVARCHAR(100),
	@Description        NVARCHAR(500),
	@Address            NVARCHAR(200),
	@PriceOwner         DECIMAL,
	@Percentage         DECIMAL,
	@FeeCompany         DECIMAL,
	@RecruitmentDate    DATE,
	@FinalPrice         DECIMAL,
	@Rooms              INT,
	@Toilets            INT,
	@Reception          BIT,
	@Pool               BIT,
	@Area               DECIMAL,
	@Observation        NVARCHAR(500),
	@PropertyStatusId   INT,
	@CityId             INT,
	@ZoneId             INT,
	@OwnerId            INT,
	@PropertyCategoryId INT,
	@TypeOfferId        INT,
	@CompayId           INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedPropertyId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Properties.Property (IdIva, Code, Title, Description, Address,
								PriceOwner, Percentage, FeeCompany, RecruitmentDate, FinalPrice,
								Rooms, Toilets, Reception, Pool, Area,
								Observation, PropertyStatusId, CityId, ZoneId, OwnerId,
								PropertyCategoryId, TypeOfferId, CompayId)
							VALUES (@IdIva, @Code, @Title, @Description, @Address,
								@PriceOwner, @Percentage, @FeeCompany, @RecruitmentDate, @FinalPrice,
								@Rooms, @Toilets, @Reception, @Pool, @Area,
								@Observation, @PropertyStatusId, @CityId, @ZoneId, @OwnerId,
								@PropertyCategoryId, @TypeOfferId, @CompayId)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedPropertyId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedPropertyId PropertyId
	-- EXEC Properties.Property_CREATE @Option = null, @IdIva = null, @Code = null, @Title = null, @Description = null, @Address = null, @PriceOwner = null, @Percentage = null, @FeeCompany = null, @RecruitmentDate = null, @FinalPrice = null, @Rooms = null, @Toilets = null, @Reception = null, @Pool = null, @Area = null, @Observation = null, @PropertyStatusId = null, @CityId = null, @ZoneId = null, @OwnerId = null, @PropertyCategoryId = null, @TypeOfferId = null, @CompayId = null
END
GO


CREATE PROCEDURE Properties.Property_UPDATE
	@Option             TINYINT = NULL,
	@PropertyId         INT,
	@IdIva              INT,
	@Code               NVARCHAR(100),
	@Title              NVARCHAR(100),
	@Description        NVARCHAR(500),
	@Address            NVARCHAR(200),
	@PriceOwner         DECIMAL,
	@Percentage         DECIMAL,
	@FeeCompany         DECIMAL,
	@RecruitmentDate    DATE,
	@FinalPrice         DECIMAL,
	@Rooms              INT,
	@Toilets            INT,
	@Reception          BIT,
	@Pool               BIT,
	@Area               DECIMAL,
	@Observation        NVARCHAR(500),
	@PropertyStatusId   INT,
	@CityId             INT,
	@ZoneId             INT,
	@OwnerId            INT,
	@PropertyCategoryId INT,
	@TypeOfferId        INT,
	@CompayId           INT
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
			IF NOT EXISTS(SELECT 1 FROM Properties.Property WHERE PropertyId = @PropertyId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Properties.Property
			SET 	IdIva              = @IdIva,
					Code               = @Code,
					Title              = @Title,
					Description        = @Description,
					Address            = @Address,
					PriceOwner         = @PriceOwner,
					Percentage         = @Percentage,
					FeeCompany         = @FeeCompany,
					RecruitmentDate    = @RecruitmentDate,
					FinalPrice         = @FinalPrice,
					Rooms              = @Rooms,
					Toilets            = @Toilets,
					Reception          = @Reception,
					Pool               = @Pool,
					Area               = @Area,
					Observation        = @Observation,
					PropertyStatusId   = @PropertyStatusId,
					CityId             = @CityId,
					ZoneId             = @ZoneId,
					OwnerId            = @OwnerId,
					PropertyCategoryId = @PropertyCategoryId,
					TypeOfferId        = @TypeOfferId,
					CompayId           = @CompayId
			WHERE 	PropertyId = @PropertyId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @PropertyId PropertyId
	-- EXEC Properties.Property_UPDATE @Option = null, @PropertyId = null, @IdIva = null, @Code = null, @Title = null, @Description = null, @Address = null, @PriceOwner = null, @Percentage = null, @FeeCompany = null, @RecruitmentDate = null, @FinalPrice = null, @Rooms = null, @Toilets = null, @Reception = null, @Pool = null, @Area = null, @Observation = null, @PropertyStatusId = null, @CityId = null, @ZoneId = null, @OwnerId = null, @PropertyCategoryId = null, @TypeOfferId = null, @CompayId = null
END
GO


CREATE PROCEDURE Properties.Property_ENABLE
	@PropertyId INT
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
		IF NOT EXISTS(SELECT 1 FROM Properties.Property WHERE PropertyId = @PropertyId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Properties.Property WHERE PropertyId = @PropertyId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Properties.Property
		SET		
		WHERE	Active = 0
		  AND 	PropertyId = @PropertyId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @PropertyId PropertyId
	-- EXEC Properties.Property_ENABLE @PropertyId = null
END
GO


CREATE PROCEDURE Properties.Property_DISABLE
	@PropertyId INT
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
		IF NOT EXISTS(SELECT 1 FROM Properties.Property WHERE PropertyId = @PropertyId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Properties.Property WHERE PropertyId = @PropertyId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Properties.Property
		SET		
		WHERE	Active = 1
		  AND 	PropertyId = @PropertyId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @PropertyId PropertyId
	-- EXEC Properties.Property_DISABLE @PropertyId = null
END
GO


CREATE PROCEDURE Properties.Property_DELETE
	@PropertyId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Properties.Property WHERE PropertyId = @PropertyId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Properties.Property
		WHERE  PropertyId = @PropertyId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @PropertyId PropertyId
	-- EXEC Properties.Property_DELETE @PropertyId = null
END
GO


