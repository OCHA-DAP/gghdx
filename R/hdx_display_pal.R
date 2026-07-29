#' Display HDX palette
#'
#' Displays the HDX color palettes. By default, shows all values for all
#' palettes. You can change the number of values for each palette or only
#' show a subset of the available palettes (from `hdx_pal_...()`).
#'
#' @param n Number of colors for each palette to show.
#' @param palette Character vector of palettes to show.
#'
#' @return Plot of HDX color palettes.
#'
#' @examples
#' hdx_display_pal()
#' hdx_display_pal(n = 3)
#'
#' @export
hdx_display_pal <- function(
    n = NULL,
    palette = c(
      "discrete", "primary", "brand", "error",
      "gray", "mint", "sapphire", "tomato"
    )
) {
  # check the palette argument is correct
  palette <- rlang::arg_match(
    arg = palette,
    multiple = TRUE
  )

  pal_funs <- list(
    discrete = hdx_pal_discrete(),
    primary = hdx_pal_primary(),
    brand = hdx_pal_brand(),
    error = hdx_pal_error(),
    gray = hdx_pal_gray(),
    mint = hdx_pal_mint(),
    sapphire = hdx_pal_sapphire(),
    tomato = hdx_pal_tomato()
  )

  # use Roboto/Merriweather if loaded, falling back to Source Sans 3, then sans
  loaded_fonts <- sysfonts::font_families()
  base_family <- if ("Roboto" %in% loaded_fonts) {
    "Roboto"
  } else if ("Source Sans 3" %in% loaded_fonts) {
    "Source Sans 3"
  } else {
    "sans"
  }
  title_family <- if ("Merriweather" %in% loaded_fonts) {
    "Merriweather"
  } else {
    base_family
  }

  purrr::map(
    .x = palette,
    .f = function(pal) {
      pal_fun <- pal_funs[[pal]]
      if (is.null(n)) {
        n <- attributes(pal_fun)$max_n
      }

      data.frame(
        palette = pal,
        value = pal_fun(n),
        idx = 1:n
      )
    }
  ) %>%
    purrr::list_rbind() %>%
    ggplot2::ggplot(
      ggplot2::aes(
        x = idx,
        y = palette,
        fill = I(value)
      )
    ) +
    ggplot2::geom_tile(
      color = "white",
      linewidth = 1
    ) +
    theme_hdx(
      base_family = base_family,
      title_family = title_family
    ) +
    ggplot2::theme(
      panel.grid = ggplot2::element_blank(),
      axis.line = ggplot2::element_blank(),
      axis.text.x = ggplot2::element_blank()
    ) +
    ggplot2::labs(
      x = "",
      y = "",
      title = "gghdx palettes"
    )
}
