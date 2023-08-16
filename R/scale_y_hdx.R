#' Position scales for continuous y data
#'
#' `scale_y_continuous_hdx()` and the three variants with different `trans`
#' arguments are defaults scales for the y axis that ensures the distance
#' from data to the y-axis is reduced to 0, as is common throughout the HDX
#' data visualization guidelines. This is done by setting `expand = c(0, 0)`.
#'
#' @inherit ggplot2::scale_y_continuous details
#' @param ... Other arguments pass on to [ggplot2::scale_y_continuous()].
#'
#' @rdname scale_y_hdx
#'
#' @examples
#' library(ggplot2)
#'
#' p <- ggplot(df_covid) +
#'   geom_line(
#'     aes(
#'       x = date,
#'       y = cases_monthly
#'     )
#'   )
#'
#' p
#'
#' # start y axis at 0
#' p + scale_y_continuous_hdx()
#' p + scale_y_log10_hdx()
#'
#' @return Relevant ggplot2 scaling.
#'
#' @export
scale_y_continuous_hdx <- function(...) {
  ggplot2::scale_y_continuous(..., expand = c(0, 0))
}

#' @rdname scale_y_hdx
#' @export
scale_y_log10_hdx <- function(...) {
  ggplot2::scale_y_log10(..., expand = c(0, 0))
}

#' @rdname scale_y_hdx
#' @export
scale_y_reverse_hdx <- function(...) {
  ggplot2::scale_y_reverse(..., expand = c(0, 0))
}

#' @rdname scale_y_hdx
#' @export
scale_y_sqrt_hdx <- function(...) {
  ggplot2::scale_y_sqrt(..., expand = c(0, 0))
}
