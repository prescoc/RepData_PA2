url.StormData <- "https://d396qusza40orc.cloudfront.net/repdata%2Fdata%2FStormData.csv.bz2"
download.file(url.StormData, basename(url.StormData))
# Contents documented https://d396qusza40orc.cloudfront.net/repdata%2Fpeer2_doc%2Fpd01016005curr.pdf
# also at http://www.nws.noaa.gov/directives/010/pd01016005e.pdf
# National Weather Service Instruction 10-1605, August 17, 2007; Storm Data Preparation.
# RStudio version 0.99.903
#  version 3.3.1 (2016-06-21) -- "Bug in Your Hair"
stormData <- read.csv(basename(url.StormData))
# 902,297 obs of 37 variables

table(grep("WIND", stormData$EVTYPE, value = T))

ExpVal <- function(exponent) {
  # Convert an exponent into a value to scale the damage estimate
  # Valid exponents (case insensitive) are H, K, M, and B,
  # other values receive a scale of 1.
  # Damage estimate is this value times the DMG field value.
  
  switch(toupper(exponent),
         H=100, K=1000, M=1000000, B=1000000000, 1)
}

evFatal <- sort(tapply(stormData$FATALITIES, stormData$EVTYPE, sum), decr=T)
head(evFatal)
barplot(evFatal[1:10], names.arg=names(evFatal)[1:10], main="Fatality Events")
HowMany <- function(ev, ptn, ic=TRUE) { vv <- ev[grep(ptn, names(ev), value=T, ignore.case=ic)]; vv <- vv[vv>0]; show(vv); sum(vv)}
evFatal[grep("TORN", names(evFatal), value=T, ignore.case=T)]
evFatal[grep("HEAT|HOT", names(evFatal), value=T, ignore.case=T)]
evFatal[grep("FLOOD", names(evFatal), value=T, ignore.case=T)]
evFatal[grep("LIGHTNING", names(evFatal), value=T, ignore.case=T)]