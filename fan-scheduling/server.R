library(shiny)

server <- function(input, output, session) {
  
  
  fan_trend <- callModule(csvFile,"file1",
                          targetColumns=reactive({c("Motor")}), 
                          stateChange=reactive({TRUE}), 
                          periodicity15=reactive({TRUE}),
                          name=reactive({"Fan"}),
                          color=reactive({"gray"}))

  all_data <- reactive({
    list(fan_trend())
  })
  
  date_range <- callModule(dateRange,"placeholder-id",data=all_data)
  
  
  discrete <- reactive({
    NA
  })
  
  state <- reactive({
    list(fan_trend())
  })
  
  occupancyRects <- callModule(occupancy,"occ",date_range)
  callModule(plotting,"plot1",discreteTrends=discrete,stateTrends=state,occupancyRects=occupancyRects)
}