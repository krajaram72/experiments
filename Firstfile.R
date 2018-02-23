
# List files in the primary storage

rxHadoopListFiles("wasb:///example/data/fruits.txt")

rxHadoopListFiles("wasb:///ford/")



myNameNode <- "default"
myPort <- 0


#Location of the data:  
bigDataDirRoot <- "/ford"  

#Define Spark compute context:
mySparkCluster <- RxSpark(nameNode=myNameNode, consoleOutput=TRUE)

#Set compute context:
rxSetComputeContext(mySparkCluster)

#Define the Hadoop Distributed File System (HDFS) file system:
hdfsFS <- RxHdfsFileSystem(hostName=myNameNode, port=myPort)

#Specify the input file to analyze in HDFS:
inputFile <-file.path(bigDataDirRoot,"UBIWeeklyBrakingAccelReport_2017-08-09.txt")
inputFile

fordFile <-file.path(bigDataDirRoot,"UBIWeeklyBrakingAccelReport_2017-08-09.txt")

ford_df <- RxTextData(fordFile, fileSystem = hdfsFS)
head(ford_df)

rxGetVarInfo(ford_df)


rxSummary(~ acceleration, data = ford_df)


rxSummary(~ ., data = ford_df)
