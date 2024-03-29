

ALTER PROCEDURE [Properties].[Iva_LIST]
	@Option TINYINT = NULL,
	@IvaId INT = NULL
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.IvaId IvaId, a.Valor Valor
		FROM 	Properties.Iva a
		WHERE 	(@IvaId IS NULL OR a.IvaId = @IvaId)
	END

	-- EXEC Properties.Iva_LIST @Option = null, @IvaId = null
END


GO


ALTER PROCEDURE [Properties].[PropertyCategory_LIST]
	@Option             TINYINT = NULL,
	@PropertyCategoryId INT = NULL,
	@CategoryName       NVARCHAR(200) = ''
AS
BEGIN


	IF @Option = 1
	BEGIN
		SELECT 	a.PropertyCategoryId PropertyCategoryId, a.CategoryName CategoryName
		FROM 	Properties.PropertyCategory a
		WHERE 	(@PropertyCategoryId IS NULL OR a.PropertyCategoryId = @PropertyCategoryId)
		  AND 	(ISNULL(@CategoryName, '')       = ''    OR a.CategoryName LIKE '%' + TRIM(@CategoryName) + '%')
	END

	-- EXEC Properties.PropertyCategory_LIST @Option = null, @PropertyCategoryId = null, @CategoryName = ''
END
