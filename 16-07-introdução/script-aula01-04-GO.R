
# Anotação por GO

## Primeiro, vamos gerar novamente um objeto meusEIDs:

GO_EIDs <- c("1","10","100","1000","37960")

## Então, vamos usar esses numerais para encontrar nossos GOs:

meusGOs_1 <- org.Hs.egGO[[GO_EIDs[1]]]
meusGOs_1
head(meusGOs_1)

meusGOs_2 <- org.Hs.egGO[[GO_EIDs[2]]]
meusGOs_2
head(meusGOs_2)

meusGOs_5 <- org.Hs.egGO[[GO_EIDs[4]]]
meusGOs_5
head(meusGOs_5)

## Para todos os IDs:

todosGOs <- mget(GO_EIDs, org.Hs.egGO)
todosGOs

## É possível também consultar de forma reversa:

genesGO <- org.Hs.egGO2ALLEGS[["GO:0008270"]]
genesGO


## Com os termos em mãos, é possível mapear de volta aos termos:

biocLite("GO.db")
library(GO.db)

GOTERM$"GO:0006805"
GOTERM$"GO:0002576"
GOTERM$"GO:0007155"
