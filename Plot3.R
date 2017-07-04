###Plot3.R
cat("\f")   
library(dplyr)
library(base)
library(ggplot2)
library(lattice)

setwd("C:\\Users\\Aner\\Desktop\\C4_W1")
HPC <-read.table("household_power_consumption.txt",header = TRUE,sep=";")  ###   2,075,259[rows]X9[cols]
# Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3?

#Read only dates 2007-02-01 and 2007-02-02
HPC_sub <- subset(HPC, Date == "1/2/2007" | Date == "2/2/2007") ### 2880[rows]X9[cols]                  
#may be useful to convert the Date and Time variables to Date/Time classes in R using the strptime()  and as.Date() functions.
#in this dataset missing values are coded as ?.


########  plot 3
x<-HPC_sub$Sub_metering_1
y<-HPC_sub$Sub_metering_2
z<-HPC_sub$Sub_metering_3

HPC_sub$Date <- as.Date(HPC_sub$Date, format = '%d/%m/%Y')
HPC_sub$DateTime <- as.POSIXct(paste(HPC_sub$Date, HPC_sub$Time))
t<-HPC_sub$DateTime

plot(t,x, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(t,y, col = 'red')
lines(t,z, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)


dev.copy(png,'plot3.png')
dev.off()