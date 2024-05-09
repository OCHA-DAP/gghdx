#' Label numeric key figures
#'
#' Formats numeric vector of key figures in the Centre style, which abbreviates
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
#' Designed like the `scales::` family of label functions, the return value of
#' `label_key_figures` is a function, based on the `additional_prefix`. So you
#' should pass it in to `scales_...()` `labels` parameter in the same way as
#' `scales_...()`
#'
#' @param additional_prefix Additional prefix to add to string, that will come
#'     between `sign_prefix` and the number. For example, `"$"` could produce a
#'     return value of `-$1.1K`.
#'
#' @returns Returns a "labelling" function, in the same way as `scales::label_...()`
#'     functions work, i.e. a function that takes `x` and returns a labelled character
#'     vector of `length(x)`.
#'
#' @examples
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
#'     labels = label_key_figures("$")
#'   ) +
#'   scale_y_continuous(
#'     labels = label_key_figures()
#'   )
#'
#' @export
label_key_figures <- function(additional_prefix = "") {
  if (!is.character(additional_prefix) || length(additional_prefix) > 1) {
    stop(
      "`additional_prefix` should be a character string of length 1, not a ",
      class(additional_prefix)[1],
      ".",
      call. = FALSE
    )
  }

  function(x) format_key_figures(x = x, additional_prefix = additional_prefix)
}

#' Format key figures
#'
#' Does the formatting found in `label_key_figures`.
#'
#' @inherit label_key_figures params description details
#'
#' @param x Numeric vector to format
#'
#' @returns Character vector of formatted strings
format_key_figures <- function(x, additional_prefix) {
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
