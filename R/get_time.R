#' Get an image based on time
#'
#' A timestamp will be inserted into the correct format to pull an existing image from a repository.
#' @param time character string in the form hour, minute, second.
#' @param sample_path character string showing the path to a file in the repo/folder (output from `find_image_path`), marked up with `%HOUR%`, `%MINUTE%` and `%SECOND%` in appropriate places.
#' @param repo character string. Path to the Github repo `heike/ticktock-images` (or a local clone).
#' @param github binary value; true if the give path points to a github repository
#' @export
#' @importFrom lubridate hms hour minute second
#' @returns path to an image showing the specified time (based on its name, not the clock hand). In case of a warning the image corresponding to the closest time is shown.
#' @examples
#' # example code
#'
#' im <- get_time("18:15:39",
#' "omni/clock2019-10-16_%HOUR%/clock2019-10-16_%HOUR%.%MINUTE%.%SECOND%.jpg",
#' "heike/ticktock-images", TRUE)
#' plot(im)
#' im <- get_time("18:15:44",
#' "omni/clock2019-10-16_%HOUR%/clock2019-10-16_%HOUR%.%MINUTE%.%SECOND%.jpg",
#' "heike/ticktock-images", TRUE)
#' # careful - the image for the next second does not exist.
#' plot(im)
get_time <- function(time, sample_path = NULL,
                     repo = NULL, github=TRUE) {
  # make sure the image exists at the specified path
  # format:
  # "omni/clock2019-10-16_18/clock2019-10-16_18.59.59.jpg"
  time <- hms(time)
  H <- lubridate::hour(time)
  M <- lubridate::minute(time)
  S <- lubridate::second(time)
  sample_path <- gsub("%HOUR%", H, sample_path)
  sample_path <- gsub("%MINUTE%", M, sample_path)
  sample_path <- gsub("%SECOND%", S, sample_path)

  im <- get_image(sample_path, repo = repo, github=github)
  im
}
