# Alinhamento par-a-par (pairwise)

## Conferência de pacotes

source("http://bioconductor.org/biocLite.R")
biocLite("Biostrings")
library(Biostrings)

## Duas sequências

seq1 <- "GATTACAGATTACAGATTCGTA"
seq2 <- "GATTACCTAGATTACAGTTGCT"

## Determinar matriz de pontuação e penalidades de gaps:

pontMat <- nucleotideSubstitutionMatrix(match = 1, mismatch = -1, baseOnly = TRUE)
pontMat

gapOpen <- 2
gapExtend <- 1

## Realizar o alinhamento:

Aln01 <- pairwiseAlignment(seq1, seq2,
                           substitutionMatrix = pontMat,
                           gapOpening = gapOpen,
                           gapExtension = gapExtend,
                           type="global",
                           scoreOnly= FALSE)
Aln01


# Alinhamento de proteínas

data(package="Biostrings")
data(BLOSUM62)
protMat <- BLOSUM62
protMat

# Human albumins: Homo sapiens

hum_alb <- "MKWVTFISLLFLFSSAYSRGVFRRDAHKSEVAHRFKDLGEENFKAL"
hum_tst <- "MKWVTFISLLFLFSSAYSRGVFRRDAHKSEVAHRFKDLGEENFKAL"

# Bos taurus albumin:

bos_alb <- "MKWVTFISLLLLFSSAYSRGVFRRDTHKSEIAHRFKDLGEEHFKGL"

# Albumina de lampreia *Petromyzon marinus*

lamp_alb <- "EGEGAWPHALPVTSPPELHAIALANEFITGLTTCCLVEEEHGACLATLREASHKS"


AlnProt <- pairwiseAlignment(hum_alb, bos_alb,
                             substitutionMatrix = protMat,
                             gapOpening = gapOpen,
                             gapExtension = gapExtend,
                             type = "global",
                             scoreOnly = FALSE)
AlnProt


## Visualizando as duas sequências

humAlbc <- s2c(hum_alb)
bovAlbc <- s2c(bos_alb)
lampAlbc <- s2c(lamp_alb)

dotPlot(
  humAlbc,
  bovAlbc,
  col=c("white","red"),
  xlab="Human",
  ylab="Bovine"
)

## Teste de permutações

source("sequencePermutatioTest.R")


# Geração dos testes de permutação

pvalue <- permutest.seq(seq1=hum_alb,
                       seq2=lamp_alb,
                       n=100,
                       plot=TRUE)


pvalue <- permutest.seq(seq1=hum_alb,
                        seq2=bos_alb,
                        n=1000,
                        plot=TRUE)



