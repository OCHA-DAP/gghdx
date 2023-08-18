#' Set HDX theme
#'
#' `gghdx()` gives you the convenience of `theme_hdx()` without having to
#' explicitly call it for each plot. It also allows for setting the default
#' continuous and discrete scales to follow the HDX color scheme, including
#' default line and point colors and area fills.
#'
#' @details
#' `gghdx()` changes global settings for this R session. This includes updating
#' the ggplot2 default geometries using `ggplot2::update_geom_defaults()` and
#' setting global options to scale color and fill for ggplot2:
#'
#' * `options("ggplot2.discrete.fill")`
#' * `options("ggplot2.discrete.colour")`
#' * `options("ggplot2.continuous.fill")`
#' * `options("ggplot2.continous.colour")`
#'
#' The default discrete scale is `scale_..._hdx()` for both `fill` and `color`.
#' For continuous scales, the default is `scale_fill_gradient_hdx_mint()` for
#' fill and `scale_color_gradient_hdx_sapphire()` for color.
#'
#' Once `gghdx()` is run, the easiest way to return to the default ggplot2
#' settings is to restart your R session. Without restarting the session, you
#' can make some changes:
#'
#' * `ggplot2::reset_theme_settings()`: resets the global theme to default.
#' * For all of the options listed above, run `options("option") <- NULL`.
#' * `showtext::showtext_end()` to stop using the showtext library if it was
#' activated.
#'
#' There is no easy way to update the default geometries, but you can manually
#' use `ggplot2::update_geom_defaults()` if you desire.
#'
#' @inheritParams theme_hdx
#' @param showtext `logical` If `TRUE`, uses the showtext package to add
#'     the Source Sans 3 font and runs `showtext_auto()` so all future plots
#'     in this session will use the font.
#'
#' @examples
#'
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
#' # automatically use the gghdx theme and visuals
#' gghdx()
#' p
#'
#' @seealso `gghdx()` relies on the following functions:
#' * [theme_hdx()] as the default theme.
#' * [load_source_sans_3()] to load the font and activate showtext.
#' * [hdx_geom_defaults()] as the default geometries to set with
#'    `ggplot2::update_geom_defaults()`.
#' * [scale_color_hdx_discrete()] and other family of functions to set standard
#'     fill and color scales.
#'
#' @returns No return value, run for the side effects described in Details.
#'
#' @export
gghdx <- function(showtext = TRUE,
                  base_size = 10,
                  base_family = "Source Sans 3",
                  horizontal = TRUE) {
  colors <- hdx_colors()

  # check the fonts are loaded correctly
  if (showtext) {
    load_source_sans_3()
  }

  check_font(base_family)

  # set the theme
  ggplot2::theme_set(
    theme_hdx(
      base_size = base_size,
      base_family = base_family,
      horizontal = horizontal
    )
  )

  # updating geom defaults (like default color of a point or fill for bar)
  purrr::walk(
    hdx_geom_defaults(),
    ~ do.call(what = ggplot2::update_geom_defaults, args = .),
  )

  # set default scales
  options("ggplot2.discrete.fill" = scale_fill_hdx_discrete)
  options("ggplot2.discrete.colour" = scale_color_hdx_discrete)
  options("ggplot2.continuous.fill" = scale_fill_gradient_hdx_mint)
  options("ggplot2.continuous.colour" = scale_color_gradient_hdx_sapphire)

  # return nothing
  NULL
}
