
#' Text
#'
#' Text geoms are useful for labeling plots. They can be used by themselves as
#' scatterplots or in combination with other geoms, for example, for labeling
#' points or for annotating the height of bars. `geom_text_hdx()` adds only
#' text to the plot. `geom_label_hdx()` draws a rectangle behind the text,
#' making it easier to read. The only difference with the base `geom_text()`
#' is that the default font family is Source Sans Pro. `geom_label_hdx()` also
#' incorporates a default dark gray background, white text, and no borders.
#'
#' @inherit ggplot2::geom_text details params return
#'
#' @rdname geom_text_family
#' @export
geom_text_hdx <- function(mapping = NULL,
                          data = NULL,
                          stat = "identity",
                          position = "identity",
                          ...,
                          parse = FALSE,
                          nudge_x = 0,
                          nudge_y = 0,
                          check_overlap = FALSE,
                          na.rm = FALSE,
                          show.legend = NA,
                          inherit.aes = TRUE) {
  # source code taken from ggplot2 for easy wrapping
  if (!missing(nudge_x) || !missing(nudge_y)) {
    if (!missing(position)) {
      stop(
        "You must specify either `position` or `nudge_x`/`nudge_y`.",
        call. = FALSE
      )
    }
    position <- ggplot2::position_nudge(nudge_x, nudge_y)
  }

  ggplot2::layer(
    data = data,
    mapping = mapping,
    stat = stat,
    geom = ggplot2::GeomText,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(
      parse = parse,
      check_overlap = check_overlap,
      na.rm = na.rm,
      family = "Source Sans Pro",
      ...
    )
  )
}


#' @rdname geom_text_family
#'
#' @param fill Fill color for label box. Defaults to dark gray.
#' @param color Font color. Defaults to white.
#' @param fontface Font emphasis. Defaults to bold.
#'
#' @inherit ggplot2::geom_label params
#' @export
geom_label_hdx <- function(mapping = NULL,
                           data = NULL,
                           stat = "identity",
                           position = "identity",
                           ...,
                           fill = hdx_hex("gray-dark"),
                           color = "white",
                           fontface = "bold",
                           parse = FALSE,
                           nudge_x = 0,
                           nudge_y = 0,
                           label.padding = unit(0.25, "lines"),
                           label.r = unit(0.15, "lines"),
                           label.size = 0,
                           na.rm = FALSE,
                           show.legend = NA,
                           inherit.aes = TRUE) {
  # source code taken from ggplot2 for easy wrapping
  if (!missing(nudge_x) || !missing(nudge_y)) {
    if (!missing(position)) {
      stop(
        "You must specify either `position` or `nudge_x`/`nudge_y`.",
        call. = FALSE
      )
    }
    position <- ggplot2::position_nudge(nudge_x, nudge_y)
  }

  ggplot2::layer(
    data = data,
    mapping = mapping,
    stat = stat,
    geom = ggplot2::GeomLabel,
    position = position,
    show.legend = show.legend,
    inherit.aes = inherit.aes,
    params = list(
      fill = fill,
      color = color,
      fontface = fontface,
      parse = parse,
      label.padding = label.padding,
      label.r = label.r,
      label.size = label.size,
      na.rm = na.rm,
      family = "Source Sans Pro",
      ...
    )
  )
}
