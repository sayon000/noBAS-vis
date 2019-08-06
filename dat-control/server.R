#Hot Water Reset

library(shiny)

server <- function(input, output, session) {
  
  
  dat_trend <- callModule(csvFile,"file1",
                          targetColumns=reactive({c("Temp","dat","DAT")}),
                          stateChange=reactive({FALSE}),
                          periodicity15=reactive({TRUE}),
                          name=reactive({"DAT"}),
                          color=reactive({"blue"}),
                          axis=reactive({'y1'}))
  
  datsp_trend <- callModule(csvFile,"file2",
                           targetColumns=reactive({c("Temp","datsp","DATSP")}),
                           stateChange=reactive({FALSE}),
                           periodicity15=reactive({TRUE}),
                           name=reactive({"DATSP"}),
                           color=reactive({"red"}),
                           axis=reactive({'y1'}))
  
  fan_trend <- callModule(csvFile,"file3",
                           targetColumns=reactive({c("Motor","Fan")}),
                           stateChange=reactive({TRUE}),
                           periodicity15=reactive({TRUE}),
                           name=reactive({"Fan1"}),
                           color=reactive({"gray"}),
                           axis=reactive({'y2'}))
  
  all_data <- reactive({
    list(dat_trend(),datsp_trend(),fan_trend())
  })
  
  date_range <- callModule(dateRange,"placeholder-id",data=all_data)
  occupancyRects <- callModule(occupancy,"occ",date_range)
  
  callModule(plotting,"plot1",data=all_data,occupancyRects=occupancyRects,y1label='Temp (°F)',y2label='Occupancy Status')
}