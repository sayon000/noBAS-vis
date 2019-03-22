#Plots and Data Processing/Prep

library(plotly)
library(lubridate)
library(readr)
library(xts)
library(dplyr)

#####-----Data Cleaning / Reformatting -----#####

#DEPRECATED
#Loop through index_column of dataframe looking for and entry that matches parse_date_time(entry,dt_formats)
  #Returns location of first match
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

#Read in csv file. Skips until string "Date" is encountered
#Assumes Index column header contains string "Date"
csv_read <- function(filepath){
  data.table::fread(filepath,sep=',',data.table=FALSE,blank.lines.skip=TRUE,skip="Date",na.strings=c("","logged","Logged"))
}

#input: datapath from csvFileInput containing 1 trend
#Output: xts object with 1 data column, 1 index
process_data<-
  function(data,
           state_change_data,
           target_columns,
           dt_formats = c('Ymd HM', 'Ymd HMS', 'mdy IMS p'),
           periodicity_15 = FALSE) {
    #data: csv file object exported through HOBOware
    #state_change: bool flag for whether state change data
    #target_columns: target data columns (not Date Time) to keep (matching via regex)
    
      #IMPORTANT: target_columns string values MUST corresponds to the "Measurement" name given to the logger 
                  #when initialized in HOBOware
    
    #dt_formats: datetime formats to try and parse against. Default values work for all  HOBOware files (to my knowledge)
    #periodicity_15: bool flag to force downscale to 15 minute period for NON state_change data
    
    df <- csv_read(data)
    
    #Remove redundant index column if present
    df <- df %>% select(-matches("#"))
    
    actual_colnames <- colnames(df)
    
    #Keep only Specified Columns + Date Column
    targets <- "Date" 
    for(target in target_columns){
      targets <- paste(targets,"|",target,sep="")
    }
    df <- df %>% select(matches(targets))
    
    if(length(target_columns) + 1 != length(colnames(df))){
      stop(paste(
        "\nUnable to locate all target_columns.", 
        "\nThis indicates the expected column headers do no match the actual column headers.",
        "\nExpected Column Headers: ", target_columns,
        "\nActual Columns: ", actual_colnames)
      )
    }

    colnames(df)[1] <- "index"
    
    #filter out incomplete date/val pairs
    df <- df[complete.cases(df),]
    
    #Convert index to datetime format
    df$index <-
      lubridate::parse_date_time(df$index, dt_formats, quiet = TRUE)
    if (all(is.na(df$index))) {
      stop("Unable to parse datetimes with given orders/index column")
    }
    
    #Convert to xts
    col_names = colnames(df)[-1]
    xtsdata <- xts(df[2:length(df)], order.by = df$index)
    
    #State Change Data
    if(state_change_data){
      
      times <- index(xtsdata)
      times <- times - 1
      times <- times[-1]
      nas <- rep(NA,length(times))
      insert <- xts(nas,times)
      xtsdata <- suppressWarnings(rbind(xtsdata,insert))
      xtsdata <- na.locf(xtsdata)
      
      return(xtsdata)
      
    }
    #Account for Periodicty
    else if (periodicity_15) {
      p <- periodicity(xtsdata)
      if (p['frequency'] < 15 &&
          p['units'] == 'mins') {
        xtsdata <- to.minutes15(xtsdata)[, 1]
        colnames(xtsdata) <- col_names
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

#Return plotly object from data (xtsformat)
fullPlot <- function(discreteData=NA,
                     stateData=NA,
                     title='My Plot',
                     x_label='Time',
                     y1_label='Y1 Label',
                     y2_label='Y2 Label') {
  
  
  #discreteData: List of trend lists each containing:
    # $name: Legend Name for Trend
    # $index: data.frame of datatime objects
    # $values: data.frame of value pairs for index
    # $color: color of trend
    
    #ex: list(list(name=temp1,index=date_indexes1,values=values1,color='red'),
                #list(name=temp2,index=date_indexes2,values=values2,color='blue'))
  
  #stateData: State change data (0 or 1)
  
  if (all(is.na(discreteData)) && all(is.na(stateData))){
    warning("no data provided, defaulted to emptyPlot")
    return(emptyPlot())
  }
  
  y <- list(title = y1_label, 
            overlaying = 'y2')
  
  #Right y-axis (State Change)
  y2 <- list(
    tickfont = list(color = "red"),
    showgrid = FALSE,
    side = "right",
    title = y2_label
  )
  
  #x-axis (time)
  x <- list(title = x_label,
            nticks = 45,
            tickangle = -90,
            automargin=TRUE
          )
  
  plt <-
    plot_ly(type = 'scatter', mode = 'lines') %>% layout(
      title = title,
      xaxis = x,
      yaxis = y
    )
  

  if (all(!is.na(discreteData))) {
    for(trend in discreteData){
      trend_label <- trend$name
      trend_date_times <-  trend$index
      trend_values <- trend$values
      trend_color <- trend$color
      
      plt <-
        plt %>% add_lines(
          yaxis='y',
          name = trend_label,
          x = trend_date_times,
          y = trend_values,
          line = list(color = trend_color)
        )
    }
  }
  
  if(all(!is.na(stateData))){
    for(trend in stateData){
      trend_label <- trend$name
      trend_date_times <-  trend$index
      trend_values <- trend$values
      trend_color <- trend$color
      
      plt <- plt %>% add_lines(
          yaxis = 'y2',
          name = trend_label,
          x = trend_date_times,
          y = trend_values,
          line = list(color = trend_color)
      ) %>% layout(yaxis2 = y2)
    }
  }
  
  return(plt)
}