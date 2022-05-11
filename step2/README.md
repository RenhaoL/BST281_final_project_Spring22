# This is differential expression gene analysis. 

In this part, I compared the gene expression profiles of Microglia in both WT and AD mice, and output the statistically significant gene list of differentially expressed genes for downstream analyses. The description for each file is listed here: 


Note: in the Step2 folder, it contains four different files:

    - AD_cluster5_results.csv     : This file contains the output of differential gene list between microglia of WT v.s. AD mice. Both up- and down-regulated genes are included, and differentiable by the sign of the log2FC column.

    - C5_DEG.R            : This file contains all the code beginning from input taken from step 1 (rds file stored in google drive due to its large size) to the .csv output. 
    
    - No_shrinkage.pdf         : This pdf contains the raw log fold change in expression levels of each gene prior to shrinkage. Blue color represents significantly differential genes.
    
    - LFC shrinkage.pdf         : This pdf contains the shrinked log fold change information for each gene to correct for large dispersions of low-expressed genes.

