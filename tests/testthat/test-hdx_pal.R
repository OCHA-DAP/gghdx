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
    hdx_pal_gray(),
    hdx_pal_primary(),
    hdx_pal_brand(),
    hdx_pal_error()
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
    hdx_pal_tomato(),
    hdx_pal_primary(),
    hdx_pal_brand(),
    hdx_pal_error()
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

test_that("hdx_pal_discrete(design = 'legacy') reproduces pre-2025 palette", {
  pal_legacy <- hdx_pal_discrete(design = "legacy")
  pal_2025 <- hdx_pal_discrete()

  expect_identical(
    pal_legacy(3),
    unname(
      hdx_colors(c("mint", "sapphire", "tomato"))[
        c("mint-hdx", "sapphire-hdx", "tomato-hdx")
      ]
    )
  )
  expect_false(identical(pal_legacy(3), pal_2025(3)))
  for (i in 1:12) {
    expect_hex_colors(pal_legacy(i))
  }
})
