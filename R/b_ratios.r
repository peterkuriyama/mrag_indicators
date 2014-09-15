b_ratios <- function(){
  ts <- time_series()
  refs <- ref_points()

  #Time Series Values
  b.ts <- ts[grep('B', ts$tsid), ]
  b.ts$metric.and.spp <- paste(b.ts$tsid, b.ts$stocklong)

  unq.ts.mas <- unique(b.ts$metric.and.spp)

  #Reference Points
  refs.dd <- unique(refs$bioid)
  # refs.dd[refs.dd %in% refs.dd[grep('B', refs.dd)] == FALSE]

  b.refs <- refs[grep('B', refs$bioid), ]
  
  b.refs$metric.and.spp <- paste(b.refs$bioid, b.refs$stocklong)
  b.refs$metric.and.spp <- gsub('msy', '', b.refs$metric.and.spp)
  b.refs$metric.and.spp <- gsub('0', '', b.refs$metric.and.spp)

  #Merge refs and ts by metric.and.spp column to see where merge will work 
  b.ratios <- merge(b.ts, b.refs, all = TRUE, by = 'metric.and.spp')
  b.ratios$tsvalue <- as.numeric(b.ratios$tsvalue)

  #Calculate Ratios
  b.ratios$ratio <- b.ratios$tsvalue / b.ratios$biovalue

  #Separate Rows with NA
  nas <- b.ratios[which(is.na(b.ratios$ratio) == TRUE), ]
  b.ratios <- b.ratios[-which(is.na(b.ratios$ratio) == TRUE), ]    
  
  #Rearrange Columns
  b.ratios <- b.ratios[, c('tsyear', 'stockid.x', 'assessid.x', 'stocklong.x', 
                           'tsid', 'tsvalue', 'bioid', 'biovalue',
                           'ratio')]
  b.ratios <- rename(b.ratios, c('stockid.x' = 'stockid',
                                 'assessid.x' = 'assessid',
                                 'stocklong.x' = 'stocklong'))
  b.ratios <- b.ratios[, c('stocklong', 'stockid', 'assessid', 'tsyear', 'tsid',
    'tsvalue', 'bioid', 'biovalue', 'ratio')]

  b.ratios <- east_west(data = b.ratios)
  # write.csv(nas, 'output/b_values_that_didnt_merge.csv')
  write.csv(b.ratios, 'output/b_values_that_merged.csv')
  return(b.ratios)
}
