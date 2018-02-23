# List data files in the secondary blob storage

rxHadoopListFiles("wasb://nwfordhd-2017-08-28t14-42-20-095z@nwford.blob.core.windows.net/ford/WeeklyMetrics/UBIWeeklyBrakingAccelReport_2017-08-04.txt")
rxHadoopListFiles("wasb://nwfordhd-2017-08-28t14-42-20-095z@nwford.blob.core.windows.net/ford/WeeklyMetrics/")

myNameNode <- "wasb://nwfordhd-2017-08-28t14-42-20-095z@nwford.blob.core.windows.net"
myPort <- 0

#Location of the data:
bigDataDirRoot <- "/ford/WeeklyMetrics"

#Define Spark compute context:
mySparkCluster <- RxSpark(consoleOutput=TRUE, nameNode=myNameNode, port=myPort)

#Set compute context:
rxSetComputeContext(mySparkCluster)

#Define HDFS file system:
hdfsFS <- RxHdfsFileSystem(hostName=myNameNode, port=myPort)

#Specify the input file to analyze in HDFS:
inputFile <-file.path(bigDataDirRoot,"UBIWeeklyBrakingAccelReport_2017-08-04.txt")
inputFile

df <- RxTextData(inputFile, fileSystem = hdfsFS)
head(df)
