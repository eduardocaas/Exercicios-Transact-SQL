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

CREATE PROCEDURE sp_CalculoTriangulo
	@valorA NUMERIC,
	@valorB NUMERIC,
	@valorC NUMERIC,
	@valorPerimetro NUMERIC OUT,
	@tipoTriangulo VARCHAR(50) OUT
AS
BEGIN
	SET @valorPerimetro = @valorA + @valorB + @valorC
