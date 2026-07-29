test_that("gghdx() and gghdx_reset() run without error using 2025 defaults", {
  skip_if_font_unavailable(load_hdx_fonts())
  expect_no_error(gghdx())
  expect_no_error(gghdx_reset())
})

test_that("gghdx() positional arguments keep their original order", {
  skip_if_font_unavailable(load_hdx_fonts())
  expect_no_error(gghdx(TRUE, 10, "sans", FALSE))
  gghdx_reset()
})

test_that("gghdx(design = 'legacy') runs without error, loads Source Sans 3", {
  skip_if_font_unavailable(load_source_sans_3())
  expect_no_error(gghdx(design = "legacy"))
  expect_true("Source Sans 3" %in% sysfonts::font_families())
  gghdx_reset()
})
