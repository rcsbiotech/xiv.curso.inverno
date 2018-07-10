# Aula 02 - Análise de Sequências

## Verificação de pacotes

install.packages("seqinr")
library(seqinr)

## Escolha do banco de dados

choosebank()
choosebank("genbank")

## QUERY = requisição de um conjunto de genes

BRCA1 <- query("BRCA1", "SP=Homo sapiens AND K=BRCA1")
attributes(BRCA1)

## Para checar para todas as sequências

BRCA1$req

## Download de sequência por número de acesso

BRCA1_AC <- query("BRCA1", "SP=Homo sapiens AND AC=U61268")

## Obtenção da sequência

minhaSeq <- getSequence(BRCA1$req[[1]])
minhaSeq

## Outra forma de obter sequência

minhaSeq2 <- getSequence(BRCA1) # Obtem a sequencia BRCA1 do GenBank
seqName <- getName(BRCA1) # Obtem os nomes das sequências
length(minhaSeq2) # Tamanho da sequência
seqName

write.fasta(minhaSeq2, seqName, file.out = "BRCA.fasta")

# Determinação do conteúdo de GC
## Download das sequências de rpoB microbianas para actino e proteobactérias:

Mtu <- query(listname = "actino", query="SP=Mycobacterium tuberculosis AND K=rpoB")
Eco <- query(listname = "proteo", query="SP=Escherichia coli AND K=rpoB")

## Atribuição da sequência:

MtuSeq <- getSequence(Mtu$req[[644]])
EcoSeq <- getSequence(Eco$req[[1]])

## Verificar os nucleotídeos:

table(MtuSeq)
table(EcoSeq)

## Computar os conteúdos:

table(MtuSeq)/length(MtuSeq) # Maior conteúdo de GC
table(EcoSeq)/length(EcoSeq) # Menor conteúdo de GC

## Para realizar a computação manualmente:

handSeq <- "TGTCAGATGCGACTAGCATCGACATGCACTACGTGACTCAG"
handSeq <- strsplit(handSeq, "")
handSeq <- unlist(handSeq)
table(handSeq)

## De forma análoga, para proteínas:

protSeq <- "MTMDKSELVQKAKLAEQAERYDDMAAAMKAVTEQGHELSNEE"
protSeq <- strsplit(protSeq, "")
protSeq <- unlist(protSeq)
table(protSeq)

protSeq <- s2c(protSeq)
handSeq <- s2c(handSeq)

## Conteúdo de GC:

proteo <- GC(EcoSeq)
actino <- GC(MtuSeq)

## Comparando entre os dois organismos:

barplot(c(Actinobacteria=actino, Proteobacteria=proteo),
        main="Diferença do conteúdo GC")

## Contar frequência dos kmers:

seqinr::count(MtuSeq, wordsize=3)
seqinr::count(MtuSeq, wordsize=4)
seqinr::count(EcoSeq, wordsize=3)
seqinr::count(EcoSeq, wordsize=4)

## Fechar o banco

closebank()



