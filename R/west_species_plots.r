

data <- classify_status()

##Northeast
west <- subset(data, region == 'west')

#F/Fmsy Ratios
west.f <- ggplot(west, aes(x = year, y = f.ratio, group = stocklong.x)) + 
                 geom_line() +  
                 facet_wrap (~ stocklong.x) +
                 theme_bw() + 
                 geom_vline(xintercept = 2009.5, linetype = 'dashed') + 
                 geom_hline(yintercept = 1, linetygitpe = 'dashed') + 
                 ggtitle('West F/Fmsy Ratios')
print(west.f)


#B/Bmsy Ratios

west.b <- ggplot(west, aes(x = year, y = b.ratio, group = stocklong.x)) + 
                 geom_line() +  
                 facet_wrap (~ stocklong.x) +
                 theme_bw() + 
                 geom_vline(xintercept = 2009.5, linetype = 'dashed') + 
                 geom_hline(yintercept = 1, linetype = 'dashed') + 
                 ggtitle('West B/Bmsy Ratios')         

print(west.b)


