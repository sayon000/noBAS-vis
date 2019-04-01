library(shinythemes)

ui <-
  navbarPage(
    theme = shinytheme('yeti'),
    title = "Hot Water Reset",
    selected = 'Plotting',
    useShinyjs(),
    tabPanel('Plotting',
             sidebarLayout(sidebarPanel(
               ##File Inputs
               csvFileInput(id='file1',label='Outside Air Temperature (OAT)'),
               csvFileInput(id='file2',label='Hot Water Set Temperature (HWST)'),
               occupancyInput(id='occ',"https://cunybpl.shinyapps.io/nobas-occupancy/")
             ),
             mainPanel(
               #Plotting Output
               plottingOutput(id='plot1')
             )))
  )