
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("Exploratory Course Project 2/exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("Exploratory Course Project 2/exdata_data_NEI_data/Source_Classification_Code.rds")

#names(NEI)
#names(SCC)
library(magrittr)
library(dplyr)
library(ggplot2)

##Q2
BaltimoreEmissions <- summarise(group_by(filter(NEI, fips == "24510"), year), Emissions = sum(Emissions))
x2<-barplot(height = BaltimoreEmissions$Emissions, names.arg = BaltimoreEmissions$year,
            xlab="years", ylab="Total PM2.5 emissions",
            main=expression("Total PM2.5 emissions in Baltimore City from 1999 to 2008"))
