######################################################################
##                      RCA define cluster                          ##
######################################################################
"ISS_cluster"
#' Cluster ISS data based on different methods.
#'
#' @description Cluster ISS data by different methods used in SEURAT, MONOCLE, BackSPIN.
#' @param data Input data in class MolDiaISS. Output of \link[MolDia]{readISS}.
#' @param method Method of clustering. SEURAT, backspin, monocle.
#' @param pc Desired percent of variance (0 to 1) to be explained by PCA. Default is 1 (All PC will use).
#' @param cluster_id Re-cluster clustreded data. Numeric input. Default is NULL.
#' @param resolution Value of the resolution parameter, use a value above (below)
#'                   1.0 if you want to obtain a larger (smaller) number of communities.
#'                   Default is 0.3.
#' @param algorithm Algorithm for modularity optimization (1 = original Louvain algorithm;
#'        2 = Louvain algorithm with multilevel refinement; 3 = SLM algorithm). Default is 1.
#' @param do.norm Do normalization
#' @param do.scale Do scalling
#' @param DEGmethod Methods to find DE genes.NULL means use all genes.
#' @param k.param Defines k for the k-nearest neighbor algorithm
#'
#' @examples
#' ## Reading data
#' left_hypo <- readISS(file = system.file("extdata", "Hypocampus_left.csv", package="MolDia"),
#'                   cellid = "CellId", centX = "centroid_x", centY = "centroid_y")
#'
#' ## Arrange marker gene
#' data(marker_gene)
#' mark_gene <- list(genr = marker_gene$genr, neuron = c(marker_gene$genr_neuro,
#'                                                       marker_gene$genr_neuro_pyra1,
#'                                                       marker_gene$genr_neuro_pyra2,
#'                                                       marker_gene$genr_neuro_inter1,
#'                                                       marker_gene$genr_neuro_inter2,
#'                                                       marker_gene$genr_neuro_inter3,
#'                                                       marker_gene$genr_neuro_inter4,
#'                                                       marker_gene$genr_neuro_inter5,
#'                                                       marker_gene$genr_neuro_inter6),
#'                                             nonneuron = marker_gene$genr_nonneuro)
#'
#' ## Barplot of Neuronal marker gene and extract those cells only
#' neuron_group <- ISS_barplot(data = left_hypo, gene = mark_gene, gene.target = 2,
#'                             at.least.gene = 2, gene.show = 2)
#' ## Data preprocessing
#' neuron_group <- ISS_preprocess(data = neuron_group, normalization.method = "LogNormalize",
#'                                do.scale = TRUE, do.center = TRUE)
#'
#' ## Cluster data based on SEURAT pipeline
#' neuron_group_clust  <- ISS_cluster (data = neuron_group, method = "seurat",
#'                                     pc = 0.9, resolution = 0.3)
#'
#' ## Re-cluster specific cluster
#' re_clust  <- ISS_cluster (data = neuron_group_clust, method = "seurat",
#'                                  pc = 0.9, cluster_id = 3, resolution = 1)
#'
#'@export
ISS_cluster <- function(data, method = "seurat", DEGmethod = "seurat",
                        pc = 1, cluster_id = NULL,
                        resolution = 0.3, algorithm = 1,
                        do.norm = TRUE, do.scale = TRUE, k.param = 30)
{
  ## Information 
  ## Check Method
  metho <- c("seurat","backspin","monocle")
  if(method %in% metho == FALSE ) stop("Please check available method", call. = FALSE)

  ## Apply SEURAT
  if(method=="seurat")
  {
    myres<- ISS_cluster_seruat (data = data, pc = pc,
                                cluster_id = cluster_id, resolution = resolution,
                                algorithm = algorithm, DEGmethod = DEGmethod, k.param = k.param)
    myres
  }

  ## Apply Backspin
  if(method == "backspin")
  {myres<- cat ("At present SEURAT is working. Coming soon")}

  ## Apply Monocle
  if(method == "monocle")
  {myres<- cat ("At present SEURAT is working. Coming soon")}

  ############ Return Result
  return(myres)
}
