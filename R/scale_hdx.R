#' HDX color scales
#'
#' Color scales using the HDX palette. For discrete color scales, the
#' `scale_color_hdx_...()` and `scale_fill_hdx_...()` family of functions are
#' available. For gradient scales, use `scale_color_gradient_hdx()` and
#' `scale_fill_gradient_hdx()` functions for a single color scale or
#' `scale_..._gradient2...()` alternative.
#'
#' @inheritParams ggplot2::scale_color_hue
#' @inheritParams hdx_pal
#' @inheritParams ggplot2::scale_color_gradient2
#' @rdname scale_hdx
#'
#' @examples
#' library(ggplot2)
#'
#' # discrete scaling
#' p1 <- ggplot(iris) +
#'   geom_point(
#'     aes(
#'       x = Sepal.Length,
#'       y = Petal.Width,
#'       color = Species
#'     )
#'   )
#'
#' p1
#'
#' p1 + scale_color_hdx_discrete()
#' p1 + scale_color_hdx_mint()
#'
#' # use gradient scaling
#' p2 <- ggplot(iris) +
#'   geom_point(
#'     aes(
#'       x = Sepal.Length,
#'       y = Petal.Width,
#'       color = Petal.Length
#'     )
#'   )
#'
#' p2
#'
#' p2 + scale_color_gradient_hdx_mint()
#' p2 + scale_color_gradient_hdx_tomato()
#'
#' @return Relevant ggplot2 scale object to add to a `ggplot2::ggplot()` plot,
#'     either `ggplot2::ScaleDiscrete` or `ggplot2::ScaleContinuous`.
#'
#' @seealso [gghdx()] for setting default fill and color scaling,
#'     along with other styling.
#'
#' @export
scale_color_hdx_discrete <- function(na.value = hdx_hex("gray-light"), ...) {
  ggplot2::discrete_scale(
    aesthetics = "colour",
    scale_name = scale_name(),
    palette = hdx_pal_discrete(),
    na.value = na.value,
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_colour_hdx_discrete <- scale_color_hdx_discrete

#' @rdname scale_hdx
#' @export
scale_color_hdx_gray <- function(na.value = hdx_hex("tomato-hdx"), ...) {
  ggplot2::discrete_scale(
    aesthetics = "colour",
    scale_name = scale_name(),
    palette = hdx_pal_gray(),
    na.value = na.value,
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_colour_hdx_gray <- scale_color_hdx_gray

#' @rdname scale_hdx
#' @export
scale_colour_hdx_grey <- scale_color_hdx_gray

#' @rdname scale_hdx
#' @export
scale_color_hdx_grey <- scale_color_hdx_gray

#' @rdname scale_hdx
#' @export
scale_color_hdx_mint <- function(na.value = hdx_hex("gray-light"), ...) {
  ggplot2::discrete_scale(
    aesthetics = "colour",
    scale_name = scale_name(),
    palette = hdx_pal_mint(),
    na.value = na.value,
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_colour_hdx_mint <- scale_color_hdx_mint

#' @rdname scale_hdx
#' @export
scale_color_hdx_sapphire <- function(na.value = hdx_hex("gray-light"), ...) {
  ggplot2::discrete_scale(
    aesthetic = "colour",
    scale_name = scale_name(),
    palette = hdx_pal_sapphire(),
    na.value = na.value,
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_colour_hdx_sapphire <- scale_color_hdx_sapphire

#' @rdname scale_hdx
#' @export
scale_color_hdx_tomato <- function(na.value = hdx_hex("gray-light"), ...) {
  ggplot2::discrete_scale(
    aesthetics = "colour",
    scale_name = scale_name(),
    palette = hdx_pal_tomato(),
    na.value = na.value,
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_colour_hdx_tomato <- scale_color_hdx_tomato

#' @rdname scale_hdx
#' @export
scale_fill_hdx_discrete <- function(na.value = hdx_hex("gray-light"), ...) {
  ggplot2::discrete_scale(
    aesthetics = "fill",
    scale_name = scale_name(),
    palette = hdx_pal_discrete(),
    na.value = na.value,
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_fill_hdx_gray <- function(na.value = hdx_hex("tomato-hdx"), ...) {
  ggplot2::discrete_scale(
    aesthetics = "fill",
    scale_name = scale_name(),
    palette = hdx_pal_gray(),
    na.value = na.value,
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_fill_hdx_grey <- scale_fill_hdx_gray

#' @rdname scale_hdx
#' @export
scale_fill_hdx_mint <- function(na.value = hdx_hex("gray-light"), ...) {
  ggplot2::discrete_scale(
    aesthetics = "fill",
    scale_name = scale_name(),
    palette = hdx_pal_mint(),
    na.value = na.value,
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_fill_hdx_sapphire <- function(na.value = hdx_hex("gray-light"), ...) {
  ggplot2::discrete_scale(
    aesthetics = "fill",
    scale_name = scale_name(),
    palette = hdx_pal_sapphire(),
    na.value = na.value,
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_fill_hdx_tomato <- function(na.value = hdx_hex("gray-light"), ...) {
  ggplot2::discrete_scale(
    aesthetics = "fill",
    scale_name = scale_name(),
    palette = hdx_pal_tomato(),
    na.value = na.value,
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_fill_gradient_hdx <- function(na.value = "transparent", ...) {
  ggplot2::continuous_scale(
    aesthetics = "fill",
    scale_name = scale_name(),
    palette = scales::seq_gradient_pal(
      low = hdx_hex("tomato-hdx"),
      high = hdx_hex("sapphire-hdx")
    ),
    guide = "colorbar",
    na.value = na.value,
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_fill_gradient_hdx_sapphire <- function(na.value = "transparent", ...) {
  ggplot2::continuous_scale(
    aesthetics = "fill",
    scale_name = scale_name(),
    palette = scales::seq_gradient_pal(
      low = "white",
      high = hdx_hex("sapphire-hdx")
    ),
    guide = "colorbar",
    na.value = na.value,
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_fill_gradient_hdx_mint <- function(na.value = "transparent", ...) {
  ggplot2::continuous_scale(
    aesthetics = "fill",
    scale_name = scale_name(),
    palette = scales::seq_gradient_pal(
      low = "white",
      high = hdx_hex("mint-hdx")
    ),
    guide = "colorbar",
    na.value = na.value,
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_fill_gradient_hdx_tomato <- function(na.value = "transparent", ...) {
  ggplot2::continuous_scale(
    aesthetics = "fill",
    scale_name = scale_name(),
    palette = scales::seq_gradient_pal(
      low = "white",
      high = hdx_hex("tomato-hdx")
    ),
    guide = "colorbar",
    na.value = na.value,
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_color_gradient_hdx <- function(na.value = "transparent", ...) {
  ggplot2::continuous_scale(
    aesthetics = "color",
    scale_name = scale_name(),
    palette = scales::seq_gradient_pal(
      low = hdx_hex("tomato-hdx"),
      high = hdx_hex("sapphire-hdx")
    ),
    guide = "colorbar",
    na.value = na.value,
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_colour_gradient_hdx <- scale_color_gradient_hdx

#' @rdname scale_hdx
#' @export
scale_color_gradient_hdx_sapphire <- function(na.value = "transparent", ...) {
  ggplot2::continuous_scale(
    aesthetics = "color",
    scale_name = scale_name(),
    palette = scales::seq_gradient_pal(
      low = "white",
      high = hdx_hex("sapphire-hdx")
    ),
    guide = "colorbar",
    na.value = na.value,
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_colour_gradient_hdx_sapphire <- scale_color_gradient_hdx_sapphire

#' @rdname scale_hdx
#' @export
scale_color_gradient_hdx_mint <- function(na.value = "transparent", ...) {
  ggplot2::continuous_scale(
    aesthetics = "color",
    scale_name = scale_name(),
    palette = scales::seq_gradient_pal(
      low = "white",
      high = hdx_hex("mint-hdx")
    ),
    guide = "colorbar",
    na.value = na.value,
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_colour_gradient_hdx_mint <- scale_color_gradient_hdx_mint

#' @rdname scale_hdx
#' @export
scale_color_gradient_hdx_tomato <- function(na.value = "transparent", ...) {
  ggplot2::continuous_scale(
    aesthetics = "color",
    scale_name = scale_name(),
    palette = scales::seq_gradient_pal(
      low = "white",
      high = hdx_hex("tomato-hdx")
    ),
    guide = "colorbar",
    na.value = na.value,
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_colour_gradient_hdx_tomato <- scale_color_gradient_hdx_tomato

#' @rdname scale_hdx
#' @export
scale_color_gradient2_hdx <- function(na.value = "transparent", ...) {
  ggplot2::continuous_scale(
    aesthetics = "color",
    scale_name = scale_name(),
    palette = scales::div_gradient_pal(
      low = hdx_hex("tomato-hdx"),
      mid = hdx_hex("gray-white"),
      high = hdx_hex("sapphire-hdx")
    ),
    guide = "colorbar",
    na.value = na.value,
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_colour_gradient2_hdx <- scale_color_gradient2_hdx

#' @rdname scale_hdx
#' @export
scale_fill_gradient2_hdx <- function(na.value = "transparent", ...) {
  ggplot2::continuous_scale(
    aesthetics = "fill",
    scale_name = scale_name(),
    palette = scales::div_gradient_pal(
      low = hdx_hex("tomato-hdx"),
      mid = hdx_hex("gray-white"),
      high = hdx_hex("sapphire-hdx")
    ),
    guide = "colorbar",
    na.value = na.value,
    ...
  )
}
