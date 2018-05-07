

# Instalação dos pacotes necessários

source("http://bioconductor.org/biocLite.R")
biocLite("muscle")
library(muscle)

# Obter as sequências para alinhamento:

minhasSeqs <- muscle::read.fasta("/work/rcsilva/projects/cinverno/fastaMSA.fasta")

mySeqs <- readDNAStringSet("/work/rcsilva/projects/cinverno/fastaMSA.fasta", format = "fasta")
mySeqs

aln <- muscle(mySeqs)
aln

## Análise filogenética/fenética

biocLite("ape")
library(ape)

mySet <- c("U15717","U15718","U15719","U15720","U15721","U15722","U15723","U15724")
mySeqs <- read.GenBank(mySet)
myDist <- dist.dna(mySeqs)
myPhylo <- triangMtd(myDist)

plot(myPhylo, type="phylogram",
     edge.color="red",
     cex=1,
     edge.width=1,
     main="(A) Filograma")

plot(myPhylo, type="cladogram",
     edge.color="red",
     cex=1,
     edge.width=1,
     main="(B) Cladograma")

plot(myPhylo, type="fan",
     edge.color="red",
     cex=1,
     edge.width=1,
     main="(C) Leque")

plot(myPhylo, type="Unrooted",
     edge.color="red",
     cex=1,
     edge.width=1,
     main="(D) Sem raíz")
