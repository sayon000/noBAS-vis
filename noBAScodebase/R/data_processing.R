#Plots and Data Processing/Prep
  #Functions defined in this file are intended to work in or outside of the Shiny context.

library(plotly)
library(lubridate)
library(readr)
library(xts)
library(dplyr)

#####-----Data Cleaning / Reformatting -----#####
MASTER_DATE_FORMATS = c('mdy HMSOS','mdy HM','Ymd HM', 'ymd HM', 'Ymd HMS', 'ymd HMS', 'mdy IMS p', 'mdy HMS', 'mdY HM', 'mdY HMS', 'mdy HMS', "HM md")
MASTER_SKIP_FORMATS = c('Date','date',"DATE",'Time',"TIME",'time')
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
  data.table::fread(filepath,sep=',',data.table=FALSE,blank.lines.skip=TRUE,skip=MASTER_SKIP_FORMATS,na.strings=c("","logged","Logged"))
}

#input: datapath from csvFileInput containing 1 trend
#Output: xts object with 1 data column, 1 index

process_data<-
  function(data,
           state_change_data,
           target_columns,
           dt_formats = MASTER_DATE_FORMATS,
           periodicity_15 = FALSE) {
    #data: csv file object exported through HOBOware
    #state_change: bool flag for whether state change data 0 -> 1 -> 0 -> 1
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

    if(length(colnames(df)) < 2){
      #target_columns not found

      #error message formatting
      targets <- gsub(',','',targets)
      actual_colnames_str <- NULL
      for(col in actual_colnames){
        actual_colnames_str <- paste(actual_colnames_str, "\n",gsub(',','',col))
      }

      stop(paste(
        "\nUnable to locate target_column substring.",
        "\nThis indicates the expected column headers do not match the actual column headers.",
        "You've either uploaded the wrong type of trend or the column headers of your .csv are labeled incorrectly for this application.",
        "\n\nExpected Column Headers: ", gsub('|','\n',targets,fixed=TRUE),
        "\n\nActual Columns: ", actual_colnames_str,
        "\n\n To fix this issue, edit your .csv file column headers. For the desired column of measurement (such as temperature),",
        "replace the column header with the expected column header "


        )
      )
    }

    colnames(df)[1] <- "index"


    #filter out incomplete date/val pairs
    df <- df[complete.cases(df),]

    #Convert index to datetime format
    df$index <-
      lubridate::parse_date_time(df$index, dt_formats, quiet = TRUE)
    if (all(is.na(df$index))) {
      warning("Unable to parse datetimes with given orders/index column")
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

#Plotly Output of BPL Logo
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
fullPlot <- function(data=NA,
                     occupancyRects=NA,
                     title='My Plot',
                     x_label='Time',
                     y1_label='Y1 Label',
                     y2_label='Y2 Label',
                     plotHeight = 500,
                     plotWidth = 2000,
                     numXTicks = 60,
                     plotTickAngle = 90,
                     XTickSize = 12,
                     YTickSize = 12) {


  # data: List of trend lists each containing:
    # $name: Legend Name for Trend
    # $index: data.frame of datatime objects
    # $values: data.frame of value pairs for index
    # $color: color of trend
    # $axis: either 'y1' or 'y2' indicating which y-axis to use.

    #ex: list(list(name=temp1,index=date_indexes1,values=values1,color='red'),
      #list(name=temp2,index=date_indexes2,values=values2,color='blue',axis='y1'))

  if (all(is.na(data)) ){
    warning("no data provided, defaulted to emptyPlot")
    return(emptyPlot())
  }

  y1 <- list(title = y1_label,
             tickfont = list(size = YTickSize),
             gridcolor = toRGB("gray60"),
             overlaying = 'y2')

  #Right y-axis (State Change usually)
  y2 <- list(title = y2_label,
             tickfont = list(color = "black"),
             showgrid = FALSE,
             side = "right",
             gridcolor = toRGB("gray60")
  )

  #x-axis (time)
  x <- list(title = x_label,
            nticks = numXTicks,
            tickfont = list(size = XTickSize),
            tickangle = plotTickAngle,
            gridcolor = toRGB('gray60'),
            automargin=TRUE
  )
  #default setup
  plt <-
    plot_ly(type = 'scatter', mode = 'lines',height = plotHeight,
            width = plotWidth) %>% layout(
      title = title,
      xaxis = x,
      yaxis = y1
      
    )

  #add occupancy if any
  if(any(!is.na(occupancyRects))){
    plt <- plt %>% layout(plot_bgcolor = "#d7d2d2", shapes = occupancyRects)
  }

  #add trends if any
  if (any(!is.na(data))) {
    for(trend in data){
      if(all(!is.na(trend))){

        #y1 axis trends
        if(trend$axis == 'y1'){
          plt <-
            plt %>%
            add_lines(
              yaxis = 'y1',
              name = trend$name,
              x = trend$index,
              y = trend$values,
              line = list(color = trend$color)
            )
        }

        #y2 axis trends
        else{
          plt <-
            plt %>% add_lines(
              yaxis = 'y2',
              name = trend$name,
              x = trend$index,
              y = trend$values,
              line = list(color = trend$color)) %>% layout(yaxis2 = y2)
        }

      }
    }
  }

  return(plt)
}
