######################################################################
##MRAG Catch Shares Analysis
#Peter Kuriyama; ptrkrym@uw.edu
#September, 2014 - 

#Goal is to Generate biomass and fishing mortality plots for
#catch share managed fisheries
######################################################################

#set working directory
<<<<<<< HEAD
=======
# setwd('/Users/peterkuriyama/School/Research/MRAG')
>>>>>>> 5b7f53ba19860290cd2629b610de03c9cb942325
setwd('/Users/peterkuriyama/School/Research/MRAG/mrag_indicators')

#load packages
library('dplyr')
library('ggplot2')
source('mrag_functions.r')

######################################################################
##Proportions Plots
#Proportion Overfished
png(width = 9.5, height = 5.6, units = 'in', res = 250, 
  file = 'figs/prop_overfished.png')
plot_trend()
dev.off()

#Proportion Overfishing
png(width = 9.5, height = 5.6, units = 'in', res = 250, 
  file = 'figs/prop_overfishing.png')
plot_trend(column = 'prop.overfishing', 
  main.title = "Proportion Overfishing, F > Fmsy", ylim = c(0, .5))
dev.off()

#Proportion of High Overfishing
png(width = 9.5, height = 5.6, units = 'in', res = 250, 
  file = 'figs/prop_high_overfishing.png')
plot_trend(column = 'prop.high.overfishing', 
  main.title = "Proportion High Overfishing, F > 1.5 * Fmsy", ylim = c(0, 1))
dev.off()

######################################################################
##Trends in B and F

#All Stock Geometric average biomass
#B Ratios
png(width = 9.5, height = 5.6, units = 'in', res = 250, 
  file = 'figs/avg_b_ratio.png')
plot_trend(column = 'gm.b.ratio',
           main.title = 'Geometric Mean Biomass Ratio (B / Bmsy)',
           ylim = c(0, 1.6),
           ylabel = 'Ratio')
dev.off()

#F Ratios
png(width = 9.5, height = 5.6, units = 'in', res = 250, 
  file = 'figs/avg_f_ratio.png')
plot_trend(column = 'gm.f.ratio',
           main.title = 'Geometric Mean Fishing Mortality Ratio (F / Fmsy)',
           ylim = c(0, 2.5),
           ylabel = 'Ratio')
dev.off()

######################################################################
#Plot Rebuilding Trends
png(width = 9.5, height = 5.6, units = 'in', res = 250, 
  file = 'figs/rebuilding_b_ratio.png')
plot_rebuilding(column = 'gm.b.ratio',
           main.title = 'Rebuilding - Geometric Mean Biomass Ratio (B / Bmsy)',
           ylim = c(0, 1.5),
           ylabel = 'Ratio')
dev.off()

png(width = 9.5, height = 5.6, units = 'in', res = 250, 
  file = 'figs/rebuilding_f_ratio.png')
plot_rebuilding(column = 'gm.f.ratio',
           main.title = 'Rebuilding - Geometric Mean Fishing Mortality Ratio (F / Fmsy)',
           ylim = c(0, 1),
           ylabel = 'Ratio'
           )
dev.off()

######################################################################
##COmpare Overfished trends to total trend by region
#Northeast
png(width = 9.5, height = 5.6, units = 'in', res = 250, 
  file = 'figs/ne_overfished_avg_b_ratio.png')
plot_overfished(column = 'gm.b.ratio',
  area = 'ne',
  main.title = 'Northeast - Average B/Bmsy ratio',
  main1 = 'All Stocks',
  main2 = 'Overfished Stocks',
  ylabel = 'Ratio')
dev.off()

png(width = 9.5, height = 5.6, units = 'in', res = 250, 
  file = 'figs/ne_overfished_avg_f_ratio.png')
plot_overfished(column = 'gm.f.ratio',
  area = 'ne',
  main.title = 'Northeast - Average F/Fmsy ratio',
  main1 = 'All Stocks',
  main2 = 'Overfished Stocks',
  ylim = c(0, 4),
  ylabel = 'Ratio')
dev.off()

#West
png(width = 9.5, height = 5.6, units = 'in', res = 250, 
  file = 'figs/west_overfished_avg_b_ratio.png')
plot_overfished(column = 'gm.b.ratio',
  area = 'west',
  main.title = 'West - Average B/Bmsy ratio',
  main1 = 'All Stocks',
  main2 = 'Overfished Stocks',
  ylim = c(0, 1.5),
  ylabel = 'Ratio')
dev.off()

png(width = 9.5, height = 5.6, units = 'in', res = 250, 
  file = 'figs/west_overfished_avg_f_ratio.png')
plot_overfished(column = 'gm.f.ratio',
  area = 'west',
  main.title = 'West - Average F/Fmsy ratio',
  main1 = 'All Stocks',
  main2 = 'Overfished Stocks',
  ylabel = 'Ratio')
dev.off()












