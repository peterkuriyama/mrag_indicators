#Trajectories of species plots over time for west coast


data <- classify_status()

##West
west <- subset(data, region == 'west')

# west[duplicated(west$unq), ]
# write.csv(west[duplicated(west$unq), ], file = 'output/duplicates.csv')

#Remove Cowcod B0
cowcod <- west[grep('cowcod', west$stocklong.x), ]

#Remove Cowcod from main data frame
west <- west[-grep('cowcod', west$stocklong.x), ]
cowcod <- cowcod[-grep('B0', cowcod$bmsy.id), ]
west <- rbind(west, cowcod)

#Condense Stock names
temp <- strsplit(west$stocklong.x, split = ' ', fixed = TRUE)
west$plot.names <- sapply(X = temp, FUN = function(x) paste(x[1], x[2], x[3]))

#alter greenspotted names
gs.index <- grep('greenspotted', west$stocklong.x)
gs.temp <- strsplit(west[gs.index, 'stocklong.x'], split = ' ', fixed = TRUE)
west[gs.index, 'plot.names'] <- sapply(X = gs.temp, FUN = function(x) paste(x[1], x[2], x[5]))

#F/Fmsy Ratios

west.f <- ggplot(west, aes(x = year, y = f.ratio, group = plot.names)) + 
                 geom_line() +  
                 facet_wrap (~ plot.names) +
                 theme_bw() + 
                 geom_vline(xintercept = 2010.5, linetype = 'dashed') + 
                 geom_hline(yintercept = 1, linetype = 'dashed') + 
                 ggtitle('West F/Fmsy Ratios')

png(width = 12.7, height = 7, res = 250, units = 'in',
  file = 'figs/west_f_ratios.png')
print(west.f)
dev.off()

#B/Bmsy Ratios
west.b <- ggplot(west, aes(x = year, y = b.ratio, group = plot.names)) + 
                 geom_line() +  
                 facet_wrap (~ plot.names) +
                 theme_bw() + 
                 geom_vline(xintercept = 2010.5, linetype = 'dashed') + 
                 geom_hline(yintercept = 1, linetype = 'dashed') + 
                 ggtitle('West B/Bmsy Ratios')

png(width = 12.7, height = 7, res = 250, units = 'in',
  file = 'figs/west_b_ratios.png')
print(west.b)
dev.off()
#Cowcod B

