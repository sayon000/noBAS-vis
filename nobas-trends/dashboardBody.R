######MODIFY EACH SPECIFIC QUESTION DOWN HERE#######
source("questions.R")

body <- dashboardBody(
  tags$head(
    tags$link(rel = "stylesheet", type = "text/css", href = "homepage.css")
  ),
  useShinyjs(),
  extendShinyjs("www/shinyjsScrollUp.js"),
  tabItems(
    tabItem(tabName = "Home",
           fluidRow(
             width = 12
             
           ),
           
           fluidRow(class = "text-center",
             width = 12,
             box(class = "text-center",
               width = 12,
               solidHeader = TRUE,
               h1("Welcome to the CUNY BPL Trend Chart App"),
               img(src="https://raw.githubusercontent.com/cunybpl/noBAS-vis/master/bpl-logo.png",
                   align = "middle",
                   width = "25%",
                   length = "25%"
               ),
               h2("This app helps you create trend charts in the Building Operator Playbook. "),
               h3("Use the Playbook to select trend charts; gather data for each parameter needed (such as “OAT”), and create a “CSV” file for each parameter.")
             )
           ),
            fluidRow(class = "text-center",
            width = 12,
             box(
                title = "AHU Charts",
                class = "text-center",
                solidHeader = TRUE,
                width = 2,
                tags$button(
                  id = "OccToAHUTab",
                  type = "button",
                  class = "btn action-button",
                  img(src = "AHU.png",
                      height = "75%",
                      width = "75%")
                )
              ),
              
              
             box(
                title = "Chiller Plant Charts",
                width = 2,
                solidHeader = TRUE,
                tags$button(
                  id = "OccToCHPTab",
                  type = "button",
                  class = "btn action-button",
                  img(src = "CHILLER.jpg",
                      height = "75%",
                      width = "75%")
                )
              ),
              
              box(
                title = "Boiler Plant Charts",
                width = 2,
                solidHeader = TRUE,
                tags$button(
                  id = "OccToBPTab",
                  type = "button",
                  class = "btn action-button",
                  img(src = "BOILER.png",
                      height = "75%",
                      width = "75%")
                )
              ),
             
              box(
                title = "Zone Charts",
                width = 2,
                solidHeader = TRUE,
                tags$button(
                  id = "OccToZTab",
                  type = "button",
                  class = "btn action-button",
                  img(src = "ZONE.png",
                      height = "75%",
                      width = "75%")
                )
              ),
            
            box(title = "Perimeter and Air Charts",
                width = 2,
                solidHeader = TRUE,
                tags$button(
                  id = "OccToPTab",
                  type = "button",
                  class = "btn action-button",
                  img(src = "PERIMETER.png",
                      height = "75%",
                      width = "75%")
                )
            )
        ),
        fluidRow(class = "text-center",
                 width = 12,
                 box(class = "text-center",
                     width = 12,
                     solidHeader = TRUE,
                     h1("Tips to make the most out of this app"),
                     h4(
                       tags$ul(class = "text-left",
                             tags$li("In order to use this app, you must input each trend in to a CSV"),
                             tags$li("You should come prepared with data from your loggers."),
                             tags$li("To save a trend, click the camera icon in the top right hand corner of the trend graph to save the image."),
                             tags$li("If you want to return back to the main page, click the home button at the top right hand corner.")
                      )
                     )
                 )
                 
        )  
          
    ),
    
    ########################################AHU TAB START##################################################
    # AHU Tab Content start
    tabItem(tabName = "AHU",
            #FIRST ROW Start
            fluidRow(
              titlePanel("AHU TRENDS"),
              navlistPanel(
                tabPanel(
                  "AHU",
                  h1("Start by selecting a tab on the left, then input the data that is requested")
                ),
                tabPanel(
                  div(class="navPanels", trend1_name),
                  box(solidHeader = TRUE, width = 12,
                    h1(strong("Trend Chart 1")),
                    h2("Fan Schedule"),
                    h3("Parameters to trend"),
                    tags$ul(
                      tags$li(csvFileInput(id="fant1",label="Browse and input your fan status here")),
                      tags$li(occupancyInput(id="occ1","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                    ),
                    actionButton("trend1Tab","Trend 1")
                  )
                ),
                tabPanel(
                  div(class="navPanels", trend2a_name),
                  box(solidHeader = TRUE, width = 12,
                      h1(strong("Trend Chart 2a")),
                      h2("OA Control Using OAD"),
                      h3("Parameters to trend"),
                      tags$ul(
                        tags$li(csvFileInput(id = "fant2a", label = "Browse and input your Fan Status file here")),
                        tags$li(csvFileInput(id = "OAD2a", label = "Browse and input your Outside Air Damper position here")),
                        tags$li(occupancyInput(id="occ2a","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                      ),
                      actionButton("trend2aTab","Trend 2a")
                  )
                ),
                tabPanel(
                  div(class="navPanels", trend2b_name),
                   box(solidHeader = TRUE, width = 12,
                       h1(strong("Trend Chart 2b")),
                       h2("OA Control Using OAF"),
                       h3("Parameters to trend"),
                       tags$ul(
                         tags$li(csvFileInput(id = "fant2b", label = "Browse and input your Fan Status file here")),
                         tags$li(csvFileInput(id = "OAT2b", label = "Browse and input your Outside Air Temperature file here")),
                         tags$li(csvFileInput(id = "MAT2b", label = "Browse and input your Mixed Air Temperature file here")),
                         tags$li(csvFileInput(id = "RAT2b", label = "Browse and input your Return Air Temperature file here")),
                         tags$li(occupancyInput(id="occ2b","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                       ),
                       actionButton("trend2bTab","Trend 2b")
                  )
                ),
                tabPanel(
                  div(class="navPanels", trend3_name),
                  box(solidHeader = TRUE, width = 12,
                      h1(strong("Trend Chart 3")),
                      h2("Minimum OAD Position"),
                      h3("Parameters to trend"),
                      tags$ul(
                        tags$li(csvFileInput(id ="OAD3", label = "Browse and input your Outside Air Damper Position file here")),
                        tags$li(csvFileInput(id = "CO2-3", label = "Browse and input your CO2 level file here")),
                        tags$li(occupancyInput(id="occ3","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                      ),
                      actionButton("trend3Tab","Trend 3")
                  )
                ),
                tabPanel(
                  div(class="navPanels", trend4c_name),
                  box(solidHeader = TRUE, width = 12,
                      h1(strong("Trend Chart 4c")),
                      h2("Simultaneous Heating & Cooling"),
                      h3("Parameters to trend"),
                      tags$ul(
                        tags$li(csvFileInput(id ="OAD4c", label = "Browse and input your Outside Air Damper Position file here")),
                        tags$li(csvFileInput(id = "HCV4c", label = "Browse and input your Heating Coil Valve file here")),
                        tags$li(csvFileInput(id = "HWST4c", label = "Browse and input your Hot Water Supply Temperature file here")),
                        tags$li(occupancyInput(id="occ4c","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                      ),
                      actionButton("trend4cTab","Trend 4c")
                  )
                ),
                tabPanel(
                  div(class="navPanels", trend4d_name),
                  box(solidHeader = TRUE, width = 12,
                      h1(strong("Trend Chart 4d")),
                      h2("Simultaneous Heating & Cooling"),
                      h3("Parameters to trend"),
                      tags$ul(
                        tags$li(csvFileInput(id ="fant4d", label = "Browse and input your Fan Status file here")),
                        tags$li(csvFileInput(id = "HWP4d", label = "Browse and input your Hot Water Pump file here")),
                        tags$li(occupancyInput(id="occ4d","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                      ),
                      actionButton("trend4dTab","Trend 4d")
                  )
                ),
                tabPanel(
                  div(class="navPanels", trend5a_name),
                  box(solidHeader = TRUE, width = 12,
                      h1(strong("Trend Chart 5a")),
                      h2("Economizing Using Temperature or Enthalpy"),
                      h3("Parameters to trend"),
                      tags$ul(
                        tags$li(csvFileInput(id = "fant5a", label = "Browse and input your Fan Status file here")),
                        tags$li(csvFileInput(id = "OAT5a", label = "Browse and input your Outside Air Temperature file here")),
                        tags$li(csvFileInput(id = "MAT5a", label = "Browse and input your Mixed Air Temperature file here")),
                        tags$li(csvFileInput(id = "RAT5a", label = "Browse and input your Return Air Temperature file here")),
                        tags$li(occupancyInput(id="occ5a","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                      ),
                      actionButton("trend5aTab","Trend 5a")
                  )
                ),
                tabPanel(
                  div(class="navPanels", trend7_name),
                  box(solidHeader = TRUE, width = 12,
                      h1(strong("Trend Chart 7")),
                      h2("DAT Control"),
                      h3("Parameters to trend"),
                      tags$ul(
                        tags$li(csvFileInput(id = "fant7", label = "Browse and input your Fan Status file here")),
                        tags$li(csvFileInput(id = "DAT7", label = "Browse and input your Discharge Air Temperature file here")),
                        tags$li(csvFileInput(id = "DATSP7", label = "Browse and input your Discharge Air Temperature Setpoint file here")),
                        tags$li(occupancyInput(id="occ7","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                      ),
                      actionButton("trend7Tab","Trend 7")
                  )
                ),
                tabPanel(
                  div(class="navPanels", trend8a_name),
                  box(solidHeader = TRUE, width = 12,
                      h1(strong("Trend Chart 8a")),
                      h2("Compressor Cycling & Staging"),
                      h3("Parameters to trend"),
                      tags$ul(
                        tags$li(csvFileInput(id = "Compressor1-t8a", label = "Browse and input your Compressor 1 Status file here")),
                        tags$li(csvFileInput(id = "Compressor2-t8a", label = "Browse and input your Compressor 2 Status here")),
                        tags$li(occupancyInput(id="occ8a","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                      ),
                      actionButton("trend8aTab","Trend 8a")
                  )
                ),
                tabPanel(
                  div(class="navPanels", trend8b_name),
                  box(solidHeader = TRUE, width = 12,
                      h1(strong("Trend Chart 8b")),
                      h2("Burner Cycling & Staging"),
                      h3("Parameters to trend"),
                      tags$ul(
                        tags$li(csvFileInput(id = "Burner1-t8b", label = "Browse and input your Burner 1 Status file here")),
                        tags$li(csvFileInput(id = "Burner2-t8b", label = "Browse and input your Burner 2 Status file here")),
                        tags$li(occupancyInput(id="occ8b","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                      ),
                      actionButton("trend8bTab","Trend 8b")
                  )
                ),
                tabPanel(
                  div(class="navPanels", trend10_name),
                  box(solidHeader = TRUE, width = 12,
                      h1(strong("Trend Chart 10")),
                      h2("Heating/Cooling Mode"),
                      h3("Parameters to trend"),
                      tags$ul(
                        tags$li(csvFileInput(id ="fant10", label = "Browse and input your Fan Status file here")),
                        tags$li(csvFileInput(id = "MAT10", label = "Browse and input your Mixed Air Temperature file here")),
                        tags$li(csvFileInput(id = "DAT10", label = "Browse and input your Discharge Air Temperature file here")),
                        tags$li(occupancyInput(id="occ10","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                      ),
                      actionButton("trend10Tab","Trend 10")
                  )
                )
              )
            )
            
    ),
    ####AHU TAB END#########
    
    ####AHU REMINDER ABOUT THE OCCUPANCY SCHEDULE######
    tabItem(tabName = "OccToAHU",
            fluidRow(class = "text-center",
                     width = 12,
                     box(class = "text-center",
                         width = 12,
                         solidHeader = TRUE,
                         h1("Make an occupancy schedule if you do not have one already"),
                         h1("(24/7 buildings do not require this)"),
                         h2(tags$a(href="https://cunybpl.shinyapps.io/nobas-occupancy/", target = "_blank", "Click here "), "to make an occupancy schedule"),
                         h2("Remember where you saved the file"),
                         h2(" "),
                         fluidRow(
                           actionButton("AHUTab","Click here to proceed once you are ready")
                  )
              )
            )
    ),
    #AHU Plot
    #######################################AHU Plots#################################################
    
    ####Trend 1 Plot ####
    tabItem(tabName = "trend1",
            
            fluidRow(
              box(title = trend1_name,
                  width = 12,
                  solidHeader = TRUE,
                  plottingOutput(id="trend1",initialName = trend1_name, questionPanel = trend1_panel)
              )
            ),
            
            fluidRow(
              box(
                width = 2,
                solidHeader = TRUE,
                actionButton("Prevtabt1","Previous Page")
              )
            )
    ),
    
    #####Trend 2a Plot#####
    tabItem(tabName = "trend2a",
            fluidRow(
              box(title = trend2a_name,
                  width = 12,
                  solidHeader = TRUE,
                  plottingOutput(id = "trend2a",initialName = trend2a_name, questionPanel = trend2a_panel)
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                solidHeader = TRUE,
                actionButton("Prevtabt2a","Previous Page")
              )
            )
    ),
    
    #####Trend 2b Plot#####
    tabItem(tabName = "trend2b",
            fluidRow(
              box(title = trend2b_name,
                width = 12,
                solidHeader = TRUE,
                plottingOutput(id = "trend2b", initialName = trend2b_name ,questionPanel = trend2b_panel)
              )
            ),
            
            
            fluidRow(
              box(
                width = 3,
                solidHeader = TRUE,
                actionButton("Prevtabt2b","Previous Page")
              )
            )
    ),

    
    ###Trend 3 Plot####
    
    tabItem(tabName = "trend3",
            fluidRow(
              box(title = trend3_name,
                width = 12,
                solidHeader = TRUE,
                plottingOutput(id = "trend3",initialName = trend3_name, questionPanel = trend3_panel )
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                solidHeader = TRUE,
                actionButton("Prevtabt3","Previous Page")
              )
            )
          ),
    
    
    #####Trend 4c######
    
    tabItem(tabName = "trend4c",
            fluidRow(
              box(title = trend4c_name,
                  width = 12,
                  solidHeader = TRUE,
                  plottingOutput(id = "trend4c",initialName = trend4c_name, questionPanel = trend4c_panel )
              )
            ),
            
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt4c","Previous Page")
              )
            )
    ),
    
    ####Trend 4d####
    
    tabItem(tabName = "trend4d",
            fluidRow(
              box(title = trend4d_name,
                  width = 12,
                  solidHeader = TRUE,
                  plottingOutput(id = "trend4d",initialName = trend4d_name, questionPanel = trend4d_panel)
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt4d","Previous Page")
              )
            )
    ),
    
    #####Trend 5a######
    
    tabItem(tabName = "trend5a",
            fluidRow(
              box(title = trend5a_name,
                  width = 12,
                  solidHeader = TRUE,
                  plottingOutput(id = "trend5a",initialName = trend5a_name,questionPanel = trend5a_panel)
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                solidHeader = TRUE,
                actionButton("Prevtabt5a","Previous Page")
              )
            )
    ),
    
    #######Trend 7#######
    
    tabItem(tabName = "trend7",
            fluidRow(
              box(title = trend7_name,
                  width = 12,
                  solidHeader = TRUE,
                  plottingOutput(id = "trend7",initialName =trend7_name,questionPanel = trend7_panel)
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt7","Previous Page")
              )
            )
    ),
    
    #####Trend 8a#####
    
    tabItem(tabName = "trend8a",
            fluidRow(
              box(title = trend8a_name,
                  width = 12,
                  solidHeader = TRUE,
                  plottingOutput(id = "trend8a",initialName = trend8a_name,questionPanel = trend8a_panel)
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt8a","Previous Page")
              )
            )
    ),
    
    #######Trend 8b######
    
    tabItem(tabName = "trend8b",
            fluidRow(
              box(title = trend8b_name,
                  width = 12,
                  solidHeader = TRUE,
                  plottingOutput(id = "trend8b",initialName = trend8b_name, questionPanel = trend8b_panel)
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                solidHeader = TRUE,
                actionButton("Prevtabt8b","Previous Page")
              )
            )
    ),
    
    
    ######Trend 10######
    
    tabItem(tabName = "trend10",
            fluidRow(
              box(title = trend10_name,
                  width = 12,
                  solidHeader = TRUE,
                  plottingOutput(id = "trend10",initialName = trend10_name,questionPanel = trend10_panel)
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                solidHeader = TRUE,
                actionButton("Prevtabt10","Previous Page")
              )
            )
            
            
    ),
    
    #Trend 10 Plot End
    ###################################AHU CONTENT END####################
    
    ###################################Chiller Tab Start######################
    #Chiller Home Page Begin
    
    tabItem(tabName = "ChillerPlant",
            fluidRow(
              titlePanel("CHILLER PLANT TRENDS"),
              navlistPanel(
                tabPanel(
                  "Chiller Plant",
                  h1("Start by selecting a tab on the left, then input the data that is requested")
                ),
                tabPanel(
                  div(class="navPanels", trend12_name),
                  box(solidHeader = TRUE, width = 12,
                      h1(strong("Trend Chart 12")),
                      h2("Chiller Plant Schedule"),
                      h3("Parameters to trend"),
                      tags$ul(
                        tags$li(csvFileInput(id = "CHWST12", label = "Chilled Water Supply Temperature")),
                        tags$li(csvFileInput(id = "CWPS12", label = "Chilled Water Pump Speed")),
                        tags$li(occupancyInput(id="occ12","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                      ),
                      
                      actionButton("trend12Tab","Trend 12")
                  )
                ),
                tabPanel(
                  div(class="navPanels", trend13a_name),
                  box(solidHeader = TRUE, width = 12,
                      h1(strong("Trend Chart 13a")),
                      h2("Chilled Water Delta T"),
                      h3("Parameters to trend"),
                      tags$ul(
                        tags$li(csvFileInput(id = "CHWST13a", label = "Chilled Water Supply Temperature")),
                        tags$li(csvFileInput(id = "CHWRT13a", label = "Chilled Water Return Temperature")),
                        tags$li(occupancyInput(id="occ13a","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                      ),
                      
                      actionButton("trend13aTab","Trend 13a")
                  )
                ),
                tabPanel(
                  div(class="navPanels", trend14a_name),
                  box(solidHeader = TRUE, width = 12,
                      h1(strong("Trend Chart 14a")),
                      h2("ChWST Reset"),
                      h3("Parameters to trend"),
                      tags$ul(
                        tags$li(csvFileInput(id = "CHWST14a", label = "Chilled Water Supply Temperature")),
                        tags$li(csvFileInput(id = "CHWSTSP14a", label = "Chilled Water Supply Temperature Set Point")),
                        tags$li(csvFileInput(id = "OAT14a", label = "Outside Air Temperature")),
                        tags$li(occupancyInput(id="occ14a","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                      ),
                      actionButton("trend14aTab","Trend 14a")
                  )
                ),
                tabPanel(
                  div(class="navPanels", trend15_name),
                  box(solidHeader = TRUE, width = 12,
                      h1(strong("Trend Chart 15")),
                      h2("Cooling Tower Scheduling"),
                      h3("Parameters to trend"),
                      tags$ul(
                        tags$li(csvFileInput(id = "CWPS15", label = "Chilled Water Pump Status")),
                        tags$li(csvFileInput(id = "CTFS15", label = "Cooling Tower Fan Status")),
                        tags$li(occupancyInput(id ="occ15","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                      ),
                      actionButton("trend15Tab","Trend 15")
                  )
                )
              )
            )
            
            
    ),
    
    #################OCCUPANCY TO CHILLER PLANT#################
    tabItem(tabName = "OccToCHP",
            fluidRow(class = "text-center",
                     width = 12,
                     box(class = "text-center",
                         width = 12,
                         solidHeader = TRUE,
                         h1("Make an occupancy schedule if you do not have one already"),
                         h1("(24/7 buildings do not require this)"),
                         h2(tags$a(href="https://cunybpl.shinyapps.io/nobas-occupancy/", target = "_blank", "Click here "), "to make an occupancy schedule"),
                         h2("Remember where you saved the file"),
                         h2(" "),
                         fluidRow(
                           actionButton("CHPTab","Click here to proceed once you are ready")
                         )
                     )
                  )
    ),
    
    ################CHILLER PLANT PLOTS########################
   
  ##################Trend 12############
    
    tabItem(tabName = "trend12",
            fluidRow(
              box(
                width = 12,
                solidHeader = TRUE,
                plottingOutput(id = "trend12",initialName = trend12_name,questionPanel = trend12_panel)
              )
            ),
            
            
            fluidRow(
              box(
                width = 3,
                solidHeader = TRUE,
                actionButton("Prevtabt12","Previous Page")
              )
            )
            
    ),
    
    #######TREND 13a#########
    
    tabItem(tabName = "trend13a",
            fluidRow(
            box(
              width = 12,
              solidHeader = TRUE,
              plottingOutput(id = "trend13a",initialName = trend13a_name,questionPanel = trend13a_panel)
              )
            ),
            
            
            fluidRow(
              box(
                width = 3,
                solidHeader = TRUE,
                actionButton("Prevtabt13a","Previous Page")
              )
            )
      
    ),
    
  #####trend 14a#########
    
    tabItem(tabName = "trend14a",
            fluidRow(
              box(
                width = 12,
                solidHeader = TRUE,
                plottingOutput(id = "trend14a",initialName = trend14a_name,questionPanel=trend14a_panel)
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt14a","Previous Page")
              )
            )
            
    ),
    
    ######trend 15#######
    
    tabItem(tabName = "trend15",
            fluidRow(
              box(
                width = 12,
                solidHeader = TRUE,
                plottingOutput(id = "trend15",initialName = trend15_name,questionPanel = trend15_panel)
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                solidHeader = TRUE,
                actionButton("Prevtabt15","Previous Page")
              )
            )
            
    ),
    
    #end trend 15
    ##################################Chiller End################
    
    ##################################Boiler TAB Start###################
    tabItem(tabName = "BoilerPlant",
            fluidRow(
              titlePanel("BOILER PLANT TRENDS"),
              navlistPanel(
                tabPanel(
                  "Boiler Plant",
                  h1("Start by selecting a tab on the left, then input the data that is requested")
                ),
                
                tabPanel(
                  div(class="navPanels", trend17_name),
                  box(solidHeader = TRUE, width = 12,
                      h1(strong("Trend Chart 17")),
                      h2("Steam Boiler Condensate Return Temperature"),
                      h3("Parameters to trend"),
                      tags$ul(
                        tags$li(csvFileInput(id = "CRT17", label = "Condensate Return Temperature")),
                        tags$li(occupancyInput(id="occ17","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                      ),
                      actionButton("trend17Tab","Trend 17")
                  )
                ),
                
                tabPanel(
                  div(class="navPanels", trend18_name),
                  box(solidHeader = TRUE, width = 12,
                      h1(strong("Trend Chart 18")),
                      h2("Boiler Plant Scheduling"),
                      h3("Parameters to trend"),
                      tags$ul(
                        tags$li(csvFileInput(id = "BS18", label = "Boiler Status")),
                        tags$li(csvFileInput(id = "HWST18", label = "Hot Water Supply Temperature")),
                        tags$li(csvFileInput(id = "HWPS18", label = "Hot Water Pump Status")),
                        tags$li(csvFileInput(id = "OAT18", label = "Outside Air Temperature")),
                        tags$li(occupancyInput(id="occ18","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                      ),
                      actionButton("trend18Tab","Trend 18")
                  )
                ),
                
                tabPanel(
                  div(class="navPanels", trend19a_name),
                  box(solidHeader = TRUE, width = 12,
                      h1(strong("Trend Chart 19a")),
                      h2("Hot Water Temperature Reset"),
                      h3("Parameters to trend"),
                      tags$ul(
                        tags$li(csvFileInput(id = "HWST19a", label = "Hot Water Supply Temperature")),
                        tags$li(csvFileInput(id = "OAT19a", label = "Outside Air Temperature")),
                        tags$li(occupancyInput(id="occ19a","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                      ),
                      actionButton("trend19aTab","Trend 19a")
                  )
                ),
                
                tabPanel(
                  div(class="navPanels", trend20a_name),
                  box(solidHeader = TRUE, width = 12,
                      h1(strong("Trend Chart 20a")),
                      h2("Hot Water Loop: Delta T"),
                      h3("Parameters to trend"),
                      tags$ul(
                        tags$li(csvFileInput(id = "HWST20a", label = "Hot Water Supply Temperature")),
                        tags$li(csvFileInput(id = "HWRT20a", label = "Hot Water Return Temperature")),
                        tags$li(occupancyInput(id="occ20a","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                      ),
                      actionButton("trend20aTab","Trend 20a")
                  )
                ),
                
                tabPanel(
                  div(class="navPanels", trend21_name),
                  box(solidHeader = TRUE, width = 12,
                      h1(strong("Trend Chart 21")),
                      h2("Condensing Boiler Efficiency"),
                      h3("Parameters to trend"),
                      tags$ul(
                        tags$li(csvFileInput(id = "HWRT21", label = "Hot Water Return Temperature")),
                        tags$li(occupancyInput(id="occ21","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                      ),
                      actionButton("trend21Tab","Trend 21")
                  )
                ),
                
                tabPanel(
                  div(class="navPanels", trend22_name),
                  box(solidHeader = TRUE, width = 12,
                      h1(strong("Trend Chart 22")),
                      h2("Boiler Cycling & Staging"),
                      h3("Parameters to trend"),
                      tags$ul(
                        tags$li(csvFileInput(id = "BMS22", label = "Burner Motor Status")),
                        tags$li(csvFileInput(id = "STACK22", label = "Stack Temperature")),
                        tags$li(occupancyInput(id="occ22","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                      ),
                      actionButton("trend22Tab","Trend 22")
                  )
                ),
                
                tabPanel(
                  div(class="navPanels", trend23_name),
                  box(solidHeader = TRUE, width = 12,
                      h1(strong("Trend Chart 23")),
                      h2("Hot Water Temperature Hunting"),
                      h3("Parameters to trend"),
                      tags$ul(
                        tags$li(csvFileInput(id = "HWST23", label = "Hot Water Supply Temperature")),
                        tags$li(csvFileInput(id = "HWSTSP23", label = "Hot Water Supply Temperature Set Point")),
                        tags$li(occupancyInput(id="occ23","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                      ),
                      actionButton("trend23Tab","Trend 23")
                  )
                )
              )
            )    
            
            
            
            
    ),
    
  ##########OCCUPANCY TO BOILER#############
  tabItem(tabName = "OccToBP",
          fluidRow(class = "text-center",
                   width = 12,
                   box(class = "text-center",
                       width = 12,
                       solidHeader = TRUE,
                       h1("Make an occupancy schedule if you do not have one already"),
                       h1("24/7 buildings do not require this"),
                       h2(tags$a(href="https://cunybpl.shinyapps.io/nobas-occupancy/", target = "_blank", "Click here "), "to make an occupancy schedule"),
                       h2("Remember where you saved the file"),
                       h2(" "),
                       fluidRow(
                         actionButton("BPTab","Click here to proceed when you are ready")
                       )
                   )
              )
  ),
  
    #########START BOILER PLOT#####################
    
  ####### trend 17########
  
  tabItem(tabName = "trend17",
          fluidRow(
            box(
              width = 12,
              solidHeader = TRUE,
              plottingOutput(id = "trend17",initialName = trend17_name,questionPanel = trend17_panel)
            )
          ),
          
          fluidRow(
            box(
              width = 3,
              actionButton("Prevtabt17","Previous Page")
            )
          )
          
  ),
  
  ######trend 18######
  
  tabItem(tabName = "trend18",
          fluidRow(
            box(
              width = 12,
              solidHeader = TRUE,
              plottingOutput(id = "trend18",initialName = trend18_name,questionPanel = trend18_panel)
            )
          ),
          
          fluidRow(
            box(
              width = 3,
              solidHeader = TRUE,
              actionButton("Prevtabt18","Previous Page")
            )
          )
          
  ),
  
  
  #########trend 19a#########
  tabItem(tabName = "trend19a",
          fluidRow(
            box(
              width = 12,
              solidHeader = TRUE,
              plottingOutput(id = "trend19a",initialName = trend19a_name,questionPanel = trend19a_panel)
            )
          ),
          
          
          fluidRow(
            box(
              width = 3,
              solidHeader = TRUE,
              actionButton("Prevtabt19a","Previous Page")
            )
          )
          
  ),
  
  ######trend 20a########
  
  tabItem(tabName = "trend20a",
          fluidRow(
            box(
              width = 12,
              solidHeader = TRUE,
              plottingOutput(id = "trend20a",initialName = trend20a_name,questionPanel = trend20a_panel)
            )
          ),
          
          fluidRow(
            box(
              width = 3,
              solidHeader = TRUE,
              actionButton("Prevtabt20a","Previous Page")
            )
          )
          
  ),
  
  #####trend 21########
  
  tabItem(tabName = "trend21",
          fluidRow(
            box(
              width = 12,
              solidHeader = TRUE,
              plottingOutput(id = "trend21",initialName = trend21_name,questionPanel = trend21_panel)
            )
          ),

          fluidRow(
            box(
              width = 3,
              solidHeader = TRUE,
              actionButton("Prevtabt21","Previous Page")
            )
          )
          
  ),
  
  #####trend 22######
  
  tabItem(tabName = "trend22",
          fluidRow(
            box(
              width = 12,
              solidHeader = TRUE,
              plottingOutput(id = "trend22",initialName = trend22_name, questionPanel = trend22_panel)
            )
          ),
          
          fluidRow(
            box(
              width = 3,
              solidHeader = TRUE,
              actionButton("Prevtabt22","Previous Page")
            )
          )
          
  ),
  
  ####trend 23######
  
  tabItem(tabName = "trend23",
          fluidRow(
            box(
              width = 12,
              solidHeader = TRUE,
              plottingOutput(id = "trend23",initialName = trend23_name, questionPanel = trend23_panel)
            )
          ),
          
          
          fluidRow(
            box(
              width = 3,
              solidHeader = TRUE,
              actionButton("Prevtabt23","Previous Page")
            )
          )
          
  ),
  
  #######END OF BOILER#################
  
    
    #######START OF ZONE##############
    
    tabItem(tabName = "Zone",
            fluidRow(
              titlePanel("Zone Trends"),
              navlistPanel(
                tabPanel(
                  "Zone Trends",
                  h1("Start by selecting a tab on the left, then input the data that is requested")
                ),
                
                tabPanel(
                  div(class="navPanels", "Trend Chart 26: Zone Temperature Setpoint"),
                  box(solidHeader = TRUE, width = 12,
                      h1(strong("Trend Chart 26")),
                      h2("Zone Temperature Setpoint"),
                      h3("Parameters to trend"),
                      tags$ul(
                        tags$li(csvFileInput(id = "ZT26", label = "Zone Temperature")),
                        tags$li(csvFileInput(id = "ZTSP26", label = "Zone Temperature Setpoint")),
                        tags$li(csvFileInput(id = "ZTSBSP26", label = "Zone Temperature Setback Setpoint")),
                        tags$li(occupancyInput(id="occ26","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                      ),
                      actionButton("trend26Tab","Trend 26")
                  )
                )
                )
              )
    ),
  
  
  ###############OCC TO ZONE############################
  tabItem(tabName = "OccToZ",
          fluidRow(class = "text-center",
                   width = 12,
                   box(class = "text-center",
                       width = 12,
                       solidHeader = TRUE,
                       h1("Make an occupancy schedule if you do not have one already"),
                       h1("(24/7 buildings do not require this)"),
                       h2(tags$a(href="https://cunybpl.shinyapps.io/nobas-occupancy/", target = "_blank", "Click here "), "to make an occupancy schedule"),
                       h2("Remember where you saved the file"),
                       h2(" "),
                       fluidRow(
                         actionButton("ZTab","Click here to proceed once you are ready")
                       )
                   )
          )
  ),
  
    ###########trend26###########
    tabItem(tabName = "trend26",
            fluidRow(
              box(
                width = 12,
                solidHeader = TRUE,
                plottingOutput(id = "trend26",initialName = trend26_name,questionPanel = trend26_panel)
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                solidHeader = TRUE,
                actionButton("Prevtabt26","Previous Page")
              )
            )
          ),
    
    
    ########END OF ZONE#############
     
    ############START OF PERIMETER TAB######### 
    
     tabItem(tabName = "Perimeter",
             fluidRow(
               titlePanel("Perimter and Air Trends"),
               navlistPanel(
                 tabPanel(
                   "Perimeter and air",
                   h1("Start by selecting a tab on the left, then input the data that is requested")
                 ),
                 tabPanel(
                   div(class="navPanels", "Trend Chart 27-37a: Heating Status"),
                   box(solidHeader = TRUE, width = 12,
                       h1(strong("Trend Chart 27-37a")),
                       h2("Plotting the 'a' Trend Chart For Each Trend (Heating Status)"),
                       h3("Parameters to trend"),
                       tags$ul(
                         tags$li(csvFileInput(id = "Burner-t2737a", label = "Burner Status")),
                         tags$li(csvFileInput(id = "Boiler-t2737a", label = "Boiler Status")),
                         tags$li(csvFileInput(id = "MAT2737a", label = "Mixed Air Temperature")),
                         tags$li(csvFileInput(id = "DAT2737a", label = "Discharge Air Temperature")),
                         tags$li(csvFileInput(id = "HCV2737a", label = "Heating Coil Valve Position")),
                         tags$li(occupancyInput(id="occ2737a","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                       ),
                       actionButton("trend2737aTab","Trend 27-37a")
                   )
                 ),
                 tabPanel(
                   div(class="navPanels", "Trend Chart 27b: Constant Volume Air System With a Heating Coil or Burner"),
                   box(solidHeader = TRUE, width = 12,
                       h1(strong("Trend Chart 27b")),
                       h2("Constant Volume Air System With a Heating Coil or Burner"),
                       h3("Parameters to trend"),
                       tags$ul(
                         tags$li(csvFileInput(id = "DAT27b", label = "Discharge Air Temperature")),
                         tags$li(csvFileInput(id = "ZT27b", label = "Zone Temperature")),
                         tags$li(csvFileInput(id = "ZTSP-A27b",label = "Zone Temperature Setpoint (Air System)")),
                         tags$li(csvFileInput(id = "fant27b",label = "Fan Status")),
                         tags$li(occupancyInput(id="occ27b","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                       ),
                       actionButton("trend27bTab","Trend 27b")
                   )
                 ),
                 tabPanel(
                   div(class="navPanels", "Trend Chart 28b: VAV without Reheats"),
                   box(solidHeader = TRUE, width = 12,
                       h1(strong("Trend Chart 28b")),
                       h2("VAV without Reheats"),
                       h3("Parameters to trend"),
                       tags$ul(
                         tags$li(csvFileInput(id = "DAT28b", label = "Discharge Air Temperature")),
                         tags$li(csvFileInput(id = "DATSP28b", label = "Discharge Air Temperature Setpoint")),
                         tags$li(csvFileInput(id = "ZT28b", label = "Zone Temperature")),
                         tags$li(csvFileInput(id = "ZTSP-A28b",label = "Zone Temperature Setpoint (Air System)")),
                         tags$li(csvFileInput(id = "fant28b",label = "Fan Status")),
                         tags$li(occupancyInput(id="occ28b","https://cunybpl.shinyapps.io/nobas-occupancy/")
                         ),
                         actionButton("trend28bTab","Trend 28b")
                       )
                   )
                 ),
                 
                 tabPanel(
                   div(class="navPanels", "Trend Chart 29b: VAV with Reheats"),
                   box(solidHeader = TRUE, width = 12,
                       h1(strong("Trend Chart 29b")),
                       h2("VAV with Reheats"),
                       h3("Parameters to trend"),
                       tags$ul(
                         tags$li(csvFileInput(id = "DAT29b", label = "Discharge Air Temperature")),
                         tags$li(csvFileInput(id = "DATSP29b", label = "Discharge Air Temperature Setpoint")),
                         tags$li(csvFileInput(id = "ZTSP-A29b",label = "Zone Temperature Setpoint (Air System)")),
                         tags$li(csvFileInput(id = "fant29b",label = "Fan Status")),
                         tags$li(occupancyInput(id="occ29b","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                       ),
                       actionButton("trend29bTab","Trend 29b")
                   )
                 ),
                 tabPanel(
                   div(class="navPanels", "Trend Chart 30b: DAT Modulates Based on RAT"),
                   box(solidHeader = TRUE, width = 12,
                       h1(strong("Trend Chart 30b")),
                       h2("DAT Modulates Based on RAT"),
                       h3("Parameters to trend"),
                       tags$ul(
                         tags$li(csvFileInput(id = "RATSP30b", label = "Return Air Temperature Setpoint")),
                         tags$li(csvFileInput(id = "RAT30b", label = "Return Air Temperature")),
                         tags$li(csvFileInput(id = "DAT30b", label = "Discharge Air Temperature")),
                         tags$li(csvFileInput(id = "ZT30b", label = "Zone Temperature")),
                         tags$li(csvFileInput(id = "fant30b",label = "Fan Status")),
                         tags$li(occupancyInput(id="occ30b","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                       ),
                       actionButton("trend30bTab","Trend 30b")
                   )
                 ),
                 tabPanel(
                   div(class="navPanels", "Trend Chart 31b: Constant Volume Air System with a DATSP"),
                   box(solidHeader = TRUE, width = 12,
                       h1(strong("Trend Chart 31b")),
                       h2("Constant Volume Air System with a DATSP"),
                       h3("Parameters to trend"),
                       tags$ul(
                         tags$li(csvFileInput(id = "DAT31b", label = "Discharge Air Temperature")),
                         tags$li(csvFileInput(id = "DATSP31b", label = "Discharge Air Temperature Setpoint")),
                         tags$li(csvFileInput(id = "ZT31b",label = "Zone Temperature")),
                         tags$li(csvFileInput(id = "RAT31b",label = "Return Air Temperature")),
                         tags$li(occupancyInput(id="occ31b","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                       ),
                       actionButton("trend31bTab","Trend 31b")
                   )
                 ),
                 
                 tabPanel(
                   div(class="navPanels", "Trend Chart 32b: Constant Volume Air System without a DATSP"),
                   box(solidHeader = TRUE, width = 12,
                       h1(strong("Trend Chart 32b")),
                       h2("Constant Volume Air System without a DATSP"),
                       h3("Parameters to trend"),
                       tags$ul(
                         tags$li(csvFileInput(id = "HWST32b", label = "Perimeter Hot Water Supply Temperature")),
                         tags$li(csvFileInput(id = "HWRT32b", label = "Perimeter Hot Water Return Temperature")),
                         tags$li(csvFileInput(id = "ZT32b",label = "Zone Temperature")),
                         tags$li(occupancyInput(id="occ32b","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                       ),
                       actionButton("trend32bTab","Trend 32b")
                   )
                 ),
                 
                 tabPanel(
                   div(class="navPanels", "Trend Chart 33b: Constant Volume On/Off Air System With a Heating Coil or Burner"),
                   box(solidHeader = TRUE, width = 12,
                       h1(strong("Trend Chart 33b")),
                       h2("Constant Volume On/Off Air System With a Heating Coil or Burner"),
                       h3("Parameters to trend"),
                       tags$ul(
                         tags$li(csvFileInput(id = "ZT33b",label = "Zone Temperature")),
                         tags$li(csvFileInput(id = "ZTSP-P33b", label = "Zone Temperature Setpoint (Perimeter)")),
                         tags$li(csvFileInput(id = "ZTSP-A33b", label = "Zone Temperature Setpoint (Air System)")),
                         tags$li(csvFileInput(id = "fant33b",label = "Fan Status")),
                         tags$li(csvFileInput(id = "DAT33b", label = "Discharge Air Temperature")),
                         tags$li(occupancyInput(id="occ33b","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                       ),
                       actionButton("trend33bTab","Trend 33b")
                   )
                 ),
                 
                 tabPanel(
                   div(class="navPanels", "Trend Chart 34b: VAV without Reheats"),
                   box(solidHeader = TRUE, width = 12,
                       h1(strong("Trend Chart 34b")),
                       h2("VAV without Reheats"),
                       h3("Parameters to trend"),
                       tags$ul(
                         tags$li(csvFileInput(id = "DAT34b", label = "Discharge Air Temperature")),
                         tags$li(csvFileInput(id = "DATSP34b", label = "Discharge Air Temperature Setpoint")),
                         tags$li(csvFileInput(id = "ZT34b",label = "Zone Temperature")),
                         tags$li(csvFileInput(id = "ZTSP-P34b", label = "Zone Temperature Setpoint (Perimeter)")),
                         tags$li(csvFileInput(id = "ZTSP-A34b", label = "Zone Temperature Setpoint (Air System)")),
                         tags$li(csvFileInput(id = "fant34b",label = "Fan Status")),
                         tags$li(occupancyInput(id="occ34b","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                         
                       ),
                       actionButton("trend34bTab","Trend 34b")
                   )
                 ),
                 
                 tabPanel(
                   div(class="navPanels", "Trend Chart 36b: DAT based on RAT"),
                   box(solidHeader = TRUE, width = 12,
                       h1(strong("Trend Chart 36b")),
                       h2("DAT based on RAT"),
                       h3("Parameters to trend"),
                       tags$ul(
                         tags$li(csvFileInput(id = "RATSP36b", label = "Return Air Temperature Setpoint")),
                         tags$li(csvFileInput(id = "RAT36b", label = "Return Air Temperature")),
                         tags$li(csvFileInput(id = "DAT36b", label = "Discharge Air Temperature")),
                         tags$li(csvFileInput(id = "ZT36b", label = "Zone Temperature")),
                         tags$li(csvFileInput(id = "ZTSP-P36b", label = "Zone Temperature Setpoint (Perimeter)")),
                         tags$li(csvFileInput(id = "fant36b",label = "Fan Status")),
                         tags$li(occupancyInput(id="occ36b","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                         
                       ),
                       actionButton("trend36bTab","Trend 36b")
                   )
                 ),
                 
                 
                 tabPanel(
                   div(class="navPanels", "Trend Chart 37b: Constant Volume Air System Based on DAT"),
                   box(solidHeader = TRUE, width = 12,
                       h1(strong("Trend Chart 37b")),
                       h2("Constant Volume Air System Based on DAT"),
                       h3("Parameters to trend"),
                       tags$ul(
                         tags$li(csvFileInput(id = "DAT37b", label = "Discharge Air Temperature")),
                         tags$li(csvFileInput(id = "DATSP37b", label = "Discharge Air Temperature Set Point")),
                         tags$li(csvFileInput(id = "ZT37b", label = "Zone Temperature")),
                         tags$li(csvFileInput(id = "ZTSP-P37b", label = "Zone Temperature Setpoint (Perimeter)")),
                         tags$li(csvFileInput(id = "RAT37b", label = "Return Air Temperature")),
                         tags$li(occupancyInput(id="occ37b","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                       ),
                       actionButton("trend37bTab","Trend 37b")
                   )
                 )
                 
               )
             )
            
        ),
  
  ####################OCC TO PERIMETER#####################
  
  tabItem(tabName = "OccToP",
          fluidRow(class = "text-center",
                   width = 12,
                   box(class = "text-center",
                       width = 12,
                       solidHeader = TRUE,
                       h1("Make an occupancy schedule if you do not have one already"),
                       h1("(24/7 buildings do not require this)"),
                       h2(tags$a(href="https://cunybpl.shinyapps.io/nobas-occupancy/", target = "_blank", "Click here "), "to make an occupancy schedule"),
                       h2("Remember where you saved the file"),
                       h2(" "),
                       fluidRow(
                         actionButton("PTab","Click here to proceed once you are ready")
                       )
                   )
          )
          
  ),
  
  
    #################Start OF PERIMETER Plot##################
    
  #########trend2737a#########
    tabItem(tabName = "trend2737a",
            fluidRow(
              box(
                width = 12,
                solidHeader = TRUE,
                plottingOutput(id = "trend2737a",initialName = trend2737a_name,questionPanel = trend2737a_panel)
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                solidHeader = TRUE,
                actionButton("Prevtabt2737a","Previous Page")
              )
            )
            
    ),
    
  ###########trend27b#############
    tabItem(tabName = "trend27b",
            fluidRow(
              box(
                width = 12,
                solidHeader = TRUE,
                plottingOutput(id = "trend27b",initialName = trend27b_name, questionPanel = trend27b_panel)
              )
            ),
            
            
            fluidRow(
              box(
                width = 3,
                solidHeader = TRUE,
                actionButton("Prevtabt27b","Previous Page")
              )
            )
          ),
  
  ###########trend28b#############
    tabItem(tabName = "trend28b",
            fluidRow(
              box(
                width = 12,
                solidHeader = TRUE,
                plottingOutput(id = "trend28b",initialName = trend28b_name, questionPanel = trend28b_panel)
              )
            ),
            
            fluidRow(
              width = 12,
              box(
                width = 3,
                actionButton("Prevtabt28b","Previous Page")
              )
            )
        ),
  
  ###########trend29b#############
    tabItem(tabName = "trend29b",
            fluidRow(
              box(
                width = 12,
                solidHeader = TRUE,
                plottingOutput(id = "trend29b",initialName = trend29b_name,questionPanel = trend29b_panel)
              )
            ),
            
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt29b","Previous Page")
              )
            )
    ),
  
  
  ###########trend30b#############
    tabItem(tabName = "trend30b",
            fluidRow(
              box(
                width = 12,
                solidHeader = TRUE,
                plottingOutput(id = "trend30b",initialName = trend30b_name,questionPanel = trend30b_panel)
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                solidHeader = TRUE,
                actionButton("Prevtabt30b","Previous Page")
              )
            )
            
    ),
    
  ###########trend31b#############
    
    tabItem(tabName = "trend31b",
            fluidRow(
              box(
                width = 12,
                solidHeader = TRUE,
                plottingOutput(id = "trend31b",initialName = trend31b_name,questionPanel = trend31b_panel)
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                solidHeader = TRUE,
                actionButton("Prevtabt31b","Previous Page")
              )
            )
      ),
    
  ###########trend32b#############
    tabItem(tabName = "trend32b",
            fluidRow(
              box(
                width = 12,
                solidHeader = TRUE,
                plottingOutput(id = "trend32b",initialName = trend32b_name,questionPanel = trend32b_panel)
              )
            ),
            
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt32b","Previous Page")
              )
            )
    ),
    
  ###########trend33b#############
  
    tabItem(tabName = "trend33b",
            fluidRow(
              box(
                width = 12,
                plottingOutput(id = "trend33b",initialName = trend33b_name,questionPanel = trend33b_panel)
              )
            ),
            fluidRow(
              box(
                width = 3,
                solidHeader = TRUE,
                actionButton("Prevtabt33b","Previous Page")
              )
            )
    ),
  
  ###########trend34b#############  
  
    tabItem(tabName = "trend34b",
            fluidRow(
              box(
                width = 12,
                solidHeader = TRUE,
                plottingOutput(id = "trend34b",initialName = trend34b_name, questionPanel = trend34b_panel)
              )
            ),

            fluidRow(
              box(
                width = 3,
                solidHeader = TRUE,
                actionButton("Prevtabt34b","Previous Page")
              )
            )
    ),
    
  ###########trend36b#############
  
    tabItem(tabName = "trend36b",
            fluidRow(
              box(
                width = 12,
                solidHeader = TRUE,
                plottingOutput(id = "trend36b",initialName = trend36b_name,questionPanel = trend36b_panel)
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                solidHeader = TRUE,
                actionButton("Prevtabt36b","Previous Page")
              )
            )
    ),
    
  ###########trend37b#############
  
    tabItem(tabName = "trend37b",
            fluidRow(
              box(
                width = 12,
                solidHeader = TRUE,
                plottingOutput(id = "trend37b",initialName = trend37b_name,questionPanel = trend37b_panel)
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                solidHeader = TRUE,
                actionButton("Prevtabt37b","Previous Page")
              )
            )
          )
    #######################END OF PERIMETER PLOT###########
    )####THESE ARE THE MOST IMPORTANT END PARENTHESES THAT HOLD THE WHOLE FUNCTION TOGETHER
  )####


#####MODIFY THE SPECFIC PAGES DOWN HERE#######


