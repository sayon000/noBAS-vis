#Hot Water Reset

library(shiny)

server <- function(input, output, session) {
  
  
  chwst_trend <- callModule(csvFile,"file1",
                          targetColumns=reactive({c("Temp","chwst","CHWST")}),
                          stateChange=reactive({FALSE}),
                          periodicity15=reactive({TRUE}),
                          name=reactive({"CHWST"}),
                          color=reactive({"blue"}),
                          axis=reactive({'y1'}))
  
  chwrt_trend <- callModule(csvFile,"file2",
                           targetColumns=reactive({c("Temp","chwrt","CHWRT")}),
                           stateChange=reactive({FALSE}),
                           periodicity15=reactive({TRUE}),
                           name=reactive({"CHWRT"}),
                           color=reactive({"red"}),
                           axis=reactive({'y1'}))
  

  all_data <- reactive({
    list(chwst_trend(),chwrt_trend())
  })
  
  date_range <- callModule(dateRange,"placeholder-id",data=all_data)
  occupancyRects <- callModule(occupancy,"occ",date_range)
  
  callModule(plotting,"plot1",data=all_data,occupancyRects=occupancyRects,y1label='Temp (°F)',y2label='Occupancy Status')
}