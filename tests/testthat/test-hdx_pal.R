test_that("hdx_pal() returns hex codes", {
  pal <- hdx_pal()
  for (i in 1:12) {
    expect_hex_colors(pal(i))
  }
})

test_that("hdx_pal() raises correctly", {
  pal <- hdx_pal()
  expect_error(pal(0))
  expect_warning(pal(13))
})

test_that("hdx_pal_color()s return hex codes", {
  pals <- list(
    hdx_pal_mint(),
    hdx_pal_sapphire(),
    hdx_pal_tomato()
  )

  for (pal in pals) {
    for (i in 1:4) {
      expect_hex_colors(pal(i))
    }
  }
})

test_that("hdx_pal() raises errors", {
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

test_that("hdx_pal() raises warnings", {
  pal <- hdx_pal()
  expect_warning(pal(13))
})
