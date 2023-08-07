test_that("hdx_colors raises errors correctly", {
  expect_error(hdx_colors(colors = NULL))
  expect_error(hdx_colors(colors = character(0)))
  expect_error(hdx_colors(colors = "mnit"))
  expect_equal(hdx_colors(colors = NA), NA_character_)
})

test_that("hdx_colors output", {
  expect_out <- c(
    `mint-dark` = "#18998F",
    `mint-hdx` = "#1EBFB3",
    `mint-light` = "#78D9D1",
    `mint-ultra-light` = "#D2F2F0"
  )
  expect_identical(hdx_colors("mint"), expect_out)
})

test_that("hdx_colors hdx_colours matches", {
  expect_equal(hdx_colors(), hdx_colours())
})

test_that("hdx_hex raises errors correctly", {
  expect_error(hdx_hex(color_names = NULL))
  expect_error(hdx_hex(color_names = character(0)))
  expect_error(hdx_hex(color_names = "sapphire mint"))
  expect_equal(hdx_hex(color_names = NA), NA_character_)
})

test_that("hdx_hex output", {
  expect_out <- c("#007CE0", "#FCE0DE")
  expect_identical(hdx_hex(c("sapphire-hdx", "tomato-ultra-light")), expect_out)
})

test_that("hdx_color_names hdx_colour_names matches", {
  expect_equal(hdx_color_names(), hdx_colour_names())
})

test_that("hdx_color functions have 17 values", {
  nms <- hdx_color_names()
  expect_length(nms, 17)
  expect_length(hdx_hex(nms), 17)
  expect_length(hdx_colors(), 17)
})
