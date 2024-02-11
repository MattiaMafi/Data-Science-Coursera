corr <- function(directory, threshold = 0) {
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
  
  files <- list.files(directory)
  cr <- c()
  for(f in files) {
    df <- read.csv(file.path(directory, f), header = T, sep = ",")
    obs <- complete.cases(df)
    if(sum(obs) > threshold) {
      cr <- c(cr, cor(df$sulfate[obs], df$nitrate[obs]))
    }
  }
  cr
}