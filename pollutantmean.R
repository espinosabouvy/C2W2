pollutantmean <- function(direc ="specdata", pollutant, id = 1:10){
     resul <- numeric()
     archivos <- list.files(direc,full.names = TRUE)
     for (i in id) {
          contamina <-read.csv(archivos[i])[pollutant]
          sina <- contamina[!is.na(contamina)]
          resul <- c(resul,sina)
     }
     print(mean(resul))
}