/*------------ VIEW  ------------*/
USE AdventureWorks2019;
CREATE VIEW vw_ListarVendasPorSubCategoria
AS 
	SELECT 
		ps.ProductSubcategoryID AS 'SubcategoriaID',
		p.Name AS 'Produto',
		sod.SalesOrderID AS 'PedidoID',
		soh.OrderDate AS 'Data_do_Pedido',
		sod.LineTotal AS 'Total_da_venda'
	FROM 
		Sales.SalesOrderDetail sod 
			INNER JOIN
		Sales.SalesOrderHeader soh 
			ON sod.SalesOrderID = soh.SalesOrderID
			INNER JOIN 
		Production.Product p 
			ON sod.ProductID = p.ProductID
			INNER JOIN
		Production.ProductSubcategory ps 
			ON p.ProductSubcategoryID = ps.ProductSubcategoryID;
		
SELECT * FROM vw_ListarVendasPorSubCategoria ORDER BY vw_ListarVendasPorSubCategoria.SubcategoriaID, vw_ListarVendasPorSubCategoria.PedidoID;


/*------------ VIEW  ------------*/
USE AdventureWorks2019;
CREATE VIEW vw_ListarPedidosAgrupadoPaisAnoMes
AS
	SELECT 
		cr.Name AS 'Nome',
		YEAR(soh.OrderDate) AS 'Ano',
		DATENAME(MONTH, soh.OrderDate) AS 'Mês',
		FORMAT(SUM(sod.LineTotal), 'N2') AS 'Total' 
	FROM 
		Sales.SalesOrderHeader soh 
			INNER JOIN 
		Sales.SalesOrderDetail sod 
			ON soh.SalesOrderID = sod.SalesOrderID 
			INNER JOIN 
		Sales.SalesTerritory st
			ON soh.TerritoryID = st.TerritoryID
			INNER JOIN
		Person.CountryRegion cr 
			ON st.CountryRegionCode = cr.CountryRegionCode
	GROUP BY
		cr.Name,
		YEAR(soh.OrderDate),
		DATENAME(MONTH, soh.OrderDate);

SELECT * FROM vw_ListarPedidosAgrupadoPaisAnoMes;


/*------------ PROCEDURE CÁLCULO PERÍMETRO E TIPO TRIÂNGULO  ------------*/
CREATE PROCEDURE usp_CalculoTriangulo
	@valorA NUMERIC,
	@valorB NUMERIC,
	@valorC NUMERIC
AS
BEGIN
	DECLARE @valorPerimetro NUMERIC, @tipoTriangulo VARCHAR(50);

	SET @valorPerimetro = @valorA + @valorB + @valorC;
	IF @valorA = @valorB AND @valorB = @valorC
		SET @tipoTriangulo = 'Equilátero';
	ELSE IF @valorA <> @valorB AND @valorB <> @valorC 
		SET @tipoTriangulo = 'Escaleno';
	ELSE 
		SET @tipoTriangulo =	'Isósceles';

	SELECT @tipoTriangulo AS 'Tipo triângulo: ';
END

EXEC usp_CalculoTriangulo 5, 5 , 5;

/*------------ PROCEDURE TOTAL DE VENDAS DE PRODUTO ENTRE DATAS  ------------*/
USE AdventureWorks2019;
CREATE PROCEDURE usp_TotalVendasProdutoData
	@codProduto INT,
	@dataInicio DATE,
	@dataFinal DATE
AS 
BEGIN
	DECLARE @totalVendas INT;

	SELECT @totalVendas = COUNT(*) FROM Sales.SalesOrderHeader AS soh 
	INNER JOIN Sales.SalesOrderDetail sod
	ON soh.SalesOrderID = sod.SalesOrderID
	WHERE sod.ProductID = @codProduto
	AND soh.OrderDate >= @dataInicio
	AND soh.OrderDate <= @dataFinal;

	SELECT @totalVendas AS 'Total de vendas'
END;

EXEC usp_TotalVendasProdutoData 707, '2010-01-01', '2011-06-30';


/*------------ FUNÇÃO IDADE  ------------*/
CREATE FUNCTION fn_IdadeAtual (@data DATE)
	RETURNS INT 
AS 
BEGIN
	DECLARE @idade AS INT;
	SET @idade = DATEDIFF(YEAR, @data, GETDATE());
	RETURN @idade;
END;

SELECT dbo.fn_IdadeAtual('2000-01-01') AS Idade;


/*------------ FUNÇÃO NOME FORMATADO  ------------*/
USE AdventureWorks2019;
CREATE FUNCTION fn_FormatarNome (@codPessoa INT)
	RETURNS VARCHAR(100)
AS 
BEGIN
	DECLARE @nomeCompleto AS VARCHAR(100);
	SET @nomeCompleto = (
	SELECT p.FirstName + ' ' + ISNULL(p.MiddleName, '') + ' ' + p.LastName FROM Person.Person p WHERE p.BusinessEntityID = @codPessoa);
	RETURN @nomeCompleto;
END;

SELECT dbo.fn_FormatarNome(3) AS 'Nome completo';

