library(shinythemes)

ui <-
  navbarPage(
    theme = shinytheme('sandstone'),
    title = "RTU Compressor Cycle",
    selected = 'Plotting',
    useShinyjs(),
    tabPanel('Plotting',
             sidebarLayout(sidebarPanel(
               ##File Inputs
               csvFileInput(id='file1',label='Discharge Air Temperature (DAT)'),
               csvFileInput(id='file2',label='Mixed Air Temperature (MAT)'),
               csvFileInput(id='file3',label='Outside Air Temperature (OAT)'),
               csvFileInput(id='file4',label='Return Air Temperature (RAT)'),
               csvFileInput(id='file5',label='Compressor'),
               occupancyInput(id='occ',"https://cunybpl.shinyapps.io/nobas-occupancy/")
             ),
             mainPanel(
               #Plotting Output
               plottingOutput(id='plot1')
             )))
  )