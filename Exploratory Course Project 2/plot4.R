
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("Exploratory Course Project 2/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("Exploratory Course Project 2/exdata_data_NEI_data/Source_Classification_Code.rds")

#names(NEI)
#names(SCC)
library(magrittr)
library(dplyr)
library(ggplot2)


##Q4
Combustion_coal <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
Combustion_coal_sources <- SCC[Combustion_coal,]

# Find emissions from coal combustion-related sources
Emissions_coal_combustion <- NEI[(NEI$SCC %in% Combustion_coal_sources$SCC), ]
Emissions_coal_related <- summarise(group_by(Emissions_coal_combustion, year), Emissions=sum(Emissions))

ggplot(Emissions_coal_related, aes(x = factor(year), y = Emissions, fill = year, 
                                    label = round(Emissions, 2))) + 
  geom_bar(stat="identity") + 
  xlab("year") +
  ylab("total PM2.5 emissions") +
  ggtitle("Emissions from coal combustion-related sources") +
  geom_label(aes(fill = year), colour = "white", fontface = "bold")

