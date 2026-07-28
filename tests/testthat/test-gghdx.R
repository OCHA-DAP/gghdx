test_that("gghdx() and gghdx_reset() run without error using 2025 defaults", {
  load_hdx_fonts()
  expect_no_error(gghdx())
  expect_no_error(gghdx_reset())
})

test_that("gghdx() positional arguments keep their original order", {
  load_hdx_fonts()
  expect_no_error(gghdx(TRUE, 10, "sans", FALSE))
  gghdx_reset()
})

test_that("gghdx(design = 'legacy') runs without error, loads Source Sans 3", {
  expect_no_error(gghdx(design = "legacy"))
  expect_true("Source Sans 3" %in% sysfonts::font_families())
  gghdx_reset()
})
