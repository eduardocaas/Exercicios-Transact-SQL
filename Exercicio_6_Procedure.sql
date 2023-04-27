CREATE PROCEDURE usp_Calculadora
	@valor01 NUMERIC,
	@valor02 NUMERIC,
	@operacao CHAR,
	@resultado NUMERIC OUT
AS 
BEGIN
	IF UPPER(@operacao) = 'S'
		BEGIN
			SET @resultado = @valor01 + @valor02;
		END
	ELSE IF UPPER(@operacao) = 'U'
		BEGIN
			SET @resultado = @valor01 + @valor02;
		END
	ELSE IF UPPER(@operacao) = 'M'
		BEGIN
			SET @resultado = @valor01 * @valor02;
		END
	ELSE IF UPPER(@operacao) = 'D'
		BEGIN
			SET @resultado = @valor01 / @valor02;
		END
	ELSE IF UPPER(@operacao) = 'P'
		BEGIN
			SET @resultado = POWER(@valor01, @valor02);
		END
END;

DECLARE @valorCalculo NUMERIC;
EXEC usp_Calculadora @valor01 = 10, @valor02 = 2, @operacao = 'S', @resultado = @valorCalculo OUT;
SELECT @valorCalculo;

DECLARE @valorCalculo NUMERIC;
EXEC usp_Calculadora @valor01 = 10, @valor02 = 2, @operacao = 'U', @resultado = @valorCalculo OUT;
SELECT @valorCalculo;

DECLARE @valorCalculo NUMERIC;
EXEC usp_Calculadora @valor01 = 10, @valor02 = 2, @operacao = 'M', @resultado = @valorCalculo OUT;
SELECT @valorCalculo;

DECLARE @valorCalculo NUMERIC;
EXEC usp_Calculadora @valor01 = 10, @valor02 = 2, @operacao = 'D', @resultado = @valorCalculo OUT;
SELECT @valorCalculo;

DECLARE @valorCalculo NUMERIC;
EXEC usp_Calculadora @valor01 = 10, @valor02 = 2, @operacao = 'P', @resultado = @valorCalculo OUT;
SELECT @valorCalculo;