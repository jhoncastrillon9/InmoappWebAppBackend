USE Inmoapp_dev
GO

/*
	IF OBJECT_ID('Tenants.Tenant_READ', 'P') IS NOT NULL DROP PROCEDURE Tenants.Tenant_READ
	IF OBJECT_ID('Tenants.Tenant_LIST', 'P') IS NOT NULL DROP PROCEDURE Tenants.Tenant_LIST
	IF OBJECT_ID('Tenants.Tenant_CREATE', 'P') IS NOT NULL DROP PROCEDURE Tenants.Tenant_CREATE
	IF OBJECT_ID('Tenants.Tenant_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Tenants.Tenant_UPDATE
	IF OBJECT_ID('Tenants.Tenant_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Tenants.Tenant_ENABLE
	IF OBJECT_ID('Tenants.Tenant_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Tenants.Tenant_DISABLE
	IF OBJECT_ID('Tenants.Tenant_DELETE', 'P') IS NOT NULL DROP PROCEDURE Tenants.Tenant_DELETE
*/

CREATE PROCEDURE Tenants.Tenant_READ
	@Option      TINYINT = NULL,
	@TenantId    INT = NULL,
	@TenantName  NVARCHAR(200) = '',
	@Document    NVARCHAR(50) = '',
	@Telephone   NVARCHAR(30) = '',
	@Mobile      NVARCHAR(30) = '',
	@Email       NVARCHAR(80) = '',
	@Address     NVARCHAR(200) = '',
	@Observation NVARCHAR(500) = '',
	@CompayId    INT = NULL
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.TenantId, a.TenantName, a.Document, a.Telephone, a.Mobile, 
				a.Email, a.Address, a.Observation, a.CompayId
		FROM 	Tenants.Tenant a
		WHERE 	(@TenantId    IS NULL OR a.TenantId = @TenantId)
		  AND 	(ISNULL(@TenantName, '')  = ''    OR a.TenantName LIKE '%' + TRIM(@TenantName) + '%')
		  AND 	(ISNULL(@Document, '')    = ''    OR a.Document LIKE '%' + TRIM(@Document) + '%')
		  AND 	(ISNULL(@Telephone, '')   = ''    OR a.Telephone LIKE '%' + TRIM(@Telephone) + '%')
		  AND 	(ISNULL(@Mobile, '')      = ''    OR a.Mobile LIKE '%' + TRIM(@Mobile) + '%')
		  AND 	(ISNULL(@Email, '')       = ''    OR a.Email LIKE '%' + TRIM(@Email) + '%')
		  AND 	(ISNULL(@Address, '')     = ''    OR a.Address LIKE '%' + TRIM(@Address) + '%')
		  AND 	(ISNULL(@Observation, '') = ''    OR a.Observation LIKE '%' + TRIM(@Observation) + '%')
		  AND 	(@CompayId    IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Tenants.Tenant_READ @Option = null, @TenantId = null, @TenantName = '', @Document = '', @Telephone = '', @Mobile = '', @Email = '', @Address = '', @Observation = '', @CompayId = null
END
GO


CREATE PROCEDURE Tenants.Tenant_LIST
	@Option      TINYINT = NULL,
	@TenantId    INT = NULL,
	@TenantName  NVARCHAR(200) = '',
	@Document    NVARCHAR(50) = '',
	@Telephone   NVARCHAR(30) = '',
	@Mobile      NVARCHAR(30) = '',
	@Email       NVARCHAR(80) = '',
	@Address     NVARCHAR(200) = '',
	@Observation NVARCHAR(500) = '',
	@CompayId    INT = NULL
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.TenantId TenantId, a.TenantName TenantName
		FROM 	Tenants.Tenant a
		WHERE 	(@TenantId    IS NULL OR a.TenantId = @TenantId)
		  AND 	(ISNULL(@TenantName, '')  = ''    OR a.TenantName LIKE '%' + TRIM(@TenantName) + '%')
		  AND 	(ISNULL(@Document, '')    = ''    OR a.Document LIKE '%' + TRIM(@Document) + '%')
		  AND 	(ISNULL(@Telephone, '')   = ''    OR a.Telephone LIKE '%' + TRIM(@Telephone) + '%')
		  AND 	(ISNULL(@Mobile, '')      = ''    OR a.Mobile LIKE '%' + TRIM(@Mobile) + '%')
		  AND 	(ISNULL(@Email, '')       = ''    OR a.Email LIKE '%' + TRIM(@Email) + '%')
		  AND 	(ISNULL(@Address, '')     = ''    OR a.Address LIKE '%' + TRIM(@Address) + '%')
		  AND 	(ISNULL(@Observation, '') = ''    OR a.Observation LIKE '%' + TRIM(@Observation) + '%')
		  AND 	(@CompayId    IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Tenants.Tenant_LIST @Option = null, @TenantId = null, @TenantName = '', @Document = '', @Telephone = '', @Mobile = '', @Email = '', @Address = '', @Observation = '', @CompayId = null
END
GO


CREATE PROCEDURE Tenants.Tenant_CREATE
	@Option      TINYINT = NULL,
	@TenantName  NVARCHAR(200),
	@Document    NVARCHAR(50),
	@Telephone   NVARCHAR(30),
	@Mobile      NVARCHAR(30),
	@Email       NVARCHAR(80),
	@Address     NVARCHAR(200),
	@Observation NVARCHAR(500),
	@CompayId    INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedTenantId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Tenants.Tenant (TenantName, Document, Telephone, Mobile, Email,
								Address, Observation, CompayId)
							VALUES (@TenantName, @Document, @Telephone, @Mobile, @Email,
								@Address, @Observation, @CompayId)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedTenantId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedTenantId TenantId
	-- EXEC Tenants.Tenant_CREATE @Option = null, @TenantName = null, @Document = null, @Telephone = null, @Mobile = null, @Email = null, @Address = null, @Observation = null, @CompayId = null
END
GO


CREATE PROCEDURE Tenants.Tenant_UPDATE
	@Option      TINYINT = NULL,
	@TenantId    INT,
	@TenantName  NVARCHAR(200),
	@Document    NVARCHAR(50),
	@Telephone   NVARCHAR(30),
	@Mobile      NVARCHAR(30),
	@Email       NVARCHAR(80),
	@Address     NVARCHAR(200),
	@Observation NVARCHAR(500),
	@CompayId    INT
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
			IF NOT EXISTS(SELECT 1 FROM Tenants.Tenant WHERE TenantId = @TenantId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Tenants.Tenant
			SET 	TenantName  = @TenantName,
					Document    = @Document,
					Telephone   = @Telephone,
					Mobile      = @Mobile,
					Email       = @Email,
					Address     = @Address,
					Observation = @Observation,
					CompayId    = @CompayId
			WHERE 	TenantId = @TenantId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @TenantId TenantId
	-- EXEC Tenants.Tenant_UPDATE @Option = null, @TenantId = null, @TenantName = null, @Document = null, @Telephone = null, @Mobile = null, @Email = null, @Address = null, @Observation = null, @CompayId = null
END
GO


CREATE PROCEDURE Tenants.Tenant_ENABLE
	@TenantId INT
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
		IF NOT EXISTS(SELECT 1 FROM Tenants.Tenant WHERE TenantId = @TenantId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Tenants.Tenant WHERE TenantId = @TenantId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Tenants.Tenant
		SET		
		WHERE	Active = 0
		  AND 	TenantId = @TenantId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @TenantId TenantId
	-- EXEC Tenants.Tenant_ENABLE @TenantId = null
END
GO


CREATE PROCEDURE Tenants.Tenant_DISABLE
	@TenantId INT
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
		IF NOT EXISTS(SELECT 1 FROM Tenants.Tenant WHERE TenantId = @TenantId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Tenants.Tenant WHERE TenantId = @TenantId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Tenants.Tenant
		SET		
		WHERE	Active = 1
		  AND 	TenantId = @TenantId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @TenantId TenantId
	-- EXEC Tenants.Tenant_DISABLE @TenantId = null
END
GO


CREATE PROCEDURE Tenants.Tenant_DELETE
	@TenantId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Tenants.Tenant WHERE TenantId = @TenantId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Tenants.Tenant
		WHERE  TenantId = @TenantId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @TenantId TenantId
	-- EXEC Tenants.Tenant_DELETE @TenantId = null
END
GO


