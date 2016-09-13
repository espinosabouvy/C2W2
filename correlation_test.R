corr <- function(direct = "specdata", threshold = 0){
     #gral vars
     ids<- 1:2
     pollutants <- c("nitrate","sulfate")
     
     #all files - true when threshold correct
     archivos <- list.files(direct, full.names = TRUE)
     tabla <- cbind(id = complete(direct, id = ids)$id, thres_ok = complete(direct, id= ids)$nobs >threshold)
     #read only files with correct threshold
     for (i in ids) {
          if (tabla[i,2] == 1) {
               dato <- read.csv(archivos[i])[pollutants]
               dato.compl <- dato[complete.cases(dato), ]
               prueba <- cor(dato.compl$nitrate,dato.compl$sulfate)
               print(prueba)
          }
     }
}