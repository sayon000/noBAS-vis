#Hot Water Reset

library(shiny)

server <- function(input, output, session) {


  oat_trend <- callModule(csvFile,"file1",
                             targetColumns=reactive({c("Temp","oat","OAT")}),
                             stateChange=reactive({FALSE}),
                             periodicity15=reactive({TRUE}),
                             name=reactive({"OAT"}),
                             color=reactive({"green"}),
                             axis=reactive({'y1'}))

  hwst_trend <- callModule(csvFile,"file2",
                             targetColumns=reactive({c("Temp","hwst","HWST")}),
                             stateChange=reactive({FALSE}),
                             periodicity15=reactive({TRUE}),
                             name=reactive({"HWST"}),
                             color=reactive({"red"}),
                             axis=reactive({'y2'}))

  all_data <- reactive({
    list(oat_trend(),hwst_trend())
  })

  date_range <- callModule(dateRange,"placeholder-id",data=all_data)
  occupancyRects <- callModule(occupancy,"occ",date_range)

  callModule(plotting,"plot1",data=all_data,occupancyRects=occupancyRects,y1label='OA Temp',y2label='HWS Temp')
}
