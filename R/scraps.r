# data <- subset(data, year <= years[2] & year >= years[1])


# all.stocks <- data %.% group_by(region, year) %.% summarise(arit.b.ratio = mean(b.ratio), 
#                                                               arit.f.ratio = mean(f.ratio, na.rm = T),
#                                                               gm.b.ratio = gm_mean(b.ratio),
#                                                               gm.f.ratio = gm_mean(f.ratio))

rebuilding.stocks
summarise(arit.b.ratio = mean(b.ratio), 
          arit.f.ratio = mean(f.ratio, na.rm = T),
          gm.b.ratio = gm_mean(b.ratio),
          gm.f.ratio = gm_mean(f.ratio)    )
                                                  arit.b.ratio = mean(b.ratio), 
                                                  arit.f.ratio = mean(f.ratio, na.rm = T),
                                                  gm.b.ratio = gm_mean(b.ratio),
                                                  gm.f.ratio = gm_mean(f.ratio)

all.stocks <- data %.% group_by(region, year) %.% 
                                                  summarise(tot.nrow = length(overfished), 
                                                  n.row = length(grep('Overfished', overfished)),
                                                  prop.overfished = n.row / tot.nrow,
                                                  arit.b.ratio = mean(b.ratio), 
                                                  arit.f.ratio = mean(f.ratio, na.rm = T),
                                                  gm.b.ratio = gm_mean(b.ratio),
                                                  gm.f.ratio = gm_mean(f.ratio))

#Below Msy


summarise(n.row = length(grep('Overfished', )))



  nrow(x))

grep('Overfished')


#Overfished

#Depleted
#Average biomass for overfished stocks

# B/bmsy ratio time series

#Catch shares went in in 2010

#Calculate




#Stocklong.x goes with f
#stocklong.y goes with b



as.data.frame(data %.% group_by(stocklong.x, f.ts) %.% 
  summarise(range(year)[1], range(year)[2]),
  function(x)                       ) 

 




data <- subset(data, year <= years[2] & year >= years[1])


all.avg.year <- data %.% group_by(region, year) %.% summarise(arit.b.ratio = mean(b.ratio), 
                                                              arit.f.ratio = mean(f.ratio, na.rm = T),
                                                              gm.b.ratio = gm_mean(b.ratio),
                                                              gm.f.ratio = gm_mean(f.ratio))








# make_plots <- function(data.type = 'biomass',
#                        years = c(2002, 2011),
#                        bad.crit = 0.5){
#   # print('data.type can be "biomass" or "fishing mortality"')
#   if(data.type == 'biomass') data <- b_ratios()
#   if(data.type == 'fishing mortality') data <- f_ratios()

#   data <- subset(data, tsyear <= years[2] & tsyear >= years[1])
   
#     data$ratio < bad.crit
#     data$overfished <- 
 
#   #Average Ratios by year  
#   all.avg.year <- data %.% group_by(region, tsyear) %.% summarise(avg.ratio = mean(ratio))

#   #Overfished Stocks



#   head()



# }


# biomass_plots <- function(years = c(2002, 2011)){
#   #Load Biomass
#   b <- b_ratios()



#   #Split Data
#   b.west <- east_west(data = b)$west
#   b.ne <- east_west(data = b)$ne


  
# }

# east_west(f)








# #Classify Stocks
# b <- b_ratios()
# b$overfished <- 'not overfished' 
# b[b$ratio <= 0.5, 'overfished'] <- 'overfished'

# overfished_stocks <- function(){
#   b <- b_ratios()
#   b$overfished <- 'not overfished' 
#   b[b$ratio <= 0.5, 'overfished'] <- 'Overfished'

#   b$s.o <- paste(b$overfished, b$stocklong)

#   unique(b[grep('Overfished', b$s.o), 'stocklong'])

# }



#   #Biomass Ratios
#   unique(nas$stocklong.x)
#   unique(b.ratios$stocklong.x)

#   unique(nas$stocklong.x)[unique(nas$stocklong.x) %in% unique(b.ratios$stocklong.x) == FALSE]

#   unique(b.ratios$stocklong.x)

#   b.ratios$stocklong.x[b.ratios$stocklong.x %in% nas$stocklong.x]



#   unique(b.ratios$stocklong.x)

#   is.na(b.ratios$stocklong.y)


#   to.check <- b.ratios[is.na(b.ratios$ratio), ]
#   unique(to.check$stocklong.x)


#   write.csv(b.ratios, 'output/check_b_ratios.csv')

#   unique(b.ratios[is.na(b.ratios$ratio),  'stocklong.y'])
  
#   b.ratios$stocklong.x == b.ratios$stocklong.y

#   is.na(b.ratios$ratio) == FALSE





#   unq.ref.mas <- unique(b.refs$metric.and.spp)

#   #Remove MSY 
#   unq.ref.mas[grep('msy', unq.ref.mas)]
  
#     #have no msy?
#     unq.ref.mas[1:107 %in% grep('msy', unq.ref.mas) == FALSE]
#     #A lot of B0 and SSB0. 
#     # Longspine thornyhead has 'SSB-MSY'

#   unq.ref.mas.nomsy <- gsub('msy','', unq.ref.mas)



#   unq.ts.mas %in% unq.ref.mas
  


  

#   ts.dd <- unique(ts$tsid)
#   ts.dd[ts.dd %in% ts.dd[grep('B', ts.dd)] == FALSE]



#   b.ts$metric.and.spp <- paste(b.ts$tsid)






#   b.refs[duplicated(b.refs$bioid), ]

#   grep('msy', refs$bioid)

#   gsub('msy')  refs$bioid









#   ##Calculate B Ratios
#   #Time Series
#   fs <- ts[grep('F', ts$tsid), ]
#   us <- ts[grep('U', ts$tsid), ]
#   ers <- ts[grep('ER', ts$tsid), ]
#   f <- rbind(fs, us, ers)

#   #Reference Points
#   fs.ref <- refs[grep('F', refs$bioid), ]
#   us.ref <- refs[grep('U', refs$bioid), ]
#   ers.ref <- refs[grep('ER', refs$bioid), ]
#   f.ref <- rbind(fs.ref, us.ref, ers.ref)

#   #Merge time series and reference points
#   f.ratios <- merge(f, f.ref, all = TRUE, by = 'stocklong')

#   #Remove NAs
#   f.ratios <- f.ratios[-which(is.na(f.ratios$tsvalue) == TRUE), ]
#   f.ratios <- f.ratios[-which(f.ratios$tsvalue == ''), ]
#   f.ratios <- f.ratios[-which(is.na(f.ratios$biovalue) == TRUE), ]

#   #Convert value columns to numeric
#   f.ratios$tsvalue <- as.numeric(f.ratios$tsvalue)

#   #Calculate Ratio
#   f.ratios$ratio <- f.ratios$tsvalue / f.ratios$biovalue

#   #Move Columns Around
#   f.ratios <- f.ratios[, c('stocklong', 'stockid.x', 'assessid.x', 'tsyear', 'tsvalue',
#                            'biovalue', 'ratio')]
#   f.ratios <- rename(f.ratios, c('stockid.x' = 'stockid', 
#                                  'assessid.x' = 'assessid'))

#   write.csv(f.ratios, file = 'output/f_ratios.csv')
#   return(f.ratios)




# #Change stocklong to all lowercase

# ##Function to Split into NE and West Coast Stocks
# east <- f[grep('NE', f$assessid), ]

# 'cod gulf of maine'
# 'cod Georges Bank'
# 'plaice'
# 'white hake'
# 'redfish'
# 'witch'
# 'pollock'
# 'yellowtail flounder'
# 'haddock'
# 'winter'


# west <- rbind(f[grep('W', f$assessid) ,], f[grep('PF', f$assessid) ,])








# unique(refs$bioid)









# #Calculate Ratios
# ##Check to see which species don't have ratios
# ts.spp <- unique(ts$stocklong)
# refs.spp <- unique(refs$stocklong)

# ts.spp[ts.spp %in% refs.spp == FALSE]
# refs.spp[refs.spp %in% ts.spp == FALSE]


# ts.id <- unique(ts$assessid)
# refs.id <- unique(refs$assessid)

# check <- merge(ts, refs, by = 'stocklong', all = TRUE)
# unique(check[which(check$assessid.x != check$assessid.y), 'stocklong'])





# # ts.id[ts.id %in% refs.id == FALSE]

# # head(ts)


