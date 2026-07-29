# gghdx 0.2.0

- Incorporate the 2025 HDX website redesign into the package's colors,
fonts, and default theme.
- Add the `primary`, `brand`, `neutral`, `success`, `warning`, and `error`
color scales from the new HDX design tokens to `hdx_color_list`, accessible
through `hdx_colors()`, `hdx_hex()`, and `hdx_color_names()`. The original
`sapphire`, `mint`, `tomato`, and `gray` scales are kept for backwards
compatibility. `hdx_color_names()` and `hdx_hex()` now cover all 94 legacy +
2025 color names (previously 17); `hdx_colors()` still defaults to just the
original 17 for backwards compatibility, unless specific scales are
requested.
- Add `hdx_pal_primary()`, `hdx_pal_brand()`, and `hdx_pal_error()`, along
with matching `scale_color_hdx_...()`, `scale_fill_hdx_...()`, and
`scale_..._gradient_hdx_...()` functions, superseding `hdx_pal_sapphire()`,
`hdx_pal_mint()`, and `hdx_pal_tomato()` respectively.
- Add `load_hdx_fonts()` to load Merriweather (display/title font) and
Roboto (body font), replacing Source Sans 3 as the package's default fonts.
`load_source_sans_3()` is kept for backwards compatibility.
- Update `theme_hdx()` with a new `title_family` argument (default
`"Merriweather"`) applied to titles, subtitles, and strip text, while
`base_family` (default `"Roboto"`) applies to body text. Gridlines, axis
lines, and ticks now use the new hairline gray, and axis text uses the new
muted gray. If only `base_family` is supplied, `title_family` now follows it
automatically instead of defaulting to `"Merriweather"`, so pre-2025 code
such as `theme_hdx(base_family = "Source Sans 3")` continues to work without
also loading Merriweather.
- Update `hdx_geom_defaults()` so points, lines, and other default geometries
use the new primary blue, and area/bar/ribbon fills use the new
institutional data-grid blue, instead of the original sapphire/mint colors.
- `geom_text_hdx()` and `geom_label_hdx()` now default to the Roboto font
family instead of Source Sans 3.
- Add a `design = c("2025", "legacy")` argument to `gghdx()`, `theme_hdx()`,
`hdx_geom_defaults()`, and `hdx_pal_discrete()` (and a matching `design`
argument on `scale_color_hdx_discrete()`/`scale_fill_hdx_discrete()`).
`design = "legacy"` restores the exact pre-2025 theme, geometry defaults,
and 12-color discrete scale, since much unpinned downstream code depends on
this package's defaults and previously had no way to opt back out of the
redesign.
- `title_family` and `design` were appended at the *end* of the `theme_hdx()`
and `gghdx()` argument lists (after `horizontal`), preserving the original
positional argument order so existing positional calls like
`theme_hdx(10, "sans", FALSE)` still work as before.
- Update maintainer in `DESCRIPTION` to Giulia Martini. Since this changes
the CRAN maintainer contact, coordinate with Seth Caldwell in advance of the
next CRAN submission, as CRAN will email the account listed at submission
time for confirmation.
- Add a `design = c("2025", "legacy")` argument to `geom_text_hdx()` and
`geom_label_hdx()` so `design = "legacy"` uses Source Sans 3 instead of
hardcoding Roboto, completing the `design = "legacy"` escape hatch for plots
using text or label geoms.
- Move `design` after `...` in `scale_color_hdx_discrete()` and
`scale_fill_hdx_discrete()`, fixing the same positional-argument hazard
already fixed in `theme_hdx()`/`gghdx()` (e.g.
`scale_color_hdx_discrete("red", "Legend name")` no longer binds
`"Legend name"` to `design`).
- Improve the error raised when a font isn't loaded to mention the 0.2.0
default font change and point at `load_hdx_fonts()` or `design = "legacy"`.
- Tests, examples, and the vignette no longer fail when Merriweather, Roboto,
or Source Sans 3 can't be downloaded from Google Fonts (e.g. no internet
connection or the `curl` package is unavailable); they now skip or fall back
to `sans` instead.

# gghdx 0.1.4

- Export `number_hdx()` to provide users simple access to number formatting
outside the labeling use case.

# gghdx 0.1.3

- Implement `label_number_hdx()` function to improve numeric scales labeling
to match the data visualization guidelines.
- Switch develop continuous `NA` fill value to be `"transparent"` so it appears
better when plotting continuous rasters.
- Check installed `{ggplot2}` version to pass the `scale_name` argument to remove
warnings and errors.

# gghdx 0.1.2

* Use anonymous function format `function()` in `hdx_display_pal()`.
* Add `gghdx_reset()` and `ggplot2_geom_defaults()` functions to allow user to
remove all defaults set by `gghdx()`.
* Improve `load_source_sans_3()` so local installations of Source Sans 3 are
used when an internet connection is unavailable.
* Update tests to not break with release of `{ggplot2}` 3.5.0.

# gghdx 0.1.1

* Switched base font family from Source Sans Pro to Source Sans 3.
* Fixed links flagged in CRAN checks.
* Revamped all documentation for clarity and ensuring return values and
examples are provided, based on CRAN review.
* First CRAN release, as we have reached some stability!

# gghdx 0.1.0

* Right adjusting y-axis labels in `theme_hdx()`.
* Replace deprecated `size` argument from `ggplot2` calls.
* Move `ultra-light` colors to end of `hdx_pal()` discrete palette.
* Make output of `hdx_hex()` unnamed to avoid errors in `ggplot2` and
allow both grey and gray spellings of colors.
* Change `..._gradient_...` scale functions to have `white` as the low color.
* Add `display_hdx_pal()` function to allow visualizing the HDX color palettes.
* Improved error catching when fonts are not available.
* Added gray color palette, `hdx_pal_gray()`.

# gghdx 0.0.2

* Cleaned `df_covid` for consistent days between dates on x-axis plots.
* Changed `NA` colors from white to gray.

# gghdx 0.0.1

* Added a `NEWS.md` file to track changes to the package.
* Implemented `scale_fill...()` and `scale_color_...()` functions for easy
application of HDX palette to aesthetics and `hdx_colors()`, `hdx_pal()`, and
`hdx_hex()` for user access.
* Released `theme_hdx()`.
* Added `gghdx()` to apply session level defaults for plotting.
* Developed default text plotting through `geom_text_hdx()` and
`geom_label_hdx()`.
* Built vignette and main README.md.
