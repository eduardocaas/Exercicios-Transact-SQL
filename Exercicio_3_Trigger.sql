USE AdventureWorks2019;

SELECT * FROM dbo.AulaProduto;
SELECT * FROM dbo.AulaVendas;

/*------------ ATUALIZAR ESTOQUE ------------*/
CREATE TRIGGER tr_AtualizaEstoque 
ON dbo.AulaVendas
AFTER INSERT
AS
BEGIN 
	UPDATE p
	SET p.nr_estoque = p.nr_estoque - i.nr_quantidade, p.dt_AtualEstoque = GETDATE()
	FROM dbo.AulaProduto p
	INNER JOIN INSERTED i ON p.id_Produto = i.id_Produto;
END


/*------------ VERIFICAR ESTOQUE ------------*/
CREATE TRIGGER tr_VerificaEstoque
ON dbo.AulaVendas
INSTEAD OF INSERT
AS 
BEGIN
	DECLARE @id_Produto int, @quantidade int, @estoque int, @estoqueMin int, @preco DECIMAL(12, 2), @nome VARCHAR(100);
	SELECT @id_Produto = i.id_Produto, @quantidade = i.nr_quantidade, @preco = i.nr_precoProduto,
		   @nome = p.nm_Produto, @estoque = p.nr_estoque, @estoqueMin = p.nr_estoqueMin
	FROM dbo.AulaProduto p 
	JOIN INSERTED i ON p.id_Produto = i.id_Produto;

	IF @estoque > @quantidade
		IF (@estoque - @quantidade) > @estoqueMin
			BEGIN 
				INSERT INTO dbo.AulaVendas(id_Produto, nr_quantidade, nr_precoProduto, dt_Venda)
				VALUES (@id_Produto, @quantidade, @preco, GETDATE());

				UPDATE dbo.AulaProduto 
				SET nr_estoque = nr_estoque - @quantidade
				WHERE id_Produto = @id_Produto;
			END
		ELSE 
			BEGIN 
				PRINT 'Quantidade acima do estoque mínimo'
					  + ' - Estoque atual: ' + CAST(@estoque AS VARCHAR(10)) 
					  + ' - Estoque mínimo ' + CAST(@estoqueMin AS VARCHAR(10))
					  + ' - Quantidade solicitada: ' + CAST(@quantidade AS VARCHAR(10)) + '.';
			END
	ELSE 
		BEGIN
			PRINT 'Quantidade acima do estoque'
					  + ' - Estoque atual: ' + CAST(@estoque AS VARCHAR(10)) 					 
					  + ' - Quantidade solicitada: ' + CAST(@quantidade AS VARCHAR(10)) + '.';
		END
END

/*------------ VERIFICAR ESTOQUE ------------*/	

CREATE TRIGGER dbo.AtualizaPreco
ON dbo.AulaProduto
AFTER UPDATE
AS
BEGIN
    DECLARE @id_Produto  int, @preco money;
    
    SELECT @id_Produto = id_Produto, @preco = nr_Preco
    FROM INSERTED;

    UPDATE dbo.AulaVendas
    SET nr_precoProduto = @preco
    WHERE id_Produto = @id_Produto 
    AND nr_precoProduto < @preco;
END;

