

library(shiny)

server <- function(input, output, session) {
  
  
  data1_trend <- callModule(csvFile,"file1",
                      targetColumns=reactive({c("K-Type")}), 
                      stateChange=reactive({FALSE}), 
                      periodicity15=reactive({TRUE}),
                      name=reactive({"Stack Temp"}),
                      color=reactive({"red"}))
  
  data2_trend <- callModule(csvFile,"file2",
                                    targetColumns=reactive({c("Motor")}), 
                                    stateChange=reactive({TRUE}), 
                                    periodicity15=reactive({FALSE}),
                                    name=reactive({"Motor Status"}),
                                    color=reactive({"gray"}))
  
  all_data <- reactive({
    list(data1_trend(),data2_trend())
  })
  
  discrete <- reactive({
    list(data1_trend())
  })
  
  state <- reactive({
    list(data2_trend())
  })
  
  
  date_range <- callModule(dateRange,"placeholder-id",data=all_data)
  occupancyRects <- callModule(occupancy,"occ",date_range)
  callModule(plotting,"plot1",discrete,state,occupancyRects)
}
