#' Load and use Source Sans 3
#'
#' Simple wrapper for `sysfonts::font_add_google()` and
#' `showtext::showtext_auto()` to load the
#' [Source Sans 3 font](https://fonts.google.com/specimen/Source+Sans+3) and
#' specify all plots to automatically use showtext. Use to load the default
#' font family for [geom_text_hdx()] and [geom_label_hdx()].
#'
#' @details
#' By default, the font is loaded from Google using `sysfonts::font_add_google()`.
#' If an internet connection is unavailable, then attempts to use a locally
#' installed version of the font using `sysfonts::font_add(family, regular)`.
#' If you have the font installed but still receive an error from this function,
#' check the `family` and `regular` arguments match your installed font.
#'
#' @param family Character string for the Source Sans 3 family. If `NULL`,
#'     defaults to `"Source Sans 3"`, the standard family name. See "Details"
#'     in the [sysfonts::font_add()] documentation for further explanation. Used
#'     only when no internet connection is available to directly load from
#'     Google.
#' @param regular Path to the font file for the regular font face. If `NULL`,
#'     defaults to `"SourceSans3-Regular.ttf"`, the standard file name downloaded
#'     from [Source Sans 3](https://fonts.google.com/specimen/Source+Sans+3).
#'     Used only when no internet connection is available to directly load from
#'     Google.
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
#' try(load_source_sans_3())
#'
#' try(p + geom_label_hdx())
#'
#' @return Nothing, run for side effect of loading the font and activating
#'     showtext.
#'
#' @seealso [gghdx()] for automatically running `load_source_sans_3()`,
#'     along with other styling.
#'
#' @export
load_source_sans_3 <- function(
    family = NULL,
    regular = NULL
) {
  tryCatch(
    sysfonts::font_add_google("Source Sans 3"),
    error = function(cond) {
      message(
        "Unable to download Source Sans 3 using `sysfonts::font_add_google`, ",
        "loading the font locally."
      )
      load_source_sans_3_local(family, regular)
    }
  )
  showtext::showtext_auto()
}

#' Load Source Sans 3 locally
#'
#' Load Source Sans 3 from the locally installed fonts. This is done if a
#' connection to Google is unavailable, so the function can still run.
#'
#' @noRd
load_source_sans_3_local <- function(family, regular) {
  # set the standard defaults for family and regular
  # based on downloading from Google
  if (is.null(family)) {
    family <- "Source Sans 3"
  }
  if (is.null(regular)) {
    regular <- "SourceSans3-Regular.ttf"
  }
  load_google_font_local(
    google_name = "Source Sans 3",
    family = family,
    regular = regular
  )
}

#' Load a Google font locally
#'
#' Shared fallback used when a Google font can't be downloaded through
#' `sysfonts::font_add_google()`, so the locally installed version is used
#' instead. Used by [load_source_sans_3()] and [load_hdx_fonts()].
#'
#' @param google_name Name of the font as listed on Google Fonts, used only
#'     in the error message if the local font is also unavailable.
#' @param family Font family name to register with `sysfonts::font_add()`.
#' @param regular Path to the regular font face file.
#'
#' @noRd
load_google_font_local <- function(google_name, family, regular) {
  tryCatch(
    sysfonts::font_add(
      family = family,
      regular = regular
    ),
    error = function(cond) {
      message("")
      stop(
        "The ", google_name, " font was not accessible through ",
        "`sysfonts::font_add_google()`, likely due to connection issues.\n\n",
        "If you do not have a connection, ensure the font is installed and the ",
        "correct `family` and `regular` arguments are passed for use in ",
        "`sysfonts::font_add()`. Otherwise, use a pre-installed font family ",
        "such as sans by running `gghdx(showtext = FALSE, base_family = 'sans')`.",
        call. = FALSE
      )
    }
  )
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
      "libraries to simplify installation and usage of fonts.\n\n",
      "If you are upgrading from gghdx <= 0.1.4: as of 0.2.0, `theme_hdx()` ",
      "and `gghdx()` default to Roboto and Merriweather instead of Source ",
      "Sans 3. Call `load_hdx_fonts()` to load both, or pass ",
      "`design = \"legacy\"` to keep the pre-0.2.0 look with Source Sans 3.",
      call. = FALSE
    )
  }
}
