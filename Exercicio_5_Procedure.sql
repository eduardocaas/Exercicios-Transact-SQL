/*--------DIFERENÇA PERCENTUAL--------*/
CREATE PROCEDURE usp_Margem
	@valor01 MONEY,
	@valor02 MONEY
AS 
BEGIN
	DECLARE @diferenca MONEY, @percent DECIMAL(18,2)
	SET @diferenca = @valor01 - @valor02
	IF @valor01 <> 0 
		SET @percent = (@diferenca / @valor01) * 100
	ELSE 
		SET @percent = 0
	SELECT @percent AS 'Porcentagem em que valor 1 é maior que valor 2'
END;

EXEC usp_Margem 11, 10;

