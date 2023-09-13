#' Parses --tblout format output from hammer
#'
#' @param fn a length-one character vector for the file path of the file to be parsed

parse_badly <- function(fn, trim.end=TRUE) {

  col.widths <- c(
    "target.name" = 33, # Note I'm giving the "space" to the following column
    #"space1" = 1,
    "target.accession" = 11,
    #"space2" = 1, # space
    "quary.name" = 22, # query name
    #"space3" = 2, # dunno why it is 2 here
    "query.accession" = 12, # query accession
    #"space4" = 1,
    "full.seq.e.val" = 10,
    #"space5" = 1,
    "full.seq.score" = 7,
    #"space6" = 1,
    "full.seq.bias" = 6,
    #"space7" = 1,
    "best.domain.e.val" = 10,
    #"space8" = 1,
    "best.domain.score" = 7,
    #"space9" = 1,
    "best.domain.bias" = 6,
    #"space10" = 3, # wtf
    "domain.num.exp" = 6,
    #"space11" = 1,
    "domain.num.reg" = 4,
    #"space12" = 1,
    "domain.num.clu" = 4,
    #"space13" = 1,
    "domain.num.ov" = 4,
    #"space14" = 1,
    "domain.num.env" = 4,
    #"space15" = 1,
    "domain.num.dom" = 4
  )

  col.types <- c("ccccdddddddddddd") # I expect those last few doubles are integers

  d <- readr::read_fwf(fn, skip = 3,
                col_positions = readr::fwf_widths(col.widths),
                col_types = col.types
                #col_names = names(col.widths)
  )

  names(d) <- names(col.widths)

  #d <- d |>
  #  select(-starts_with("space"))

  # Cut off the crap at the end
  if(trim.end) {
  d <- d |>
    remove_suffix_lines()
  }


  d
}
