# Exploratory Data Analysis - Assignment 2 - Question 1
# Have total emissions from PM2.5 decreased in the United States 
# from 1999 to 2008? Using the base plotting system, make a plot 
# showing the total PM2.5 emission from all sources for each of 
# the years 1999, 2002, 2005, and 2008.

# Author: Danijel Bara
message(sprintf("Run time: %s\nR version: %s", Sys.time(), R.Version()$version.string))

# Loading datasets after downloading and unziping from local working directory
NEI.data <- readRDS("summarySCC_PM25.rds")
SCC.data <- readRDS("Source_Classification_Code.rds")

# Aggregate
Data.Aggregate <- aggregate(Emissions ~ year, data=NEI.data, sum)
Data.Aggregate$PM <- round(Data.Aggregate[,2]/1000,2)

# Plot 1

png(filename='plot1.png', width = 480, height = 480, units="px",bg="transparent")
barplot(Data.Aggregate$PM, 
        names.arg=Data.Aggregate$year, 
        col = rainbow(30, start = 0, end = 1),
        main=expression(paste('Total PM',''[2.5],' Emission')),
        xlab='Year',
        ylim = c(0,8000),
        ylab=expression(paste('PM', ''[2.5],' in Tons')))
dev.off()