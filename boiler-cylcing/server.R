

library(shiny)

server <- function(input, output, session) {
  
  
  callModule(plotting,"plot1",data=reactive({NA}))
}
