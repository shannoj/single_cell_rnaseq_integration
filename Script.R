dirs <- list.dirs(path = '~/Desktop/Bioinfromatics/integration_data/', recursive = F, full.names = F)
for (x in dirs){
 name <- gsub('filtered_feature_bc_matrix', "", x)
  
 cts <- ReadMtx(mtx = paste0("~/Desktop/Bioinfromatics/integration_data/", x, "/matrix.mtx.gz"),
          features = paste0("~/Desktop/Bioinfromatics/integration_data/", x, "/features.tsv.gz"),
          cells = paste0("~/Desktop/Bioinfromatics/integration_data/", x, "/barcodes.tsv.gz"))
 assign(name, CreateSeuratObject(counts = cts))
}

