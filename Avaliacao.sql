/*---------QUESTÃO 2 - FUNÇÃO NOME DO DIA DA SEMANA---------*/
CREATE FUNCTION udf_DiaDaSemana
	(@Data DATE)
RETURNS VARCHAR(30)
AS
BEGIN
	DECLARE @DiaDaSemana AS VARCHAR(30)
	
	SELECT @DiaDaSemana =
		CASE DATEPART(DW, @Data)
			WHEN 1 THEN 'Domingo'
			WHEN 2 THEN 'Segunda'
			WHEN 3 THEN 'Terça'
			WHEN 4 THEN 'Quarta'
			WHEN 5 THEN 'Quinta'
			WHEN 6 THEN 'Sexta'
			WHEN 7 THEN 'Sábado'
			ELSE 'Indefinido' 
		END
	RETURN @DiaDaSemana
END;

SELECT dbo.udf_DiaDaSemana('2023-05-17') AS Dia;


/*---------FUNÇÃO AUXILIAR PARA QUESTÃO 3---------*/
CREATE FUNCTION udf_NomeMes
	(@Data DATE)
RETURNS VARCHAR(30)
AS
BEGIN
	DECLARE @mes AS VARCHAR(30)
	
	SELECT @mes =
		CASE DATEPART(MM, @Data)
			WHEN 1 THEN 'Janeiro'
			WHEN 2 THEN 'Fevereiro'
			WHEN 3 THEN 'Março'
			WHEN 4 THEN 'Abril'
			WHEN 5 THEN 'Maio'
			WHEN 6 THEN 'Junho'
			WHEN 7 THEN 'Julho'
			WHEN 8 THEN 'Agosto'
			WHEN 9 THEN 'Setembro'
			WHEN 10 THEN 'Outubro'
			WHEN 11 THEN 'Novembro'
			WHEN 12 THEN 'Dezembro'
			ELSE 'Indefinido' 
		END
	RETURN @mes
END;

SELECT dbo.udf_NomeMes('2023-05-17') AS Mes;


SELECT * FROM FERIADOS;
SELECT * FROM AGENDA;


/*---------QUESTÃO 3 - PROCEDURE CARGA AGENDA---------*/
CREATE PROCEDURE usp_CargaAgenda
	@dataInicio DATE,
	@dataFinal DATE
AS
BEGIN 
	DECLARE @dataAtual DATE
	DECLARE @mes VARCHAR(30)
	DECLARE @diaDaSemana VARCHAR(30)
	DECLARE @feriado CHAR(1)
	DECLARE @descricao VARCHAR(50)

	SET @dataAtual = @dataInicio

	WHILE @dataAtual <= @dataFinal
	BEGIN
		IF EXISTS(SELECT 1 FROM FERIADOS WHERE MES = MONTH(@dataAtual) AND DIA = DAY(@dataAtual))
			BEGIN
				SET @feriado = 'S'
				SET @descricao = (SELECT DESCRICAO FROM FERIADOS WHERE MES = MONTH(@dataAtual) AND DIA = DAY(@dataAtual))
			END	
		ELSE IF DATEPART(DW, @dataAtual) IN (1, 7)
			BEGIN
				SET @feriado = 'S'
				SET @descricao = 'Fim de Semana'
			END	
		ELSE 
			BEGIN
				SET @feriado = 'N'
				SET @descricao = 'Dia útil'
			END	

		SET @diaDaSemana = dbo.udf_DiaDaSemana(@dataAtual)
		SET @mes = dbo.udf_NomeMes(@dataAtual)

		INSERT INTO AGENDA (DT_AGENDA, NM_MES, NM_DIA_SEMANA, FERIADO, DESCRICAO) VALUES (@dataAtual, @mes, @diaDaSemana, @feriado, @descricao)

		SET @dataAtual = DATEADD(DAY, 1, @dataAtual)
	END
END;
	
EXEC dbo.usp_CargaAgenda '2023-09-01', '2023-09-30';

SELECT * FROM FERIADOS;
SELECT * FROM AGENDA;

