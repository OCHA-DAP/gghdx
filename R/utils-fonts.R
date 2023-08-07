#' Load and use Source Sans Pro
#'
#' Simple wrapped for `sysfonts::font_add_google()` and
#' `showtext::showtext_auto()` to load the Source Sans Pro font and
#' specify all plots to use `showtext` in all plots automatically.
#'
#' @export
load_source_sans_pro <- function() {
  sysfonts::font_add_google("Source Sans Pro")
  showtext::showtext_auto()
}

#' Check font availability
#'
#' @noRd
check_font <- function(family) {
  fonts <- sysfonts::font_families()
  # if already in font families, ignore
  if (!(family %in% fonts)) {
    if (family == "Source Sans Pro") {
      stop(
        "Source Sans Pro not available. Load the font with the sysfonts and ",
        "showfonts libraries or use `load_source_sans_pro()` to automatically ",
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
