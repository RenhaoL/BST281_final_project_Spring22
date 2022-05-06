library(Seurat)
library(DESeq2)
library(stringr)
library(zinbwave)
library(edgeR)
library(glmGamPoi)
library(dplyr)

### C17
c17 <- readRDS("/Users/davydeng/Desktop/c17.rds")
counts <- as.data.frame(c17@assays$RNA@counts)
coldata <- data.frame(sample= colnames(counts))
coldata$condition[str_detect(coldata$sample,'WT')] = 'WT'
coldata$condition[!str_detect(coldata$sample,'WT')] = 'AD'


### EDGER
assay(dds) %>% log1p %>% rowVars -> vars
names(vars) <- rownames(dds)
vars <- sort(vars, decreasing = TRUE)
head(vars)
dds <- dds[names(vars)[1:100],]
dds_zinb <- zinbwave(dds, K = 2, epsilon=1000)
zinb <- zinbFit(dds, K=2, epsilon=1000)
dds_zinb <- zinbwave(dds, fitted_model = zinb, K = 2, epsilon=1000,
                          observationalWeights = TRUE)
weights <- assay(dds_zinb, "weights")
dge <- DGEList(assay(dds_zinb))
dge <- calcNormFactors(dge)
design <- model.matrix(~condition, data = colData(dds))
dge$weights <- weights
dge <- estimateDisp(dge, design)
fit <- glmFit(dge, design)
lrt <- glmWeightedF(fit, coef = 2)
topTags(lrt)


### Deseq
dds <- DESeqDataSetFromMatrix(countData = counts,
                              colData = coldata,
                              design = ~ condition)
dds <- estimateSizeFactors(dds)
dds <- estimateDispersions(dds,fitType = "glmGamPoi")
dds <- DESeq(dds,test="LRT",reduced=~1)
res <- results(dds, contrast=c("condition","WT","AD"))
resLFC <- lfcShrink(dds, coef="condition_WT_vs_AD", type="apeglm")
resLFC


### C5
c5 <- readRDS("/Users/davydeng/Desktop/c5_17.rds")
c5 <- subset(c5, idents=c('5'))
counts <- as.data.frame(c5@assays$RNA@counts)
coldata <- data.frame(sample= colnames(counts))
coldata$condition[str_detect(coldata$sample,'WT')] = 'WT'
coldata$condition[!str_detect(coldata$sample,'WT')] = 'AD'

### DESEQ
dds <- DESeqDataSetFromMatrix(countData = counts,
                              colData = coldata,
                              design = ~ condition)
dds <- estimateSizeFactors(dds)
dds <- estimateDispersions(dds,fitType = "glmGamPoi")
dds <- DESeq(dds,test="LRT",reduced=~1)
res <- results(dds, contrast=c("condition","WT","AD"))
resLFC <- lfcShrink(dds, coef="condition_WT_vs_AD", type="apeglm")
resLFC
resLFCOrdered <- resLFC[order(resLFC$pvalue),]

res_LFC_sig <- as.data.frame(resLFCOrdered) %>% dplyr::filter(padj < 0.1)
write.csv(res_LFC_sig, 
          file="AD_cluster5_results.csv")
  
  
