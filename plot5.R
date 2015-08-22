# Exploratory Data Analysis - Assignment 2 - Question 5
# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

# Author: Danijel Bara
message(sprintf("Run time: %s\nR version: %s", Sys.time(), R.Version()$version.string))

# Loading datasets after downloading and unziping from local working directory
NEI.data <- readRDS("summarySCC_PM25.rds")
SCC.data <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

# Subset data
Vehicles.data <- grepl("vehicle", SCC.data$SCC.Level.Two, ignore.case=TRUE)
VehiclesSCC.data <- SCC.data[Vehicles.data,]$SCC
VehiclesNEI.data <- NEI.data[NEI.data$SCC %in% VehiclesSCC.data,]

# Subset vehicles data
VehNEIBalt.data <- VehiclesNEI.data[VehiclesNEI.data$fips=="24510",]

# Plot 5
png("plot5.png", width=480, height=480, units="px", bg="transparent")
plot5 <- ggplot(VehNEIBalt.data,aes(factor(year),Emissions, fill=year)) +
        geom_bar(stat="identity",width=0.65) +
        scale_fill_gradient(low="red", high="orange")+
        theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
              panel.background = element_blank(), axis.line = element_line(colour = "black"))+
        guides(fill=FALSE) +
        labs(x="Year", y=expression("Total PM"[2.5]*" Emission in Kilotons")) + 
        labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore from 1999-2008"))
print(plot5)
dev.off()