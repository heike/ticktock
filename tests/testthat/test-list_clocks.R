test_that("list_clocks works", {
  res <- list_clocks("heike/ticktock-images")
  expect_contains(res, "omni")

  # locally, an error
  expect_error(
    list_clocks("it-would-be-very-weird-if.this.string.existed_as_a_folder", github=FALSE))
  # remotely, we get a warning first
  expect_error(
    expect_warning(
      list_clocks("it-would-be-very-weird-if.this.string.existed_as_a_folder", github=TRUE))
  )
})
