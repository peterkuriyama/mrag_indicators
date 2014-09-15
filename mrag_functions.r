#Source Functions
source('R/time_series.r') #Load and update time series data
source('R/ref_points.r') #Load and update reference points
source('R/f_ratios.r') #Calculate F:Fmsy ratios for stocks
source('R/b_ratios.r') #Calculate B:Bmsy ratios for stocks
source('R/east_west.r') #Split input into east and west
source('R/rename.r') #Rename
source('R/merge_f_b.r') #Merge F and B ratio data frames
source('R/gm_mean.r') #Function to calculate geometric mean
source('R/expand_data_years.r') #Add years up to 2013
source('R/classify_status.r') #Classify Stock Status
source('R/plot_trend.r') #Plot Columns of aggregated data
source('R/plot_rebuilding.r') #Plot Rebuilding Species Trends
source('R/plot_overfished.r') #Plot Overfished Trends