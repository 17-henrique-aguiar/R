vendasTec <- read.csv("C:/Users/EFG/Downloads/vendasTec - Página1.csv")
head(vendasTec)

# Faturamento
vendasTec$faturamento <- vendasTec$quantidade * vendasTec$preco_unitario
head(vendasTec)

# Produto mais vendidos (qtd)
library(dplyr)

produto_mais_vendido <- vendasTec %>%
  group_by(mercadoria) %>%
  summarise(
    total_vendido = sum(quantidade),
    faturamento_total = sum(faturamento),
    media_venda = mean(quantidade)
  )
produto_mais_vendido

# Faturamento do mês
faturamento_mes <- vendasTec %>%
  group_by(mes) %>%
  summarise(
    total_faturamento = sum(faturamento)
    )
faturamento_mes

# Gráfico de faturamento mensal
library(ggplot2)
ggplot(faturamento_mes, aes(x=mes,y=total_faturamento)) +
  geom_line(size=1.2)+
  geom_point(size=3) +
  labs(
    title = "Faturamento Mensal",
    x="Mês",
    y="Total Faturado"
  )

# Os Produtos mais vendidos (Gráfico de Barras)
ggplot(produto_mais_vendido, aes(x=mercadoria, y=total_vendido))+
  geom_bar(stat="identity")+
  labs(
    title="Quantidade vendida por Produtos",
    x="Produtos",
    y="Quantidade"
  )
