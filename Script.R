dirs <- list.dirs(path = '~/Desktop/Bioinfromatics/integration_data/', recursive = F, full.names = F)
for (x in dirs){
 name <- gsub('filtered_feature_bc_matrix', "", x)
  
 cts <- ReadMtx(mtx = paste0("~/Desktop/Bioinfromatics/integration_data/", x, "/matrix.mtx.gz"),
          features = paste0("~/Desktop/Bioinfromatics/integration_data/", x, "/features.tsv.gz"),
          cells = paste0("~/Desktop/Bioinfromatics/integration_data/", x, "/barcodes.tsv.gz"))
 assign(name, CreateSeuratObject(counts = cts))
}

merged_seraut <- merge(HB17_background_, y = c(HB17_PDX_, HB30_tumor_, HB17_tumor_, HB53_tumor_, HB53_background_, HB30_PDX_), add.cell.ids = ls()[3:9], project = 'HB')

merged_seraut$sample <- rownames(merged_seraut@meta.data)

merged_seraut@meta.data <- separate(merged_seraut@meta.data, col = 'sample', into = c("Patient", "Type", "Barcode"), sep = '_')
view(merged_seraut)

view(merged_seraut)

