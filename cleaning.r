load_data <- function(){
  
  # The database is stored as an r object, rename it for ease of access
  
  x <- readRDS("raw-data/Corp_HouseOfCommons_V2.rds")
  
  # Mutate to extract dates in easy format from the chr date
  
  x <- x %>%
    mutate(date_fmt = ymd(date),
           year = year(date_fmt), 
           month = month(date_fmt), 
           day = day(date_fmt))
  
  # save the summaries to be easily accessed later
  
  x_sum <- summary(x)
  x_skim <- skim(x)
  
  # produce a subset of the data for testing changes on 
  
  x_5000 <- sample_n(x, 5000)
  
  # x_mod is the cleaned version of the data sometimes the chair was given their
  # actual name, manually checked that the speaker had held a chairperson post and
  # then recoded as chair Recoded chair parties as CHAIR to separate from other.
  # Relevant as in the HoC Speakers relinquish party affiliation. Removed the
  # cases where speaker was not recorded. This was only 1053 entries, a small
  # fraction of the total. Similarly removed entries where party was NA,
  # representing 2816 entries or 0.1% of the total.
  
  x_mod <- x %>%
    mutate(speaker = ifelse(chair == TRUE,
                            "CHAIR",
                            speaker)) %>%
    mutate(party = ifelse(chair == TRUE,
                          "CHAIR",
                          party)) %>%
    filter(is.na(speaker) == FALSE) %>%
    filter(is.na(party) == FALSE)
  
}