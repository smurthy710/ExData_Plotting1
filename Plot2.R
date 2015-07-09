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


png("plot2.png", width=480, height=480, res=120)

plot(as.POSIXct(paste(df1[,1],df1[,2],sep=" "),format="%d/%m/%Y %H:%M:%S"),df1[,3],type = "l",xlab="",ylab="Global Active Power (kilowatts)",main="",cex.lab=.6)


dev.off()