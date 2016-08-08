# plot 3 

library(lubridate)
library(dplyr)
library(stringr)


# read data from file. 
# TODO define read operation as function

ds1 <- read.table("household_power_consumption.txt", sep =";", stringsAsFactors = FALSE, header = TRUE ,
                  dec = ".",na.strings = "?",
                  colClasses = c("character", "character", "numeric", "numeric", "numeric","numeric","numeric","numeric","numeric" )
)



ds1<- ds1 %>% filter (Date=="1/2/2007" | Date=="2/2/2007") %>%
  mutate (Date = dmy_hms( paste(Date , Time , sep =" ") )) 

# Draw plot on display 
#reset mfrow
par(mfrow=c(1,1))

with(ds1, plot(Date, Sub_metering_1, type = "n" , xlab = "", ylab = "Energy sub metering"))
with(ds1, lines(Date, Sub_metering_1, col = "black" ))
with(ds1, lines(Date, Sub_metering_2, col = "red" ))
with(ds1, lines(Date, Sub_metering_3, col = "blue" ))



legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1,1), 
       lwd=c(2.5,2.5,2.5),col=c("black","red", "blue")) 


# then copy to PNG
dev.copy( png,'plot3.png',  width = 480, height = 480)
dev.off()
