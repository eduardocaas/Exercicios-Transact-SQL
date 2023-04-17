/*-----------FORMATAR NOME-----------*/
CREATE FUNCTION dbo.udf_FormatarNome(@Id INTEGER, @Form CHAR(1))
RETURNS VARCHAR(200)
AS
BEGIN
	DECLARE @NomeCompleto VARCHAR(100),
			@PrimeiroNome VARCHAR(100),
			@MeioNome VARCHAR(100),
			@UltimoNome VARCHAR(100)

	SELECT @NomeCompleto = (FirstName + ISNULL(MiddleName, '') + ISNULL(LastName, '')),
		   @PrimeiroNome = ISNULL(FirstName, ''), @MeioNome = ISNULL(MiddleName, ''), 
		   @UltimoNome = ISNULL(LastName, '') FROM Person.Person WHERE BusinessEntityID = @Id

	IF @Form = 'C'
		RETURN @PrimeiroNome + ' ' + @MeioNome + ' ' + @UltimoNome
	ELSE IF @Form = 'B'
		RETURN UPPER(@UltimoNome) + ', ' + @PrimeiroNome + ' ' + @MeioNome
	ELSE IF @Form = 'I'
		RETURN @UltimoNome + ', ' + @PrimeiroNome + ' ' + @MeioNome
	ELSE IF @Form = 'A'
		RETURN SUBSTRING(@PrimeiroNome, 1, 1) + '.' + SUBSTRING(@MeioNome, 1, 1) + '.' + SUBSTRING(@UltimoNome, 1, 1)

	RETURN ''
END;
		
SELECT dbo.udf_FormatarNome(2, 'B') AS 'Nome Formatado'
SELECT * FROM Person.Person