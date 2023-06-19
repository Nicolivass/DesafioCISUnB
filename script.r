
# tratando as colunas pf_rol_procedural, pf_rol_civil, pf_rol_criminal alterando os valores faltantes pela média
hfi$pf_rol_procedural <- ifelse(is.na(hfi$pf_rol_procedural), mean(hfi$pf_rol_procedural, na.rm = TRUE), hfi$pf_rol_procedural)
hfi$pf_rol_civil <- ifelse(is.na(hfi$pf_rol_civil), mean(hfi$pf_rol_civil, na.rm = TRUE), hfi$pf_rol_civil)
hfi$pf_rol_criminal <- ifelse(is.na(hfi$pf_rol_criminal), mean(hfi$pf_rol_criminal, na.rm = TRUE), hfi$pf_rol_criminal)

install.packages("readxl")
library(readxl)
medals <- read_xlsx("medals.xlsx")
save(medals, file = "medals.rda")

geral <- read_xlsx("geral.xlsx")
save(geral, file = "geral.rda")

hapiness <- read_xlsx("hapiness.xlsx")
save(hapiness, file = "hapiness.rda")
