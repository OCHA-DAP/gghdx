#' Format and labels numbers in HDX key figures style
#'
#' Use `format_number_hdx()` to directly format numeric vectors, and use `label_number_hdx()`
#' in the same way as the `scales::` family of label functions. The return value of
#' `label_number_hdx()` is a function, based on the `additional_prefix`. So you
#' should pass it in to `scales_...()` `labels` parameter in the same way as
#' `scales_...()`
#'
#' Numeric vectors are formatted in the HDX style for key figures, which abbreviates
#' numbers 1,000 and above to X.YK, 10,000 and above to XYK, 100,000 and above
#' to XYZK, and the same for 1,000,000 and above, replacing the K with an M, and
#' the same for B. Details of the data viz style can be found in the
#' [visualization guidelines](https://data.humdata.org/dataviz-guide/dataviz-elements/#/data-visualization/text)
#'
#' Just for continuity, values are labeled with T for trillion, and that is the
#' maximum formatting available, anything above the trillions will continue to be
#' truncated to report in the trillions.
#'
#' Deals with negative values in case those ever need to be formatted in similar
#' manners. Also ensures that rounding is performed so numbers look correct.
#' Not to be used for percents, which should just use [scales::label_percent()].
#'
#' @param additional_prefix Additional prefix to add to string, that will come
#'     between `sign_prefix` and the number. For example, `"$"` could produce a
#'     return value of `-$1.1K`.
#'
#' @returns `label_number_hdx()`: "labelling" function, in the same way as `scales::label_...()`
#'     functions work, i.e. a function that takes `x` and returns a labelled character
#'     vector of `length(x)`.
#'
#' @examples
#' # label_number_hdx()
#'
#' library(ggplot2)
#'
#' # discrete scaling
#' p <- ggplot(txhousing) +
#'   geom_point(
#'     aes(
#'       x = median,
#'       y = volume
#'     )
#'   )
#'
#' p
#'
#' p +
#'   scale_x_continuous(
#'     labels = label_number_hdx("$")
#'   ) +
#'   scale_y_continuous(
#'     labels = label_number_hdx()
#'   )
#'
#' @rdname number_hdx
#'
#' @export
label_number_hdx <- function(additional_prefix = "") {
  assert_prefix(additional_prefix)
  function(x) format_number_hdx(x = x, additional_prefix = additional_prefix)
}

#' @param x Numeric vector to format
#'
#' @returns `format_number_hdx()`: Formatted character vector of number strings
#'
#' @examples
#' # number_hdx()
#'
#' x <- c(1234, 7654321)
#' format_number_hdx(x)
#' format_number_hdx(x, "$")
#'
#' @rdname number_hdx
#'
#' @export
format_number_hdx <- function(x, additional_prefix = "") {
  assert_prefix(additional_prefix)

  if (!is.numeric(x)) {
    stop(
      "`x` must be numeric, not class ",
      class(x)[1],
      ".",
      call. = FALSE
    )
  }

  sign_x <- sign(x)
  sign_prefix <- ifelse(sign_x == -1, "-", "")
  abs_x <- abs(x)

  dplyr::case_when(
    abs_x < 1e3 ~ paste0(sign_prefix, additional_prefix, round(abs_x, digits = 0)),
    abs_x < 1e4 ~ paste0(sign_prefix, additional_prefix, round(abs_x / 1e3, digits = 1), "K"),
    abs_x < 1e6 ~ paste0(sign_prefix, additional_prefix, round(abs_x / 1e3, digits = 0), "K"),
    abs_x < 1e7 ~ paste0(sign_prefix, additional_prefix, round(abs_x / 1e6, digits = 1), "M"),
    abs_x < 1e9 ~ paste0(sign_prefix, additional_prefix, round(abs_x / 1e6, digits = 0), "M"),
    abs_x < 1e10 ~ paste0(sign_prefix, additional_prefix, round(abs_x / 1e9, digits = 1), "B"),
    abs_x < 1e12 ~ paste0(sign_prefix, additional_prefix, round(abs_x / 1e9, digits = 0), "B"),
    abs_x < 1e13 ~ paste0(sign_prefix, additional_prefix, round(abs_x / 1e12, digits = 1), "T"),
    abs_x >= 1e13 ~ paste0(sign_prefix, additional_prefix, round(abs_x / 1e12, digits = 0), "T")
  )
}

#' @noRd
assert_prefix <- function(additional_prefix) {
  if (!is.character(additional_prefix) || length(additional_prefix) > 1) {
    stop(
      "`additional_prefix` should be a character string of length 1, not a ",
      class(additional_prefix)[1],
      ".",
      call. = FALSE
    )
  }
}
