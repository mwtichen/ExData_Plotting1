file <- 'household_power_consumption.txt'
data <- read.table(file,header=TRUE,sep=';',stringsAsFactors=FALSE,na.strings='?')
date <- sub('\\/','',data$Date)
date <- sub('\\/','',date)
date <- as.numeric(date)
log <- date == 222007 | date == 122007
data <- data[log,]

par(mfrow=c(2,2),mar=c(4,4,0.5,0.5))
with(data,plot(datetime,Global_active_power,type='l',ylab=gap,xlab=''))
with(data,plot(datetime,Voltage,type='l'))
with(data,plot(datetime,Sub_metering_1,type="n",xlab='',ylab='Energy sub metering'))
points(data$datetime,data$Sub_metering_1,type='l')
points(data$datetime,data$Sub_metering_2,type='l',col='red')
points(data$datetime,data$Sub_metering_3,type='l',col='blue')
legend('topright',lty=1,col=c('black','red','blue'),legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),cex=0.6)
with(data,plot(datetime,Global_reactive_power,type='l'))