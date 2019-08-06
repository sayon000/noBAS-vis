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
  
  mat_trend <- callModule(csvFile,"file2",
                          targetColumns=reactive({c("Temp","mat","MAT")}),
                          stateChange=reactive({FALSE}),
                          periodicity15=reactive({TRUE}),
                          name=reactive({"MAT"}),
                          color=reactive({"orange"}),
                          axis=reactive({'y1'}))
  
  oat_trend <- callModule(csvFile,"file3",
                          targetColumns=reactive({c("Temp","oat","OAT")}),
                          stateChange=reactive({FALSE}),
                          periodicity15=reactive({TRUE}),
                          name=reactive({"OAT"}),
                          color=reactive({"green"}),
                          axis=reactive({'y1'}))
  
  rat_trend <- callModule(csvFile,"file4",
                          targetColumns=reactive({c("Temp","rat","RAT")}),
                          stateChange=reactive({FALSE}),
                          periodicity15=reactive({TRUE}),
                          name=reactive({"RAT"}),
                          color=reactive({"red"}),
                          axis=reactive({'y1'}))
  
  com_trend <- callModule(csvFile,"file5",
                          targetColumns=reactive({c("pump","com","COM")}),
                          stateChange=reactive({FALSE}),
                          periodicity15=reactive({TRUE}),
                          name=reactive({"Compressor"}),
                          color=reactive({"magenta"}),
                          axis=reactive({'y2'}))
  
  all_data <- reactive({
    list(dat_trend(),mat_trend(),oat_trend(),rat_trend(),com_trend())
  })
  
  date_range <- callModule(dateRange,"placeholder-id",data=all_data)
  occupancyRects <- callModule(occupancy,"occ",date_range)
  
  callModule(plotting,"plot1",data=all_data,occupancyRects=occupancyRects,y1label='Temp (°F)',y2label='Status')
}