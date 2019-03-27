library(shinythemes)

ui <-
  navbarPage(
    theme = shinytheme('yeti'),
    title = "Boiler Cycling and Stack Temperature",
    selected = 'Plotting',
    useShinyjs(),
    tabPanel('Plotting',
             sidebarLayout(sidebarPanel(
               ##File Inputs
               csvFileInput(id='file1',label='Stack Temperature 1'),
               csvFileInput(id='file2',label='Motor Status 1'),
               csvFileInput(id='file3',label='Stack Temperature 2'),
               csvFileInput(id='file4',label='Motor Status 2'),
               occupancyInput(id='occ',"https://cunybpl.shinyapps.io/nobas-occupancy/")
             ),
             mainPanel(
               #Plotting Output
               plottingOutput(id='plot1')
             )))
  )
