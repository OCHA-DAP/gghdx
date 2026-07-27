#' Hex values for HDX colors
#'
#' `hdx_colors()` conveniently returns a vector of hex values for specified
#' color ramps. Full values can be found in [gghdx::hdx_color_list]. If you
#' know the name of the color you want, such as "sapphire-hdx", you can use
#' `hdx_hex(c("sapphire-hdx"))` to directly access the hex code.
#'
#' All valid color names are in the named vector returned by `hdx_colors()` or
#' accessible in the convenient `hdx_color_names()`.
#'
#' As of the 2025 HDX website redesign, the "primary", "brand", "neutral",
#' "success", "warning", and "error" scales are also available, following the
#' step naming of the HDX design tokens (e.g. "primary-5" for the primary
#' scale's base blue, "neutral-2" for a hairline gridline gray). These are not
#' returned by default to avoid breaking existing uses of `hdx_colors()`;
#' request them explicitly, e.g. `hdx_colors("primary")`. The original
#' "sapphire", "mint", and "tomato" scales are kept for backwards
#' compatibility but are superseded by "primary"/"brand"/"error" going
#' forward.
#'
#' @param colors Specified color ramps to return. Some set of "sapphire",
#'     "mint", "tomato", "gray", "primary", "brand", "neutral", "success",
#'     "warning", and "error". By default returns the original "sapphire",
#'     "mint", "tomato", and "gray" colors.
#'
#' @returns
#'    * `hdx_colors()` returns a named vector of hex values.
#'    * `hdx_color_names()` returns a character vector of color names.
#'
#' @family color hdx
#' @rdname hdx_color
#'
#' @examples
#' # get hex values
#' hdx_colors()
#' hdx_colors("sapphire")
#'
#' # 2025 redesign colors
#' hdx_colors("primary")
#'
#' # get color names
#' hdx_color_names()
#'
#' @export
hdx_colors <- function(colors = c("sapphire", "mint", "tomato", "gray")) {
  # return NA if input is NA
  ln <- length(colors)
  if (all(is.na(colors)) && ln == 1) {
    return(NA_character_)
  }

  valid <- names(gghdx::hdx_color_list)
  if (!all(colors %in% valid) || ln == 0) {
    stop(
      "`colors` must specify some set of ",
      paste(paste0("'", valid, "'"), collapse = ", "),
      " in a character vector.",
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
#'     using `hdx_colors`
#'
#' @export
hdx_hex <- function(color_names) {
  ln <- length(color_names)
  if (all(is.na(color_names)) && ln == 1) {
    return(NA_character_)
  }
  # allow for alternate spelling of gray
  color_names <- gsub(
    pattern = "grey",
    replacement = "gray",
    x = color_names
  )

  if (!all(color_names %in% hdx_color_names()) || ln == 0) {
    stop(
      "Not all color names are valid. Check `hdx_color_names()` for ",
      "all valid values.",
      call. = FALSE
    )
  }

  unname(hdx_colors_all()[color_names])
}

#' @rdname hdx_color
#' @export
hdx_color_names <- function() {
  unname(names(hdx_colors_all()))
}

#' All HDX colors, across legacy and 2025 redesign scales
#'
#' Unlike [hdx_colors()], which defaults to only the original "sapphire",
#' "mint", "tomato", and "gray" scales for backwards compatibility, this
#' returns every scale in [gghdx::hdx_color_list]. Used internally by
#' [hdx_hex()] and [hdx_color_names()] so both legacy and 2025 redesign color
#' names are accessible by name.
#'
#' @noRd
hdx_colors_all <- function() {
  hdx_colors(names(gghdx::hdx_color_list))
}

#' @rdname hdx_color
#' @export
hdx_colour_names <- hdx_color_names
