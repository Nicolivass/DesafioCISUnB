
Esse é um repositório pertencente ao Processo Seletivo 01/2023
IEEE Computational Intelligence Society, UnB.

Visa avaliar as habilidades dos candidatos em manipular,
visualizar e interpretar grandes volumes de dados.

Foi utilizada a linguagem R para manipulação dos Datasets e Conclusão das questões solicitadas.

Para saber mais acesse <code>Apresentação do Desafio.docx<code>

Questôes:

1. No dataset human_freedom, existem alguns valores faltantes. Antes de
começar a manipular os dados, trate essas informações e descreva
sucintamente as alterações feitas;

R: Para tratar os dados faltantes eu usei a técnica de adicionar o valor da média, dependendo do contexto, 
se a variação dos valores for baixa ou se a variável não possuir muita importância é possível substituir as missing values pelo valor da média.


# tratando as colunas pf_rol_procedural, pf_rol_civil, pf_rol_criminal alterando os valores faltantes pela média

<code>hfi$pf_rol_procedural <- ifelse(is.na(hfi$pf_rol_procedural), mean(hfi$pf_rol_procedural, na.rm = TRUE), hfi$pf_rol_procedural)<code>

<code>hfi$pf_rol_civil <- ifelse(is.na(hfi$pf_rol_civil), mean(hfi$pf_rol_civil, na.rm = TRUE), hfi$pf_rol_civil)<code>

<code>hfi$pf_rol_criminal <- ifelse(is.na(hfi$pf_rol_criminal), mean(hfi$pf_rol_criminal, na.rm = TRUE), hfi$pf_rol_criminal)<code>

2. Calcule o número total de medalhas recebido por cada país e adicione essa coluna no dataset:

