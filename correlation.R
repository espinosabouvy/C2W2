#proyecto terminado
corr <- function(direct = "specdata", threshold = 0){
     prueba <- numeric()
     #all files - true when threshold correct
     archivos <- list.files(direct, full.names = TRUE)
     tabla <- cbind(thres_ok = complete(direct)$nobs >threshold)
     #read only files with correct threshold
     for (i in seq_along(archivos)) {
          x <- 1
          if (tabla[i] == TRUE) {
               dato <- read.csv(archivos[i])[c("ID", "nitrate", "sulfate")]
               dato.compl <- dato[complete.cases(dato), ]
               dato.prueba <- cor(dato.compl$nitrate,dato.compl$sulfate)
               prueba<- c(prueba, dato.prueba)
               
               x = x + 1
          }
     }
     return(prueba)
}