#Shiny UI/Server Modules

csvFileInput <- function(id, label = "CSV file") {
  # Create a namespace function using the provided id
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

plottingOutput <- function(id) {
  ns <- NS(id)
  
  tagList(plotlyOutput(ns("plot")))
}

plotting <- function(input, output, session, data) {
  plt <- reactive({
    if (all(is.na(data()))) {
      emptyPlot()
    }
    else{
      
    }
  })
  
  output$plot <- renderPlotly(plt())
}