test_that("hdx_pal_discrete() returns hex codes", {
  pal <- hdx_pal_discrete()
  for (i in 1:12) {
    expect_hex_colors(pal(i))
  }
})

test_that("hdx_pal_discrete() raises correctly", {
  pal <- hdx_pal_discrete()
  expect_error(pal(0))
  expect_warning(pal(13))
})

test_that("hdx_pal_color()s return hex codes", {
  pals <- list(
    hdx_pal_mint(),
    hdx_pal_sapphire(),
    hdx_pal_tomato(),
    hdx_pal_gray()
  )

  for (pal in pals) {
    for (i in 1:4) {
      expect_hex_colors(pal(i))
    }
  }
})

test_that("hdx_pal_...() raises errors", {
  pals <- list(
    hdx_pal_mint(),
    hdx_pal_sapphire(),
    hdx_pal_tomato()
  )

  for (pal in pals) {
    expect_error(pal(0))
    expect_warning(pal(5))
  }
})

test_that("hdx_pal_discrete() raises warnings", {
  pal <- hdx_pal_discrete()
  expect_warning(pal(13))
})
