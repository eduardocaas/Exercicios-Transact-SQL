/*-----------NOME MÊS-----------*/
CREATE FUNCTION dbo.udf_MesCorrente (@Data DATE = NULL)
RETURNS VARCHAR(30)
AS
BEGIN
    DECLARE @Mes AS VARCHAR(30)
    
    IF @Data IS NULL
        SET @Data = GETDATE()
    
	SET @Mes = DATENAME(MONTH, @Data)
    
    RETURN @Mes
END;

SELECT dbo.udf_MesCorrente('2023-03-16') AS Resultado;
SELECT dbo.udf_MesCorrente(DEFAULT) AS Resultado;


/*-----------FATORIAL-----------*/
CREATE FUNCTION dbo.udf_Fatorial(@Num INTEGER)
RETURNS INTEGER
AS
BEGIN
	DECLARE @Count INTEGER = 1,
			@Res INTEGER = 1

	WHILE @Count <= @Num
		BEGIN 
			SET @Res = @Res * @Count
			SET @Count = @Count + 1
		END
	RETURN @Res
END;

SELECT dbo.udf_Fatorial(5) AS Resultado;


