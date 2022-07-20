#' Hex values for HDX colors
#'
#' `hdx_colors()` conveniently returns a vector of hex values for specified
#' color ramps. Full values can be found in [gghdx::hdx_color_list]. If you
#' know the name of the color you want, such as "sapphire-hdx", you can use
#' `hdx_hex(c("sapphire-hdx"))` to directly access the hex code.
#'
#' All valid color names are in the named vector returned by `hdx_colors()` or
#' accessible in the convenient `hdx_colors_names()`.
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

#' @rdname hdx_color
#' @param color_names Vector of color names. Valid values are all available
#'
#' @export
hdx_hex <- function(color_names) {
  if (!all(color_names %in% hdx_colors_names())) {
    stop(
      "Not all color names are valid. Check `hdx_colors_names()` for",
      "all valid values.",
      call. = FALSE
    )
  }
  hdx_colors()[color_names]
}

#' @rdname hdx_color
#' @export
hdx_colors_names <- function() {
  unname(names(hdx_colors()))
}

#' @rdname hdx_color
#' @export
hdx_colours_names <- hdx_colors_names
