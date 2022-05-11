#  Data process, UMAP, and cluster annotation.

First download GSE143758_Admouse_Hippocampus_7m_AllNuclei_UMIcounts.txt.gz from https://www.ncbi.nlm.nih.gov/geo/query/acc.cgi?acc=GSE143758. This should be our raw data.

Then, use 
1. `extract_EZbatch.ipynb`: to extract the EZ_Batch1 data from the raw data. This step outputs our subsetted data EZ_Batch1.csv. We also provide it in as `results/EZ_Batch1.zip` in our result folder.
2. `analyzer.Rmd`: to preprocess, run PCA + KNN + clustering, and find marker genes for each cluster. This step takes in the .csv raw data from the previous step, and outputs a folder of marker lists (21 lists in our study). This step also outputs an .rds file for cluster 5 and cluster 7, which is a subsetted Seurat object. Due to the large storage space it takes, we uploaded it to GoogleDrive: https://drive.google.com/file/d/1iMLWFT4awMfqtjtJ7aQrvBPqd9-2XOWF/view?usp=sharing.
3. 
4. `find_marker.ipynb`: to match marker genes against each cluster in order to identify any potential microglia cluster. 

The  `results/` folder also contains an `figures/` folder, which stores output images from the `analyzer.Rmd` file. All figures can be found in the corresponding section of the paper.
