file_path <- "STSCI3740_CLEANDATA.R"
get_data <- function(path) {
  source(path, local = TRUE)
  return(df)
}
df <- get_data(file_path)
