
Esse é um repositório pertencente ao Processo Seletivo 01/2023
IEEE Computational Intelligence Society, UnB.

Visa avaliar as habilidades dos candidatos em manipular,
visualizar e interpretar grandes volumes de dados.

Foi utilizada a linguagem R para manipulação dos Datasets e conclusão das questões solicitadas.

Para saber mais acesse o arquivo "Apresentação do Desafio.docx"

Resolução das questôes:

1. No dataset human_freedom, existem alguns valores faltantes. Antes de
começar a manipular os dados, trate essas informações e descreva
sucintamente as alterações feitas;

R: Para tratar os dados faltantes eu usei a técnica de adicionar o valor da média, dependendo do contexto, 
se a variação dos valores for baixa ou se a variável não possuir muita importância é possível substituir as missing values pelo valor da média.





2. Calcule o número total de medalhas recebido por cada país e adicione essa coluna no dataset:

O dataset já tinha o total, mas eu recalculei usando a rowSums, tive que apagar a linha de hongkong pois o dataset colocou o valor "china" na coluna de gold medal e atrapalhou. 
Tambem tive que transformar tudo em numerico pois estava dando erro.




3. Seguindo as regras oficiais das Olimpíadas, obtenha o ranking dos
países. Visualize, também, os dez melhores países com base no total de
medalhas;

Também ja tinha a coluna rank no dataset, mas eu calculei de novo usando a função rank.
Depois puxei os dez primeiros paises.




4.Obtenha a média de alfabetização por região e a represente
graficamente: 

R: Para calcular a média usei a função mean do R em cada região.

Média de alfabetização por região:
 
                 Region Literacy (%)
1  ASIA (EX. NEAR EAST)     79.55357
2               BALTICS     99.73333
3   C.W. OF IND. STATES     98.72500
4        EASTERN EUROPE     97.08889
5   LATIN AMER. & CARIB     90.65455
6             NEAR EAST     79.52143
7       NORTHERN AFRICA     67.24000
8      NORTHERN AMERICA     97.75000
9               OCEANIA     88.83529
10   SUB-SAHARAN AFRICA     62.51000
11       WESTERN EUROPE     98.39130

Gráfico no arquivo "Grafico_questao_4.png"





5.Liste os cinco países com maior número de celulares a cada mil habitantes. Faça uma representação gráfica;

R: [1] "Monaco"       "UnitedStates" "Gibraltar"    "Bermuda"      "Guernsey"   

Ordenei a coluna "Phones (per 1000)" em ordem decrescente, e depois peguei os 5 primeiros dessa lista.

Para construir o gráfico separei as colunas "Country" e "Phones (per 1000)" em um data frame.
Gráfico no arquivo "Grafico_questao_5.png".





6. Obtenha os dados do dataset human_freedom apenas para o ano de
2018;

R: Gerei um subset filtrando pelo ano





7. Mostre a evolução do hf_score (human freedom score) do Brasil em
função do tempo;

R: primeiro eu criei um subset apenas com as colunas "countries", "hf_score" e "year". Depois
eu filtrei pelo país "Brazil" e odernei pelo ano. Depois criei um gráfico. Gráfico no arquivo "Grafico_questao_7.png".





8. Mostre qual é a região com a maior média populacional;

R: ASIA (EX. NEAR EAST)  131713651

Primeiro eu fiz um agregado com as médias por região, depois eu ordenei do maior pro menor e peguei o primeiro.





9. Com base na análise dos dados, é possível afirmar que países com maior
população tendem a ter mais pessoas saindo ou entrando no país (maior
fluxo migratório)?

R: de acordo com os dados do data frame "migracao_paises_ordenado" foi possível concluir que quanto maior a população menor a taxa líquida de migração, porém saber sobre o fluxo fica inconclusivo.





10. Caso o número de medalhas de bronze e de ouro fossem trocadas, qual
seria o ranking dos países?

Como o ranking foi feito de acordo com o total de medalhas, trocar as colunas não fez diferença





11. Normalize os valores dos datasets;





12. É possível observar correlação entre os índices de natalidade e de
mortalidade? Justifique o resultado encontrado;

R: Nessa questão não fiz nenhum código, Apenas ordenando a coluna de GDP(PIB) observei que quanto maior o pib menor a diferença entre esses indices, e quanto menor o pib, maior a natalidade e menor a mortalidade.




13. É possível observar correlação entre a generosidade da população e o
índice de agricultura dos países? Justifique o resultado encontrado;


