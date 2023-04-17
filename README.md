# Exercícios Transact-SQL
Resolução de exercícios envolvendo T-SQL e MS SQL Server
#### Base de dados utlizada: AdventureWorks2019 -> cedida pela Microsoft

EXERCÍCIO 1
> 1. Criar a função udf_MesCorrente que recebe um parâmetros com uma data e devolve o nome do mês
relativo a data informada (janeiro, fevereiro, março, etc). Se a data informada for nula deve considerar
a data atual, senão usar a data informada.
> 2. Criar a função udf_Fatorial que deverá calcular o fatorial de um número informado como parâmetro
retornando o resultado da operação.

EXERCÍCIO 2

> 1. Criar a função udf_FormatarNome que recebe como parâmetro: a chave de identificação da pessoa e
o tipo de formatação que deve ser aplicada. Retorna o texto do nome conforme formatação desejada.
>> Padrão de formatação:
<br/> C: Completo → Primeiro nome Nome do meio e Último nome
<br/> B: Bibliografia → ÚLTIMO NOME (maiúsculo), demais nomes;
<br/> I: Inverso → Ultimo nome, demais nomes
<br/> A: Abreviado → Inicias de cada nome

#### Exemplo:
<img src="https://uploaddeimagens.com.br/images/004/433/417/original/img1.png?1681701669" />
