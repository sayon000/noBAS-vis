#Shiny UI/Server Modules

###########
#All function parameters must be passed as reactive values. These reactive values are dereferenced within the functions themselves.
#EX: To pass a 'string' pass reactive({'my string})
###########

#Libraries
library(shiny)
library(plotly) #renderPlotly
library(DT)
library(shinyjs)

#source('data_processing.R')
MASTER_DATE_FORMATS_MODULE = c('mdy HMSOS','mdy HMSp','mdy HM','Ymd HM', 'ymd HM', 'Ymd HMS', 'ymd HMS', 'mdy IMS p', 'mdy HMS', 'mdY HM', 'mdY HMS', 'mdy HMS', "HM md")


csvFileInput <- function(id, label = "CSV file",bLabel = "Click here to find and upload your file") {
  #File Input UI
    #Inputs:
      #label: label of fileInput in UI output (string)

  ns <- shiny::NS(id)

  shiny::tagList(shiny::fileInput(
    ns("file"),
    label,
    multiple = TRUE,
    accept = c(
      "text/csv",
      "text/comma-separated-values,text/plain",
      ".csv"
    ),
    buttonLabel = bLabel
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
           axis,
           dtFormats = MASTER_DATE_FORMATS_MODULE) {
    #Clean file and return xts time series

    #Inputs:
      #targetColumns, periodicity15,dtFormats are passed to process_data in data_processing.R See documentation there.

      #name: name of trend
      #color: color of trend to use on plot
      #axis: either 'y' or 'y2', which y axis to use. Cannot mix discrete/state data on same axis

    #Outputs:
      #List object representing an individual trend
      #TODO: Investigate object oriented approach to representing 'trends'

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
          color = color(),
          axis = axis()
        )
    })

    return(data_trend)
  }

dateRange <- function(input, output, session, data) {
  #available date range of all uploaded files return: (min date, max date)
    #Inputs:
      #data: list of 'trends' retreived from csvFile module
    #outputs:
      #reactive container of list(start,end)

  date_range <- reactive({
    earliest_dt <- NA
    latest_dt <- NA

    if (any(!is.na(data()))) {
      notNA <- !is.na(data())
      all_data <- data()[notNA]

      for (dat in all_data) {
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
    range <- list(start = earliest_dt, end = latest_dt)
    return(range)
  })

  return(date_range)
}

occupancyInput <- function(id, occupancy_app_link, bLabel = "Click here to find and upload your occupancy file") {
  #File Input for an occupancy .csv, retreieved from the occupancy shiny application.
    #Inputs:
      #occupancy_app_link: url of the occupancy shiny application

  ns <- NS(id)

  #Occupancy file input
  tagList(
    fileInput(
      ns("occFile"),
      "Occupancy Schedule",
      accept = c(
        "text/csv",
        "text/comma-separated-values,text/plain",
        ".csv"
      ),
      buttonLabel = bLabel
    ),
    tags$a(
      href = occupancy_app_link,
      "Create an Occupancy Schedule",
      target = "_blank"
    )
  )

}

occupancy <- function(input, output, session, date_range) {
  #Server logic for processing occupancy .csvs and creating the shapes for plotting
    #Inputs:
      #date_range: output from dateRange module
    #Output:
      #Occupancy "rectangles" to pass to the plotting module

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

  #I'm sure this can be done in a loop~~~someday
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

plottingOutput <- function(id,initialName = "Untitled plot",Row1 = fluidRow(),Row2 = fluidRow(),Row3 = fluidRow()) {
  #Plot Output UI
  ns <- NS(id)

  shiny::tagList(
    div(style = 'overflow:scroll',
      plotly::plotlyOutput(ns("plot"), height = "500px",width = "1350px")
    ),
    textInput(
      ns("plot_name"),
      label = "Plot Title",
      value = initialName,
      placeholder = "My Plot",
      width = '25%'
    ),
    h2("Questions"),
    Row1,
    Row2,
    Row3,
    #questionButtonOutput("yeetus"),
    
    box(title = "Advanced Options",
      width = 12,
      collapsed = TRUE,
      collapsible = TRUE,
      closable = FALSE,
      solidHeader = TRUE,
      div(style = 'display: inline-block;vertical-align:top;width:25%;',
          numericInput(
            ns("Height"),
            label = h3("Plot Height"),
            value = 500
          )
      ),
      
      #these space out the elements on the page
      div(style = 'display: inline-block;vertical-align:top; width:25%;',
          HTML("<br>")
      ),
      
      
      div(style = 'display: inline-block;vertical-align:top; width:25%;',
          numericInput(
            ns("Width"),
            label = h3("Plot Width"),
            value = 1350
          )
      ),
      
      div(style = 'display: inline-block;vertical-align:top; width:100%;',
          HTML("<br>")
      ),
      
      div(style = 'display: inline-block;vertical-align:top; width:25%;',
          numericInput(
            ns("XTicks"),
            label = h3("X Ticks Number"),
            value = 60,
          )
      ),
      
      div(style = 'display: inline-block;vertical-align:top; width:25%;',
          HTML("<br>")
      ),
      
      div(style = 'display: inline-block;vertical-align:top; width:25%;',
          sliderInput(
            ns("TickAngle"),
            label = h3("Tick Angle"),
            min = 0,
            max = 360,
            value = 90,
          )
      ),
      
      div(style = 'display: inline-block;vertical-align:top; width:100%;',
          HTML("<br>")
      ),
      
      div(style = 'display: inline-block;vertical-align:top; width:25%;',
          numericInput(
            ns("xTickSize"),
            label = h3("X Tick Font Size"),
            value = 12,
          )
      ),
      
      div(style = 'display: inline-block;vertical-align:top; width:25%;',
          HTML("<br>")
      ),
      
      div(style = 'display: inline-block;vertical-align:top; width:25%;',
          numericInput(
            ns("yTickSize"),
            label = h3("Y Tick Font Size"),
            value = 12,
          )
      )
    )
    
    #actionButton(
    #  ns("Download"),
     # "Download"
    #)
    ###work on the download thing using JShttps://stackoverflow.com/questions/48929528/whats-the-best-way-to-write-custom-javascript-for-r-shiny-module-that-uses-modu#####
  )
}

plotting <-
  function(input,
           output,
           session,
           data=NA,
           occupancyRects=NA,
           y1label = 'Y1',
           y2label = 'Y2') {
    #Create plotly output from data
      #Inputs:
        #data: list of 'trends' from csvFile module
        #occupancyRects: ouput of occupancy module
    #Note: fullPlot comes from data processing
    ###NOTE: Everytime i want a reactive input, I go to data_processing and keep modifying the fullPlot
    ###with whatever I need
    plt <- reactive({
      plt <- fullPlot(
        data = data(),
        occupancyRects = occupancyRects(),
        title = input$plot_name,
        x_label = 'Time',
        y1_label = y1label,
        y2_label = y2label,
        plotHeight = input$Height,
        plotWidth = input$Width,
        numXTicks = input$XTicks,
        plotTickAngle = input$TickAngle,
        XTickSize = input$xTickSize,
        YTickSize = input$yTickSize
      )
      plt <- config(plt,displayModeBar = TRUE)
      
      return(plt)
    })

    output$plot <- renderPlotly(plt())
  }

questionButtonOutput <- function(id){
  ns <- NS(id)
  actionButton(ns("questionJump"),"Go To Questions")
}

questionButton <- 
  function(input,
          output,
          session){
  
  observeEvent(input$questionJump,{
    js$ScrollToQuestion()
  })
}


