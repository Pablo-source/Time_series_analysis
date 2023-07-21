# Plot AE data 
library(here)

if(!dir.exists("data")){dir.create("data")}
if(!dir.exists("test")){dir.create("test")}

AE_tabs <- excel_sheets(here("data","AE_England_data.xls"))
AE_data<- read_excel(
  here("data", "AE_England_data.xls"), 
  sheet = 1, skip =17) %>% 
  clean_names()
AE_data
