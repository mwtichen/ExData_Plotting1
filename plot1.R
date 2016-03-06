file <- 'household_power_consumption.txt'
data <- read.table(file,header=TRUE,sep=';',stringsAsFactors=FALSE,na.strings='?')
date <- sub('\\/','',data$Date)
date <- sub('\\/','',date)
date <- as.numeric(date)
log <- date == 222007 | date == 122007
data <- data[log,]

gap <- 'Global Active Power (kilowatts)'
hist(data$Global_active_power,xlab=gap,main="Global Active Power",col='red')
 dev.copy(png,file="plot1.png")
 dev.off()