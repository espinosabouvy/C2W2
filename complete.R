complete <- function(direc = "specdata", id = 1:332){
     archivos <- list.files(direc,full.names = TRUE)
     x<- 1
     nobs <- 0
     for (i in id) {
          ##Calculate sum of complete cases
          casos <- sum(complete.cases(read.csv(archivos[i])))
          nobs[x]<- casos
          x<- x + 1
     }
     
     ##create data frame with value
     resultados <- data.frame(id,nobs)
     resultados
}