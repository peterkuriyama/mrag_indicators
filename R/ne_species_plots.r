

data <- classify_status()

##Northeast
ne <- subset(data, region == 'ne')

#F/Fmsy Ratios
ne.f <- ggplot(ne, aes(x = year, y = f.ratio, group = stocklong.x)) + 
               geom_line() +  
               facet_wrap (~ stocklong.x) +
               theme_bw() + 
               geom_vline(xintercept = 2009.5, linetype = 'dashed') + 
               geom_hline(yintercept = 1, linetype = 'dashed') + 
               ggtitle('Northeast F/Fmsy Ratios')

png(width = 12.7, height = 7, res = 250, units = 'in',
  file = 'figs/ne_f_ratios.png')
print(ne.f)
dev.off()

#B/Bmsy Ratios

ne.b <- ggplot(ne, aes(x = year, y = b.ratio, group = stocklong.x)) + 
               geom_line() +  
               facet_wrap (~ stocklong.x) +
               theme_bw() + 
               geom_vline(xintercept = 2009.5, linetype = 'dashed') + 
               geom_hline(yintercept = 1, linetype = 'dashed') + 
               ggtitle('Northeast B/Bmsy Ratios')         

png(width = 12.7, height = 7, res = 250, units = 'in',
  file = 'figs/ne_b_ratios.png')
print(ne.b)
dev.off()

