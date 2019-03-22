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
               csvFileInput(id='file1',label='Stack Temperature'),
               csvFileInput(id='file2',label='Motor Status')
             ),
             mainPanel(
               #Plotting Output
               plottingOutput(id='plot1')
             )))
  )
