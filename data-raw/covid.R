# global COVID data example

library(tidyverse)
library(zoo)
library(lubridate)

df_covid <- read_csv("https://covid19.who.int/WHO-COVID-19-global-data.csv") %>%
  group_by(
    Date_reported
  ) %>%
  summarize(
    cases = sum(New_cases)
  ) %>%
  bind_rows(
    tibble(
      Date_reported = seq(
        as.Date("2019-12-01"),
        as.Date("2020-01-02"),
        by = "day"
      ),
      cases = 0
    ),
    .
  ) %>%
  mutate(
    cases_monthly = rollsumr(
      x = cases,
      k = 30,
      fill = 0
    )
  ) %>%
  filter(
    day(Date_reported) %in% c(1, 10, 20),
    year(Date_reported) == 2020,
    month(Date_reported) < 10
  ) %>%
  transmute(
    date = Date_reported,
    cases_monthly,
    flag = date == max(date)
  )

usethis::use_data(df_covid, overwrite = TRUE)
