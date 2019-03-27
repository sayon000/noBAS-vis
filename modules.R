#Shiny UI/Server Modules

#Libraries
library(shiny)
library(plotly) #renderPlotly
library(DT)
library(shinyjs)

source('../data_processing.R')

csvFileInput <- function(id, label = "CSV file") {
  #File Input UI
  
  ns <- NS(id)
  
  tagList(fileInput(
    ns("file"),
    label,
    multiple = TRUE,
    accept = c(
      "text/csv",
      "text/comma-separated-values,text/plain",
      ".csv"
    )
  ))
}

csvFile <-
  function(input,
           output,
           session,
           targetColumns,
           stateChange,
           periodicity15,
           name,
           color,
           dtFormats = c('Ymd HM', 'Ymd HMS', 'mdy IMS p')) {
    #Clean file and return xts time series
    #stateChange = True indicates file contained a state change trend
    
    data_trend <- reactive({
      if (is.null(input$file)) {
        return(NA)
      }
      
      data <- process_data(
        input$file$datapath,
        state_change_data = stateChange(),
        target_columns = targetColumns(),
        dt_formats = dtFormats,
        periodicity_15 = periodicity15()
      )
      
      data_trend <-
        list(
          name = name(),
          index = index(data),
          values = coredata(data),
          color = color()
        )
    })
    
    return(data_trend)
  }

dateRange <- function(input,output,session,data){
  #available date range of all uploaded files return: (min date, max date)
  date_range <- reactive({
    earliest_dt <- NA
    latest_dt <- NA
    
    if (any(!is.na(data()))) {
      notNA <- !is.na(data())
      all_data <- data()[notNA]
      
      for (dat in all_data) {
        #dat <- na.trim(dat, is.na = 'all')
        
        # start <- head(index(data), 1)
        # start <- as.POSIXct(start)
        # end <- tail(index(data), 1)
        # end <- as.POSIXct(end)
        
        start <- head(dat$index, 1)
        start <- as.POSIXct(start)
        end <- tail(dat$index, 1)
        end <- as.POSIXct(end)
        
        
        if (is.na(earliest_dt)) {
          earliest_dt <- start
        } else{
          if (start < earliest_dt) {
            earliest_dt <- start
          }
        }
        
        if (is.na(latest_dt)) {
          latest_dt <- end
        } else{
          if (end > latest_dt) {
            latest_dt <- end
          }
        }
        
      }
    }
    range <- list(start=earliest_dt, end=latest_dt)
    return(range)
  })
  
  return(date_range)
}

occupancyInput <- function(id,occupancy_app_link) {
  ns <- NS(id)
  
  #Occupancy file input
  tagList(fileInput(
    ns("occFile"),
    "Occupancy Schedule",
    accept = c(
      "text/csv",
      "text/comma-separated-values,text/plain",
      ".csv"
    )
  ),
  tags$a(href=occupancy_app_link, "Create an Occupancy Schedule",target="_blank")
  )
  
}

occupancy <- function(input,output,session,date_range){
  occData <- reactive({
    if (!is.null(input$occFile)) {
      d1 <- input$occFile$datapath
      d1 <- read.csv(d1, na.strings = 'NA')
      colnames(d1) <-
        c("ind",
          "day",
          "startup_start",
          "startup_end",
          "occ_start",
          "occ_end")
      
      #check for empty schedule
      if (is.na(d1[1, 3]) &&
          is.na(d1[2, 3]) &&
          is.na(d1[3, 3]) &&
          is.na(d1[4, 3]) &&
          is.na(d1[5, 3]) && is.na(d1[6, 3]) && is.na(d1[7, 3])) {
        return(NA)
      }
      else{
        return(d1)
      }
    }
    else{
      return (NA)
    }
  })
  
  occRects <- eventReactive({
    occData()
    date_range()
  },
  {
    if (all(is.na(occData()))) {
      return(NA)
    }
    else{
      df <-
        data.frame(dates = seq.POSIXt(
          from = as.POSIXct(date_range()$start),
          to = as.POSIXct(date_range()$end),
          by = "day"
        ))
      df$wday <- weekdays(df$dates)
      
      startup_rects <- list()
      occ_rects <- list()
      
      line_properties = list(width = 0)
      
      for (row in 1:nrow(df)) {
        date <- substr(df[row, 'dates'], 1, 10)
        
        wday <- df[row, 'wday']
        
        if (wday == 'Sunday' && !is.na(occData()[1, 3])) {
          startup_rect <- list(
            type = 'rect',
            line = line_properties,
            x0 = ymd_hm(paste(date, occData()[1, 3]), tz = 'UTC'),
            x1 = ymd_hm(paste(date, occData()[1, 4]), tz = 'UTC'),
            y0 = 0,
            y1 = 1,
            xref = 'x',
            yref = 'paper',
            fillcolor = 'yellow'
            ,
            opacity = 0.5,
            layer = 'below'
          )
          occ_rect <- list(
            type = 'rect',
            line = line_properties,
            x0 = ymd_hm(paste(date, occData()[1, 5]), tz = 'UTC'),
            x1 = ymd_hm(paste(date, occData()[1, 6]), tz = 'UTC'),
            y0 = 0,
            y1 = 1,
            xref = 'x',
            yref = 'paper',
            fillcolor = '#fff'
            ,
            opacity = 1.0,
            layer = 'below'
          )
          startup_rects[[row]] <- startup_rect
          occ_rects[[row]] <- occ_rect
        }
        
        else if (wday == 'Monday' && !is.na(occData()[2, 3])) {
          startup_rect <- list(
            type = 'rect',
            line = line_properties,
            x0 = ymd_hm(paste(date, occData()[2, 3]), tz = 'UTC'),
            x1 = ymd_hm(paste(date, occData()[2, 4]), tz = 'UTC'),
            y0 = 0,
            y1 = 1,
            xref = 'x',
            yref = 'paper',
            fillcolor = 'yellow'
            ,
            opacity = 0.5,
            layer = 'below'
          )
          occ_rect <- list(
            type = 'rect',
            line = line_properties,
            x0 = ymd_hm(paste(date, occData()[2, 5]), tz = 'UTC'),
            x1 = ymd_hm(paste(date, occData()[2, 6]), tz = 'UTC'),
            y0 = 0,
            y1 = 1,
            xref = 'x',
            yref = 'paper',
            fillcolor = '#fff'
            ,
            opacity = 1.0,
            layer = 'below'
          )
          startup_rects[[row]] <- startup_rect
          occ_rects[[row]] <- occ_rect
        }
        
        
        else if (wday == 'Tuesday' && !is.na(occData()[3, 3])) {
          startup_rect <- list(
            type = 'rect',
            line = line_properties,
            x0 = ymd_hm(paste(date, occData()[3, 3]), tz = 'UTC'),
            x1 = ymd_hm(paste(date, occData()[3, 4]), tz = 'UTC'),
            y0 = 0,
            y1 = 1,
            xref = 'x',
            yref = 'paper',
            fillcolor = 'yellow'
            ,
            opacity = 0.5,
            layer = 'below'
          )
          occ_rect <- list(
            type = 'rect',
            line = line_properties,
            x0 = ymd_hm(paste(date, occData()[3, 5]), tz = 'UTC'),
            x1 = ymd_hm(paste(date, occData()[3, 6]), tz = 'UTC'),
            y0 = 0,
            y1 = 1,
            xref = 'x',
            yref = 'paper',
            fillcolor = '#fff'
            ,
            opacity = 1.0,
            layer = 'below'
          )
          startup_rects[[row]] <- startup_rect
          occ_rects[[row]] <- occ_rect
        }
        
        
        else if (wday == 'Wednesday' && !is.na(occData()[4, 3])) {
          startup_rect <- list(
            type = 'rect',
            line = line_properties,
            x0 = ymd_hm(paste(date, occData()[4, 3]), tz = 'UTC'),
            x1 = ymd_hm(paste(date, occData()[4, 4]), tz = 'UTC'),
            y0 = 0,
            y1 = 1,
            xref = 'x',
            yref = 'paper',
            fillcolor = 'yellow'
            ,
            opacity = 0.5,
            layer = 'below'
          )
          occ_rect <- list(
            type = 'rect',
            line = line_properties,
            x0 = ymd_hm(paste(date, occData()[4, 5]), tz = 'UTC'),
            x1 = ymd_hm(paste(date, occData()[4, 6]), tz = 'UTC'),
            y0 = 0,
            y1 = 1,
            xref = 'x',
            yref = 'paper',
            fillcolor = '#fff'
            ,
            opacity = 1.0,
            layer = 'below'
          )
          startup_rects[[row]] <- startup_rect
          occ_rects[[row]] <- occ_rect
        }
        
        
        else if (wday == 'Thursday' && !is.na(occData()[5, 3])) {
          startup_rect <- list(
            type = 'rect',
            line = line_properties,
            x0 = ymd_hm(paste(date, occData()[5, 3]), tz = 'UTC'),
            x1 = ymd_hm(paste(date, occData()[5, 4]), tz = 'UTC'),
            y0 = 0,
            y1 = 1,
            xref = 'x',
            yref = 'paper',
            fillcolor = 'yellow'
            ,
            opacity = 0.5,
            layer = 'below'
          )
          occ_rect <- list(
            type = 'rect',
            line = line_properties,
            x0 = ymd_hm(paste(date, occData()[5, 5]), tz = 'UTC'),
            x1 = ymd_hm(paste(date, occData()[5, 6]), tz = 'UTC'),
            y0 = 0,
            y1 = 1,
            xref = 'x',
            yref = 'paper',
            fillcolor = '#fff'
            ,
            opacity = 1.0,
            layer = 'below'
          )
          startup_rects[[row]] <- startup_rect
          occ_rects[[row]] <- occ_rect
        }
        
        
        else if (wday == 'Friday' && !is.na(occData()[6, 3])) {
          startup_rect <- list(
            type = 'rect',
            line = line_properties,
            x0 = ymd_hm(paste(date, occData()[6, 3]), tz = 'UTC'),
            x1 = ymd_hm(paste(date, occData()[6, 4]), tz = 'UTC'),
            y0 = 0,
            y1 = 1,
            xref = 'x',
            yref = 'paper',
            fillcolor = 'yellow'
            ,
            opacity = 0.5,
            layer = 'below'
          )
          occ_rect <- list(
            type = 'rect',
            line = line_properties,
            x0 = ymd_hm(paste(date, occData()[6, 5]), tz = 'UTC'),
            x1 = ymd_hm(paste(date, occData()[6, 6]), tz = 'UTC'),
            y0 = 0,
            y1 = 1,
            xref = 'x',
            yref = 'paper',
            fillcolor = '#fff'
            ,
            opacity = 1.0,
            layer = 'below'
          )
          startup_rects[[row]] <- startup_rect
          occ_rects[[row]] <- occ_rect
        }
        
        
        else if (wday == 'Saturday' && !is.na(occData()[7, 3])) {
          startup_rect <- list(
            type = 'rect',
            line = line_properties,
            x0 = ymd_hm(paste(date, occData()[7, 3]), tz = 'UTC'),
            x1 = ymd_hm(paste(date, occData()[7, 4]), tz = 'UTC'),
            y0 = 0,
            y1 = 1,
            xref = 'x',
            yref = 'paper',
            fillcolor = 'yellow'
            ,
            opacity = 0.5,
            layer = 'below'
          )
          occ_rect <- list(
            type = 'rect',
            line = line_properties,
            x0 = ymd_hm(paste(date, occData()[7, 5]), tz = 'UTC'),
            x1 = ymd_hm(paste(date, occData()[7, 6]), tz = 'UTC'),
            y0 = 0,
            y1 = 1,
            xref = 'x',
            yref = 'paper',
            fillcolor = '#fff'
            ,
            opacity = 1.0,
            layer = 'below'
          )
          startup_rects[[row]] <- startup_rect
          occ_rects[[row]] <- occ_rect
        }
        
      }
      all_rects <- c(startup_rects, occ_rects)
      return(all_rects)
    }
    
  })
  
  return(occRects)
}

plottingOutput <- function(id) {
  #Plot Output UI
  ns <- NS(id)
  
  tagList(plotlyOutput(ns("plot"), height = "500px"),
          textInput(ns("plot_name"),label="Plot Title",value="My Plot",placeholder="My Plot")
          )
}

plotting <-
  function(input,
           output,
           session,
           discreteTrends,
           stateTrends,
           occupancyRects) {
    #Create plotly output from data
    
    plt <- reactive({
      plt <- fullPlot(
        discreteData = discreteTrends(),
        stateData = stateTrends(),
        occupancyRects = occupancyRects(),
        title = input$plot_name,
        x_label = 'Time',
        y1_label = 'Y1 Label',
        y2_label = 'Y2 Label'
      )
      
      return(plt)
    })
    
    
    
    output$plot <- renderPlotly(plt())
  }
