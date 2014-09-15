#Function to repeat last year of data up to 2013
#Assumes that stock statuses have remained constant since time of 
#last assessment
expand_data_years <- function(){
  data <- merge_f_b()

  # write.csv(data[is.na(data$stocklong.x != data$stocklong.y), ], 
  #   file = 'output/check_merged_data.csv')
# grep('cowcod', data[-which(is.na(data$b.ratio) == TRUE), ])
  data <- data[-which(is.na(data$b.ratio) == TRUE), ]

  #Extend all ratios to 2013
  f.spp <- unique(data$stocklong.x)

  data.expanded <- as.data.frame(matrix(nrow=1, ncol=17))
  names(data.expanded) <- names(data)

  for(ii in 1:length(f.spp)){
    temp <- subset(data, stocklong.x == f.spp[ii])
    # print(ii)
    # if(max(temp$year) == 2013) next
    if(nrow(temp) == 0) next
    to.add <- temp[rep(which(temp$year == max(temp$year)), 2013 - max(temp$year) + 1), ]
    to.add$year <- seq(max(temp$year), 2013)
    to.add <- to.add[-1, ]

    expanded <- rbind(temp, to.add)

    data.expanded <- rbind(data.expanded, expanded)
  }
  
  data.expanded <- data.expanded[-which(is.na(data.expanded$unq) == TRUE), ]

  write.csv(data.expanded, file = 'output/expand_data_years.csv')
  return(data.expanded)
}
