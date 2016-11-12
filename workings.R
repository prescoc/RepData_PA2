url.StormData <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
download.file(url.StormData, basename(url.StormData))
# Contents documented https://d396qusza40orc.cloudfront.net/repdata%2Fpeer2_doc%2Fpd01016005curr.pdf
# also at http://www.nws.noaa.gov/directives/010/pd01016005e.pdf
# National Weather Service Instruction 10-1605, August 17, 2007; Storm Data Preparation.
# RStudio version 0.99.903
#  version 3.3.1 (2016-06-21) -- "Bug in Your Hair"
stormData <- read.csv(basename(url.StormData))
# 902,297 obs of 37 variables