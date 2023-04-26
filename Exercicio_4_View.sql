/*---------SELECT PARA VIEW---------*/
SELECT 
	p.BusinessEntityID, 
	p.FirstName + ' ' + ISNULL(p.MiddleName, '') + ' ' + ISNULL(p.LastName, '') AS 'Nome Completo' ,
	e.JobTitle AS Cargo,
	e.BirthDate AS 'Data de Nascimento',
	e.MaritalStatus AS 'Estado Civil',
	YEAR(GETDATE()) - YEAR(e.BirthDate) AS Idade
FROM Person.Person p 
INNER JOIN 
HumanResources.Employee e
ON p.BusinessEntityID = e.BusinessEntityID;


/*---------ITEM 1 - CRIAÇÃO DA VIEW---------*/
CREATE VIEW VW_COLABORADORES AS 
	SELECT 
		p.BusinessEntityID, 
		p.FirstName + ' ' + ISNULL(p.MiddleName, '') + ' ' + ISNULL(p.LastName, '') AS NomeCompleto,
		e.JobTitle AS Cargo,
		e.BirthDate AS DataDeNascimento,
		e.MaritalStatus AS EstadoCivil,
		YEAR(GETDATE()) - YEAR(e.BirthDate) AS Idade
	FROM Person.Person p 
	INNER JOIN 
	HumanResources.Employee e
	ON p.BusinessEntityID = e.BusinessEntityID;


/*---------ITEM 2 - QNTD POR CARGO---------*/
SELECT COUNT(1) AS Quantidade, vw_col.Cargo 
FROM VW_COLABORADORES vw_col
GROUP BY vw_col.Cargo
ORDER BY vw_col.Cargo;


/*---------ITEM 3 - ALTERAÇÃO DA VIEW---------*/
ALTER VIEW VW_COLABORADORES AS 
	SELECT 
		p.BusinessEntityID, 
		p.FirstName + ' ' + ISNULL(p.MiddleName, '') + ' ' + ISNULL(p.LastName, '') AS NomeCompleto,
		e.JobTitle AS Cargo,
		e.BirthDate AS DataDeNascimento,
		e.MaritalStatus AS EstadoCivil,
		YEAR(GETDATE()) - YEAR(e.BirthDate) AS Idade,
		pa.AddressLine1 + ISNULL(' ' + pa.AddressLine2, '') AS Endereco,
		pa.City AS Cidade,
		sp.Name AS Estado,
		cr.Name AS País
	FROM Person.Person p 
	INNER JOIN 
	HumanResources.Employee e
	ON p.BusinessEntityID = e.BusinessEntityID
	INNER JOIN 
	Person.BusinessEntityAddress bea
	ON p.BusinessEntityID = bea.BusinessEntityID
	INNER JOIN 
	Person.Address pa 
	ON bea.AddressID = pa.AddressID
	INNER JOIN 
	Person.StateProvince sp
	ON pa.StateProvinceID = sp.StateProvinceID
	INNER JOIN 
	Person.CountryRegion cr
	ON sp.CountryRegionCode = cr.CountryRegionCode;


/*---------ITEM 4 - QNTD POR ESTADO E PAÍS---------*/
SELECT COUNT(1) AS Colaboradores, vw_col.País, vw_col.Estado
FROM VW_COLABORADORES vw_col
GROUP BY vw_col.País, vw_col.Estado
ORDER BY vw_col.País, Colaboradores DESC;


/*---------TESTE VIEW---------*/
SELECT * FROM VW_COLABORADORES;