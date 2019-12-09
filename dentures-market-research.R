# Dentures Market Research
# Author: Thomas A. Pepperz, Southern Analytica LLC
# Email: Thomas.Pepperz@SouthernAnalytica.Com
# Date: Sunday, December 8, 2019

# Set up working directory
setwd("~")
setwd("dentures")

# Load required libraries
library(dplyr)
library(gtrendsR)
library(reshape2)
library(stargazer)

# Query for "dentures": world
dentures_trends_world = 
  gtrends(
    keyword =
      c(
        "dentures"),
    geo = 
      "",
    time = 
      "2009-01-01 2019-10-15",
    gprop = 
      c(
        "web", 
        "news",
        "images",
        "froogle",
        "youtube"
      ),
    category = 
      0,
    hl = 
      "en-US",
    low_search_volume = 
      TRUE,
    onlyInterest = 
      FALSE
  )

dentures_trends_us = 
  gtrends(
    keyword =
      c(
        "dentures"),
    geo = 
      "US",
    time = 
      "2009-01-01 2019-10-15",
    gprop = 
      c(
        "web", 
        "news",
        "images",
        "froogle",
        "youtube"
      ),
    category = 
      0,
    hl = 
      "en-US",
    low_search_volume = 
      TRUE,
    onlyInterest = 
      FALSE
  )

dentures_trends_us

#### Interest by Country ####

# Subset Interest by Country
dentures_interest_by_country =
  dentures_trends_world$interest_by_country

dentures_interest_by_country


# Reformat dataframe and rename columns
dentures_interest_by_country = 
  dentures_interest_by_country %>%
  select("Country" = location, 
         "Hit Index" = hits, 
         "Primary Keyword" = keyword)

# Write data out as a csv file
write.csv(
  dentures_interest_by_country,
  "google-trends-dentures-interest-by-country.csv",
  row.names = FALSE)

#### Interest Over Time ####

# Subset Interest Over Time
dentures_interest_over_time =
  dentures_trends_us$interest_over_time


# Replace NA values with zero
#dentures_interest_over_time[is.na(dentures_interest_over_time)] = 
#  0
# Write data out as a csv file
write.csv(
  dentures_interest_over_time,
  "google-trends-dentures-interest-over-time.csv",
  row.names = FALSE)

#### Interest by DMA ####

# Subset Interest by DMA
dentures_interest_by_dma =
  dentures_trends_us$interest_by_dma
# Replace NA values with zero
#dentures_interest_by_dma[is.na(dentures_interest_by_dma)] = 
#  0
# Write data out as a csv file
write.csv(
  dentures_interest_by_dma,
  "google-trends-dentures-interest-by-dma.csv",
  row.names = FALSE)

#### Interest by City ####

# Subset Interest by City
dentures_interest_by_city = 
  dentures_trends_us$interest_by_city
# Replace NA values with zero
#dentures_interest_by_city[is.na(dentures_interest_by_city)] = 
#  0
# Write data out as a csv file
write.csv(
  dentures_interest_by_city,
  "google-trends-dentures-interest-by-city.csv",
  row.names = FALSE)

#### Related Topics ####

#  Subset Related Topics
dentures_related_topics =
  dentures_trends_us$related_topics
# Replace NA values with zero
#dentures_related_topics[is.na(dentures_related_topics)] = 
#  0
# Write data out as a csv file
write.csv(
  dentures_related_topics,
  "google-trends-dentures-related-topics.csv",
  row.names = FALSE)

#### Related Queries ####

# Subset Related Queries
dentures_related_queries =
  dentures_trends_us$related_queries

# Reformat dataframe and rename columns
dentures_related_queries = 
  dentures_related_queries %>%
  select("Related Keywords" = value, 
         "Hit Index" = subject, 
         "Keyword Relation Type" = related_queries,
         "Primary Keyword" = keyword)

# Write data out as a csv file
write.csv(
  dentures_related_queries,
  "google-trends-dentures-related-queries.csv",
  row.names = FALSE)

# Related Queries Table: Dentures
stargazer::stargazer(dentures_related_queries, 
                     type = 'latex', 
                     summary = FALSE,
                     style = "aer",
                     title = "Related Queries to Keyword 'Dentures'",
                     #column.labels = 
                     #  c("Student Name",
                     #    "IE-Score",
                     #    "Qualified",
                     #    "IE-Total Score"),
                     #column.separate = 4,
                     header = FALSE)
table(dentures_related_queries)



# Interest by DMA: Dentures
dentures_interest_by_dma = 
  dentures_interest_by_dma %>%
  select("DMA" = location, 
         "Hit Index" = hits, 
         "Primary Keyword" = keyword)

# Interest by City: Dentures
dentures_interest_by_city = 
  dentures_interest_by_city %>%
  select("City" = location, 
         "Hit Index" = hits, 
         "Primary Keyword" = keyword)
