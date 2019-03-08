#Plots and Data Processing/Prep

library(plotly)
library(lubridate)
library(readr)
library(xts)

#####-----Data Cleaning / Reformatting -----#####
find_start <- function(index_column, dt_formats) {
  count <- 1
  for (entry in index_column) {
    if (count > 50) {
      return(NA)
    }
    
    result <- parse_date_time(entry, dt_formats, quiet = TRUE)
    
    if (!is.na(result)) {
      return(count)
    }
    count <- count + 1
  }
}

#input: datapath from csvFileInput containing 1 trend
#Output: xts object with 1 data column, 1 index
process_data<-
  function(df,
           keep_columns = c(2),
           col_names = c('val'),
           dt_formats = c('Ymd HM', 'Ymd HMS', 'mdy IMS p'),
           state_change_data = FALSE,
           periodicity_15 = FALSE) {
    #df: dataframe like object containing time series data
    #keep_columns: vector of column numbers to keep (after dropping redundant index columns)
    #col_names: names of non index columns
    #state_change: bool flag for whether state change data
    #periodicity_15: bool flag to force downscale to 15 minute period for NON state_change data
    
    #Remove redundant index column if present
    df_rowcount <- length(df[[1]]) + array(-5:5) #+/- 5
    
    last_val <- df[length(df[[1]]), 1][[1]]
    
    if (any(df_rowcount == last_val)) {
      df <- df[c(-1)]
      warning("First column detected to be numeric index, removed")
    }
    
    start <- find_start(df[[1]], dt_formats)
    if (is.na(start)) {
      start <- find_start(df[[2]], dt_formats)
      if (is.na(start)) {
        stop("Unable to locate or parse datetime column within first two columns")
      } else{
        df <- df[c(-1)] #failsafe to drop redunant index column
        warning("First column detected to be numeric index, removed")
      }
    }
    
    #trim rows before start
    df <- df[start:length(df[[1]]), ]
    
    #trim extra columns
    df <- df[c(1, keep_columns)]
    
    colnames(df) <- c('index', col_names)
    
    #filter out incomplete date/val pairs
    df <- df[complete.cases(df[, c(1, keep_columns)]), ]
    
    #Convert index to datetime format
    df$index <-
      lubridate::parse_date_time(df$index, dt_formats, quiet = TRUE)
    if (all(is.na(df$index))) {
      stop("Unable to parse datetimes with given orders/index column")
    }
    
    xtsdata <- xts(df[2:length(df)], order.by = df$index)
    
    #Account for Periodicty
    if (periodicity_15 && !state_change_data) {
      p <- periodicity(xtsdata)
      if (p['frequency'] < 15 &&
          p['units'] == 'mins') {
        xtsdata <- to.minutes15(xtsdata)[, 1]
      }
    }
    
    return(xtsdata)
  }


#####----- Plotting -----#####

emptyPlot <-
  function() {
    #x-axis
    x <- list(visible = FALSE)
    
    #Left y-axis
    y <- list(visible = FALSE)
    
    #BPL Logo Splash
    logo <- list(
      list(
        source =  "https://raw.githubusercontent.com/cunybpl/noBAS-vis/master/bpl-logo.png",
        xref = "paper",
        yref = "paper",
        x = 0,
        y = 1,
        sizex = 1,
        sizey = 1,
        sizing = "contain",
        opacity = 0.3,
        layer = "below"
      )
    )
    
    plt <-
      plot_ly(type = 'scatter', mode = 'lines') %>% layout(
        title = '',
        images = logo,
        xaxis = x,
        yaxis = y
      )
    
    return(plt)
  }

fullPlot <- function(discreteData = NA,
                     stateData = NA) {
  #Return plotly object from data (xtsformat)
  #discreteData: List of trends such as Temperature
  #stateData: State change data (0 or 1)
  
  if (is.na(discreteData) && is.na(stateData)){
    print("no data provided, defaulted to emptyPlot")
    return(emptyPlot())
  }
  else if (is.na(stateData)) {
    #discreteData without stateData
  }
  else if(is.na(discreteData)){
    #stateData without discreteData
  }
  else{
    #discreteData and stateData
  }
}