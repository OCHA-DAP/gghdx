## R CMD check results

0 errors | 0 warnings | 2 notes

* checking package dependencies ... NOTE
  Package suggested but not available for checking: 'covr'
  (not installed on the local check machine; used only for coverage
  reporting in CI, not required for the package to build or run)

* checking for future file timestamps ... NOTE
  unable to verify current time
  (the local check machine couldn't reach the time-verification server;
  unrelated to the package)

## Notes on this submission

* Previous check runs on this version failed because several tests,
  examples, and the vignette called `load_hdx_fonts()`/`load_source_sans_3()`,
  which download Merriweather/Roboto/Source Sans 3 from Google Fonts via
  `sysfonts::font_add_google()`. On a machine without internet access (or
  without the `curl` package, which `sysfonts` only `Suggests`), these calls
  errored instead of failing gracefully, which is not compliant with CRAN's
  policy on internet-dependent checks.
* Tests now skip (rather than fail) when the required font can't be
  downloaded and isn't available locally either. Examples and the vignette
  now fall back to the `sans` font in the same situation, so they complete
  without error either way. `curl` was also added to `Suggests` since the
  package relies on it transitively through `sysfonts`.
* No reverse dependencies.
