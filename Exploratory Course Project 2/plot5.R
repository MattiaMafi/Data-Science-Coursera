
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("Exploratory Course Project 2/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("Exploratory Course Project 2/exdata_data_NEI_data/Source_Classification_Code.rds")

#names(NEI)
#names(SCC)
library(magrittr)
library(dplyr)
library(ggplot2)


##Q5
Baltcitymary_motor_vehicle_emissions<-NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
Baltcitymary_motor_vehicle_emissions_year <- summarise(group_by(Baltcitymary_motor_vehicle_emissions, year), Emissions=sum(Emissions))

ggplot(Baltcitymary_motor_vehicle_emissions_year, aes(x = factor(year), y = Emissions, fill = year, 
                                   label = round(Emissions, 2))) + 
  geom_bar(stat="identity") + 
  xlab("year") +
  ylab("total PM2.5 emissions") +
  ggtitle("Emissions from motor vehicle sources in Baltimore City") +
  geom_label(aes(fill = year), colour = "white", fontface = "bold")
