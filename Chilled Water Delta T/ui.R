library(shinythemes)

ui <-
  navbarPage(
    theme = shinytheme('simplex'),
    title = "Chilled Water Delta T",
    selected = 'Plotting',
    useShinyjs(),
    tabPanel('Plotting',
             sidebarLayout(sidebarPanel(
               ##File Inputs
               csvFileInput(id='file1',label='Chilled Water Suppply Temperature(CHWST)'),
               csvFileInput(id='file2',label='Chilled Water Return Temperature (CHWRT)'),
               occupancyInput(id='occ',"https://cunybpl.shinyapps.io/nobas-occupancy/")
             ),
             mainPanel(
               #Plotting Output
               plottingOutput(id='plot1')
             )))
  )