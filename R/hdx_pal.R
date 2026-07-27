#' HDX color palette (discrete)
#'
#' As of the 2025 HDX website redesign, `hdx_pal_discrete()` utilizes the
#' primary, brand, and error hues for up to a 12 element discrete scale. These
#' supersede the original sapphire, mint, and tomato hues, kept available
#' individually via `hdx_pal_sapphire()`, `hdx_pal_mint()`, and
#' `hdx_pal_tomato()` for backwards compatibility.
#'
#' `hdx_pal_primary()`, `hdx_pal_brand()`, and `hdx_pal_error()` allow for a
#' 4 element discrete scale using only the specified color. These are color
#' ramps with a range from dark, normal (HDX standard), light, and ultra
#' light. `hdx_pal_mint()`, `hdx_pal_tomato()`, and `hdx_pal_sapphire()`
#' provide the same 4 element ramps for the original palette.
#'
#' @family color hdx
#' @rdname pal_general
#'
#' @examples
#' hist(mtcars$mpg, col = hdx_pal_discrete()(5))
#'
#' @return A palette function.
#'
#' @export
hdx_pal_discrete <- function() {
  colors <- hdx_hex(
    c(
      "primary-5", "brand-5", "error-5",
      "brand-3", "error-3", "primary-3",
      "error-7", "primary-7", "brand-7",
      "brand-1", "primary-1", "error-1"
    )
  )
  names(colors) <- c(
    "primary-5", "brand-5", "error-5",
    "brand-3", "error-3", "primary-3",
    "error-7", "primary-7", "brand-7",
    "brand-1", "primary-1", "error-1"
  )

  max_n <- 12
  # error used only when necessary for odd # of colors
  f <- function(n) {
    check_pal_n(n, max_n)
    if (n == 1L) {
      i <- "brand-5"
    } else if (n == 2L) {
      i <- c("brand-5", "primary-5")
    } else if (n == 3L) {
      i <- c("brand-5", "primary-5", "error-5")
    } else if (n == 4L) {
      i <- c(
        "primary-5", "brand-5", "error-5",
        "brand-3"
      )
    } else if (n == 5L) {
      i <- c(
        "primary-5", "brand-5", "error-5",
        "brand-3", "error-3"
      )
    } else if (n == 6L) {
      i <- c(
        "primary-5", "brand-5", "error-5",
        "brand-3", "error-3", "primary-3"
      )
    } else if (n == 7L) {
      i <- c(
        "primary-5", "brand-5", "error-5",
        "brand-3", "error-3", "primary-3",
        "error-7"
      )
    } else if (n == 8L) {
      i <- c(
        "primary-5", "brand-5", "error-5",
        "brand-3", "error-3", "primary-3",
        "error-7", "primary-7"
      )
    } else if (n == 9L) {
      i <- c(
        "primary-5", "brand-5", "error-5",
        "brand-3", "error-3", "primary-3",
        "error-7", "primary-7", "brand-7"
      )
    } else if (n == 10L) {
      i <- c(
        "primary-5", "brand-5", "error-5",
        "brand-3", "error-3", "primary-3",
        "error-7", "primary-7", "brand-7",
        "brand-1"
      )
    } else if (n == 11L) {
      i <- c(
        "primary-5", "brand-5", "error-5",
        "brand-3", "error-3", "primary-3",
        "error-7", "primary-7", "brand-7",
        "brand-1", "primary-1"
      )
    } else if (n >= 12L) {
      i <- c(
        "primary-5", "brand-5", "error-5",
        "brand-3", "error-3", "primary-3",
        "error-7", "primary-7", "brand-7",
        "brand-1", "primary-1", "error-1"
      )
    }
    unname(colors[i])
  }

  attr(f, "max_n") <- max_n
  f
}

#' Color palette for single color
#'
#' `hdx_pal_general()` is an internal convenience function simply used
#' behind the 3 4-level color palettes for HDX, `hdx_pal_sapphire()`,
#' `hdx_pal_mint()`, and `hdx_pal_tomato()`.
#'
#' @param colors Input of sing
#' @param max_n Maximum colors in the palette
#'
#' @noRd
hdx_pal_general <- function(colors, max_n = 4) {
  f <- function(n) {
    check_pal_n(n, max_n)
    if (n == 1L) {
      i <- 2
    } else if (n == 2L) {
      i <- c(4, 2)
    } else if (n >= 3L) {
      i <- seq(max_n, max_n + 1 - min(n, max_n), -1)
    }
    unname(colors[i])
  }
  attr(f, "max_n") <- max_n
  f
}

#' @rdname pal_general
#' @export
hdx_pal_sapphire <- function() {
  hdx_pal_general(hdx_colors("sapphire"))
}

#' @rdname pal_general
#' @export
hdx_pal_primary <- function() {
  hdx_pal_general(
    hdx_hex(c("primary-7", "primary-5", "primary-3", "primary-1"))
  )
}

#' @rdname pal_general
#' @export
hdx_pal_brand <- function() {
  hdx_pal_general(hdx_hex(c("brand-7", "brand-5", "brand-3", "brand-1")))
}

#' @rdname pal_general
#' @export
hdx_pal_error <- function() {
  hdx_pal_general(hdx_hex(c("error-7", "error-5", "error-3", "error-1")))
}

#' @rdname pal_general
#' @export
hdx_pal_tomato <- function() {
  hdx_pal_general(hdx_colors("tomato"))
}

#' @rdname pal_general
#' @export
hdx_pal_mint <- function() {
  hdx_pal_general(hdx_colors("mint"))
}

#' @rdname pal_general
#' @export
hdx_pal_gray <- function() {
  hdx_pal_general(hdx_colors("gray"), 5)
}

#' Limit palette values
#'
#' Function to check `n` passed to a palette is not above the max. Copied
#' from [ggthemes](https://github.com/jrnold/ggthemes) package for convenience.
#'
#' @param n `n` passed by user
#' @param max_n Max `n` for this specific palette
#'
#' @noRd
check_pal_n <- function(n, max_n) {
  if (n > max_n) {
    warning(
      "This palette can handle a maximum of ",
      max_n,
      " values. ",
      "You have supplied ", n, "."
    )
  } else if (n < 0) {
    stop("`n` must be a non-negative integer.", call. = FALSE)
  }
}
