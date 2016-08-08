# plot 1

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

hist(ds1$Global_active_power, col ="red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab ="Frequency")



# then copy to PNG
dev.copy( png,'plot1.png',  width = 480, height = 480)
dev.off()