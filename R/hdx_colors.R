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
#' @param colors Specified color ramps to return. Some set of "sapphire",
#'     "mint", "tomato", and "gray. By default returns all colors.
#'
#' @return Named vector of hex values.
#' @family color hdx
#' @rdname hdx_color
#'
#' @examples
#' hdx_colors()
#' hdx_colors("sapphire")
#'
#'
#' @export
hdx_colors <- function(colors = c("sapphire", "mint", "tomato", "gray")) {
  # return NA if input is NA
  ln <- length(colors)
  if (all(is.na(colors)) && ln == 1) {
    return(NA_character_)
  }

  defaults <- eval(formals()$colors)
  if (!all(colors %in% defaults) || ln == 0) {
    stop(
      "`colors` must specify some set of 'sapphire', 'mint', 'tomato', and ",
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

  unname(hdx_colors()[color_names])
}

#' @rdname hdx_color
#' @export
hdx_color_names <- function() {
  unname(names(hdx_colors()))
}

#' @rdname hdx_color
#' @export
hdx_colour_names <- hdx_color_names
