#' Default HDX geometries
#'
#' Default geometries fitting the HDX design guide. Used in [gghdx()] to
#' set default fill, color, size, and point geometry defaults, which is not possible
#' using just [theme_hdx()].
#'
#' Derived from the
#' [ggthemr](https://github.com/Mikata-Project/ggthemr/) methods.
#'
#' @return A list of geometry defaults.
#'
#' @examples
#' library(purrr)
#'
#' # updating geom defaults (like default color of a point or fill for bar)
#' purrr::walk(
#'   hdx_geom_defaults(),
#'   ~ do.call(what = ggplot2::update_geom_defaults, args = .),
#' )
#'
#' @seealso [gghdx()] for automically setting default geometries,
#'     along with other styling.
#'
#' @export
hdx_geom_defaults <- function() {
  colors <- hdx_colors()

  list(
    # geoms where we just need default color
    list(geom = "abline", new = list(color = colors["sapphire-hdx"])),
    list(geom = "point", new = list(
      color = colors["sapphire-hdx"],
      size = rel(2)
    )),
    list(geom = "density", new = list(color = colors["sapphire-hdx"])),
    list(geom = "errorbar", new = list(color = colors["sapphire-hdx"])),
    list(geom = "hline", new = list(color = colors["sapphire-hdx"])),
    list(geom = "vline", new = list(color = colors["sapphire-hdx"])),
    list(geom = "line", new = list(color = colors["sapphire-hdx"])),

    # using dark grey for text
    list(geom = "text", new = list(color = colors["gray-dark"])),

    # geoms where we just need default fill
    # using mint fill here since sapphire quite intense and contrasts with color
    list(geom = "area", new = list(fill = colors["mint-hdx"])),
    list(geom = "ribbon", new = list(fill = colors["mint-hdx"])),
    list(geom = "bar", new = list(fill = colors["mint-hdx"])),
    list(geom = "col", new = list(fill = colors["mint-hdx"])),
    list(geom = "dotplot", new = list(fill = colors["mint-hdx"])),

    # special geometries
    list(geom = "boxplot", new = list(
      color = colors["sapphire-hdx"],
      fill = colors["mint-hdx"]
    )),
    list(geom = "smooth", new = list(
      color = colors["sapphire-hdx"],
      fill = colors["mint-hdx"]
    )),
    list(geom = "dotplot", new = list(
      color = colors["sapphire-hdx"],
      fill = colors["mint-hdx"],
      size = rel(2)
    ))
  )
}
