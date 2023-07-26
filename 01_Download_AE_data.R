# Plot AE data 
library(here)
library(readxl)
library(tidyverse)
library(janitor)

# Created function to download publically available AE data from website
AE_data <- function() {
  
  if(!dir.exists("data")){dir.create("data")}
  # NHS England. A&E Attendances and Emergency Admissions statistics
  # https://www.england.nhs.uk/statistics/statistical-work-areas/ae-waiting-times-and-activity/
  # England-level time series
  # Download Excel file to a Project sub-folder called "data"
  xlsFile = "AE_England_data.xls"
  
  download.file(
    url = 'https://www.england.nhs.uk/statistics/wp-content/uploads/sites/2/2019/11/Timeseries-monthly-Unadjusted-9kidr.xls',
    destfile = here("data",xlsFile),
    mode ="wb"
  )
  
}

AE_data() 

AE_tabs <- excel_sheets(here("data","AE_England_data.xls"))
AE_data<- read_excel(
  here("data", "AE_England_data.xls"), 
  sheet = 1, skip =17) %>% 
  clean_names()
AE_data
