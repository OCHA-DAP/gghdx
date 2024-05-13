# The function `get_package_version()`
# was sourced from the shiny package version 1.8.0, available at
# <https://github.com/rstudio/shiny>, and copied from the ggsci package
# version 3.0.3, which I used to see the approach to checking the installed
# version of ggplot, based on this blog post:
#
# https://nanx.me/blog/post/ggsci-protr-msaenet-release-notes-2024/
#
# For the original version of these functions, please see:
# <https://github.com/rstudio/shiny/blob/v1.8.0/R/staticimports.R>.
#
# The shiny and ggsci packages are licensed under the GNU General Public License
# version 3.
# For more details on the license, see
# <https://github.com/rstudio/shiny/blob/main/LICENSE>.

#' Check version of package
#'
#' Gets version of package.
#'
#' This function is copied from the shiny package version 1.8.0, available at
#' <https://github.com/rstudio/shiny>. I was made aware of this function
#' and initially copied the source code through
#' its use in ggsci package version 3.0.3 <https://github.com/nanxstats/ggsci>
#' and its related blog post
#' <https://nanx.me/blog/post/ggsci-protr-msaenet-release-notes-2024/>.
#'
#' For the original version of these functions, please see:
#' <https://github.com/rstudio/shiny/blob/v1.8.0/R/staticimports.R>.
#' The shiny and ggsci packages are licensed under the GNU General Public License
#' version 3. For more details on the license, see
#' <https://github.com/rstudio/shiny/blob/main/LICENSE>.
#'
#' @param pkg Name of the package
#'
#' @returns Version of the package in `numeric_version` class.
#'
#' @noRd
get_package_version <- function(pkg) {
  # `utils::packageVersion()` can be slow, so first try the fast path of
  # checking if the package is already loaded.
  ns <- .getNamespace(pkg)
  if (is.null(ns)) {
    utils::packageVersion(pkg)
  } else {
    as.package_version(ns$.__NAMESPACE__.$spec[["version"]])
  }
}

#' Checks that ggplot version is 3.5.0 or later
#'
#' Used because the `scale_name` argument is deprecated in 3.5.0 and produces
#' a warning if passed, but for any version < 3.5.0 an error is produced if not
#' passed.
#'
#' @returns `TRUE` if ggplot2 version 3.5.0 or later is installed
#'
#' @noRd
ggplot_gt_350 <- function() {
  get_package_version("ggplot2") >= package_version("3.5.0")
}

#' Provide scale_name argument based on ggplot2 version
#'
#' Returns `lifecycle::deprecated()` if the installed version is 3.5.0 or
#' greater, which removes the ggplot2 warning as that is the new default, and
#' just returns `"hdx"` otherwise.
#'
#' @noRd
scale_name <- function() {
  if (ggplot_gt_350()) {
    lifecycle::deprecated()
  } else {
    "hdx"
  }
}
