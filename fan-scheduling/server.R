#Fan Scheduling

library(shiny)

server <- function(input, output, session) {
  
  
  fan_trend <- callModule(csvFile,"file1",
                          targetColumns=reactive({c("Motor","Fan")}), 
                          stateChange=reactive({TRUE}), 
                          periodicity15=reactive({TRUE}),
                          name=reactive({"Fan"}),
                          color=reactive({"gray"}),
                          axis=reactive({'y1'}))

  all_data <- reactive({
    list(fan_trend())
  })
  
  date_range <- callModule(dateRange,"placeholder-id",data=all_data)
  occupancyRects <- callModule(occupancy,"occ",date_range)
  
  callModule(plotting,"plot1",data=all_data,occupancyRects=occupancyRects)
}