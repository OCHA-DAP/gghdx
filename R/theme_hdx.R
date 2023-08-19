#no lint start
#' ggplot color theme based on HDX visual design guide
#'
#' A theme that approximates the style of the
#' *Humanitarian Data Exchange (HDX)*.
#'
#' `theme_hdx()` implements a chart that follows the general
#' visual guide of the HDX platform, as defined in the
#' [dataviz-guide](https://data.humdata.org/dataviz-guide/).
#'
#' Use [scale_color_hdx_discrete()] with this theme.
#'
#' *HDX* uses two fonts in its official typography, with the free Google
#' font Source Sans 3 being easily available in R. Use the
#' \pkg{sysfonts} package to add the Google font easily.
#'
#' @inheritParams ggplot2::theme_grey
#' @param horizontal `logical` Horizontal axis lines?
#'
#' @importFrom ggplot2 element_rect element_text rel element_blank margin unit
#'     theme element_line
#'
#' @return A \code{\link[ggplot2]{theme}()} to stylize a `ggplot2::ggplot()`
#'     plot.
#'
#' @seealso [gghdx()] for automatically applying the theme to all plots in this
#'     current R session, along with other styling.
#'
#' @references
#' \itemize{
#' \item \href{https://data.humdata.org}{Humanitarian Data Exchange}
#' \item \href{https://fonts.google.com/specimen/Source+Sans+3}{Google Fonts, Source Sans 3}
#' \item \href{https://data.humdata.org/dataviz-guide/}{HDX Dataviz Guide}
#' }
#'
#' @examples
#' library(ggplot2)
#'
#' p <- ggplot(mtcars) +
#'   geom_point(
#'     aes(
#'       x = mpg,
#'       y = hp
#'     )
#'   ) +
#'   labs(
#'     x = "Miles per gallon",
#'     y = "Horsepower",
#'     title = "Horsepower relative to miles per gallon"
#'   )
#'
#' # the default font is source sans 3
#' # an error will occur if not loaded before using theme_hdx()
#' try(p + theme_hdx())
#'
#' # you can change the base family
#' p + theme_hdx(base_family = "sans")
#'
#' # or load Source Sans 3 using gghdx() or load_source_sans_3()
#' load_source_sans_3()
#' p + theme_hdx()
#'
#' # we can change the axis line direction depending on the plot
#' p + theme_hdx(horizontal = FALSE)
#'
#' @export
theme_hdx <- function(base_size = 10,
                      base_family = "Source Sans 3",
                      horizontal = TRUE) {
  base_colors <- hdx_colors("gray")
  check_font(base_family)

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
        linewidth = rel(0.8),
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
        hjust = 0.95,
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
      legend.title = element_text(size = rel(1.25), hjust = 0.5, vjust = 0.5),
      legend.title.align = NULL,
      legend.position = "bottom",
      legend.direction = NULL,
      legend.justification = "center",
      panel.background = element_rect(fill = base_colors["gray-white"]),
      panel.border = element_blank(),
      panel.grid.major = element_line(
        color = base_colors["gray-light"],
        linewidth = rel(1)
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
        margin = margin(b = rel(5), unit = "pt")
      ),
      plot.title.position = "plot",
      plot.subtitle = element_text(
        size = rel(1.1),
        hjust = 0,
        face = "bold",
        margin = margin(b = rel(10), unit = "pt")
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
