test_that("theme_hdx base_family", {
  thm_base <- theme_hdx()
  thm_sans <- theme_hdx(base_family = "sans")

  expect_identical(thm_base$text$family, "Source Sans Pro")
  expect_identical(thm_sans$text$family, "sans")
})

test_that("theme_hdx horizontal", {
  thm_base <- theme_hdx()
  thm_vert <- theme_hdx(horizontal = FALSE)

  expect_equal(thm_base$panel.grid.major.x, ggplot2::element_blank())
  expect_equal(thm_vert$panel.grid.major.y, ggplot2::element_blank())
})
