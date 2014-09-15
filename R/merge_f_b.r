merge_f_b <- function(){
  #Merge f and b
  f <- f_ratios()
  f$unq <- paste(f$stocklong, f$tsyear)
  f <- rename(f, c('ratio' = 'f.ratio',
                   'biovalue' = 'f.msy',
                   'tsid' = 'f.ts',
                   'tsvalue' = 'f',
                   'tsyear' = 'year',
                   'bioid' = 'fmsy.id'))

  b <- b_ratios()
  b$unq <- paste(b$stocklong, b$tsyear)
  b <- rename(b, c('ratio' = 'b.ratio',
                   'biovalue' = 'b.msy',
                   'tsid' = 'b.ts',
                   'tsvalue' = 'b',
                   'tsyear' = 'year',
                   'bioid' = 'bmsy.id'))

  f <- subset(f, year >= 2000)
  b <- subset(b, year >= 2000)

  full <- merge(f[, c('unq', 'f.ratio', 'f.msy', 'fmsy.id',
                      'f', 'f.ts', 'stocklong')], b, by='unq', all = TRUE)

  write.csv(full, file = 'output/merged_data.csv')
  return(full)
}
