# plot 4

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

#Set Plot Area 2x2

par(mfrow=c(2,2))

# 1. Top Left
with(ds1, 
     plot(Date, Global_active_power, type="l",
          xlab="", ylab="Global Active Power" 
     )
)

# 2. Top Right
with(ds1,
     plot(Date, Voltage, type="l",xlab="", ylab="Voltage" )
)


# 3. Bottom Left
with(ds1, plot(Date, Sub_metering_1, type = "n" , xlab = "", ylab = "Energy sub metering"))
with(ds1, lines(Date, Sub_metering_1, col = "black" ))
with(ds1, lines(Date, Sub_metering_2, col = "red" ))
with(ds1, lines(Date, Sub_metering_3, col = "blue" ))


legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=c(1,1,1), col=c("black","red", "blue"),  bty="n", cex=0.75)

# 4. Bottom Right
with(ds1, 
     plot(Date, Global_reactive_power, type="l",
          lwd=0.5, xlab="datetime", ylab="Global_reactive_power"
     )
)

# then copy to PNG
dev.copy( png,'plot4.png',  width = 480, height = 480)
dev.off()





