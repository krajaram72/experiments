myNameNode <- "wasb://nwfordhd-2017-08-28t14-42-20-095z@nwford.blob.core.windows.net"
myPort <- 0

# List files in the primary storage

rxHadoopListFiles("wasb:///example/data/fruits.txt")

rxHadoopListFiles("wasb:///example/data/")
