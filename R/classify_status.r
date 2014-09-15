classify_status <- function(){
  data <- suppressWarnings(expand_data_years())

  #Classify Stocks by biomass status
  data$overfished <- 'not overfished'
  data[data$b.ratio <= 0.5, 'overfished'] <- 'Overfished'


  data$bmsy.status <- 'above'
  data[data$b <= data$b.msy, 'bmsy.status'] <- 'below'

  data$fmsy.status <- 'overfishing'
  data[data$f <= data$f.msy, 'fmsy.status'] <- 'none'
  data[data$f > 1.5 * data$f.msy, 'fmsy.status'] <- 'high'


  #Classify West Coast Rebuilding
  data$rebuilding <- 'not'

  #Define rebuilding species
  rebuilding <- c('canary rockfish pacific coast', 'pacific ocean perch pacific coast', 
                  'yelloweye rockfish pacific coast', 'darkblotched rockfish pacific coast', 
                  'bocaccio southern pacific coast', 'petrale sole pacific coast', 
                  'cowcod southern california')

  #Change rebuilding column value
  data[data$stocklong.x %in% rebuilding, 'rebuilding'] <- 'rebuilding'
  write.csv(data, file = 'output/classify_status.csv')

  return(data)
}

