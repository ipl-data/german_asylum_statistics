# ATTENTION: Before running this code, run clean_data.R and
# monthly_values.R from the same repository.

library(reshape)
library(ggplot2)
library(gridExtra)

# The variables created in monthly_values.R allow to
# graphically analyze how the BAMF made use of different
# protection categories over time. For some countries we see
# a dicsontinuity after the so called Asylpaket II (vertical
# line) was enacted.

# Written by: Niklas Harder

# Syria
syr <- melt(subset(df.top, country == "Syrien, Arabische Republik", 
  select = c(month, subsid.m.share, protected.m.share)), id.vars = c("month"))
levels(syr$variable) <- c("Subsidiary portection", "Asylum or refugee status")

syria <- ggplot(syr, aes(x = month, y = value, fill = variable)) + 
  geom_line(aes(colour = variable), size = 1) + ylab("Share of all decisions") + 
  xlab("Month") + ggtitle("Protection status of Syrian refugees before and after March 2016") + 
  geom_vline(xintercept = as.numeric(as.Date("2016-03-17")), 
    linetype = 4) + theme_minimal() + theme(legend.title = element_blank(), 
  legend.position = "bottom") + annotate("text", label = "Remaining cases were nonrefoulement, rejected or otherwise terminated cases", 
  x = as.Date("2015-07-01"), y = 0.1, size = 3, colour = "black")
syria
ggsave("syria.png")
# Irak
ir <- melt(subset(df.top, country == "Irak", select = c(month, 
  subsid.m.share, protected.m.share)), id.vars = c("month"))
levels(ir$variable) <- c("Subsidiary portection", "Asylum or refugee status")

irak <- ggplot(ir, aes(x = month, y = value, fill = variable)) + 
  geom_line(aes(colour = variable), size = 1) + ylab("Share of all decisions") + 
  xlab("Month") + ggtitle("Protection status of Iraqi refugees before and after March 2016") + 
  geom_vline(xintercept = as.numeric(as.Date("2016-03-17")), 
    linetype = 4) + theme_minimal() + theme(legend.title = element_blank()) + 
  annotate("text", label = "Remaining cases were nonrefoulement, rejected or otherwise terminated cases", 
    x = as.Date("2015-07-01"), y = 0.1, size = 3, colour = "black")
irak

# Afghanistan
afg <- melt(subset(df.top, country == "Afghanistan", select = c(month, 
  subsid.m.share, protected.m.share)), id.vars = c("month"))
levels(afg$variable) <- c("Subsidiary portection", "Asylum or refugee status")

afghanistan <- ggplot(afg, aes(x = month, y = value, fill = variable)) + 
  geom_line(aes(colour = variable), size = 1) + ylab("Share of all decisions") + 
  xlab("Month") + ggtitle("Protection status of Afghan refugees before and after March 2016") + 
  geom_vline(xintercept = as.numeric(as.Date("2016-03-17")), 
    linetype = 4) + theme_minimal() + theme(legend.title = element_blank()) + 
  annotate("text", label = "Remaining cases were nonrefoulement, rejected or otherwise terminated cases", 
    x = as.Date("2015-07-01"), y = 0.1, size = 3, colour = "black")
afghanistan

eri <- melt(subset(df.top, country == "Eritrea", select = c(month, 
  subsid.m.share, protected.m.share)), id.vars = c("month"))
levels(eri$variable) <- c("Subsidiary portection", "Asylum or refugee status")

# Eritrea
eritrea <- ggplot(eri, aes(x = month, y = value, fill = variable)) + 
  geom_line(aes(colour = variable), size = 1) + ylab("Share of all decisions") + 
  xlab("Month") + ggtitle("Protection status of Eritrean refugees before and after March 2016") + 
  geom_vline(xintercept = as.numeric(as.Date("2016-03-17")), 
    linetype = 4) + theme_minimal() + theme(legend.title = element_blank()) + 
  annotate("text", label = "Remaining cases were nonrefoulement, rejected or otherwise terminated cases", 
    x = as.Date("2015-07-01"), y = 0.1, size = 3, colour = "black")
eritrea

