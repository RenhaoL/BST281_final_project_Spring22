
# WT sample
cellphonedb method statistical_analysis cellphoneDB_ready_WT_neuron_microglia_meta_table.csv cellphoneDB_ready_WT_neuron_microglia_count_matrix.csv \
	--output-path WT_output \
	--counts-data hgnc_symbol \
	--threads 8

# AD sample 
cellphonedb method statistical_analysis cellphoneDB_ready_AD_neuron_microglia_meta_table.csv cellphoneDB_ready_AD_neuron_microglia_count_matrix.csv \
	--output-path AD_output \
	--counts-data hgnc_symbol \
	--threads 8

# generate WT dotplot
cellphonedb plot dot_plot \
 	--output-path Figures \
	--means-path WT_output/means.txt \ 
	--pvalues-path WT_output/pvalues.txt \
	--output-name WT_dot_plot.pdf

# generate AD dotplot
cellphonedb plot dot_plot \
 	--output-path Figures \
	--means-path AD_output/means.txt \ 
	--pvalues-path AD_output/pvalues.txt \
	--output-name AD_dot_plot.pdf

# generate WT heatmap
cellphonedb plot heatmap_plot cellphoneDB_ready_WT_neuron_microglia_meta_table.csv \ 
	--pvalues-path WT_output/pvalues.txt \ 
	--count-name WT_heatmap.pdf \ 
	--output-path Figures

# generate AD heatmap
cellphonedb plot heatmap_plot cellphoneDB_ready_AD_neuron_microglia_meta_table.csv \ 
	--pvalues-path AD_output/pvalues.txt \ 
	--count-name AD_heatmap.pdf \ 
	--output-path Figures