## Filtros e Subconjunto dos Dados

# Estrutura de Íris

str(iris)

# Criação do Subconjunto minha_iris baseado no iris

minha_iris1 = data.frame(
  comprimento.sépalas=iris$Sepal.Length,
  largura.sépalas=iris$Sepal.Width,
  espécie=iris$Species
  )

# Verificação da Estrutura de minha_iris

str(minha_iris1)

# Escolha da variável minha_iris por colunas
## Método inclusivo:

minha_iris2 <- iris[,c(1,2,5)]

## Método exclusivo:

minha_iris3 <- iris[,-c(3,4)]

## Verificação dos objetos:

head(minha_iris1)
head(minha_iris2)
head(minha_iris3)

## Adicionando colunas com função cbind

comprimento.colmo <-c (
  rnorm(30,1.0,0.1),
  rnorm(30,1.3,0.1),
  rnorm(30,1.5,0.1),
  rnorm(30,1.8,0.1),
  rnorm(30,2.0,0.1))

## Verificação do novo vetor

comprimento.colmo

## Adição do vetor à tabela minha_iris1 gerando iris_colmo

iris_colmo <- cbind(minha_iris1, comprimento.colmo)

## Verificação de iris_colmo

head(iris_colmo)

## Verificação das duas tabelas

dim(minha_iris1)
dim(iris_colmo)

## Gerando uma nova linha de outra espécie:

nova_linha <- data.frame(comprimento.sépalas=10.1,
               largura.sépalas=0.5,
               comprimento.colmo=1.3,
               espécie="albicans")

## Verificação da nova_linha

nova_linha

## Adição da nova linha ao objeto iris_colmo e verificação:

iris_espécie <- rbind(iris_colmo, nova_linha)

## Consulta do número de linhas:

dim(iris_espécie)

## Verificação da última linha:

iris_espécie[151,]

#### end of basic



                       