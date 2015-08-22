# Exploratory Data Analysis - Assignment 2 - Question 3
# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) 
# variable, which of these four sources have seen decreases in emissions from 1999–2008 
# for Baltimore City? Which have seen increases in emissions from 1999–2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

# Author: Danijel Bara
message(sprintf("Run time: %s\nR version: %s", Sys.time(), R.Version()$version.string))

# Loading datasets after downloading and unziping from local working directory
NEI.data <- readRDS("summarySCC_PM25.rds")
SCC.data <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

# Subset data 
Subset.data <- subset(NEI.data, fips=='24510')

# Plot 3
png(filename='plot3.png', width = 480, height = 480, units="px",bg="transparent")
plot3 <- ggplot(Subset.data ,aes(factor(year),Emissions,fill=year)) +
        geom_bar(stat="identity") +
        theme_bw() + guides(fill=FALSE)+
        facet_grid(.~type,scales = "free",space="free", margins=TRUE) + 
        labs(x="Year", y=expression("Total PM"[2.5]*" Emission in Tons")) + 
        labs(title=expression("PM"[2.5]*" Emissions, Baltimore City,by Sources, 1999-2008"))
print(plot3)
dev.off()