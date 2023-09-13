#' Removes suffix lines from
#'
#' @param d data frame produced by parse_badly()

remove_suffix_lines <- function(d) {
  # identify the number of lines to keep
  program.line <- stringr::str_which(d$target.name, "^#[:space:]Program")[1] # regex seems to work
  lines.to.keep <- program.line - 2 # because there's a blank line above # Program

  d_trim <- d |>
    dplyr::slice_head(n=lines.to.keep)

  d_trim
}
