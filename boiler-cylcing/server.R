#Boiler Cycling & Stack Temp

library(shiny)

server <- function(input, output, session) {


  stack1_trend <- callModule(csvFile,"file1",
                             targetColumns=reactive({c("K-Type")}),
                             stateChange=reactive({FALSE}),
                             periodicity15=reactive({TRUE}),
                             name=reactive({"Stack Temp 1"}),
                             color=reactive({"red"}),
                             axis=reactive({'y1'}))

  motor1_trend <- callModule(csvFile,"file2",
                             targetColumns=reactive({c("Motor","Fan")}),
                             stateChange=reactive({TRUE}),
                             periodicity15=reactive({FALSE}),
                             name=reactive({"Motor Status 1"}),
                             color=reactive({"gray"}),
                             axis=reactive({'y2'}))

  stack2_trend <- callModule(csvFile,"file3",
                             targetColumns=reactive({c("K-Type")}),
                             stateChange=reactive({FALSE}),
                             periodicity15=reactive({TRUE}),
                             name=reactive({"Stack Temp 2"}),
                             color=reactive({"orange"}),
                             axis=reactive({'y1'}))

  motor2_trend <- callModule(csvFile,"file4",
                             targetColumns=reactive({c("Motor","Fan")}),
                             stateChange=reactive({TRUE}),
                             periodicity15=reactive({FALSE}),
                             name=reactive({"Motor Status 2"}),
                             color=reactive({"green"}),
                             axis=reactive({'y2'}))


  all_data <- reactive({
    list(stack1_trend(),motor1_trend(),stack2_trend(),motor2_trend())
  })

  date_range <- callModule(dateRange,"placeholder-id",data=all_data)
  occupancyRects <- callModule(occupancy,"occ",date_range)

  callModule(plotting,"plot1",all_data,occupancyRects)
}
