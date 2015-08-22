# Exploratory Data Analysis - Assignment 2 - Question 6
# Compare emissions from motor vehicle sources in Baltimore City with emissions 
# from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
# Which city has seen greater changes over time in motor vehicle emissions?

# Author: Danijel Bara
message(sprintf("Run time: %s\nR version: %s", Sys.time(), R.Version()$version.string))

# Loading datasets after downloading and unziping from local working directory
NEI.data <- readRDS("summarySCC_PM25.rds")
SCC.data <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

# Data subset
SubsetCity.data <- rbind(data1 <- NEI.data[which(NEI.data$fips == "24510"), ], 
                         data2 <- NEI.data[which(NEI.data$fips == "06037"), ])
SubsetCity.data$fips[which(SubsetCity.data$fips == "24510")] <- "Baltimore City"
SubsetCity.data$fips[which(SubsetCity.data$fips == "06037")] <- "Los Angeles County"
names(SubsetCity.data)[1] <- "Cities"

# Plot 6
png("plot6.png", width=480, height=480, units="px", bg="transparent")
plot6 <- ggplot(SubsetCity.data, aes(x = factor(year), y = Emissions, fill = Cities))+
        geom_bar(aes(fill=year),stat = "identity") +
        guides(fill=FALSE)+
        facet_grid(.~Cities,scales = "free",space="free") + 
        labs(x="Year", y=expression("Total PM"[2.5]*" Emission in Tons")) + 
        labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))+
        theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
              panel.background = element_blank(), axis.line = element_line(colour = "black"))
print(plot6)
dev.off()

