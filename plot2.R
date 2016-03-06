file <- 'household_power_consumption.txt'
data <- read.table(file,header=TRUE,sep=';',stringsAsFactors=FALSE,na.strings='?')
date <- sub('\\/','',data$Date)
date <- sub('\\/','',date)
date <- as.numeric(date)
log <- date == 222007 | date == 122007
data <- data[log,]

data$datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
with(data,plot(datetime,Global_active_power,type='l',ylab=gap,xlab=''))
dev.copy(png,file="plot2.png")
dev.off()