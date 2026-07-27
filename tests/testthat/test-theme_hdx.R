test_that("theme_hdx raises error for font", {
  expect_error(theme_hdx())
  expect_error(theme_hdx(base_family = "NONSENSE TEXT ZZZ"))
  expect_error(theme_hdx(title_family = "NONSENSE TEXT ZZZ"))
})

test_that("theme_hdx base_family and title_family", {
  load_hdx_fonts()
  thm_base <- theme_hdx()
  thm_sans <- theme_hdx(base_family = "sans", title_family = "sans")

  expect_identical(thm_base$text$family, "Roboto")
  expect_identical(thm_base$plot.title$family, "Merriweather")
  expect_identical(thm_sans$text$family, "sans")
  expect_identical(thm_sans$plot.title$family, "sans")
})

test_that("theme_hdx horizontal", {
  load_hdx_fonts()
  thm_base <- theme_hdx()
  thm_vert <- theme_hdx(horizontal = FALSE)

  expect_equal(thm_base$panel.grid.major.x, ggplot2::element_blank())
  expect_equal(thm_vert$panel.grid.major.y, ggplot2::element_blank())
})
