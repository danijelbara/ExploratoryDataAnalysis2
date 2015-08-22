# Exploratory Data Analysis - Assignment 2 - Question 2
# Have total emissions from PM2.5 decreased in the Baltimore City, 
# Maryland '(fips == "24510")' from 1999 to 2008? Use the base 
# plotting system to make a plot answering this question.

# Author: Danijel Bara
message(sprintf("Run time: %s\nR version: %s", Sys.time(), R.Version()$version.string))

# Loading datasets after downloading and unziping from local working directory
NEI.data <- readRDS("summarySCC_PM25.rds")
SCC.data <- readRDS("Source_Classification_Code.rds")

# Subset data 
Subset.data <- subset(NEI.data, fips=='24510')

# AggregateData
AggBaltimore.data <- aggregate(Emissions ~ year, Subset.data,sum)

# Plot 2
png(filename='plot2.png', width = 480, height = 480, units="px",bg="transparent")
barplot(AggBaltimore.data$Emissions,
        names.arg=AggBaltimore.data$year,
        main=expression(paste('Total PM',''[2.5],' Emission From all Baltimore City Sources')),
        col = rainbow(30, start = 0, end = 1),
        xlab="Year",
        ylim = c(0,4000),
        ylab=expression(paste('PM', ''[2.5],' in Tons')))
dev.off()