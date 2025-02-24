#' Get an image path from a clock
#'
#' Get the path (or a different example path) to an image for a specific clock.
#' @param time character string in hms format. Which time does the image show?
#' @param folder character string showing the clock specific folder format (output from `list_times`)
#' @param clock character string. For which clock is additional information required?
#' @param path character string. Path to the Github repo `heike/ticktock-images` (or a local clone).
#' @param github binary value; true if the give path points to a github repository
#' @export
#' @importFrom lubridate hms
#' @importFrom dplyr filter `%>%`
#' @importFrom jsonlite fromJSON
#' @returns path to an image showing the specified time (based on its name, not the clock hand). In case of a warning the image corresponding to the closest time is shown.
#' @examples
#' # example code
#'
#' find_image_path("18:21:55", "clock2019-10-16_18", "omni", "heike/ticktock-images", TRUE)
#' find_image_path("18:59:59", "clock2019-10-16_18", "omni", "heike/ticktock-images", TRUE)
find_image_path <- function(time, folder, clock, path = NULL, github=TRUE) {
  time <- hms(time)

  res <- list_image_files(folder = file.path(clock, folder), path = path, github=github)
  file_names <- basename(res)
  # take out file name
  file_names <- gsub(folder, lubridate::hour(time),file_names)
  times <- hms(file_names)
  found_idx <- which(times == time)
#  browser()
  diff_time <- times - time


  if (length(found_idx) > 0) {
    file_path <- res[found_idx]
  } else {

    if (length(times) < 1000) error(sprintf("Image for time  '%s' not found", time))
    file_path <- res[which.min(abs(lubridate::seconds(diff_time)))]
    warning(sprintf("Image for time  '%s' not found (in first 1000 images). Closest time is shown, it's %d seconds away. \nRepo uses format:\n%s", time, min(abs(lubridate::seconds(diff_time))), paste(basename(res[1:5]), collapse=" \n")))
  }

  return(file_path)
}
