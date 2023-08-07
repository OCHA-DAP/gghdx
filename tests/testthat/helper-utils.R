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
