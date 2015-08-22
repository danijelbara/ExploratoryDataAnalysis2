# Exploratory Data Analysis - Assignment 2 - Question 4
# Across the United States, how have emissions from coal 
# combustion-related sources changed from 1999–2008?

# Author: Danijel Bara
message(sprintf("Run time: %s\nR version: %s", Sys.time(), R.Version()$version.string))

# Loading datasets after downloading and unziping from local working directory
NEI.data <- readRDS("summarySCC_PM25.rds")
SCC.data <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

# Subset data
Subset1.data <- NEI.data[NEI.data$SCC %in% SCC.data[grep("Coal", SCC.data$EI.Sector), 1], ]
Subset2.data <- SCC.data[, c(1, 4)]

Coal.data <- merge(Subset1.data, Subset2.data, by.x = "SCC", by.y = "SCC")[, c(4, 6, 7)]

# Plot 4
png(filename='plot4.png', width = 480, height = 480, units="px",bg="transparent")
plot4 <- ggplot(Coal.data,aes(factor(year), fill=year, Emissions/1000)) +
        geom_bar(stat="identity",width=0.65) +
        scale_fill_gradient(low="red", high="orange")+
        theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), 
              panel.background = element_blank(), axis.line = element_line(colour = "black"))+
        guides(fill=FALSE) +
        labs(x="Year", y=expression("Total PM"[2.5]*" Emission in Kilotons")) + 
        labs(title=expression("PM"[2.5]*" Coal Combustion Source Emissions Across US from 1999-2008"))
print(plot4)
dev.off()