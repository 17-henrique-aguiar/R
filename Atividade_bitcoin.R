bitcoin <- read.csv("C:/Users/EFG/Downloads/btc_mensal2.csv - Página1.csv")
head(bitcoin)
str(bitcoin)

# Limpeza de dados
# Converter caractere para número (gsup)
bitcoin$preco<- gsub("[^0-9,]","",bitcoin$preco)

# Trocar vírgula por ponto 
bitcoin$preco<- gsub(",",".", bitcoin$preco)

# Converter para calculo em número
bitcoin$preco<- as.numeric(bitcoin$preco)

# 3º Passo - maior ou menor preço
# Maior preço
max(bitcoin$preco)
# Menor preço
min(bitcoin$preco)
# Média de preço
mean(bitcoin$preco)

# 4º Passo - Gráfico de evoloução do preço
library(ggplot2)
  ggplot(bitcoin, aes(x=mes,y=preco, group=1))+
    geom_line(size=1.2)+
    geom_point(size=3)+
    labs(
      title= "Evolução do Preço do Bitcoin",
      x= "Mês",
      y= "Preço"
    )

# 5º Passo - Variação
library(dplyr)
  
bitcoin <- bitcoin %>%
  arrange(mes_ano) %>%
  mutate(
    variacao = preco - lag(preco)
  )

head(bitcoin)
sum(is.na(bitcoin$variacao))

# 6º Passo - Gráfico da variação mensal
ggplot(bitcoin, aes(x = mes, y = variacao)) +
  geom_bar(stat = "identity") +
  labs(
    title = "Variação mensal do Bitcoin",
    x = "Mês",
    y = "Variação (R$)"
  )
    