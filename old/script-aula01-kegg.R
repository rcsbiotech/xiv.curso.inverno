# Anotação de Genes com KEGG

## Instalação/ativação do KEGG

source("http://Bioconductor.org/biocLite.R")
biocLite("KEGG.db","KEGGREST")
library(KEGG.db, KEGGREST)

## Criação de uma lista dos nossos SYMBOLS como gene IDs;

keggEIDs <- unlist(mget(meusSYMBOLS, org.Hs.egSYMBOL2EG, ifnotfound=NA))
keggEIDs <- as.character(keggEIDs)
keggEIDs

## Assim, vamos mapear os IDs em relação as rotas metabólicas do KEGG:

keggMAP <- mget(as.character(keggEIDs), KEGGEXTID2PATHID, ifnotfound=list(NA))
keggMAP

## Observar cada gene com KEGGREST (mais novo)

library(KEGGREST)

## Verificar alguns dos genes

genes_01 <- keggGet("hsa04514")
genes_02 <- keggGet("hsa05412")
genes_03 <- keggGet("hsa01100")





