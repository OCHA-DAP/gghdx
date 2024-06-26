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
    palette = c("discrete", "gray", "mint", "sapphire", "tomato")
) {
  # check the palette argument is correct
  palette <- rlang::arg_match(
    arg = palette,
    multiple = TRUE
  )

  pal_funs <- list(
    discrete = hdx_pal_discrete(),
    gray = hdx_pal_gray(),
    mint = hdx_pal_mint(),
    sapphire = hdx_pal_sapphire(),
    tomato = hdx_pal_tomato()
  )

  # check source sans 3 is laoded, and if so, use that font, otherwise use sans
  if (!("Source Sans 3" %in% sysfonts::font_families())) {
    base_family <- "sans"
  } else {
    base_family <- "Source Sans 3"
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
      base_family = base_family
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
