#' Hex values for HDX colors
#'
#' `hdx_colors()` conveniently returns a vector of hex values for specified
#' color ramps. Full values can be found in [gghdx::hdx_color_list].
#'
#' @param colors Specified color ramps to return. Some set of "sapphire",
#'     "mint", "tomato", and "gray. By default returns all colors.
#'
#' @return Named vector of hex values.
#' @family color hdx
#' @rdname hdx_color
#' @export
hdx_colors <- function(colors = c("sapphire", "mint", "tomato", "gray")) {
  defaults <- eval(formals()$colors)
  if (!all(colors %in% defaults) || length(colors) == 0) {
    stop(
      "`colors` must specify some set of 'sapphire', 'mint', 'tomato', and",
      "'gray' in a character vector.",
      call. = FALSE
    )
  }

  # create data frame of colors
  df <- purrr::imap_dfr(
    gghdx::hdx_color_list[colors],
    ~ dplyr::mutate(
      .x,
      name = paste(.y, name, sep = "-")
    )
  )

  tibble::deframe(df)
}

#' @rdname hdx_color
#' @export
hdx_colours <- hdx_colors
