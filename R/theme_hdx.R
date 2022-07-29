#' ggplot color theme based on HDX visual design guide
#'
#' A theme that approximates the style of the
#' *Humanitarian Data Exchange (HDX)*.
#'
#' `theme_hdx()` implements a chart that follows the general
#' visual guide of the HDX platform, as defined in the
#' [dataviz-guide](https://data.humdata.org/dataviz-guide/).
#'
#' Use [scale_color_hdx()] with this theme.
#'
#' *HDX* uses two fonts in its official typography, with the free Google
#' font Source Sans Pro being easily available in R. Use the
#' \pkg{sysfonts} package to add the Google font easily.
#'
#' @inheritParams ggplot2::theme_grey
#' @param horizontal `logical` Horizontal axis lines?
#'
#' @importFrom ggplot2 element_rect element_text rel element_blank margin unit
#'     theme element_line
#'
#' @return An object of class \code{\link[ggplot2]{theme}()}.
#'
#' @export
#'
#' @references
#' \itemize{
#' \item \href{https://data.humdata.org}{Humanitarian Data Exchange}
#' \item \href{https://fonts.google.com/specimen/Source+Sans+Pro}{Google Fonts, Source Sans Pro} #nolint
#' \item \href{https://data.humdata.org/dataviz-guide/}{HDX Dataviz Guide}
#' }
theme_hdx <- function(base_size = 10,
                      base_family = "Source Sans Pro",
                      horizontal = TRUE) {
  base_colors <- hdx_colors("gray")

  ret <-
    ggthemes::theme_foundation(
      base_size = base_size,
      base_family = base_family
    ) +
    theme(
      line = element_line(color = base_colors["gray-black"]),
      rect = element_rect(
        fill = "white",
        colour = NA,
        linetype = 1
      ),
      text = element_text(
        color = base_colors["gray-dark"],
        family = base_family
      ),
      ## Axis
      axis.line = element_line(
        size = rel(0.8),
        color = base_colors["gray-dark"]
      ),
      axis.line.y = element_blank(),
      axis.text = element_text(
        size = rel(1)
      ),
      axis.text.x = element_text(
        vjust = 0,
        margin = margin(t = rel(1), unit = "pt")
      ),
      axis.text.x.top = ggplot2::element_text(
        vjust = 0,
        margin = ggplot2::margin(b = rel(1), unit = "pt")
      ),
      axis.text.y = ggplot2::element_text(
        hjust = 0,
        margin = margin(r = rel(1), unit = "pt")
      ),
      axis.ticks = element_blank(),
      axis.title = element_text(size = rel(1.25)),
      axis.title.x = element_text(
        margin = margin(t = rel(4), unit = "pt")
      ),
      axis.title.y = element_text(
        angle = 90,
        margin = margin(r = rel(4), unit = "pt")
      ),
      legend.background = element_rect(linetype = 0),
      legend.spacing = unit(base_size * 1.5, "points"),
      legend.key = element_rect(linetype = 0),
      legend.key.size = unit(1.2, "lines"),
      legend.key.height = NULL,
      legend.key.width = NULL,
      legend.text = element_text(size = rel(1)),
      legend.text.align = NULL,
      legend.title = element_text(size = rel(1.25), hjust = 0, vjust = 0.5),
      legend.title.align = NULL,
      legend.position = "bottom",
      legend.direction = NULL,
      legend.justification = "center",
      panel.background = element_rect(fill = base_colors["gray-white"]),
      panel.border = element_blank(),
      panel.grid.major = element_line(
        color = base_colors["gray-light"],
        size = rel(1)
      ),
      panel.grid.minor = element_blank(),
      panel.spacing = unit(0.25, "lines"),
      strip.background = element_rect(
        fill = base_colors["gray-white"],
        color = NA,
        linetype = 0
      ),
      strip.text = element_text(
        size = rel(1.1),
        color = base_colors["gray-black"],
        face = "bold"
      ),
      strip.text.x = element_text(
        margin = margin(b = rel(5))
      ),
      strip.text.y = element_text(angle = -90),
      plot.background = element_rect(
        fill = base_colors["gray-white"],
        color = NA
      ),
      plot.title = element_text(
        size = rel(1.5),
        hjust = 0,
        face = "bold",
        color = base_colors["gray-black"],
        margin = margin(b = rel(4), unit = "pt")
      ),
      plot.title.position = "plot",
      plot.subtitle = element_text(
        size = rel(1.1),
        hjust = 0,
        face = "bold"
      ),
      plot.margin = unit(c(6, 5, 6, 5) * 2, "points"),
      complete = TRUE
    )
  if (horizontal) {
    ret <- ret + theme(panel.grid.major.x = element_blank())
  } else {
    ret <- ret + theme(panel.grid.major.y = element_blank())
  }
  ret
}
