utils::globalVariables(".data")


#' Get a list of all available recordings by clock
#'
#' @param path character string. Path to the Github repo `heike/ticktock-images` (or a local clone).
#' @param github binary value; true if the give path points to a github repository
#' @export
#' @importFrom dplyr filter `%>%`
#' @importFrom jsonlite fromJSON
#' @returns vector of available clock recordings with an attribute of the successful path
#' @examples
#' # example code
#' list_clocks("heike/ticktock-images")
list_clocks <- function(path, github=TRUE) {
  res <- list_folder(path = path, folder = "", github = github)
  attr(res, "path") <- path
  return(res)
}
