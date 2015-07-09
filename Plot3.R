## Code to read the data - Only relevant data is loaded in the memory

setwd("C:/Users/smurthy/Downloads/ExploratoryDataanalysis")


fc = file("household_power_consumption.txt", open = "r")



l <- readLines(fc, n = 1)

colnamedf<-data.frame(matrix(unlist(strsplit(l,";")),nrow=1,byrow=T))

l <- readLines(fc, n = 1)


sl<-strsplit(l,";")

df1 <- data.frame(matrix(unlist(sl),nrow=1,byrow=T), stringsAsFactors = FALSE)

i<-0
while(length( (l <- readLines(fc, n = 1) ) > 0 )){
     
     sl<-strsplit(l,";")
     
     if(as.Date(as.vector(unlist(sl))[1],"%d/%m/%Y") %in% c(as.Date("2007-02-01"),as.Date("2007-02-02"))){
          i<-i+1
          
          df1[i,] <-  data.frame(matrix(unlist(sl),nrow=1,byrow=T), stringsAsFactors = FALSE)
     }
     
}

close(fc)


## ploting routine inlcuding writing to file


png("plot3.png", width=480, height=480, res=120)

plot(as.POSIXct(paste(df1[,1],df1[,2],sep=" "),format="%d/%m/%Y %H:%M:%S"),df1[,7],type = "l",xlab="",ylab="Energy sub metering",main="",cex.lab=.75)
lines(as.POSIXct(paste(df1[,1],df1[,2],sep=" "),format="%d/%m/%Y %H:%M:%S"),df1[,8],col="red")
lines(as.POSIXct(paste(df1[,1],df1[,2],sep=" "),format="%d/%m/%Y %H:%M:%S"),df1[,9],col="blue")

legend("topright",col = c("black","red","blue"),legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,cex=.7)




dev.off()