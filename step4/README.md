# This is the Cell-cell interaction analysis. 

In this part, I compared the neuronal cells vs. Microglia in both WT and AD mice. The description for each file is listed here: 

1. `AD_output`: folder contains the CellphoneDB results in AD mice, neuronal cells vs. microglia
2. `WT_output`: folder contains the CellphoneDB results in WT mice, neuronal cells vs. microglia

Note: in the CellphoneDB output folder, each one contains four different files:

    - deconvoluted.txt     : This file contains additional information regarding the interaction pairs. This is important as some of the partners are heteromers.

    - means.txt            : This file contains the mean value for all the interacting partners. 
    
    - pvalues.txt          : P values for all the interacting partners. This p-value refers to the enrichment of the interacting ligand-receptor pair in each of the interacting pairs of cell types
    
    - significant_mean.txt : Significant mean calculation for all the interacting partners, but only considering the significant terms.  

3. `Figures`: folder contains the dot plots and heatmap from CellphoneDB outputs
4. `cellphoneDB_ready_AD_neuron_microglia_meta_table.csv` and `cellphoneDB_ready_WT_neuron_microglia_meta_table.csv`: These two files are the meta data for the AD and WT mice
5. `cellphoneDB_command.sh`: This bash file contains the CellphoneDB commands used for this project
6. `cellphoneDB_preprocess.Rmd` : This file contains the code to proprocess the Seruat object generated in the previous step to meet the requirement for CellphoneDB inputs. The outputs are the meta data and the count matrices. 
7.`cellphoneDB_ready_AD_neuron_microglia_count_matrix.csv.zip` and `cellphoneDB_ready_WT_neuron_microglia_count_matrix.csv.zip`: These two files are the count matrices for AD and WT mice. 

