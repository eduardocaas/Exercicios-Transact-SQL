/*----------PROCEDURE DESCONTO----------*/
CREATE PROCEDURE usp_Desconto
	@preco	MONEY, 
	@qntd NUMERIC,
	@valorInicial MONEY OUT,
	@valorFinal MONEY OUT,
	@desconto MONEY OUT,
	@mensagem VARCHAR(200) OUT
AS
BEGIN
	SET @valorInicial = @preco * @qntd;
	SET @desconto =
		CASE
			WHEN @valorInicial > 1001 AND @valorInicial < 2000 
				THEN @valorInicial * 0.05
			WHEN @valorInicial > 2000 
				THEN @valorInicial * 0.1
			ELSE 0
		END;
	SET @valorFinal = @valorInicial - @desconto;
	SET @mensagem = 'Valor de compra: ' + TRIM(STR(@valorInicial)) + ' - Desconto: ' + TRIM(STR(@desconto)) + ' - Valor final: ' + TRIM(STR(@valorFinal));
END;

/*----------BLOCO PARA EXECUÇÃO A FINS DE TESTES NA PROCEDURE----------*/
DECLARE @valorInicialOUT MONEY;
DECLARE @valorFinalOUT MONEY;
DECLARE @descontoOUT MONEY;
DECLARE @mensagemOUT VARCHAR(200);

EXEC usp_Desconto 
	 @preco = 1200,
	 @qntd = 2,
	 @valorInicial = @valorInicialOUT OUT,
	 @valorFinal = @valorFinalOUT OUT,
	 @desconto = @descontoOUT OUT,
	 @mensagem = @mensagemOUT OUT;

SELECT @valorInicialOUT AS Valor_Inicial
SELECT @valorFinalOUT AS Valor_Final;
SELECT @descontoOUT AS Desconto;
SELECT @mensagemOUT AS Mensagem;
/*----------FIM----------*/