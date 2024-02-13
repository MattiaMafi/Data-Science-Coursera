
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("Exploratory Course Project 2/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("Exploratory Course Project 2/exdata_data_NEI_data/Source_Classification_Code.rds")

#names(NEI)
#names(SCC)
library(magrittr)
library(dplyr)
library(ggplot2)


Baltcitymary_motor_vehicle_emissions<-NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
LosAngeles_motor_vehicle_emissions<-NEI[(NEI$fips=="06037") & (NEI$type=="ON-ROAD"),]

Baltcitymary_motor_vehicle_emissions_year <- summarise(group_by(Baltcitymary_motor_vehicle_emissions, year), Emissions=sum(Emissions))
LosAngeles_motor_vehicle_emissions_year <- summarise(group_by(LosAngeles_motor_vehicle_emissions, year), Emissions=sum(Emissions))


Baltcitymary_motor_vehicle_emissions_year$County <- "Baltimore City, MD"
LosAngeles_motor_vehicle_emissions_year$County <- "Los Angeles County, CA"
Both.emissions <- rbind(Baltcitymary_motor_vehicle_emissions_year, LosAngeles_motor_vehicle_emissions_year)

ggplot(Both.emissions, aes(x = factor(year), y = Emissions, fill = County, 
                                                      label = round(Emissions, 2))) + 
  geom_bar(stat="identity") + 
  facet_grid(County~., scales="free") +
  xlab("year") +
  ylab("total PM2.5 emissions") +
  ggtitle("Emissions from motor vehicle sources in Baltimore and Los Angeles") +
  geom_label(aes(fill = County), colour = "white", fontface = "bold")







