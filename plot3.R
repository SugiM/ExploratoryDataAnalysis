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


#plot3 Graph

plot(exdata_feb$Sub_metering_1~exdata_feb$DateTime, type="l",ylab="Energy sub metering", xlab="")
lines(exdata_feb$Sub_metering_2~exdata_feb$DateTime, col='Red')
lines(exdata_feb$Sub_metering_3~exdata_feb$DateTime, col='blue')
legend("topright",col=c("black", "red", "blue"), lty=1,lwd=1,cex=.70,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Plot3 png

dev.copy(png, file="plot3.png",width = 480, height = 480)
dev.off()
