

ui <-
  navbarPage(
    theme = shinytheme('yeti'),
    title = "Boiler Cycling and Stack Temperature",
    selected = 'Plotting',
    tabPanel('Plotting',
             sidebarLayout(sidebarPanel(
               ##File Inputs
               csvFileInput(id='file1',label='Upload First File'),
               csvFileInput(id='file2',label='Upload Second File')
             ),
             mainPanel(
               #Plotting Output
               plottingOutput(id='plot1')
             )))
  )
