
# Instalação dos pacotes para enriquecimento do GO:

source("http://Bioconductor.org/biocLite.R")
biocLite(c("topGO", "ALL","hgu95av2.db"))
library(topGO, ALL, hgu95av2.db)

### Carregar os conjuntos de dados [pode demorar]

data(ALL)
data(geneList)

### Ajustar a anotação para o chip Affymetrix humano:

affyLib <- paste(annotation(ALL), "db", sep=".")
library(package=affyLib, character.only=TRUE)

### Verificaremos, assim, os que são diferencialmente expressos para enriquecimento
### dos termos GO:

sum(topDiffGenes(geneList))

### Com as bibliotecas prontas, podemos criar um objeto com os dados aceitáveis
### (aqueles que passam no teste) da seguinte forma:

GOdata <- new("topGOdata", ontology="BP", allGenes=geneList,
               geneSel=topDiffGenes, nodeSize=10, annot= annFUN.db,
               affyLib=affyLib)

## Então, aplicamos o teste de enriquecimento (teste de Fisher):

enriq_fisher <- runTest(GOdata, algorithm = "classic", statistic = "fisher")

## Pode-se, ainda, testar outros algoritmos ou testes estatísticos, como o teste KS
## (Kolmogorov-Smirnov):

enriq_KS <- runTest(GOdata, algorithm = "classic", statistic = "ks")

## Por fim, verificaremos o resultado como tabela:

enriq_table <- GenTable(GOdata, classicFisher = enriq_fisher, topNodes = 20)
head(enriq_table)
enriq_table[1:15,]

# diferença do teste KS:

enriq_table_ks <- GenTable(GOdata, classicKS = enriq_KS, topNodes = 20)
enriq_table_ks[1:15,]

## Podemos combinar o resultado dos dois testes, da seguinte forma:

enriq_all <- GenTable(GOdata, classicFisher = enriq_fisher, classicKS = enriq_KS,
                      ranksOf = "classicFisher", topNodes = 20)

str(enriq_all)
enriq_all[1:15,]

## Exibição gráfica dos resultados
## Associar os dados do GO com a pontuação do teste de Fisher:

gostat <- termStat(GOdata, names(score(enriq_fisher)))

## montagem da figura:

plot(
  score(enriq_fisher),
  score(enriq_KS) [names(score(enriq_fisher))],
  xlab = "P-values do teste de Fisher",
  ylab = "P-values do teste KS",
  cex = (gostat$Annotated/max(gostat$Annotated))*4,
  col = heat.colors(gostat$Significant)
)

## Visualização de outro gráfico

biocLite("Rgraphviz")
library(Rgraphviz)

# Geração da figura dos nós:

showSigOfNodes(
  GOdata, 
  score(enriq_fisher), 
  firstSigNodes=5,
  useInfo="all")

fixInNamespace(drawTxtLabel, "Rgraphviz")

############## Fim do enriquecimento GO ###################


