test_that("scale_colour matches scale_color", {
  # discrete color scales
  expect_equal(scale_color_hdx_discrete(), scale_colour_hdx_discrete())
  expect_equal(scale_color_hdx_mint(), scale_colour_hdx_mint())
  expect_equal(scale_color_hdx_tomato(), scale_colour_hdx_tomato())
  expect_equal(scale_color_hdx_sapphire(), scale_colour_hdx_sapphire())

  # continuous color scales
  expect_equal(scale_color_gradient_hdx(), scale_colour_gradient_hdx())
  expect_equal(
    scale_color_gradient_hdx_mint(),
    scale_colour_gradient_hdx_mint()
  )
  expect_equal(
    scale_color_gradient_hdx_tomato(),
    scale_colour_gradient_hdx_tomato()
  )
  expect_equal(
    scale_color_gradient_hdx_sapphire(),
    scale_colour_gradient_hdx_sapphire()
  )

  # 2 gradient scale
  expect_equal(
    scale_color_gradient2_hdx(),
    scale_colour_gradient2_hdx()
  )
})
