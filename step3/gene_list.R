library(dplyr)
library(topGO)
library(KEGGREST)
library(biomaRt)
library(org.Mm.eg.db)
library(ggplot2)
library(clusterProfiler)
library(enrichplot)
library(AnnotationDbi)
library(DOSE)

gene <- read.delim("AD_cluster5_results.txt", header = T, sep = ",")
head(gene)
#################### AD ###################
gene_AD <- gene %>% filter(log2FoldChange >0 )
head(gene_AD)
nrow(gene_AD)
#write.table(gene_AD$X,"~/Desktop/离/Harvard/BST281/project/gene_list_AD.txt",sep="\t",quote=F,row.names=F, col.names = F)

# From DAVID
david_AD <- read.delim("GO_BP_AD.txt", header=T)
head(david_AD)
david_AD_p <- david_AD %>% filter(Benjamini<0.05)
ggp <- ggplot(david_AD_p, aes(reorder(Term, -log10(Benjamini)),-log10(Benjamini))) +   
  geom_bar(stat = "identity", fill='steelblue') + 
  xlab("GO_BP Terms")
ggp +  coord_flip() + theme_bw()
# GO From enrichGO
geneList <- gene_AD$pvalue
names(geneList) <- gene_AD$X
head(geneList)
ego <- enrichGO(gene          = names(geneList),
                OrgDb         = org.Mm.eg.db,
                ont           = "BP",
                pAdjustMethod = "BH",
                pvalueCutoff  = 0.05,
                minGSSize = 3,
                maxGSSize = 800, 
                keyType = "SYMBOL")
head(ego,20)
goplot(ego, showCategory=40)
dotplot(ego, showCategory=40) + ggtitle("dotplot for AD")
ggp2 <- ggplot(head(ego,40), aes(reorder(Description, -log10(p.adjust)),-log10(p.adjust),fill=Count)) +   
  geom_bar(stat = "identity") + 
  xlab("GO_BP Terms")+
  scale_fill_viridis_c()+
  ggtitle("GO Terms for Up-regulated Genes")
ggp2 +  coord_flip() + theme_bw()
# KEGG From enrichKEGG
# Gene symbol to ENTREZID
ge <- AnnotationDbi::select(org.Mm.eg.db, keys=names(geneList), columns='ENTREZID', keytype='SYMBOL')$ENTREZID
kk <- enrichKEGG(gene         = ge,
                 organism     = 'mmu', keyType = "kegg")
head(kk)
browseKEGG(kk, 'mmu05010')
kkp <- ggplot(head(kk,30), aes(reorder(Description, -log10(p.adjust)),-log10(p.adjust))) +   
  geom_bar(stat = "identity", fill='steelblue') + 
  xlab("KEGG Pathways")+
  ggtitle("KEGG for Up-regulated Genes")
kkp +  coord_flip() + theme_bw()



############### WT #####################
gene_WT <- gene %>% filter(log2FoldChange <0 )
head(gene_WT)
nrow(gene_WT)
#write.table(gene_WT$X,"~/Desktop/离/Harvard/BST281/project/gene_list_WT.txt",sep="\t",quote=F,row.names=F, col.names = F)

# From DAVID
david_WT <- read.delim("GO_BP_WT.txt", header=T)
head(david_WT)
david_WT_p <- david_WT %>% filter(FDR<0.05)
ggp_WT <- ggplot(david_WT_p, aes(reorder(Term, -log10(FDR)),-log10(FDR))) +   
  geom_bar(stat = "identity", fill="#E69F00")+
  xlab("GO_BP Terms")
ggp_WT +  coord_flip() + theme_bw()
# GO From enrichGO
geneList_WT <- gene_WT$pvalue
names(geneList_WT) <- gene_WT$X
head(geneList_WT)
ego_WT <- enrichGO(gene          = names(geneList_WT),
                OrgDb         = org.Mm.eg.db,
                ont           = "BP",
                pAdjustMethod = "BH",
                pvalueCutoff  = 0.05,
                minGSSize = 3,
                maxGSSize = 800, 
                keyType = "SYMBOL")

head(ego_WT,20)
goplot(ego_WT)
dotplot(ego_WT, showCategory=30) + ggtitle("dotplot for AD")
ggp_WT2 <- ggplot(head(ego_WT,40), aes(reorder(Description, -log10(p.adjust)),-log10(p.adjust),fill=Count)) +   
  geom_bar(stat = "identity") + 
  xlab("GO_BP Terms")+
  scale_fill_viridis_c()+
  ggtitle("GO Terms for Down-regulated Genes")
ggp_WT2 +  coord_flip() + theme_bw()
# KEGG From enrichKEGG
ge_WT <- AnnotationDbi::select(org.Mm.eg.db, keys=names(geneList_WT), columns='ENTREZID', keytype='SYMBOL')$ENTREZID
kk_WT <- enrichKEGG(gene         = ge_WT,
                 organism     = 'mmu', keyType = "kegg")
head(kk_WT)
kkp_WT <- ggplot(head(kk_WT,30), aes(reorder(Description, -log10(p.adjust)),-log10(p.adjust))) +   
  geom_bar(stat = "identity", fill='#E69F00') + 
  xlab("KEGG Pathways")+
  ggtitle("KEGG for Down-regulated Genes")
kkp_WT +  coord_flip() + theme_bw()
