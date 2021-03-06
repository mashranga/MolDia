% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/3.1_ISS_barplot.R
\name{ISS_barplot}
\alias{ISS_barplot}
\title{Plot barplot on ISS data bsed on different condition}
\usage{
ISS_barplot(data, gene, total.expr = 10000, gene.target = NULL,
  gene.show = NULL, target.min.count.cell = 1,
  rest.min.count.cell = 1, min.count = 1, at.least.gene = 0,
  at.most.gene = ncol(data), show.same.gene = FALSE,
  str.same.gene = c(".C", ".L"), main = "")
}
\arguments{
\item{data}{Input data in class MolDiaISS. Output of \link[MolDia]{readISS}.}

\item{gene}{Object in vector or list formate. In list formated input every list element is a group of
interested genes.}

\item{total.expr}{Scale factor to re-scale the data. Default is 1e4.}

\item{gene.target}{Only applicable when 'gene' parameter is a list. Which gene group in 'gene' parameter
will consider for special operation. Default is NULL. See details.}

\item{gene.show}{Only applicable when 'gene' parameter is a list. Which group/groups of gene in 'gene' parameter
to show. Default is NULL (Show all groups). See details}

\item{target.min.count.cell}{Minimum number of reads per cell to consider in targated gene group in
'gene.target' parameter. Default is 1.}

\item{rest.min.count.cell}{Minimum number of reads per cell to consider in the genes that not consider in
'gene.target' parameter. Default is 1.}

\item{min.count}{Only applicable when 'gene.target' has a value. Tharshold to consider as minimum count of a gene
in a single cell to consider as gene expression. Default is 0. See details.}

\item{at.least.gene}{Only applicable when 'gene.target' has a value. Minimum number of genes expressed in a cell
to consider. Default is 0, means all.}

\item{at.most.gene}{Only applicable when 'gene.target' has a value. Maximum number of genes expressed in a cell
to consoder}

\item{show.same.gene}{Consider to show same gene or not. Default is FALSE. See details.}

\item{str.same.gene}{Define string that will make the difference between different group in same gene name.
Only active if show.same.gene = TRUE. See detail.}

\item{main}{Main title of the plot.}
}
\value{
Data in class \link[MolDia]{readISS}.

        The barplot will explain the total number of reads per gene in 'total.expr' (Default 1e4) cells. The yellow line
        inside the bar plot indicate the number of expressed cells and percentage count on each bar is the percent of cells
        express that gene.
}
\description{
Plot bar plot on RCA data bsed on different condition
}
\details{
'gene.target' parameter will only work when 'gene' parameter is a list. 'gene.target' will consider
         only one gene group from gene list for special operation. Defaule value is NULL, means it will not
         consider any specific gene group.

         'gene.show' by default (NULL) consider all gene group in 'gene' parameter. But one can choose
         which gene group to be consider. Example: c(3,5) means, 3rd and 5th group of genes will be
         consider to show or analysis.

         'min.count' is the tharshold to consider as minimum count of a gene per single cell to consides as
         expression. Default valus is 1, which means, 1 reads count  in a sigle cell for a gene will consider
         as expression of that specific gene in that cell.

         'show.same.gene' will consider genes with same name. This case may happen if same gene has different form
         of detections. In this case the naming formte will be [gene name].[different form]. Gene name and different
         form name should be isolated by "." See 'str.same.gene' parameter for details.

         'str.same.gene' is a string or a vector of string that will make the different group in same gene name.
         Example: gene Adar has two different miRNA which is circular (Adar.C) and linear (Adar.L). So the value
         of str.same.gene will be c(".C",".L").
}
\examples{
########## Reading data
data_1      <- readISS(file = system.file("extdata", "CellBlobs_QT_0.35.csv", package="MolDia"),
                       cellid = "CellID", centX = "centroidX", centY =  "centroidY")

## Define marker gene group
marker_gene <- data_1@gene
c_rna <- marker_gene[grepl(".C",marker_gene)] # Circular RNA
l_rna <- setdiff(marker_gene,c_rna)           # Linear RNA

## Neuronal marker
Pyramidal   <- c("Nrn1.L","Pcp4.L")
Interneuron <- c("Sst.L","Pvalb.L","Ndnf.L","Vip.L","Sncg.L","Cck.L")
Other       <- c("Map2.L")
Neuron      <- c(Pyramidal,Interneuron,Other)

## Non-Neuronal marker
Oligodendrocyte <- c("Plp1.L","Enpp2.L")
Astrocytes  <- c("Gfap.L","Mfge8.L","Aldh1l1.L","S100b.L")
Nonneuron   <- c(Oligodendrocyte,Astrocytes)

marker_gene1 <- list(Neuron = Neuron,
                     Nonneuron = Nonneuron,
                     Cir_rna = c_rna,
                     Lin_rna = c(setdiff(setdiff(l_rna,Neuron),Nonneuron)))

# Barplot
all_data     <- ISS_barplot(data = data_1, gene = marker_gene,gene.target = NULL)
neuron_group <- ISS_barplot(data = data_1, gene = marker_gene1, gene.target = 1,
                            target.min.count.cell = 2, rest.min.count.cell = 2,
                            at.least.gene = 1, gene.show = NULL, main = " Neuron group (>=1 genes)")



}
\author{
Mohammad Tanvir Ahamed
}
