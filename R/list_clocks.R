utils::globalVariables(".data")

#' Get a list of all available recordings by clock
#'
#' @param path character string. Path to the Github repo `heike/ticktock-images` (or a local clone).
#' @param github binary value; true if the give path points to a github repository
#' @export
#' @importFrom dplyr filter `%>%`
#' @importFrom jsonlite fromJSON
#' @returns vector of available clock recordings
#' @examples
#' # example code
#' list_clocks("heike/ticktock-images")
list_clocks <- function(path, github=TRUE) {
  if (github) {
    url <- sprintf("repos/%s/contents", path)
    loc <- try(
      {fromJSON(sprintf("https://api.github.com/%s",url), flatten = TRUE)}, silent =TRUE)
    if ("try-error" %in% class(loc)) {
      stop(loc[1])
    }

    loc <- loc %>% dplyr::filter(.data$type=="dir")
    res <- as.vector(loc$name)

  } else {
  stopifnot(dir.exists(path))

  ls_files <- dir(path)
  ls <- list.dirs(path, recursive = FALSE, full.names = FALSE)

  # result are visible directories
  res <- intersect(ls, ls_files)
  }
  return(res)
}
