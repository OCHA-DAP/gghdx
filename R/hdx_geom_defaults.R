#' Default HDX geometry aesthetics
#'
#' Default geometry aesthetics fitting the HDX design guide. Used in [gghdx()] to
#' set default fill, color, size, and point geometry defaults, which is not possible
#' using just [theme_hdx()].
#'
#' Derived from the
#' [ggthemr](https://github.com/Mikata-Project/ggthemr/) methods.
#'
#' @returns A list of geometry defaults.
#'
#' @examples
#' library(purrr)
#' library(ggplot2)
#'
#' # updating geom defaults (like default color of a point or fill for bar)
#' purrr::walk(
#'   hdx_geom_defaults(),
#'   ~ do.call(what = ggplot2::update_geom_defaults, args = .),
#' )
#'
#' p <- ggplot(mtcars) +
#'   geom_point(
#'     aes(
#'       x = mpg,
#'       y = hp
#'     )
#'   )
#'
#' # see the points are automatically in HDX sapphire
#' p
#'
#' # need to reset back to the default geometries
#' purrr::walk(
#'   ggplot2_geom_defaults(),
#'   ~ do.call(what = ggplot2::update_geom_defaults, args = .)
#' )
#'
#' # now the points are back to default black
#' p
#'
#' @seealso
#' * [gghdx()] for automatically setting default geometries,
#'     along with other styling.
#' * [ggplot2_geom_defaults()] for the ggplot2 default aesthetics.
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

#' Default ggplot2 geometry aesthetics
#'
#' Default geometry aesthetics from the ggplot2 library. All of the aesthetics are the
#' standard ggplot2 defaults for those changed in [gghdx()] based on
#' [hdx_geom_defaults()]. Used in [gghdx_reset()] to return the plotting defaults
#' back to normal.
#'
#' @details
#' These aesthetics were manually pulled from ggplot2 from the geometries'
#' `default_aes` information, such as `ggplot2::GeomPoint$default_aes`. Since
#' the `default_aes` is changed after [gghdx()] is run, the default geometries
#' in this function are hardcoded.
#'
#' @inherit hdx_geom_defaults examples return
#'
#' @export
ggplot2_geom_defaults <- function() {
  list(
    # geoms where we just need default color
    list(geom = "abline", new = list(color = "black")),
    list(geom = "point", new = list(
      color = "black",
      size = 1.5
    )),
    list(geom = "density", new = list(color = "black")),
    list(geom = "errorbar", new = list(color = "black")),
    list(geom = "hline", new = list(color = "black")),
    list(geom = "vline", new = list(color = "black")),
    list(geom = "line", new = list(color = "black")),

    # using dark grey for text
    list(geom = "text", new = list(color = "black")),

    # geoms where we just need default fill
    # using mint fill here since sapphire quite intense and contrasts with color
    list(geom = "area", new = list(fill = "grey20")),
    list(geom = "ribbon", new = list(fill = "grey20")),
    list(geom = "bar", new = list(fill = "grey35")),
    list(geom = "col", new = list(fill = "grey35")),

    # special geometries
    list(geom = "boxplot", new = list(
      color = "grey20",
      fill = "white"
    )),
    list(geom = "smooth", new = list(
      color = "#3366FF",
      fill = "grey60"
    )),
    list(geom = "dotplot", new = list(
      color = "black",
      fill = "black",
      size = NULL
    ))
  )
}
