library(shinythemes)

ui <-
  navbarPage(
    theme = shinytheme('darkly'),
    title = "DAT Control",
    selected = 'Plotting',
    useShinyjs(),
    tabPanel('Plotting',
             sidebarLayout(sidebarPanel(
               ##File Inputs
               csvFileInput(id='file1',label='Discharge Air Temperature (DAT)'),
               csvFileInput(id='file2',label='Discharge Air Temperature Set Point (DATSP)'),
               csvFileInput(id='file3',label='Supply Fan Status (SFS)'),
               occupancyInput(id='occ',"https://cunybpl.shinyapps.io/nobas-occupancy/")
             ),
             mainPanel(
               #Plotting Output
               plottingOutput(id='plot1')
             )))
  )