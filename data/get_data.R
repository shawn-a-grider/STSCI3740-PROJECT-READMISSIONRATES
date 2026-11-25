file_path <- "STSCI3740_CLEANDATA.R"
get_data <- function(path) {
  source(here::here("data", "STSCI3740_CLEANDATA.R"), local = TRUE)
  return(df)
}
df <- get_data(file_path)
