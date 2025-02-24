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


list_image_files <- function(path, folder="", github=TRUE) {
  stopifnot(!is.null(path), !is.na(path))
  if (github) {
    url <- sprintf("repos/%s/contents/%s", path, folder)
    loc <- try(
      {fromJSON(sprintf("https://api.github.com/%s",url), flatten = TRUE)}, silent =TRUE)
    if ("try-error" %in% class(loc)) {
      stop(loc[1])
    }

    res <- as.vector(loc$path)

  } else {
    stopifnot(dir.exists(path))

    ls_files <- dir(file.path(path, folder))
#    ls <- list.dirs(path, recursive = FALSE, full.names = FALSE)

    # result are visible directories
    res <- ls_files
  }
  res
}

#' @importFrom imager load.image
download_image_file <- function(path, folder="", github=TRUE) {
  stopifnot(!is.null(path), !is.na(path))
  if (github) {
    url <- sprintf("repos/%s/contents/%s", path, folder)
    img_file <- sprintf("https://api.github.com/%s",url)
    loc <- try(
      {fromJSON(img_file, flatten = TRUE)}, silent =TRUE)
    if ("try-error" %in% class(loc)) {
      stop(loc[1])
    }

    res <- as.vector(loc$download_url)
#    tmp <- tempfile()
#    download.file(img_file, destfile = tmp)

#    browser()
    im <- try({
      imager::load.image(res)
    }, silent = TRUE)
    return(im)

  } else {
    stopifnot(dir.exists(path))

    ls_files <- dir(file.path(path, folder))
    #    ls <- list.dirs(path, recursive = FALSE, full.names = FALSE)

    # result are visible directories
    res <- ls_files
  }
  res
}
