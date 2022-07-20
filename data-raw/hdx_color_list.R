library(yaml)
library(here)
library(tidyverse)

hdx_color_list <- yaml.load_file(
  here(
    "data-raw",
    "hdx.yml"
  )
) %>%
  map(
    ~ map_dfr(., as_tibble)
  )

usethis::use_data(hdx_color_list, overwrite = TRUE)
