#' Get an image path from a clock
#'
#'
#' @param path character string showing the path to the file in the repo/folder (output from `find_image_path`)
#' @param repo character string. Path to the Github repo `heike/ticktock-images` (or a local clone).
#' @param github binary value; true if the give path points to a github repository
#' @export
#' @importFrom lubridate hms
#' @importFrom dplyr filter `%>%`
#' @importFrom jsonlite fromJSON
#' @returns path to an image showing the specified time (based on its name, not the clock hand). In case of a warning the image corresponding to the closest time is shown.
#' @examples
#' # example code
#'
#' im <- get_image("omni/clock2019-10-16_18/clock2019-10-16_18.59.59.jpg",
#' "heike/ticktock-images", TRUE)
#' plot(im)
#' im <- get_image("omni/clock2019-10-16_18/clock2019-10-16_18.29.15.jpg",
#' "heike/ticktock-images", TRUE)
#' plot(im)
get_image <- function(path, repo = NULL, github=TRUE) {
  # make sure the image exists at the specified path
  res <- list_image_files(folder=path, path=repo, github=TRUE)
  "omni/clock2019-10-16_18/clock2019-10-16_18.32.18.jpg"
  im <- download_image_file(folder=path, path = repo)

}
