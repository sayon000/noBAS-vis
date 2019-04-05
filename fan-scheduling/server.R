#Fan Scheduling

library(shiny)

server <- function(input, output, session) {


  fan_trend1 <- callModule(csvFile,"file1",
                          targetColumns=reactive({c("Motor","Fan")}),
                          stateChange=reactive({TRUE}),
                          periodicity15=reactive({TRUE}),
                          name=reactive({"Fan1"}),
                          color=reactive({"gray"}),
                          axis=reactive({'y1'}))

  fan_trend2 <- callModule(csvFile,"file2",
                          targetColumns=reactive({c("Motor","Fan")}),
                          stateChange=reactive({TRUE}),
                          periodicity15=reactive({TRUE}),
                          name=reactive({"Fan2"}),
                          color=reactive({"red"}),
                          axis=reactive({'y1'}))


  all_data <- reactive({
    list(fan_trend1(),fan_trend2())
  })

  date_range <- callModule(dateRange,"placeholder-id",data=all_data)
  occupancyRects <- callModule(occupancy,"occ",date_range)

  callModule(plotting,"plot1",data=all_data,occupancyRects=occupancyRects,y1label='Fan Status')
}
