# Exercícios Transact-SQL
Resolução de exercícios envolvendo T-SQL e MS SQL Server
<details>
<summary>
  <h4>Base de dados utlizada: AdventureWorks2019 -> cedida pela Microsoft</h4>
</summary>

> Link: https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms

</details>
<details>
  <summary>EXERCÍCIO 1 - Functions</summary>
  
> 1. Criar a função udf_MesCorrente que recebe um parâmetros com uma data e devolve o nome do mês
relativo a data informada (janeiro, fevereiro, março, etc). Se a data informada for nula deve considerar
a data atual, senão usar a data informada.
> 2. Criar a função udf_Fatorial que deverá calcular o fatorial de um número informado como parâmetro
retornando o resultado da operação.
</details>

<details>
  <summary>EXERCÍCIO 2 - Functions</summary>

> 1. Criar a função udf_FormatarNome que recebe como parâmetro: a chave de identificação da pessoa e
o tipo de formatação que deve ser aplicada. Retorna o texto do nome conforme formatação desejada.
>> Padrão de formatação:
<br/> C: Completo → Primeiro nome Nome do meio e Último nome
<br/> B: Bibliografia → ÚLTIMO NOME (maiúsculo), demais nomes;
<br/> I: Inverso → Ultimo nome, demais nomes
<br/> A: Abreviado → Inicias de cada nome

#### Exemplo:
<img src="https://uploaddeimagens.com.br/images/004/433/417/original/img1.png?1681701669" />
</details>

<details>
  <summary>EXERCÍCIO 3 - Triggers</summary>
  
  Construa triggers que atendam aos requisitos a seguir descritos:
  > 1. Execute o script de preparação de banco de dados: http://www.fileconvoy.com/dfl.php?id=gbfc5de36d0a3fb8e1000490585ad563d68e317a973
  > 2. Após inserido um novo registro na tabela AulaVendas a trigger deve atualizar o estoque da tabela, ou seja, abater a
  quantidade vendida do estoque do produto.
  > 3. Quando realizado cadastro de uma venda ANTES de efetivá-la deve verificar se a quantidade indicada para a venda existe
  no estoque no produto (AulaProduto), se o estoque for suficiente para atender o pedido deve efetivar a venda caso
  contrário deve exibir uma mensagem informando a inexistência de estoque. Utilizar o comando “PRINT” para exibir a
  mensagem. Esta mensagem deve possuir as informações de: nome do produto, estoque atual e a quantidade solicitada.
  > 4. Quando for realizada uma atualização na tabela de produtos (AulaProduto) deve ser realizada a atualização do preço em
  todas as vendas cujo valor estiver inferior ao indicado para o produto.
  
</details>
