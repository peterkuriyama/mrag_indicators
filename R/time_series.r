time_series <- function(){
  #Load Original Data
  ts <- read.csv(file = 'data/time_series.csv', stringsAsFactors = FALSE)
  ts <- ts[, 1:6]

  ts.2 <- read.csv(file = 'data/time_series_v2.csv', stringsAsFactors = FALSE)
  ts.2 <- ts.2[, 1:6]

  #Check Difference between ts and ts.2
  ts.id <- unique(ts$assessid)
  ts.2.id <- unique(ts.2$assessid)

  #Remove Winter Flounder
  ts <- ts[-which(ts$assessid ==  ts.id[77]), ]
  ts <- rbind(ts, ts.2[grep('WINFLOUNSNEMATL', ts.2$assessid), ])

  #Now Incorporate Updated TS
  ts.update <- read.csv(file = 'data/time_series_update.csv', stringsAsFactors = FALSE)
  ts.u.spp <- unique(ts.update$stocklong)
  ts.spp <- unique(ts$stocklong)

  #Remove these spp
  ts.spp.rem <- ts.spp[which(ts.spp %in% ts.u.spp == TRUE)]

  ts <- ts[-which(ts$stocklong %in% ts.spp.rem == TRUE), ]

  ts <- rbind(ts, ts.update)
  ts$stocklong <- tolower(ts$stocklong)
  write.csv(ts, 'output/time_series_output.csv')
  return(ts)
}
  