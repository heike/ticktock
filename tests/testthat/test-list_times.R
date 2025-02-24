test_that("list_times works", {
  res <- list_times(list_clocks("heike/ticktock-images"))
  expect_contains(res, "clock2019-10-16_18")

  res <- list_times("omni", "heike/ticktock-images")
  expect_contains(res, "clock2019-10-16_18")

  # locally, an error
  expect_error(
    list_times("", "it-would-be-very-weird-if.this.string.existed_as_a_folder", github=FALSE))
  # remotely, we get a warning first
  expect_error(
    expect_warning(
      list_times("", "it-would-be-very-weird-if.this.string.existed_as_a_folder", github=TRUE))
  )
})
