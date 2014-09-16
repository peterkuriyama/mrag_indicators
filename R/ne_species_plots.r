

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
print(ne.f)


#B/Bmsy Ratios

ne.b <- ggplot(ne, aes(x = year, y = b.ratio, group = stocklong.x)) + 
               geom_line() +  
               facet_wrap (~ stocklong.x) +
               theme_bw() + 
               geom_vline(xintercept = 2009.5, linetype = 'dashed') + 
               geom_hline(yintercept = 1, linetype = 'dashed') + 
               ggtitle('Northeast B/Bmsy Ratios')         

print(ne.b)


