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
#' @return Relevant ggplot2 scaling.
#'
#' @export
scale_color_hdx_discrete <- function(...) {
  ggplot2::discrete_scale(
    "colour",
    "hdx",
    hdx_pal_discrete(),
    na.value = hdx_hex("gray-light"),
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_colour_hdx_discrete <- scale_color_hdx_discrete

#' @rdname scale_hdx
#' @export
scale_color_hdx_gray <- function(...) {
  ggplot2::discrete_scale(
    "colour",
    "hdx",
    hdx_pal_gray(),
    na.value = hdx_hex("tomato-hdx"),
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
scale_color_hdx_mint <- function(...) {
  ggplot2::discrete_scale(
    "colour",
    "hdx",
    hdx_pal_mint(),
    na.value = hdx_hex("gray-light"),
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_colour_hdx_mint <- scale_color_hdx_mint

#' @rdname scale_hdx
#' @export
scale_color_hdx_sapphire <- function(...) {
  ggplot2::discrete_scale(
    "colour",
    "hdx",
    hdx_pal_sapphire(),
    na.value = hdx_hex("gray-light"),
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_colour_hdx_sapphire <- scale_color_hdx_sapphire

#' @rdname scale_hdx
#' @export
scale_color_hdx_tomato <- function(...) {
  ggplot2::discrete_scale(
    "colour",
    "hdx",
    hdx_pal_tomato(),
    na.value = hdx_hex("gray-light"),
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_colour_hdx_tomato <- scale_color_hdx_tomato

#' @rdname scale_hdx
#' @export
scale_fill_hdx_discrete <- function(...) {
  ggplot2::discrete_scale(
    "fill",
    "hdx",
    hdx_pal_discrete(),
    na.value = hdx_hex("gray-light"),
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_fill_hdx_gray <- function(...) {
  ggplot2::discrete_scale(
    "fill",
    "hdx",
    hdx_pal_gray(),
    na.value = hdx_hex("tomato-hdx"),
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_fill_hdx_grey <- scale_fill_hdx_gray

#' @rdname scale_hdx
#' @export
scale_fill_hdx_mint <- function(...) {
  ggplot2::discrete_scale(
    "fill",
    "hdx",
    hdx_pal_mint(),
    na.value = hdx_hex("gray-light"),
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_fill_hdx_sapphire <- function(...) {
  ggplot2::discrete_scale(
    "fill",
    "hdx",
    hdx_pal_sapphire(),
    na.value = hdx_hex("gray-light"),
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_fill_hdx_tomato <- function(...) {
  ggplot2::discrete_scale(
    "fill",
    "hdx",
    hdx_pal_tomato(),
    na.value = hdx_hex("gray-light"),
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_fill_gradient_hdx <- function(...) {
  ggplot2::continuous_scale(
    aesthetics = "fill",
    scale_name = "hdx",
    palette = scales::seq_gradient_pal(
      low = hdx_hex("tomato-hdx"),
      high = hdx_hex("sapphire-hdx")
    ),
    guide = "colorbar",
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_fill_gradient_hdx_sapphire <- function(...) {
  ggplot2::continuous_scale(
    aesthetics = "fill",
    scale_name = "hdx",
    palette = scales::seq_gradient_pal(
      low = "white",
      high = hdx_hex("sapphire-hdx")
    ),
    guide = "colorbar",
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_fill_gradient_hdx_mint <- function(...) {
  ggplot2::continuous_scale(
    aesthetics = "fill",
    scale_name = "hdx",
    palette = scales::seq_gradient_pal(
      low = "white",
      high = hdx_hex("mint-hdx")
    ),
    guide = "colorbar",
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_fill_gradient_hdx_tomato <- function(...) {
  ggplot2::continuous_scale(
    aesthetics = "fill",
    scale_name = "hdx",
    palette = scales::seq_gradient_pal(
      low = "white",
      high = hdx_hex("tomato-hdx")
    ),
    guide = "colorbar",
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_color_gradient_hdx <- function(...) {
  ggplot2::continuous_scale(
    aesthetics = "color",
    scale_name = "hdx",
    palette = scales::seq_gradient_pal(
      low = hdx_hex("tomato-hdx"),
      high = hdx_hex("sapphire-hdx")
    ),
    guide = "colorbar",
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_colour_gradient_hdx <- scale_color_gradient_hdx

#' @rdname scale_hdx
#' @export
scale_color_gradient_hdx_sapphire <- function(...) {
  ggplot2::continuous_scale(
    aesthetics = "color",
    scale_name = "hdx",
    palette = scales::seq_gradient_pal(
      low = "white",
      high = hdx_hex("sapphire-hdx")
    ),
    guide = "colorbar",
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_colour_gradient_hdx_sapphire <- scale_color_gradient_hdx_sapphire

#' @rdname scale_hdx
#' @export
scale_color_gradient_hdx_mint <- function(...) {
  ggplot2::continuous_scale(
    aesthetics = "color",
    scale_name = "hdx",
    palette = scales::seq_gradient_pal(
      low = "white",
      high = hdx_hex("mint-hdx")
    ),
    guide = "colorbar",
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_colour_gradient_hdx_mint <- scale_color_gradient_hdx_mint

#' @rdname scale_hdx
#' @export
scale_color_gradient_hdx_tomato <- function(...) {
  ggplot2::continuous_scale(
    aesthetics = "color",
    scale_name = "hdx",
    palette = scales::seq_gradient_pal(
      low = "white",
      high = hdx_hex("tomato-hdx")
    ),
    guide = "colorbar",
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_colour_gradient_hdx_tomato <- scale_color_gradient_hdx_tomato

#' @rdname scale_hdx
#' @export
scale_color_gradient2_hdx <- function(...) {
  ggplot2::continuous_scale(
    aesthetics = "color",
    scale_name = "hdx",
    palette = scales::div_gradient_pal(
      low = hdx_hex("tomato-hdx"),
      mid = hdx_hex("gray-white"),
      high = hdx_hex("sapphire-hdx")
    ),
    guide = "colorbar",
    ...
  )
}

#' @rdname scale_hdx
#' @export
scale_colour_gradient2_hdx <- scale_color_gradient2_hdx

#' @rdname scale_hdx
#' @export
scale_fill_gradient2_hdx <- function(...) {
  ggplot2::continuous_scale(
    aesthetics = "fill",
    scale_name = "hdx",
    palette = scales::div_gradient_pal(
      low = hdx_hex("tomato-hdx"),
      mid = hdx_hex("gray-white"),
      high = hdx_hex("sapphire-hdx")
    ),
    guide = "colorbar",
    ...
  )
}
