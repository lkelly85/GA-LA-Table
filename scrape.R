##download data

source <- "https://www.opendata.nhs.scot/dataset/b318bddf-a4dc-4262-971f-0ba329e09b87/resource/e8454cf0-1152-4bcb-b9da-4343f625dfef/download/total_cases_by_la_20211231.csv"
temp <- curl_download(url=source, destfile=temp, quiet=FALSE, mode="wb")

data <- read.csv(temp)

data <- data %>%
  mutate(date=as.Date(as.character(Date), format="%Y%m%d")) %>%
  mutate(DateTime = Sys.time()) #add time of scraping
  
#Write data to file, new data scraped after automation will be appended
write.table(data, "data/data.csv", 
            sep = ",", col.names = !file.exists("data/data.csv"),
            append = T, row.names = F)
