#' Set HDX theme
#'
#' `gghdx()` gives you the convenience of `theme_hdx()` without having to
#' explicitly call it for each plot. It also allows for setting the default
#' continuous and discrete scales to follow the HDX color scheme, including
#' default line and point colors and area fills.
#'
#' The default discrete scale is `scale_..._hdx()` for both `fill` and `color`.
#' For continuous scales, the default is `scale_fill_gradient_hdx_mint()` for
#' fill and `scale_color_gradient_hdx_sapphire()` for color.
#'
#' @inheritParams theme_hdx
#' @param showtext `logical` If `TRUE`, uses the showtext package to add
#'     the Source Sans Pro font and runs `showtext_auto()` so all future plots
#'     in this session will use the font.
#'
#' @export
gghdx <- function(showtext = TRUE,
                  base_size = 10,
                  base_family = "Source Sans Pro",
                  horizontal = TRUE) {
  colors <- hdx_colors()

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
    geom_defaults(),
    ~ do.call(what = ggplot2::update_geom_defaults, args = .),
  )

  # set default scales
  options("ggplot2.discrete.fill" = scale_fill_hdx)
  options("ggplot2.discrete.colour" = scale_color_hdx)
  options("ggplot2.continuous.fill" = scale_fill_gradient_hdx_mint)
  options("ggplot2.continuous.colour" = scale_color_gradient_hdx_sapphire)

  if (showtext) {
    st_chk <- requireNamespace("showtext", quietly = TRUE)
    sf_chk <- requireNamespace("sysfonts", quietly = TRUE)
    if (!(st_chk && sf_chk)) {
      stop(
        "The showtext and sysfonts packages must be installed to automatically",
        "load and use the Source Sans Pro font.",
        call. = FALSE
      )
    }
    sysfonts::font_add_google("Source Sans Pro")
    showtext::showtext_auto()
  }
}

#' Default geometry fills
#'
#' Default geometry fills to be used when the HDX theme is set. This allows for
#' setting default fill and point values for all plots, which is not possible
#' using just `theme_hdx()`. Derived from the
#' [ggthemr](https://github.com/Mikata-Project/ggthemr/) methods.
#'
#' @noRd
geom_defaults <- function() {
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
