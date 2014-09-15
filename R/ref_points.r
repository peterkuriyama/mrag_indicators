ref_points <- function(){
  #Reference Points
  refs <- read.csv(file = 'data/ref_points.csv', stringsAsFactors = FALSE)
  refs$X <- NULL

  refs2 <- read.csv(file = 'data/ref_points_updates_2.csv', stringsAsFactors = FALSE)
  spp.update <- unique(refs2$stocklong)

  #Remove old reference values
  refs <- refs[-which(refs$stocklong %in% spp.update == TRUE), ]

  #Add new Reference values
  refs <- rbind(refs, refs2)
  refs$stocklong <- tolower(refs$stocklong)

  write.csv(refs, 'output/ref_points_output.csv')
  return(refs)
}


