plot_overfished <- function(column = 'prop.overfished',
                             main.title = 'Proportion Overfished, B < 0.5 Bmsy',
                             ylim = c(0, 1),
                             ylabel = 'Proportion',
                             area = 'ne',
                             main1, 
                             main2){
  data <- classify_status()
  #Subset by Region
  data <- subset(data, region == area)
  overfished <- subset(data, overfished == 'Overfished')

  all.stocks <- data %.% group_by(region, year) %.% summarise(tot.nrow = length(overfished), 
                                                              overfished = length(grep('Overfished', overfished)),
                                                              prop.overfished = overfished / tot.nrow,
                                                              below.bmsy = length(grep('below', bmsy.status)),
                                                              prop.below.bmsy = below.bmsy / tot.nrow,
                                                              high.overfishing = length(grep('high', fmsy.status)), 
                                                              prop.high.overfishing = high.overfishing / tot.nrow,
                                                              overfishing = length(grep('overfishing', fmsy.status)), 
                                                              prop.overfishing = overfishing / tot.nrow,
                                                              arit.b.ratio = mean(b.ratio), 
                                                              arit.f.ratio = mean(f.ratio, na.rm = T),
                                                              gm.b.ratio = gm_mean(b.ratio),
                                                              gm.f.ratio = gm_mean(f.ratio)
                                                              )

overfished.stocks <- overfished  %.% group_by(region, year) %.% summarise(tot.nrow = length(overfished), 
                                                              overfished = length(grep('Overfished', overfished)),
                                                              prop.overfished = overfished / tot.nrow,
                                                              below.bmsy = length(grep('below', bmsy.status)),
                                                              prop.below.bmsy = below.bmsy / tot.nrow,
                                                              high.overfishing = length(grep('high', fmsy.status)), 
                                                              prop.high.overfishing = high.overfishing / tot.nrow,
                                                              overfishing = length(grep('overfishing', fmsy.status)), 
                                                              prop.overfishing = overfishing / tot.nrow,
                                                              arit.b.ratio = mean(b.ratio), 
                                                              arit.f.ratio = mean(f.ratio, na.rm = T),
                                                              gm.b.ratio = gm_mean(b.ratio),
                                                              gm.f.ratio = gm_mean(f.ratio)
                                                              )

# rebuild.only <- rebuild %.% group_by(region, year) %.% summarise(tot.nrow = length(overfished), 
#                                                               overfished = length(grep('Overfished', overfished)),
#                                                               prop.overfished = overfished / tot.nrow,
#                                                               below.bmsy = length(grep('below', bmsy.status)),
#                                                               prop.below.bmsy = below.bmsy / tot.nrow,
#                                                               high.overfishing = length(grep('high', fmsy.status)), 
#                                                               prop.high.overfishing = high.overfishing / tot.nrow,
#                                                               overfishing = length(grep('overfishing', fmsy.status)), 
#                                                               prop.overfishing = overfishing / tot.nrow,
#                                                               arit.b.ratio = mean(b.ratio), 
#                                                               arit.f.ratio = mean(f.ratio, na.rm = T),
#                                                               gm.b.ratio = gm_mean(b.ratio),
#                                                               gm.f.ratio = gm_mean(f.ratio)
#                                                               )

  
  # ne <- subset(all.stocks, region == 'ne')
  # west <- subset(all.stocks, region == 'west')

  par(mfcol = c(1, 2), oma = c(3, 4, 3, 1), mar=c(2, 1, 2, 3), xpd = TRUE)
  # plot(ne$year, round(ne[, column], digits = 2), ylim = ylim, xlab = 'Year', 
  #   ylab = 'Proportion Overfished', main = 'Northeast', type = 'b', pch = 19,
  #   axes = FALSE, xaxs = 'i', yaxs = 'i')
  
  #All West
  plot(all.stocks$year, round(all.stocks[, column], digits = 2), ylim = ylim, xlab = 'Year', 
    axes = FALSE, main = main1, type = 'b', pch = 19, xaxs = 'i', yaxs = 'i')
  abline(v = 2010, lty = 2, col = 'gray50')
  axis(side = 1, seq(2000, 2014, 2))
  axis(side = 2)
  
  #Rebuilding Plot
  plot(overfished.stocks$year, round(overfished.stocks[, column], digits = 2), ylim = ylim, xlab = 'Year', 
      axes = FALSE, main = main2, type = 'b', pch = 19, xaxs = 'i', yaxs = 'i')
    abline(v = 2011, lty = 2, col = 'gray50')
    axis(side = 1, seq(2000, 2014, 2))

  mtext(side = 1, outer = TRUE, 'Year', line = 1)
  mtext(side = 2, outer = TRUE, ylabel , line = 2)
  mtext(side = 3, outer = TRUE, main.title, line = 1)
  
}