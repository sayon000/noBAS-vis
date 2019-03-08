#Shiny UI/Server Modules

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


csvFile <- function(input,output,session,stateChange=FALSE){
  #Clean file and return xts time series
  #stateChange = True indicates file contained a state change trend
  
  data <- input$file$datapath
  if(stateChange){
    
  }else{
    
  }
}

plottingOutput <- function(id) {
  #Plot Output UI
  ns <- NS(id)
  
  tagList(plotlyOutput(ns("plot"),height="500px"))
}

plotting <- function(input, output, session, data) {
  #Create plotly output from data
  
  plt <- reactive({
    if (all(is.na(data()))) {
      emptyPlot()
    }
    else{
      #Plot data
    }
  })
  
  output$plot <- renderPlotly(plt())
}