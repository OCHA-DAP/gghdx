#' Load and use the HDX 2025 redesign fonts
#'
#' Simple wrapper for `sysfonts::font_add_google()` and
#' `showtext::showtext_auto()` to load the two fonts used in the HDX
#' website's 2025 redesign,
#' [Merriweather](https://fonts.google.com/specimen/Merriweather) for display
#' and heading text, and [Roboto](https://fonts.google.com/specimen/Roboto)
#' for body text, and specify all plots to automatically use showtext. Use to
#' load the default font families for [theme_hdx()] and [gghdx()].
#'
#' @details
#' By default, both fonts are loaded from Google using
#' `sysfonts::font_add_google()`. If an internet connection is unavailable,
#' then attempts to use locally installed versions of the fonts using
#' `sysfonts::font_add(family, regular)`. If you have the fonts installed but
#' still receive an error from this function, check the `*_family` and
#' `*_regular` arguments match your installed fonts.
#'
#' @param display_family Character string for the Merriweather family name to
#'     register, used whether the font is downloaded from Google or loaded
#'     locally. If `NULL`, defaults to `"Merriweather"`, the standard family
#'     name. See "Details" in the [sysfonts::font_add()] documentation for
#'     further explanation.
#' @param display_regular Path to the font file for the Merriweather regular
#'     font face. If `NULL`, defaults to `"Merriweather-Regular.ttf"`, the
#'     standard file name downloaded from
#'     [Merriweather](https://fonts.google.com/specimen/Merriweather). Used
#'     only when no internet connection is available to directly load from
#'     Google.
#' @param body_family Character string for the Roboto family name to
#'     register, used whether the font is downloaded from Google or loaded
#'     locally. If `NULL`, defaults to `"Roboto"`, the standard family name.
#' @param body_regular Path to the font file for the Roboto regular font
#'     face. If `NULL`, defaults to `"Roboto-Regular.ttf"`, the standard file
#'     name downloaded from [Roboto](https://fonts.google.com/specimen/Roboto).
#'     Used only when no internet connection is available to directly load
#'     from Google.
#'
#' @examples
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
#' # font not loaded so an error will be generated
#' try(p + theme_hdx())
#'
#' try(load_hdx_fonts())
#'
#' try(p + theme_hdx())
#'
#' @return Nothing, run for side effect of loading the fonts and activating
#'     showtext.
#'
#' @seealso [gghdx()] for automatically running `load_hdx_fonts()`, along
#'     with other styling. [load_source_sans_3()] to instead load the
#'     original HDX font, kept for backwards compatibility.
#'
#' @export
load_hdx_fonts <- function(
    display_family = NULL,
    display_regular = NULL,
    body_family = NULL,
    body_regular = NULL) {
  if (is.null(display_family)) {
    display_family <- "Merriweather"
  }
  if (is.null(display_regular)) {
    display_regular <- "Merriweather-Regular.ttf"
  }
  if (is.null(body_family)) {
    body_family <- "Roboto"
  }
  if (is.null(body_regular)) {
    body_regular <- "Roboto-Regular.ttf"
  }

  tryCatch(
    sysfonts::font_add_google("Merriweather", family = display_family),
    error = function(cond) {
      message(
        "Unable to download Merriweather using `sysfonts::font_add_google`, ",
        "loading the font locally."
      )
      load_google_font_local(
        google_name = "Merriweather",
        family = display_family,
        regular = display_regular
      )
    }
  )

  tryCatch(
    sysfonts::font_add_google("Roboto", family = body_family),
    error = function(cond) {
      message(
        "Unable to download Roboto using `sysfonts::font_add_google`, ",
        "loading the font locally."
      )
      load_google_font_local(
        google_name = "Roboto",
        family = body_family,
        regular = body_regular
      )
    }
  )

  showtext::showtext_auto()
}
