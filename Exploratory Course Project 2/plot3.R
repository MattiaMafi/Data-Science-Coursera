
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("Exploratory Course Project 2/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("Exploratory Course Project 2/exdata_data_NEI_data/Source_Classification_Code.rds")

#names(NEI)
#names(SCC)
library(magrittr)
library(dplyr)
library(ggplot2)

##Q3
BaltimoreEmissions_year <- summarise(group_by(filter(NEI, fips == "24510"), year, type), 
                                     Emissions = sum(Emissions))
ggplot(BaltimoreEmissions_year, aes(x = factor(year), y = Emissions, fill = type, 
                                    label = round(Emissions, 2))) + 
  geom_bar(stat="identity") + 
  facet_grid(. ~ type) +
  xlab("year") +
  ylab("total PM2.5 emissions") +
  ggtitle("PM2.5 Emissions in Baltimore City by types") +
  geom_label(aes(fill = type), colour = "white", fontface = "bold")

