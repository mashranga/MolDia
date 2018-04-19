# MolDia
R package to analyze single cell in-situ sequencing (ISS) data

# Install package 
```{r}
install.packages("devtools")
library(devtools)
install_github("mashranga/MolDia")
```
# Scope of the package
The scope of the package can be devided into following broad category
## Read and manupulate RCA ISS data
1. __readRCA__ : Function to read RCA ISS data. THis function has different parameter, how to read and what to read. See detail in function help.
2. __ISS_rotate__ : Rotate by specific angle or flip  by x or y axis of ISS image.

## ISS data summary and vizualization
1. __genesSummary__: Summary of Specific gene of interest in ISS data. This include % of gene of interest positive cell with their distribution in other positive cells and visa-versa.
2. __ISS_pieplot__:
3. __ISS_ratiocor__:

## Multiple ISS data comparision
1. __ISS_compare__: Relation of multiple ISS data interms of total reads per gene. The result is presented in fitted regression line with R^2.



## Need to updrade 

1. In function RCA_map plot empty cells foe specific genes.
2. legend problem In function RCA_map plot
3. Add violon plot in function RCA_map
4. Add tsne subplot for selected gene 