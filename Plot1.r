## Code to read the data - Only relevant data is loaded in the memory

setwd("C:/Users/smurthy/Downloads/ExploratoryDataanalysis")


fc = file("household_power_consumption.txt", open = "r")

## copy column title

l <- readLines(fc, n = 1)

colnamedf<-data.frame(matrix(unlist(strsplit(l,";")),nrow=1,byrow=T))

l <- readLines(fc, n = 1)


sl<-strsplit(l,";")

df1 <- data.frame(matrix(unlist(sl),nrow=1,byrow=T), stringsAsFactors = FALSE)

## read one line at a time - split and check if it is the right date. Load into data farame if correct

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


png("plot1.png", width=480, height=480, res=120)



hist(as.numeric(df1[,"X3"]),col="Red",xlab="Global Active Power (kilowatts)",main="Global Active Power",cex.lab = .8)

dev.off()