/*-------CONSULTA PARA IDENTIFICAR DADOS-------*/
SELECT vc.*, sp.Bonus FROM VW_COLABORADORES vc INNER JOIN Sales.SalesPerson sp ON vc.BusinessEntityID = sp.BusinessEntityID;

/*-------PROCEDURE RETORNA BÔNUS DE COLABORADOR-------*/
CREATE PROCEDURE usp_RetornaBonus
	@idColaborador NUMERIC,
	@nomeColaborador VARCHAR(200),
	@totalBonus MONEY OUT
AS 
BEGIN 
	SELECT @totalBonus = sp.Bonus
	FROM VW_COLABORADORES vc 
	INNER JOIN Sales.SalesPerson sp
	ON vc.BusinessEntityID = sp.BusinessEntityID
	WHERE vc.BusinessEntityID = @idColaborador
	OR vc.NomeCompleto LIKE '%' + @nomeColaborador + '%';
END;

/*-------TESTE COM ID-------*/
DECLARE @resultado MONEY;
EXEC usp_RetornaBonus @idColaborador = 281, @nomeColaborador = NULL, @totalBonus = @resultado OUT;
SELECT @resultado AS Bônus;

/*-------TESTE COM NOME-------*/
DECLARE @resultado MONEY;
EXEC usp_RetornaBonus @idColaborador = NULL, @nomeColaborador = 'Michael G Blythe', @totalBonus = @resultado OUT;
SELECT @resultado AS Bônus;
