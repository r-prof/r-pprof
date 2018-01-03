context("api")

test_that("entry point returns string", {
  path <- get_pprof_pkg_path()
  expect_length(path, 1)
  expect_is(path, "character")
})
