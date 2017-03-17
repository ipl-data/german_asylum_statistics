# This data is based on the monthly asylum statistics (Asylgeschäftsstatistik) 
# by the BAMF. The individual reports can be found here:
# http://www.bamf.de/DE/Infothek/Statistiken/Asylzahlen/Asylgesch%C3%A4ftsstatistik/asylgeschaeftsstatistik-node.html

# The data covers the period from January 2015 to January 2017. The data was
# collected using a mix of OCR techniques and manual copy-paste. Surprising data
# should therefore be double checked with the actual reports. 

# The data contains information on refugees from each month's top 10 sending 
# countries, the aggreagated top 10 and the aggregate numbers of all refugees.
# Values are running totals (percentages) per year. On some occasions the totals
# drop from one month to the other. I assume that this is due to data cleaning
# on the side of BAMF.

# Set working directory, read the data, and load packages
setwd("C:/Users/nharder/Dropbox (IPL)/Refugees_Germany/Data")
df <- read.csv("asylum_stats_germany.csv", nrows = 300, dec = ",")
df <- subset(df, select = c(1:15))
library(lubridate)

# Change the decimal mark and recode variables as numeric
df$total <- as.numeric(sub("[[:punct:]]", "", as.character(df$total)))
df$total_first <- as.numeric(sub("[[:punct:]]", "", as.character(df$total_first)))
df$total_follow <- as.numeric(sub("[[:punct:]]", "", as.character(df$total_follow)))
df$decisions <- as.numeric(sub("[[:punct:]]", "", as.character(df$decisions)))
df$refugee <- as.numeric(sub("[[:punct:]]", "", as.character(df$refugee)))
df$asyl <- as.numeric(sub("[[:punct:]]", "", as.character(df$asyl)))
df$sub.asylum <- as.numeric(sub("[[:punct:]]", "", as.character(df$sub.asylum)))
df$subsid <- as.numeric(sub("[[:punct:]]", "", as.character(df$subsid)))
df$no.deport <- as.numeric(sub("[[:punct:]]", "", as.character(df$no.deport)))
df$protection <- as.numeric(
  sub(
    "%", "", sub(
      "[[:punct:]]", ".", as.character(df$protection))))
df$reject <- as.numeric(sub("[[:punct:]]", "", as.character(df$reject)))
df$other.end <- as.numeric(sub("[[:punct:]]", "", as.character(df$other.end)))

# Code dates; the data always represents the counts at the end of each month
df$month <- dmy(df$month)

# Code Asyl and sub.asylum in one variable; In some reports the number of 
# refugees that received asylum according to the German Grundgesetz were only
# reported as a subset of the refugees that received refugee protection 
# according to the Geneva convention. 
df$refugee <- ifelse(is.na(df$asyl) & !is.na(df$sub.asylum), 
                     df$refugee - df$sub.asylum, 
                     df$refugee) 

df$asyl <- ifelse(is.na(df$asyl) & !is.na(df$sub.asylum), df$sub.asylum, df$asyl)

# Recode NA's as 0
df$refugee[is.na(df$refugee)] <- 0
df$asyl[is.na(df$asyl)] <- 0
df$subsid[is.na(df$subsid)] <- 0
df$no.deport[is.na(df$no.deport)] <- 0
df$reject[is.na(df$reject)] <- 0
df$other.end[is.na(df$other.end)] <- 0

# Test if numbers add up
sum(df$total == df$total_first + df$total_follow)

sum(df$decisions == df$refugee + df$asyl + df$subsid + df$no.deport +
      df$reject + df$other.end)

sum(df$protection == round(((df$refugee+df$asyl+df$subsid+df$no.deport)/df$decisions) * 100, digits = 1))

# Remove sub.asylum
df <- subset(df, select = -c(sub.asylum))


# Order data
df <- df[order(df$country, df$month), ]










