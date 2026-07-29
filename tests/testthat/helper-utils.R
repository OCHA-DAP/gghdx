#' https://github.com/Ryo-N7/tvthemes/issues/15
#'
#' @noRd
expect_eqNe <- function(...) expect_equal(..., ignore_function_env = FALSE)

#' Validate that hex colors are returned
#'
#' Regex pattern from SO https://stackoverflow.com/questions/1636350
#'
#' @noRd
expect_hex_colors <- function(x) {
  ok <- all(grepl("^#(?:[0-9a-fA-F]{3}){1,2}$", x))
  expect(
    ok = ok,
    failure_message = "Return includes non-valid hex codes."
  )
}

#' Skip a test if a Google font can't be loaded
#'
#' CRAN check machines (and CI runners) can have no internet access or a
#' blocked connection to Google Fonts, and don't have Merriweather, Roboto,
#' or Source Sans 3 installed as local system fonts. In that case, neither
#' `sysfonts::font_add_google()` nor its local fallback can succeed, so tests
#' that need a loaded font should skip rather than fail.
#'
#' @param load_expr Expression that loads the font(s), e.g.
#'     `load_hdx_fonts()` or `load_source_sans_3()`.
#'
#' @noRd
skip_if_font_unavailable <- function(load_expr) {
  loaded <- tryCatch(
    {
      load_expr
      TRUE
    },
    error = function(cond) FALSE
  )
  if (!loaded) {
    testthat::skip("Required font unavailable (no internet and not installed locally).")
  }
}
