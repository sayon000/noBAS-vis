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

plottingOutput <- function(id) {
  #Plot Output UI
  ns <- NS(id)
  
  tagList(plotlyOutput(ns("plot"), height = "500px"))
}

plotting <-
  function(input,
           output,
           session,
           discreteTrends,
           stateTrends) {
    #Create plotly output from data
    
    plt <- reactive({
      plt <- fullPlot(
        discreteData = discreteTrends(),
        stateData = stateTrends(),
        title = 'My Plot',
        x_label = 'Time',
        y1_label = 'Y1 Label',
        y2_label = 'Y2 Label'
      )
      
      return(plt)
    })
    
    
    
    output$plot <- renderPlotly(plt())
  }
