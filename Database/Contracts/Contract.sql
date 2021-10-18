USE Inmoapp_dev
GO

/*
	IF OBJECT_ID('Contracts.Contract_READ', 'P') IS NOT NULL DROP PROCEDURE Contracts.Contract_READ
	IF OBJECT_ID('Contracts.Contract_LIST', 'P') IS NOT NULL DROP PROCEDURE Contracts.Contract_LIST
	IF OBJECT_ID('Contracts.Contract_CREATE', 'P') IS NOT NULL DROP PROCEDURE Contracts.Contract_CREATE
	IF OBJECT_ID('Contracts.Contract_UPDATE', 'P') IS NOT NULL DROP PROCEDURE Contracts.Contract_UPDATE
	IF OBJECT_ID('Contracts.Contract_ENABLE', 'P') IS NOT NULL DROP PROCEDURE Contracts.Contract_ENABLE
	IF OBJECT_ID('Contracts.Contract_DISABLE', 'P') IS NOT NULL DROP PROCEDURE Contracts.Contract_DISABLE
	IF OBJECT_ID('Contracts.Contract_DELETE', 'P') IS NOT NULL DROP PROCEDURE Contracts.Contract_DELETE
*/

CREATE PROCEDURE Contracts.Contract_READ
	@Option      TINYINT = NULL,
	@ContractId  INT = NULL,
	@Observation NVARCHAR(300) = '',
	@StatusId    INT = NULL,
	@PropertyId  INT = NULL,
	@TenantId    INT = NULL,
	@CompayId    INT = NULL
AS
BEGIN

	IF @Option = 1
	BEGIN
		SELECT 	a.ContractId, a.ContractDate, a.InnitialDate, a.QuantityMonths, a.RentalFeeForOwner, 
				a.RentalFeeForTennat, a.Observation, a.StatusId, a.PropertyId, a.TenantId, 
				a.CompayId
		FROM 	Contracts.Contract a
		WHERE 	(@ContractId  IS NULL OR a.ContractId = @ContractId)
		  AND 	(ISNULL(@Observation, '') = ''    OR a.Observation LIKE '%' + TRIM(@Observation) + '%')
		  AND 	(@StatusId    IS NULL OR a.StatusId = @StatusId)
		  AND 	(@PropertyId  IS NULL OR a.PropertyId = @PropertyId)
		  AND 	(@TenantId    IS NULL OR a.TenantId = @TenantId)
		  AND 	(@CompayId    IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Contracts.Contract_READ @Option = null, @ContractId = null, @Observation = '', @StatusId = null, @PropertyId = null, @TenantId = null, @CompayId = null
END
GO


CREATE PROCEDURE Contracts.Contract_LIST
	@Option      TINYINT = NULL,
	@ContractId  INT = NULL,
	@Observation NVARCHAR(300) = '',
	@StatusId    INT = NULL,
	@PropertyId  INT = NULL,
	@TenantId    INT = NULL,
	@CompayId    INT = NULL
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.ContractId ContractId, a.ContractId ContractName
		FROM 	Contracts.Contract a
		WHERE 	(@ContractId  IS NULL OR a.ContractId = @ContractId)
		  AND 	(ISNULL(@Observation, '') = ''    OR a.Observation LIKE '%' + TRIM(@Observation) + '%')
		  AND 	(@StatusId    IS NULL OR a.StatusId = @StatusId)
		  AND 	(@PropertyId  IS NULL OR a.PropertyId = @PropertyId)
		  AND 	(@TenantId    IS NULL OR a.TenantId = @TenantId)
		  AND 	(@CompayId    IS NULL OR a.CompayId = @CompayId)
	END

	-- EXEC Contracts.Contract_LIST @Option = null, @ContractId = null, @Observation = '', @StatusId = null, @PropertyId = null, @TenantId = null, @CompayId = null
END
GO


CREATE PROCEDURE Contracts.Contract_CREATE
	@Option             TINYINT = NULL,
	@ContractDate       DATE,
	@InnitialDate       DATE,
	@QuantityMonths     INT,
	@RentalFeeForOwner  DECIMAL,
	@RentalFeeForTennat DECIMAL,
	@Observation        NVARCHAR(300),
	@StatusId           INT,
	@PropertyId         INT,
	@TenantId           INT,
	@CompayId           INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)
DECLARE @InsertedContractId INT

SET @ErrorId = 0
SET @Message = ''

	IF @Option = 1
	BEGIN
		IF @ErrorId = 0
		BEGIN
			INSERT INTO Contracts.Contract (ContractDate, InnitialDate, QuantityMonths, RentalFeeForOwner, RentalFeeForTennat,
								Observation, StatusId, PropertyId, TenantId, CompayId)
							VALUES (@ContractDate, @InnitialDate, @QuantityMonths, @RentalFeeForOwner, @RentalFeeForTennat,
								@Observation, @StatusId, @PropertyId, @TenantId, @CompayId)
			
			SET @Message = CONCAT(@@ROWCOUNT, ' record inserted')
		SET @InsertedContractId = @@IDENTITY
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @InsertedContractId ContractId
	-- EXEC Contracts.Contract_CREATE @Option = null, @ContractDate = null, @InnitialDate = null, @QuantityMonths = null, @RentalFeeForOwner = null, @RentalFeeForTennat = null, @Observation = null, @StatusId = null, @PropertyId = null, @TenantId = null, @CompayId = null
END
GO


CREATE PROCEDURE Contracts.Contract_UPDATE
	@Option             TINYINT = NULL,
	@ContractId         INT,
	@ContractDate       DATE,
	@InnitialDate       DATE,
	@QuantityMonths     INT,
	@RentalFeeForOwner  DECIMAL,
	@RentalFeeForTennat DECIMAL,
	@Observation        NVARCHAR(300),
	@StatusId           INT,
	@PropertyId         INT,
	@TenantId           INT,
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
			IF NOT EXISTS(SELECT 1 FROM Contracts.Contract WHERE ContractId = @ContractId)
			BEGIN
				SET @ErrorId = 10
				SET @Message = 'Record not found'
			END
		END

		IF @ErrorId = 0
		BEGIN
			UPDATE  Contracts.Contract
			SET 	ContractDate       = @ContractDate,
					InnitialDate       = @InnitialDate,
					QuantityMonths     = @QuantityMonths,
					RentalFeeForOwner  = @RentalFeeForOwner,
					RentalFeeForTennat = @RentalFeeForTennat,
					Observation        = @Observation,
					StatusId           = @StatusId,
					PropertyId         = @PropertyId,
					TenantId           = @TenantId,
					CompayId           = @CompayId
			WHERE 	ContractId = @ContractId

			SET @Message = CONCAT(@@ROWCOUNT, ' record updated')
		END
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @ContractId ContractId
	-- EXEC Contracts.Contract_UPDATE @Option = null, @ContractId = null, @ContractDate = null, @InnitialDate = null, @QuantityMonths = null, @RentalFeeForOwner = null, @RentalFeeForTennat = null, @Observation = null, @StatusId = null, @PropertyId = null, @TenantId = null, @CompayId = null
END
GO


CREATE PROCEDURE Contracts.Contract_ENABLE
	@ContractId INT
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
		IF NOT EXISTS(SELECT 1 FROM Contracts.Contract WHERE ContractId = @ContractId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Contracts.Contract WHERE ContractId = @ContractId AND Active = 1)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already enabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Contracts.Contract
		SET		
		WHERE	Active = 0
		  AND 	ContractId = @ContractId

		SET @Message = CONCAT(@@ROWCOUNT, ' record enabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @ContractId ContractId
	-- EXEC Contracts.Contract_ENABLE @ContractId = null
END
GO


CREATE PROCEDURE Contracts.Contract_DISABLE
	@ContractId INT
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
		IF NOT EXISTS(SELECT 1 FROM Contracts.Contract WHERE ContractId = @ContractId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		IF EXISTS(SELECT 1 FROM Contracts.Contract WHERE ContractId = @ContractId AND Active = 0)
		BEGIN
			SET @ErrorId = 20
			SET @Message = 'Record already disabled'
		END
	END

	IF @ErrorId = 0
	BEGIN
		UPDATE	Contracts.Contract
		SET		
		WHERE	Active = 1
		  AND 	ContractId = @ContractId

		SET @Message = CONCAT(@@ROWCOUNT, ' record disabled')
	END
	*/
	SELECT @ErrorId ErrorId, @Message Message, @ContractId ContractId
	-- EXEC Contracts.Contract_DISABLE @ContractId = null
END
GO


CREATE PROCEDURE Contracts.Contract_DELETE
	@ContractId INT
AS
BEGIN

DECLARE @ErrorId TINYINT
DECLARE @Message VARCHAR(100)

SET @ErrorId = 0
SET @Message = ''

	IF @ErrorId = 0
	BEGIN
		IF NOT EXISTS(SELECT 1 FROM Contracts.Contract WHERE ContractId = @ContractId)
		BEGIN
			SET @ErrorId = 10
			SET @Message = 'Record not found'
		END
	END

	IF @ErrorId = 0
	BEGIN
		DELETE
		FROM   Contracts.Contract
		WHERE  ContractId = @ContractId

		SET @Message = CONCAT(@@ROWCOUNT, ' record deleted')
	END
	
	SELECT @ErrorId ErrorId, @Message Message, @ContractId ContractId
	-- EXEC Contracts.Contract_DELETE @ContractId = null
END
GO


