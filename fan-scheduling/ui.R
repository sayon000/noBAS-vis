#Fan Scheduling

library(shinythemes)

ui <-
  navbarPage(
    theme = shinytheme('yeti'),
    title = "Fan Scheduling",
    selected = 'Plotting',
    useShinyjs(),
    tabPanel('Plotting',
             sidebarLayout(sidebarPanel(
               ##File Inputs
               csvFileInput(id='file1',label='Fan Status 1'),
               csvFileInput(id='file2',label='Fan Status 2'),
               occupancyInput(id='occ',"https://cunybpl.shinyapps.io/nobas-occupancy/")
             ),
             mainPanel(
               #Plotting Output
               plottingOutput(id='plot1')
             )))
  )
