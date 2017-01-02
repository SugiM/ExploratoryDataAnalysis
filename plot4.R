# The data should be downloaded into your working Directory
# Load data into table
exdata=read.table("household_power_consumption.txt",sep=";",header=TRUE, strip.white=TRUE,stringsAsFactors=FALSE,na.strings="?")

# Subset the table for two days
exdata_feb<-subset(exdata,exdata$Date %in% c("1/2/2007","2/2/2007"))

# Convert the Date Column into Date Class
exdata_feb$Date=as.Date(exdata_feb$Date,format="%d/%m/%Y")

#Combine Date and Time and create another column called Datetime
exdata_feb$DateTime<-paste(exdata_feb$Date, exdata_feb$Time)

# Convert DateTime column into 
exdata_feb$DateTime<-as.POSIXct(exdata_feb$DateTime)

# Plot4 Graph
# There are 4 graphs required, hence set the parameters 

par(mfrow=c(2,2), mar=c(4,4,2,2))
plot(exdata_feb$Global_active_power ~ exdata_feb$DateTime, type="l",ylab="Global Active Power",xlab="")


plot(exdata_feb$Voltage~ exdata_feb$DateTime, type="l",ylab="Voltage",xlab="datetime")
plot(exdata_feb$Sub_metering_1~exdata_feb$DateTime, type="l",ylab="Energy sub metering", xlab="")
lines(exdata_feb$Sub_metering_2~exdata_feb$DateTime, col='Red')
lines(exdata_feb$Sub_metering_3~exdata_feb$DateTime, col='blue')
legend("topright",col=c("black", "red", "blue"), lty=1, bty="n",lwd=1,cex=0.60,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(exdata_feb$Global_reactive_power~exdata_feb$DateTime,type="l",ylab="Global_reactive_power",xlab="datetime")

#Plot4 png
dev.copy(png, file="plot4.png",width = 480, height = 480)
dev.off()







