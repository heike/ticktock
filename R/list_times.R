#' Get a list of all available times for a clock
#'
#' Using the output from `list_clocks`, find the available times for a clock.
#' @param clock character string. For which clock is additional information required?
#' @param path character string. Path to the Github repo `heike/ticktock-images` (or a local clone).
#' @param github binary value; true if the give path points to a github repository
#' @export
#' @importFrom dplyr filter `%>%`
#' @importFrom jsonlite fromJSON
#' @returns vector of available clock recordings
#' @examples
#' # example code
#' list_times("omni", "heike/ticktock-images", TRUE)
#' list_times(list_clocks("heike/ticktock-images"), TRUE)
list_times <- function(clock, path = NULL, github=TRUE) {
  if (is.null(path)) path <- attr(clock, "path")
  res <- list_folder(path = path, folder = clock, github = github)

  return(res)
}
