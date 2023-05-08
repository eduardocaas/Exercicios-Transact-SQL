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


SELECT cr.Name FROM Sales.SalesOrderHeader soh
INNER JOIN Sales.Customer sc ON soh.TerritoryID = sc.TerritoryID
INNER JOIN Person.StateProvince sp ON sc.TerritoryID = sp.TerritoryID
INNER JOIN Person.CountryRegion cr ON sp.CountryRegionCode = cr.CountryRegionCode