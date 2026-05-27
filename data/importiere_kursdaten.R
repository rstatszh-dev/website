# header ------------------------------------------------------------------

# Dieses Skript greift auf die als Google Sheets gespeicherten Tabellen zu, 
# die Daten für den Vorschlag enthalten. Google Sheets werden manuell bearbeitet 
# und die Daten werden dann von hier aus gelesen und lokal als CSVs gespeichert.

# library -------------------------------------------------------------------

library(googlesheets4)
library(readr)
library(dplyr)

# authentication -----------------------------------------------------------

gs4_auth(cache = ".secrets", email = Sys.getenv("GOOGLE_EMAIL"))

# script ------------------------------------------------------------------

## kurse

kurse <- "https://docs.google.com/spreadsheets/d/1WhGB4Pqpr4ywGbOKaC2UoRsyaf5jbI7L8jY75Lic9FE/edit?gid=0#gid=0"

read_sheet(ss = kurse) |> 
    write_csv(here::here("data/tables/tbl-01-rstatszh-kurse.csv"))

## kursplan

kursplan <- "https://docs.google.com/spreadsheets/d/1zNG1qrFBDH8l76G-DQNaHDejbS3PR75_zmK0_7LiARY/edit?gid=0#gid=0"

read_sheet(ss = kursplan) |> 
    write_csv(here::here("data/tables/tbl-00-rstatszh-kursplan.csv"))

## projekte

projekte <- "https://docs.google.com/spreadsheets/d/1jWY1q1H14Zhb-c4BXgRp3K9QqdfHCX6nrkEZjQ5TQX4/edit?gid=1700884386#gid=1700884386"

read_sheet(ss = projekte) |> 
    filter(kurs == "k010") |> 
    select(gh_username = `Bitte gib deinen GitHub-Benutzernamen an`,
           kurs,
           direktion = `In welcher Direktion des Kanton Zürich bist du angestellt?`,
           fachstelle_amt = `In welcher Fachstelle / welchem Amt bist du angestellt?`,
           projekt_titel, 
           projekt_website_url, 
           projekt_github_url) |> 
    write_csv(here::here("data/tables/tbl-02-rstatszh-projekte.csv"))
