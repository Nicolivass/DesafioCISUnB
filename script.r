#convertendo os csv em rda
install.packages("readxl")
library(readxl)
medals <- read_xlsx("medals.xlsx")
save(medals, file = "medals.rda")

geral <- read_xlsx("geral.xlsx")
save(geral, file = "geral.rda")

hapiness <- read_xlsx("hapiness.xlsx")
save(hapiness, file = "hapiness.rda")

freedom <- read_xlsx("freedom.xlsx")
save(freedom, file = "freedom.rda")

# (Questão 1) tratando as colunas pf_rol_procedural, pf_rol_civil, pf_rol_criminal alterando os valores faltantes pela média
freedom$pf_rol_procedural <- ifelse(is.na(freedom$pf_rol_procedural), mean(freedom$pf_rol_procedural, na.rm = TRUE ), freedom$pf_rol_procedural)
freedom$pf_rol_civil <- ifelse(is.na(freedom$pf_rol_civil), mean(freedom$pf_rol_civil, na.rm = TRUE), freedom$pf_rol_civil)
freedom$pf_rol_criminal <- ifelse(is.na(freedom$pf_rol_criminal), mean(freedom$pf_rol_criminal, na.rm = TRUE), freedom$pf_rol_criminal)





# (Questão 2) número total de medalhas 
medals <- medals[-49, ]#essa linha estáva dando problema pois separou HongKong de China
colunas_para_total <- c("Gold Medal", "Silver Medal", "Bronze Medal")
medals[, colunas_para_total] <- sapply(medals[, colunas_para_total], as.numeric)#tive que transformar tudo em numerico
medals$TotalCalculado <- rowSums(medals[, colunas_para_total], na.rm = TRUE)




# (Questão 2) obtendo o ranking dos países. 
medals$Ranking <- rank(-medals$TotalCalculado, ties.method = "min")
melhores_paises <- head(medals, 10)
print(melhores_paises$Country)




# (Questão 4) Filtrando e calculando a média
media_alfabet_por_regiao <- aggregate(`Literacy (%)` ~ Region, data = geral, FUN = function(x) mean(x, na.rm = TRUE))
print(media_alfabet_por_regiao)
# Mudar o nome da coluna
colnames(media_alfabet_por_regiao)[2] <- "Literacy"

#Grafico Q4
install.packages("ggplot2")
library(ggplot2)
#data frame
dadosGrafico <- data.frame(media_alfabet_por_regiao)
#conjunto de dados
grafico <- ggplot(data = dadosGrafico)
#espicificar as variáveis
grafico <- grafico + aes(x = Region, y = Literacy)
#tipo de grafico
grafico <- grafico + geom_bar(stat = "identity")
print(grafico)



# (Questão 5) cinco países com maior número de celulares

# Ordenar a coluna
paises_c_mais_celulares <- geral[order(geral$`Phones (per 1000)`, decreasing = TRUE), ]
# Os cinco países com maior número de celulares
primeiros_cinco <- head(paises_c_mais_celulares, 5)
print(primeiros_cinco$Country)

#Grafico Q5
#data frame
colunas_grafico <- subset(primeiros_cinco, select = c("Country", "Phones (per 1000)"))
#conjunto de dados
grafico <- ggplot(data = colunas_grafico)
#espicificar as variáveis
grafico <- grafico + aes(x = Country, y = `Phones (per 1000)`)
#tipo de grafico
grafico <- grafico + geom_bar(stat = "identity")
print(grafico)






# (Questão 6) dados human_freedom apenas para 2018

dados_2018 <- freedom[freedom$year == 2018, ]
print(dados_2018)




# (Questão 7) evolução do hf_score do Brasil
hf_score <- subset(freedom, select = c("countries", "hf_score", "year"))
#Filtrar pelo brasil
hf_score_Brazil <- hf_score[hf_score$countries == "Brazil", ]
#Ordenar
hf_score_Brazil_ordenado <- hf_score_Brazil[order(hf_score_Brazil$year), ]

#Criar um gráfico 

#conjunto de dados
grafico <- ggplot(data = hf_score_Brazil_ordenado)
#espicificar as variáveis
grafico <- grafico + aes(x = year, y = hf_score)
#tipo de grafico
grafico <- grafico + geom_bar(stat = "identity")
#definir intervalo de anos
intervalo <- c(2007, 2019) 
grafico <- grafico + coord_cartesian(xlim = intervalo)
print(grafico)





# (Questão 8) a região com a maior média populacional
media_por_regiao <- aggregate(Population ~ Region, data = geral, FUN = mean)
media_por_regiao_ordenado <- media_por_regiao[order(media_por_regiao$Population, decreasing = TRUE), ]
print(primeiro <- head(media_por_regiao_ordenado, 1))





# (Questão 9) países com maior população tendem a ter maior fluxo migratório
migracao_paises <- subset(geral, select = c("Country", "Population", "Net migration"))
migracao_paises_ordenado <- migracao_paises[order(migracao_paises$Population, decreasing = TRUE), ]






# (Questão 10) qual seria o ranking dos países se medalhas de bronze e de ouro fossem trocadas
medals$aux <- medals$`Gold Medal`
medals$`Gold Medal` <- medals$`Bronze Medal`
colunas_para_total <- c("aux", "Silver Medal", "Bronze Medal")
medals[, colunas_para_total] <- sapply(medals[, colunas_para_total], as.numeric)
medals$TotalCalculado <- rowSums(medals[, colunas_para_total], na.rm = TRUE)
medals$Ranking_trocado <- rank(-medals$TotalCalculado, ties.method = "min")
melhores_paises <- head(medals, 10)
print(melhores_paises$Country)



#(Questão 11) Normalizando os valores dos datasets






#(Questão 12) correlação entre os índices de natalidade e de mortalidade

