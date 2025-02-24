list_folder <- function(path, folder="", github=TRUE) {
  stopifnot(!is.null(path), !is.na(path))
  if (github) {
    url <- sprintf("repos/%s/contents/%s", path, folder)
    loc <- try(
      {fromJSON(sprintf("https://api.github.com/%s",url), flatten = TRUE)}, silent =TRUE)
    if ("try-error" %in% class(loc)) {
      stop(loc[1])
    }

    loc <- loc %>% dplyr::filter(.data$type=="dir")
    res <- as.vector(loc$name)

  } else {
    stopifnot(dir.exists(path))

    ls_files <- dir(file.path(path, folder))
    ls <- list.dirs(path, recursive = FALSE, full.names = FALSE)

    # result are visible directories
    res <- intersect(ls, ls_files)
  }
  res
}
