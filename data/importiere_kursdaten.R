# header ------------------------------------------------------------------

# Dieses Skript greift auf die als Google Sheets gespeicherten Tabellen zu, 
# die Daten für den Vorschlag enthalten. Google Sheets werden manuell bearbeitet 
# und die Daten werden dann von hier aus gelesen und lokal als CSVs gespeichert.

# library -------------------------------------------------------------------

library(googlesheets4)
library(readr)
library(dplyr)

# script ------------------------------------------------------------------

## kurse

kurse <- "https://docs.google.com/spreadsheets/d/1WhGB4Pqpr4ywGbOKaC2UoRsyaf5jbI7L8jY75Lic9FE/edit?gid=0#gid=0"

read_sheet(ss = kurse) |> 
    write_csv(here::here("data/tables/tbl-01-rstatszh-kurse.csv"))

## kursplan

kursplan <- "https://docs.google.com/spreadsheets/d/1zNG1qrFBDH8l76G-DQNaHDejbS3PR75_zmK0_7LiARY/edit?gid=0#gid=0"

read_sheet(ss = kursplan) |> 
    write_csv(here::here("data/tables/tbl-00-rstatszh-kursplan.csv"))
