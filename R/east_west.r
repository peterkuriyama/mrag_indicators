# data <- f_ratios()

east_west <- function(data){
  
  #Northeast Species
  ne.species <- c('atlantic cod gulf of maine', 'atlantic cod georges bank', 'american plaice nafo-5yz', 
      'white hake georges bank / gulf of maine', 'acadian redfish gulf of maine / georges bank',
      'witch flounder nafo-5y', 'pollock nafo', 'yellowtail flounder georges bank', 
      'yellowtail flounder southern new england-mid atlantic', 'yellowtail flounder cape cod / gulf of maine',
      'haddock nafo-5y', 'haddock georges bank', 'winter flounder georges bank',
      'winter flounder southern new england-mid atlantic','winter flounder nafo-5z')

  #West Coast Species
  wf <- data[grep('WFSC', data$assessid), ]
  pac <- data[grep('PFMC', data$assessid), ]
  west <- rbind(wf, pac)
  
  #TO Remove
  west.remove <- c('pacific chub mackerel pacific coast', 'cabezon oregon coast', 
                   'california scorpionfish southern california', 'pacific sardine pacific coast', 
                   'spotted spiny dogfish pacific coast', 'cabezon southern california',
                   'cabezon northern california')

  west <- west[-which(west$stocklong %in% west.remove == TRUE), ]
  west$region <- 'west'
  
  ne <- data[data$stocklong %in% ne.species, ]
  ne$region <- 'ne'

  out <- rbind(west, ne)
  return(out)
}