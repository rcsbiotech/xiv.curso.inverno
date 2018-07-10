# Introdução ao Bioconductor

## Instalação dos pacotes necessários do Bioconductor

source("http://bioconductor.org/biocLite.R")

## Obtenção da base de dados Homo sapiens

biocLite("org.Hs.eg.db")
library(org.Hs.eg.db)

# Obtenção dos IDs do Entrez

### Criação do vetor meus EIDs

meusEIDs <- c("1","10","100","1000","37960")

### Atribuição do nome aos IDs selecionados

meusSYMBOLS <- mget(meusEIDs, org.Hs.egSYMBOL, ifnotfound=NA)

meusSYMBOLS <- unlist(meusSYMBOLS)
meusSYMBOLS
meusSYMBOLS <- meusSYMBOLS[!is.na(meusSYMBOLS)]
meusSYMBOLS
meusEIDs <- unlist(mget(meusSYMBOLS, org.Hs.egSYMBOL2EG, ifnotfound=NA))
meusEIDs

