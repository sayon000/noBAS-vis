

library(shiny)

server <- function(input, output, session) {
  
  
  stack1_trend <- callModule(csvFile,"file1",
                      targetColumns=reactive({c("K-Type")}), 
                      stateChange=reactive({FALSE}), 
                      periodicity15=reactive({TRUE}),
                      name=reactive({"Stack Temp 1"}),
                      color=reactive({"red"}))
  
  motor1_trend <- callModule(csvFile,"file2",
                                    targetColumns=reactive({c("Motor")}), 
                                    stateChange=reactive({TRUE}), 
                                    periodicity15=reactive({FALSE}),
                                    name=reactive({"Motor Status 1"}),
                                    color=reactive({"gray"}))
  
  stack2_trend <- callModule(csvFile,"file3",
                             targetColumns=reactive({c("K-Type")}), 
                             stateChange=reactive({FALSE}), 
                             periodicity15=reactive({TRUE}),
                             name=reactive({"Stack Temp 2"}),
                             color=reactive({"orange"}))
  
  motor2_trend <- callModule(csvFile,"file4",
                             targetColumns=reactive({c("Motor")}), 
                             stateChange=reactive({TRUE}), 
                             periodicity15=reactive({FALSE}),
                             name=reactive({"Motor Status 2"}),
                             color=reactive({"green"}))
  
  
  all_data <- reactive({
    list(stack1_trend(),motor1_trend(),stack2_trend(),motor2_trend())
  })
  
  date_range <- callModule(dateRange,"placeholder-id",data=all_data)
  
  
  discrete <- reactive({
    list(stack1_trend(),stack2_trend())
  })
  
  state <- reactive({
    list(motor1_trend(),motor2_trend())
  })
  
  occupancyRects <- callModule(occupancy,"occ",date_range)
  callModule(plotting,"plot1",discrete,state,occupancyRects)
}
