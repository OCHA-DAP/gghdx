test_that("theme_hdx raises error for font", {
  # use a guaranteed-invalid family name rather than relying on Roboto never
  # being loaded yet, since other tests in the suite may load it first
  expect_error(theme_hdx(base_family = "NONSENSE TEXT ZZZ"))
  expect_error(
    theme_hdx(base_family = "sans", title_family = "NONSENSE TEXT ZZZ")
  )
})

test_that("theme_hdx font error explains the 0.2.0 default font change", {
  expect_error(
    theme_hdx(base_family = "NONSENSE TEXT ZZZ"),
    regexp = "load_hdx_fonts|design = .legacy."
  )
})

test_that("theme_hdx base_family and title_family", {
  skip_if_font_unavailable(load_hdx_fonts())
  thm_base <- theme_hdx()
  thm_sans <- theme_hdx(base_family = "sans", title_family = "sans")

  expect_identical(thm_base$text$family, "Roboto")
  expect_identical(thm_base$plot.title$family, "Merriweather")
  expect_identical(thm_sans$text$family, "sans")
  expect_identical(thm_sans$plot.title$family, "sans")
})

test_that("theme_hdx horizontal", {
  skip_if_font_unavailable(load_hdx_fonts())
  thm_base <- theme_hdx()
  thm_vert <- theme_hdx(horizontal = FALSE)

  expect_equal(thm_base$panel.grid.major.x, ggplot2::element_blank())
  expect_equal(thm_vert$panel.grid.major.y, ggplot2::element_blank())
})

test_that("theme_hdx title_family follows base_family if title_family unset", {
  skip_if_font_unavailable(load_source_sans_3())
  thm <- theme_hdx(base_family = "Source Sans 3")

  expect_identical(thm$text$family, "Source Sans 3")
  expect_identical(thm$plot.title$family, "Source Sans 3")
})

test_that("theme_hdx positional arguments keep their original order", {
  skip_if_font_unavailable(load_hdx_fonts())
  thm <- theme_hdx(10, "sans", FALSE)

  expect_identical(thm$text$family, "sans")
  expect_equal(thm$panel.grid.major.y, ggplot2::element_blank())
})

test_that("theme_hdx design = 'legacy' reproduces the pre-2025 theme", {
  skip_if_font_unavailable(load_source_sans_3())
  thm <- theme_hdx(design = "legacy")

  expect_identical(thm$text$family, "Source Sans 3")
  expect_equal(thm$axis.ticks, ggplot2::element_blank())
  expect_identical(unname(thm$text$colour), unname(hdx_hex("gray-dark")))
})
