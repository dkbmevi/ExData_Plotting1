##Plot2.R
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

x<- HPC_sub$Global_active_power
x<-as.numeric(levels(x))[x]


########  plot 2
HPC_sub$Date <- as.Date(HPC_sub$Date, format = '%d/%m/%Y')
HPC_sub$DateTime <- as.POSIXct(paste(HPC_sub$Date, HPC_sub$Time))
t<-HPC_sub$DateTime
plot(t,x,type="l",ylab="Global Active Power (kilowatts)",xlab=' ')
dev.copy(png,'plot2.png')
dev.off()

