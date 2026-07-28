test_that("geom_text_hdx() defaults to Roboto", {
  layer <- geom_text_hdx()

  expect_identical(layer$aes_params$family, "Roboto")
})

test_that("geom_text_hdx(design = 'legacy') uses Source Sans 3", {
  layer <- geom_text_hdx(design = "legacy")

  expect_identical(layer$aes_params$family, "Source Sans 3")
})

test_that("geom_label_hdx() defaults to Roboto", {
  layer <- geom_label_hdx()

  expect_identical(layer$aes_params$family, "Roboto")
})

test_that("geom_label_hdx(design = 'legacy') uses Source Sans 3", {
  layer <- geom_label_hdx(design = "legacy")

  expect_identical(layer$aes_params$family, "Source Sans 3")
})

test_that("geom_text_hdx() errors on an invalid design", {
  expect_error(geom_text_hdx(design = "nonsense"))
})
