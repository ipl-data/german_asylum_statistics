# ATTENTION: Before running this code, run clean_data.R from
# the same repository.

# So far the data contains running totals. Taking the
# difference between consecutive months should yield monthly
# counts.

# Written by: Niklas Harder

# Package should be loaded; but just to be sure:
library(lubridate)

# Not all countries have uninterupted timelines.
table(df$country)

# Countries that have been in the whole time are: Afg,
# Eritrea, Irak, Syria, Albania is not in the whole time but
# uninterupted

# For now I will only work with countries/counts that have
# been in the data the whole time.
df.top <- subset(df, country == "Afghanistan" | country == "Eritrea" | 
  country == "Irak" | country == "Syrien, Arabische Republik" | 
  country == "HerkunftslÃ¤nder gesamt" | country == "Summe Top 10")

# Compute monthly decisions It is important to note, that the
# monthly numbers are close to some monthly numbers mentioned
# in the BAMF data, but do not completly add up. I assume
# that this is due to data cleaning on BAMF's side.
df.top$decisions.m <- ave(df.top$decisions, df.top$country, year(df.top$month), 
  FUN = function(x) c(0, diff(x)))
df.top$decisions.m[month(df.top$month) == 1] <- df.top$decisions[month(df.top$month) == 
  1]

df.top$total.m <- ave(df.top$total, df.top$country, year(df.top$month), 
  FUN = function(x) c(0, diff(x)))
df.top$total.m[month(df.top$month) == 1] <- df.top$total[month(df.top$month) == 
  1]

df.top$total.first.m <- ave(df.top$total_first, df.top$country, 
  year(df.top$month), FUN = function(x) c(0, diff(x)))
df.top$total.first.m[month(df.top$month) == 1] <- df.top$total_first[month(df.top$month) == 
  1]

df.top$total.follow.m <- ave(df.top$total_follow, df.top$country, 
  year(df.top$month), FUN = function(x) c(0, diff(x)))
df.top$total.follow.m[month(df.top$month) == 1] <- df.top$total_follow[month(df.top$month) == 
  1]

df.top$refugee.m <- ave(df.top$refugee, df.top$country, year(df.top$month), 
  FUN = function(x) c(0, diff(x)))
df.top$refugee.m[month(df.top$month) == 1] <- df.top$refugee[month(df.top$month) == 
  1]

df.top$asyl.m <- ave(df.top$asyl, df.top$country, year(df.top$month), 
  FUN = function(x) c(0, diff(x)))
df.top$asyl.m[month(df.top$month) == 1] <- df.top$asyl[month(df.top$month) == 
  1]

df.top$subsid.m <- ave(df.top$subsid, df.top$country, year(df.top$month), 
  FUN = function(x) c(0, diff(x)))
df.top$subsid.m[month(df.top$month) == 1] <- df.top$subsid[month(df.top$month) == 
  1]

df.top$no.deport.m <- ave(df.top$no.deport, df.top$country, year(df.top$month), 
  FUN = function(x) c(0, diff(x)))
df.top$no.deport.m[month(df.top$month) == 1] <- df.top$no.deport[month(df.top$month) == 
  1]

df.top$reject.m <- ave(df.top$reject, df.top$country, year(df.top$month), 
  FUN = function(x) c(0, diff(x)))
df.top$reject.m[month(df.top$month) == 1] <- df.top$reject[month(df.top$month) == 
  1]

df.top$other.end.m <- ave(df.top$other.end, df.top$country, year(df.top$month), 
  FUN = function(x) c(0, diff(x)))
df.top$other.end.m[month(df.top$month) == 1] <- df.top$other.end[month(df.top$month) == 
  1]

# This data is messy as in some cases there are even negative
# values.  Again, data cleaning on BAMF's side is a likely
# reason for this.

# Creating a variable that counts monthly rejections and case
# terminations
df.top$rejected.m <- df.top$reject.m + df.top$other.end.m

# Creating a variable that counts the monthly number of
# refugee status and asylum
df.top$protected.m <- df.top$refugee.m + df.top$asyl.m

# Shares of status
df.top$subsid.m.share <- df.top$subsid.m/df.top$decisions.m
df.top$protected.m.share <- df.top$protected.m/df.top$decisions.m
df.top$rejected.m.share <- df.top$rejected.m/df.top$decisions.m
df.top$no.deport.m.share <- df.top$no.deport.m/df.top$decisions.m

df.top$subsid.m.share + df.top$protected.m.share + df.top$rejected.m.share + 
  df.top$no.deport.m.share


