test_that("hdx_geom_defaults() uses the 2025 primary blue", {
  defaults <- hdx_geom_defaults()
  point <- Filter(function(x) x$geom == "point", defaults)[[1]]

  expect_identical(unname(point$new$color), unname(hdx_hex("primary-5")))
})

test_that("hdx_geom_defaults(design = 'legacy') reproduces pre-2025 defaults", {
  defaults <- hdx_geom_defaults(design = "legacy")
  point <- Filter(function(x) x$geom == "point", defaults)[[1]]
  area <- Filter(function(x) x$geom == "area", defaults)[[1]]

  expect_identical(unname(point$new$color), unname(hdx_hex("sapphire-hdx")))
  expect_identical(unname(area$new$fill), unname(hdx_hex("mint-hdx")))
})

test_that("hdx_geom_defaults() errors on an invalid design", {
  expect_error(hdx_geom_defaults(design = "nonsense"))
})
