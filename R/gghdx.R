#' Set HDX theme and aesthetics
#'
#' `gghdx()` gives you the convenience of `theme_hdx()` without having to
#' explicitly call it for each plot. It also allows for setting the default
#' continuous and discrete scales to follow the HDX color scheme, including
#' default line and point colors and area fills. `gghdx_reset()` returns
#' all of these values back to the defaults.
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
#' For continuous scales, the default is `scale_fill_gradient_hdx_primary()`
#' for fill and `scale_color_gradient_hdx_primary()` for color. Passing
#' `design = "legacy"` uses the pre-2025 equivalents instead
#' (`scale_fill_gradient_hdx_mint()` and `scale_color_gradient_hdx_sapphire()`
#' for continuous scales), so a report that isn't ready to move to the new
#' look can call `gghdx(design = "legacy")` to keep rendering as it did in
#' gghdx 0.1.4.
#'
#' Once `gghdx()` is run, the easiest way to return to the default ggplot2
#' settings is to run `gghdx_reset()`. This will make changes by running:
#'
#' * `ggplot2::reset_theme_settings()`: resets the global theme to default.
#' * For all of the options listed above, run `options("option") <- NULL`.
#' * `showtext::showtext_end()` to stop using the showtext library if it was
#' activated.
#' * Runs `ggplot2::update_geom_defaults()` for all geometries in
#' [ggplot2_geom_defaults()].
#'
#' You can also simply restart your R session to return to the defaults.
#'
#' @inheritParams theme_hdx
#' @param showtext `logical` If `TRUE`, uses the showtext package to add
#'     the Roboto and Merriweather fonts (or, when `design = "legacy"`,
#'     Source Sans 3) and runs `showtext_auto()` so all future plots in this
#'     session will use them.
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
#' # see the plot using base aesthetics
#' p
#'
#' # downloading the HDX fonts is slow, so it's wrapped in \donttest{} rather
#' # than run on every check
#' \donttest{
#' # automatically use the gghdx theme and visuals
#' try(gghdx())
#' p
#'
#' # get rid of the changes of gghdx
#' gghdx_reset()
#' p
#'
#' # keep the pre-2025 look instead
#' try(gghdx(design = "legacy"))
#' p
#' gghdx_reset()
#' }
#'
#' @seealso `gghdx()` relies on the following functions:
#' * [theme_hdx()] as the default theme.
#' * [load_hdx_fonts()] to load the fonts and activate showtext.
#' * [hdx_geom_defaults()] as the default geometries to set with
#'    `ggplot2::update_geom_defaults()`.
#' * [scale_color_hdx_discrete()] and other family of functions to set standard
#'     fill and color scales.
#'
#' @returns No return value, run for the side effects described in Details.
#' @rdname gghdx
#'
#' @export
gghdx <- function(showtext = TRUE,
                  base_size = 10,
                  base_family = NULL,
                  horizontal = TRUE,
                  title_family = NULL,
                  design = c("2025", "legacy")) {
  design <- rlang::arg_match(design)

  if (design == "legacy" && is.null(base_family)) {
    base_family <- "Source Sans 3"
  }

  # check the fonts are loaded correctly
  if (showtext) {
    if (design == "legacy") {
      load_source_sans_3()
    } else {
      load_hdx_fonts()
    }
  }

  # set the theme
  ggplot2::theme_set(
    theme_hdx(
      base_size = base_size,
      base_family = base_family,
      horizontal = horizontal,
      title_family = title_family,
      design = design
    )
  )

  # updating geom defaults (like default color of a point or fill for bar)
  purrr::walk(
    hdx_geom_defaults(design = design),
    ~ do.call(what = ggplot2::update_geom_defaults, args = .),
  )

  # set default scales
  options(
    "ggplot2.discrete.fill" = function(...) {
      scale_fill_hdx_discrete(design = design, ...)
    }
  )
  options(
    "ggplot2.discrete.colour" = function(...) {
      scale_color_hdx_discrete(design = design, ...)
    }
  )
  options(
    "ggplot2.continuous.fill" = if (design == "legacy") {
      scale_fill_gradient_hdx_mint
    } else {
      scale_fill_gradient_hdx_primary
    }
  )
  options(
    "ggplot2.continuous.colour" = if (design == "legacy") {
      scale_color_gradient_hdx_sapphire
    } else {
      scale_color_gradient_hdx_primary
    }
  )

  # return nothing
  invisible(NULL)
}

#' Reset HDX theme and aesthetics
#'
#' @rdname gghdx
#' @export
gghdx_reset <- function() {
  # stop using showtext fonts
  # errors are generated if there is no current graphics device (no plot made)
  # so we have to catch that error
  tryCatch(
    showtext::showtext_end(),
    error = function(cond) {
      message(
        "No active graphics device, so `showtext::showtext_end()` not run."
      )
    }
  )


  # reset the theme
  ggplot2::reset_theme_settings()

  # updating geom defaults to the originals
  purrr::walk(
    ggplot2_geom_defaults(),
    ~ do.call(what = ggplot2::update_geom_defaults, args = .),
  )

  # return to default scales
  options("ggplot2.discrete.fill" = NULL)
  options("ggplot2.discrete.colour" = NULL)
  options("ggplot2.continuous.fill" = NULL)
  options("ggplot2.continuous.colour" = NULL)

  # return nothing
  invisible(NULL)
}
