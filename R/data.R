#' HDX color ramps
#'
#' List of color ramps from the HDX visual identity. These are mint, sapphire,
#' tomato, and grays.
#'
#' @family color hdx
#' @format A list with 4 data frames:
#' @source \url{https://data.humdata.org/dataviz-guide/visual-identity/#/visual-identity/colours/}
"hdx_color_list"

#' Example COVID-19 dataset
#'
#' COVID-19 dataset derived from global WHO data. Used to provide simple graph
#' matching the example graphs on the HDX visual guide.
#'
#' @format A data frame with `r nrow(df_covid)` rows and `r ncol(df_covid)` variables:
#' \describe{
#'     \item{date}{Date}
#'     \item{cases_monthly}{Confirmed COVID-19 cases in the past 30 days}
#'     \item{flag}{Flag for that date}
#' }
#' @source \url{https://data.humdata.org/dataviz-guide/visual-identity/#/visual-identity/colours}
"df_covid"
