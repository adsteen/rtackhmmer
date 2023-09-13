#' Parses all files in a directory
#'
#' @param path directory
#' @param pattern reads only files containing the specified pattern in the filename

parse_directory_badly <- function(path = ".", pattern = "tblout\\.scan") {
  files <- list.files(path)
  names(files) <- seq_along(files) # this is a hack to make files work like a dictionary later

  paths <- paste0(path, "/", list.files(path)) # confusing: I have path and paths
  combined_df <- purrr::map_df(paths, parse_badly, .id = "file.index")

  # There are like 11 better ways to associate the filename with the index number, which is what ".id" does
  combined_df$filename <- files[combined_df$file.index]


  combined_df
}
