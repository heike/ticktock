% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/list_times.R
\name{list_times}
\alias{list_times}
\title{Get a list of all available times for a clock}
\usage{
list_times(clock, path = NULL, github = TRUE)
}
\arguments{
\item{clock}{character string. For which clock is additional information required?}

\item{path}{character string. Path to the Github repo \code{heike/ticktock-images} (or a local clone).}

\item{github}{binary value; true if the give path points to a github repository}
}
\value{
vector of available clock recordings
}
\description{
Using the output from \code{list_clocks}, find the available times for a clock.
}
\examples{
# example code
list_times("omni", "heike/ticktock-images", TRUE)
list_times(list_clocks("heike/ticktock-images"))
}
