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

<details>
  <summary>EXERCÍCIO 4 - Views</summary>
  
  Deve ser criada uma a VIEW de nome VW_COLABORADORES capaz de atender
  aos requisitos abaixo. Essa view será a única fonte de consulta de dados
  > 1. Listar todos os colaboradores da empresa com: Nome Completo, Cargo, Data de Nascimento, Estado
  Civil e Idade.
  > 2. Contabilizar a quantidade de colaboradores por cargo.
  > 3. Identificar a origem destes colaboradores através de seus endereços. Apresentar as informações de
  Endereço, Pais, Estado, Cidade.
  > 4. Contabilizar o número de colaboradores por País e Estado.
    
</details>

<details>
  <summary>EXERCÍCIO 5 - Stored Procedure</summary>
  
  > Criar a procedure usp_Margem que recebe como 2 parâmetros e valores (moeda) e calcule a
    diferença percentual entre eles.
  
</details>

<details>
  <summary>EXERCÍCIO 6 - Stored Procedure</summary>
  
  > Criar a procedure usp_Calculadora que recebe como 4 parâmetros: 2 correspondente aos valores de
    cálculo, 1 para a operação (M=multiplicação, S=soma, U=Subtração, D=Divisão e P=Potenciação) e por
    último um parâmetro de saída com o resultado da operação solicitada
  
</details>

<details>
  <summary>EXERCÍCIO 7 - Stored Procedure</summary>
  
  > Criar a procedure usp_Desconto que recebe como os parâmetros: 1 correspondente aos preço do
    item, 1 para a quantidade. Se o total das compras for superior ate 1000 não tem desconto, se estiver
    entre 1001 e 2000 terá 5% de desconto se for superior a 2001 será de 10%. Deve apresentar o valor
    total da compra SEM DESCONTO e o valor do DESCONTO como parâmetro de saída e uma mensagem
    informando o valor e percentual de desconto.
  
</details>

<details>
  <summary>EXERCÍCIO 8 - Stored Procedure</summary>
  
  > Utilizando a view VW_COLABORADORES proposta no exercício 4, construa a procedure
    usp_RetornaBonus a qual deve retornar o total de bônus de um colaborador. A procedure deve ter
    como parâmetro: nome do colaborador (opcional) código identificador do colaborador (opcional) e o
    total de bônus como parâmetro de saída.
  
</details>
