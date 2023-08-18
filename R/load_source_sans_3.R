#' Load and use Source Sans 3
#'
#' Simple wrapper for `sysfonts::font_add_google()` and
#' `showtext::showtext_auto()` to load the
#' [Source Sans 3 font](https://fonts.google.com/specimen/Source+Sans+3) and
#' specify all plots to automatically use showtext. Use to load the default
#' font family for [geom_text_hdx()] and [geom_label_hdx()].
#'
#' @examples
#' library(ggplot2)
#' p <- ggplot(
#'   data = mtcars,
#'   mapping = aes(
#'     x = mpg,
#'     y = mpg,
#'     label = rownames(mtcars)
#'   )
#' )
#'
#' # font not loaded so error will be generated
#' try(p + geom_label_hdx())
#'
#' load_source_sans_3()
#'
#' p + geom_label_hdx()
#'
#' @return Nothing, run for side effect of loading the font and activating
#'     showtext.
#'
#' @seealso [gghdx()] for automatically running `load_source_sans_3()`,
#'     along with other styling.
#'
#' @export
load_source_sans_3 <- function() {
  sysfonts::font_add_google("Source Sans 3")
  showtext::showtext_auto()
}

#' Check font availability
#'
#' @noRd
check_font <- function(family) {
  fonts <- sysfonts::font_families()
  # if already in font families, ignore
  if (!(family %in% fonts)) {
    if (family == "Source Sans 3") {
      stop(
        "Source Sans 3 not available. Load the font with the sysfonts and ",
        "showfonts libraries or use `load_source_sans_3()` to automatically ",
        "load the fonts.",
        call. = FALSE
      )
    }

    stop(
      family,
      " not in available fonts. You can use the sysfonts and showtext ",
      "libraries to simplify installation and usage of fonts.",
      call. = FALSE
    )
  }
}
