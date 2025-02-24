test_that("get_time works", {
  res <- list_clocks("heike/ticktock-images")
  expect_contains(res, "omni")

  im <- get_time("18:43:58", "omni/clock2019-10-16_%HOUR%/clock2019-10-16_%HOUR%.%MINUTE%.%SECOND%.jpg",
           "heike/ticktock-images", TRUE)
  expect_contains(class(im), "cimg")
  expect_equal(dim(im), c(640, 480, 1, 3))

  expect_error(
    get_time("18:43:59", "omni/clock2019-10-16_%HOUR%/clock2019-10-16_%HOUR%.%MINUTE%.%SECOND%.jpg",
                   "heike/ticktock-images", TRUE)
    )

})
