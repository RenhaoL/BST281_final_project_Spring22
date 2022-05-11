# This is GO and KEGG pathway enrichement analysis.

In this part, I used the clusterProfiler package (version 3.18.1) to perform the GO (Gene Ontology) BP (Biological Pathways) terms and KEGG pathways enrichment analysis. `enrichGO()` was utilized to find the enriched GO BP terms for the up- or down-regulated genes with their gene symbols, “org.Mm.eg.db” (Genome wide annotation of Mouse), p-value cutoff of 0.05 and p-value adjustment method of Benjamini & Hochberg (BH); `enrichKEGG()` was performed to find the enriched KEGG pathways for those genes with their ENTREZIDs converted from official gene symbols and organism type of *Mus Musculus*. 

The description for each file is listed here: 

1. `gene_list.R`: This R script takes lists of significant DEGs from step2 and then extracts the up- and down-regulated genes based on log2FoldChange directions. `enrichGO()` and `enrichKEGG()` are next being performed on those up- and down-regulated genes. Barplots and dotplots are finally utilized to visualize the top significant enriched GO BP terms and KEGG pathways.
2. `gene_list_AD.txt`: This file contains list of up-regulated genes having log2FoldChange>0.
3. `gene_list_WT.txt`: This file contains list o down-regulated genes having log2FoldChange<0. 
4. `KEGG_UP.jpeg`: This figure is the visualization of top30 enriched KEGG pathways for up-regulated genes from `enrichKEGG()` in horizontal bar plots with negative-log10 transformed adjusted p-value on the x-axis.
5. `KEGG_DOWN.jpeg`:This figure is the visualization of top30 enriched KEGG pathways for down-regulated genes from `enrichKEGG()` in horizontal bar plots with negative-log10 transformed adjusted p-value on the x-axis.
6. `GO_BP_AD.txt`: This is the GO BP Terms output coming out of the DAVID (https://david.ncifcrf.gov/) for the up-regulated genes to compare with the GO BP results generated from clusterProfiler package.
7. `GO_BP_WT.txt`:This is the GO BP Terms output coming out of the DAVID (https://david.ncifcrf.gov/) for the down-regulated genes to compare with the GO BP results generated from clusterProfiler package.
8. `Dotplot_UP.jpeg`: This figure is generated using `enrichplot` and displays the top40 enriched GO BP Terms for up-regulated genes from `enrichGO()` in dot plots with dots color being filled with adjusted p-value and dots shape being proportional to the counts of genes in each pathway.
9. `Dotplot_DOWN.jpeg`: This figure is generated using `enrichplot` and displays the top40 enriched GO BP Terms for down-regulated genes from `enrichGO()` in dot plots with dots color being filled with adjusted p-value and dots shape being proportional to the counts of genes in each pathway.
