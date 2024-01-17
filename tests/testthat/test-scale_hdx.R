test_that("scale_colour matches scale_color", {
  # Scale are environments with gnarly parentage.
  # Convert these to lists to test for equality in a more straightforward
  # manner
  expect_equal_scale <- function(x, y, ...) {
    x <- as.list(x)
    y <- as.list(y)
    x$call <- y$call <- NULL
    expect_equal(x, y, ...)
  }

  # discrete color scales
  expect_equal_scale(scale_color_hdx_discrete(), scale_colour_hdx_discrete())
  expect_equal_scale(scale_color_hdx_mint(), scale_colour_hdx_mint())
  expect_equal_scale(scale_color_hdx_tomato(), scale_colour_hdx_tomato())
  expect_equal_scale(scale_color_hdx_sapphire(), scale_colour_hdx_sapphire())

  # continuous color scales
  expect_equal_scale(scale_color_gradient_hdx(), scale_colour_gradient_hdx())
  expect_equal_scale(
    scale_color_gradient_hdx_mint(),
    scale_colour_gradient_hdx_mint()
  )
  expect_equal_scale(
    scale_color_gradient_hdx_tomato(),
    scale_colour_gradient_hdx_tomato()
  )
  expect_equal_scale(
    scale_color_gradient_hdx_sapphire(),
    scale_colour_gradient_hdx_sapphire()
  )

  # 2 gradient scale
  expect_equal_scale(
    scale_color_gradient2_hdx(),
    scale_colour_gradient2_hdx()
  )
})
