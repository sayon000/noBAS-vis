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
                  div(class="navPanels", "Trend Chart 1: Fan Schedule"),
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
                  div(class="navPanels", "Trend Chart 2a: OA Control Using OAD"),
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
                  div(class="navPanels", "Trend Chart 2b: OA Control Using OAF"),
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
                  div(class="navPanels", "Trend Chart 3: Minimum OAD Position"),
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
                  div(class="navPanels", "Trend Chart 4c: Simultaneous Heating & Cooling"),
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
                  div(class="navPanels", "Trend Chart 4d: Simultaneous Heating & Cooling"),
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
                  div(class="navPanels", "Trend Chart 5a: Economizing Using Temperature or Enthalpy"),
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
                  div(class="navPanels", "Trend Chart 7: DAT Control"),
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
                  div(class="navPanels", "Trend Chart 8a: Compressor Cycling & Staging"),
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
                  div(class="navPanels", "Trend Chart 8b: Burner Cycling & Staging"),
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
                  div(class="navPanels", "Trend Chart 10: Heating/Cooling Mode"),
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
            ),
            
           
           
           #fourth row end
           
            fluidRow(
                

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
              box(title = "Trend 1: Fan Status",
                  width = 12,
                  solidHeader = TRUE,
                  plottingOutput(id="trend1",initialName = "Trend 1: Fan Status", Row1 = trend1_panel)
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
              box(title = "Trend 2a: OA Control Using OAD",
                  width = 12,
                  solidHeader = TRUE,
                  plottingOutput(id = "trend2a",initialName = "Trend 2a: OA Control Using OAD", Row1 = trend2a_panel)
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
              box(title = "Trend 2b: OA Control Using OAF",
                width = 12,
                solidHeader = TRUE,
                plottingOutput(id = "trend2b", initialName = "Trend 2b: OA Control Using OAF",Row1 = trend2b_row1, Row2 = trend2b_row2)
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
              box(title = "Trend 3: Minimum OAD Position",
                width = 12,
                solidHeader = TRUE,
                plottingOutput(id = "trend3",initialName = "Trend 3: Minimum OAD Position",Row1 = trend3_row1 )
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
              box(title = "Trend 4c: Simultaneous Heating & Cooling",
                  width = 12,
                  solidHeader = TRUE,
                  plottingOutput(id = "trend4c",initialName = "Trend 4c: Simultaneous Heating & Cooling",Row1 = trend4c_row1 )
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
              box(title = "Trend 4d: Simultaneous Heating & Cooling",
                  width = 12,
                  solidHeader = TRUE,
                  plottingOutput(id = "trend4d",initialName = "Trend 4d: Simultaneous Heating & Cooling",Row1 = trend4d_row1)
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
              box(title = "Trend 5a: Economizing Using Temperature or Enthalpy",
                  width = 12,
                  solidHeader = TRUE,
                  plottingOutput(id = "trend5a")
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Are you in cooling mode?"),
                h4("Faults:"),
                boxPlus(
                  title = "Not in cooling mode",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("(See trend chart 2) If not in cooling mode, you should not be economizing."),
                    tags$li("The BAS does not know how to disable economizing while in heating mode."),
                    tags$li("Reprogram/disable economizing during heating.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 2",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Is MAT not between OAT and RAT? (OAF)"),
                h4("Faults:"),
                boxPlus(
                  title = "MAT is not between OAT and RAT",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("The temperature sensors are not calibrated properly."),
                    tags$li("The temperature sensors may not be properly located (ie. away from heating/cooling coils).")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 3",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Should you be economizing? Are you not?"),
                h4("Faults:"),
                boxPlus(
                  title = "Economizer not following the sequence of operations",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Operator override."),
                    tags$li("There may be issues with sensor calibration (e.g. humidity, temperature)."),
                    tags$li("OAD damper or actuator malfunction."),
                    tags$li("BAS is not executing economizing operations."),
                    tags$li("Is the economizing function overridden by another loop, such as DCV?")
                  )
                )
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
              box(title = "Trend 7: DAT Control",
                  width = 12,
                  solidHeader = TRUE,
                  plottingOutput(id = "trend7")
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2(" Is the system having trouble meeting the DATSP?"),
                h4("Faults:"),
                boxPlus(
                  title = "DAT does not meet DATSP",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Does the HCV/CCV respond to the signal?"),
                    tags$li("Are there any leaks in HCV/CCV?"),
                    tags$li("Is the AHU undersized?")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 2",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2(" Is the DAT hunting/stable?"),
                h4("Faults:"),
                boxPlus(
                  title = "DAT hunting",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("What is the operating differential? Can it be increased?"),
                    tags$li("Is the compressor/burner staging operating correctly? (see trend charts 8a and 8b)"),
                    tags$li("Is there unstable heating/cooling coil valve modulation?"),
                    tags$li("Does your PID control loop need to be tuned?")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 3",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("For a dynamic DATSP: Is the DATSP erratic or unstable?"),
                h4("Faults:"),
                boxPlus(
                  title = "Erratic DATSP",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("What is controlling the DATSP?"),
                    tags$li("Can you plot the parameters associated with the control loop? (use short duration intervals, e.g. 1 minute)")
                  )
                )
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
              box(title = "Trend 8a: Compressor/Burner Cycling & Staging",
                  width = 12,
                  solidHeader = TRUE,
                  plottingOutput(id = "trend8a")
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Are the compressors short cycling?"),
                h4("Faults:"),
                boxPlus(
                  title = "Short cycling",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("DAT / DATSP operating differential is too tight."),
                    tags$li("PID loop is out of tune.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 2",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Are the compressors not staged properly?"),
                h4("Faults:"),
                boxPlus(
                  title = "Compressors are not staged properly",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Staging controls not operating properly.")
                  )
                )
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
              box(title = "Trend 8b: Burner Cycling & Staging",
                  width = 12,
                  solidHeader = TRUE,
                  plottingOutput(id = "trend8b")
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Are the burners short cycling?"),
                h4("Faults:"),
                boxPlus(
                  title = "Short cycling",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("DAT / DATSP operating differential is too tight."),
                    tags$li("PID loop is out of tune.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 2",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Are the burners not staged properly?"),
                h4("Faults:"),
                boxPlus(
                  title = "Burners are not staged properly",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Staging controls not operating properly.")
                  )
                )
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
              box(title = "Trend 10: Heating/Cooling Mode",
                  width = 12,
                  solidHeader = TRUE,
                  plottingOutput(id = "trend10")
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Is the AHU in cooling or heating mode? "),
                h4("Faults:"),
                boxPlus(
                  title = "NO FAULTS (expand for details)",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("If MAT < DAT, heating mode"),
                    tags$li("If MAT > DAT, cooling mode"),
                    tags$li("Knowing whether you are in heating or cooling mode will help with the diagnosis of the other trend charts.")
                  )
                )
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
                  div(class="navPanels", "Trend Chart 12: Chiller Plant Schedule"),
                  box(solidHeader = TRUE, width = 12,
                      h1(strong("Trend Chart 12")),
                      h2("Chiller Plant Schedule"),
                      h3("Parameters to trend"),
                      tags$ul(
                        tags$li(csvFileInput(id = "CHWST12", label = "Chilled Water Supply Temperature")),
                        tags$li(csvFileInput(id = "CHWP12", label = "Chilled Water Pump Speed")),
                        tags$li(occupancyInput(id="occ12","https://cunybpl.shinyapps.io/nobas-occupancy/"))
                      ),
                      
                      actionButton("trend12Tab","Trend 12")
                  )
                ),
                tabPanel(
                  div(class="navPanels", "Trend Chart 13a: Chilled Water Delta T"),
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
                  div(class="navPanels", "Trend Chart 14a: ChWST Reset"),
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
                  div(class="navPanels", "Trend Chart 15: Cooling Tower Scheduling"),
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
                plottingOutput(id = "trend12")
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Is the chiller not following the occupancy (and start up) schedule?"),
                h4("Faults:"),
                boxPlus(
                  title = "Chiller does not follow the schedule",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  width = 12,
                  tags$ul(
                    tags$li("Chiller is on for another reason, such as to satisfy cooling needs for a data center."),
                    tags$li("Chiller is scheduled at odd times to address demand charges."),
                    tags$li("Chiller is not scheduled properly.")
                  )
                )
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
              plottingOutput(id = "trend13a")
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Is my Delta-T (ChWST and ChWRT differential) too small? "),
                h4("Faults:"),
                boxPlus(
                  title = "Delta-T is too small (such as below 10°F when the load is high)",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  width = 12,
                  tags$ul(
                    tags$li("LDP is set too high, creating a high ChW flow rate and low Delta T. Incrementally decrease the LDP setpoint to avoid not getting enough flow to zones that are far away.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 2",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("LDP not properly maintained by modulating pump speed?"),
                h4("Faults:"),
                boxPlus(
                  title = "LDP is not maintained well",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  width = 12,
                  tags$ul(
                    tags$li("LDP sensor problem."),
                    tags$li("Control loop problem.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 3",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Does pump speed not vary?"),
                h4("Faults:"),
                boxPlus(
                  title = "Pump speed constant when LDP varies",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Control loop not operating.")
                  )
                ),
                
                boxPlus(
                  title = "Pump speed constant, LDP constant",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("The VFD may not be working."),
                    tags$li("Piping problem: 3-way valves instead of 2-way valves prevent variable pressure."),
                    tags$li("Bypass loop could be opened.")
                  )
                )
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
                plottingOutput(id = "trend14a")
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Does your ChWST-SP not have a reset schedule? What is it based on? (such as OAT, occupancy, maximum cooling coil valve position)"),
                h4("Faults:"),
                boxPlus(
                  title = "No ChWST-SP reset",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("ChWST reset was never set up"),
                    tags$li("Can it be automated?")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 2",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Are your maximum CCV positions below 90%?"),
                h4("Faults:"),
                boxPlus(
                  title = "The maximum CCV position is often well below 90%",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("ChWST-SP is too low"),
                    tags$li("Can you have your BAS programmed to dynamically reset the ChWST-SP to adjust so that the maximum CCV position is always 90%?")
                  )
                )
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
                plottingOutput(id = "trend15")
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Are the fans on during unoccupied hours?"),
                h4("Faults:"),
                boxPlus(
                  title = "Cooling tower fans run for many hours before occupancy",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Standard start up time based on the worst day of the year."),
                    tags$li("Can scheduling be more aggressive without introducing a significant risk of not reaching comfort during the day?")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 2",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Are the fans short cycling? (turning on and off in short periods of time)"),
                h4("Faults:"),
                boxPlus(
                  title = "Fans short cycling",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Control loop not operating properly and/or needs tuning."),
                    tags$li("The condenser water supply temperature needs to be reset.")
                  )
                )
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
                  div(class="navPanels", "Trend Chart 17: Steam Boiler Condensate Return Temperature"),
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
                  div(class="navPanels", "Trend Chart 18: Boiler Plant Scheduling"),
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
                  div(class="navPanels", "Trend Chart 19a: Hot Water Temperature Reset"),
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
                  div(class="navPanels", "Trend Chart 21: Condensing Boiler Efficiency"),
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
                  div(class="navPanels", "Trend Chart 22: Boiler Cycling & Staging"),
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
                  div(class="navPanels", "Trend Chart 23: Hot Water Temperature Hunting"),
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
              plottingOutput(id = "trend17")
            )
          ),
          
          fluidRow(
            width = 12,
            boxPlus(
              title = "Question 1",
              collapsed = TRUE,
              collapsible = TRUE,
              closable = FALSE,
              solidHeader = TRUE,
              width = 4,
              h2("Is the condensate return temperature too high?"),
              h4("Faults:"),
              boxPlus(
                title = "Condensate return temperature is too high",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 12,
                tags$ul(
                  tags$li("Faulty steam traps.")
                )
              )
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
              plottingOutput(id = "trend18")
            )
          ),
          
          fluidRow(
            width = 12,
            boxPlus(
              title = "Question 1",
              collapsed = TRUE,
              collapsible = TRUE,
              closable = FALSE,
              solidHeader = TRUE,
              width = 4,
              h2("Is the boiler not following the occupancy schedule? "),
              h4("Faults:"),
              boxPlus(
                title = "Boiler does not follow the occupancy schedule",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 12,
                tags$ul(
                  tags$li("Not scheduled properly: change the boiler schedule"),
                  tags$li("Boiler needed for meeting zone setback temperatures"),
                  tags$li("Boiler needed for freeze protection below 38 ℉ (can boiler not operate above OAT = 38℉")
                )
              )
            ),
            
            boxPlus(
              title = "Question 2",
              collapsed = TRUE,
              collapsible = TRUE,
              closable = FALSE,
              solidHeader = TRUE,
              width = 4,
              h2("Is the boiler running when heating should be locked out? (such as 50℉) "),
              h4("Faults:"),
              boxPlus(
                title = "Boiler is running when heating should be locked out",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 12,
                tags$ul(
                  tags$li("Disabling cutoff temperature not operating"),
                  tags$li("No cutoff temperature is programmed"),
                  tags$li("Boiler must operate to provide other services such as DHW, Pool Heating, etc. ")
                )
              )
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
              plottingOutput(id = "trend19a")
            )
          ),
          
          fluidRow(
            width = 12,
            
            boxPlus(
              title = "Question 1",
              collapsed = TRUE,
              collapsible = TRUE,
              closable = FALSE,
              solidHeader = TRUE,
              width = 4,
              h2("Is HW reset failing to work properly or not aggressive enough?"),
              h4("Faults:"),
              boxPlus(
                title = "No HW reset",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 12,
                tags$ul(
                  tags$li("No HW reset is available."),
                  tags$li("HW reset controller not set properly."),
                  tags$li("HW reset controller not working."),
                  tags$li("If HW is solely for heating coils, consider programming HWST-SP based on a maximum HCV position of 90%.")
                )
              ),
              
              boxPlus(
                title = "HW reset is ineffective",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 12,
                tags$ul(
                  tags$li("Is the control loop functioning properly?")
                )
              )
            ),
            
            boxPlus(
              title = "Question 2",
              collapsed = TRUE,
              collapsible = TRUE,
              closable = FALSE,
              solidHeader = TRUE,
              width = 4,
              h2("Is your average HCV position well below 50%? "),
              h4("Faults:"),
              boxPlus(
                title = "The average HCV position is often well below 50% (for systems where HW is used solely for heating coils)",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 12,
                tags$ul(
                  tags$li("HWST-SP is generally too high. ")
                )
              )
            ),
            
            boxPlus(
              title = "Question 3",
              collapsed = TRUE,
              collapsible = TRUE,
              closable = FALSE,
              solidHeader = TRUE,
              width = 4,
              h2("Is your maximum HCV position well below 90%?"),
              h4("Faults:"),
              boxPlus(
                title = "The maximum HCV position is often well below 90% (for systems where HW is used solely for heating coils) ",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 12,
                tags$ul(
                  tags$li("If HW is solely for heating coils, consider programming HWST-SP based on meeting a maximum HCV position of 90%.")
                )
              )
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
              plottingOutput(id = "trend20a")
            )
          ),
          fluidRow(
            width = 12,
            boxPlus(
              title = "Question 1",
              collapsed = TRUE,
              collapsible = TRUE,
              closable = FALSE,
              solidHeader = TRUE,
              width = 4,
              h2("Is my delta T (HWST - HWRT) too small? "),
              h4("Faults:"),
              boxPlus(
                title = "Delta T too small (below 10°F) during high load times",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 12,
                tags$ul(
                  tags$li("Hot water is being over-pumped.")
                )
              )
            ),
            
            boxPlus(
              title = "Question 2",
              collapsed = TRUE,
              collapsible = TRUE,
              closable = FALSE,
              solidHeader = TRUE,
              width = 4,
              h2("Is LDP not properly maintained by modulating pump speed?"),
              h4("Faults:"),
              boxPlus(
                title = "LDP is not maintained well",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 12,
                tags$ul(
                  tags$li("LDP sensor problem."),
                  tags$li("Control loop problem.")
                )
              )
            ),
            
            boxPlus(
              title = "Question 3",
              collapsed = TRUE,
              collapsible = TRUE,
              closable = FALSE,
              solidHeader = TRUE,
              width = 4,
              h2("Does pump speed fail to vary?"),
              h4("Faults:"),
              boxPlus(
                title = "Pump speed constant when LDP varies",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 12,
                tags$ul(
                  tags$li("Control loop not working.")
                )
              ),
              boxPlus(
                title = "Pump speed constant, LDP constant",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 12,
                tags$ul(
                  tags$li("Piping problem: 3-way valves instead of 2-way valves prevent variable pressure.")
                )
              )
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
              plottingOutput(id = "trend21")
            )
          ),
          fluidRow(
            boxPlus(
              title = "Question 1",
              collapsed = TRUE,
              collapsible = TRUE,
              closable = FALSE,
              solidHeader = TRUE,
              width = 4,
              h2("Is the condensate return temperature too high?"),
              h4("Faults:"),
              boxPlus(
                title = "Is HWRT above 130°F?",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 12,
                tags$ul(
                  tags$li("Over-pumping minimizes delta T. Reduce LDP-SP to reduce pump speed, causing HWRT to drop."),
                  tags$li("HWST too high for a condensing boiler with a good Delta-T. Incrementally reduce HWST, ensuring all zone heating needs are satisfied.")
                )
              )
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
              plottingOutput(id = "trend22")
            )
          ),
          
          fluidRow(
            width = 12,
            boxPlus(
              title = "Question 1",
              collapsed = TRUE,
              collapsible = TRUE,
              closable = FALSE,
              solidHeader = TRUE,
              width = 4,
              h2("Is the boiler short cycling?"),
              h4("Faults:"),
              boxPlus(
                title = "Short cycling",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 12,
                tags$ul(
                  tags$li("The boiler could be oversized."),
                  tags$li("Pressuretrols/ aquastats are not set properly (such as operating differential too small) or out of calibration."),
                  tags$li("The boiler may be overfiring."),
                  tags$li("The lead-lag controller is not programmed/ working properly. ")
                )
              )
            ),
            
            boxPlus(
              title = "Question 2",
              collapsed = TRUE,
              collapsible = TRUE,
              closable = FALSE,
              solidHeader = TRUE,
              width = 4,
              h2("Does Stack temperature show that my burner is cycling on/off or modulating?"),
              h4("Faults:"),
              boxPlus(
                title = "Stack temperature is higher than expected or not modulating with burner",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 12,
                tags$ul(
                  tags$li("Tubes are fouled."),
                  tags$li("Burner modulation not operating properly.")
                )
              )
            ),
            
            boxPlus(
              title = "Question 3",
              collapsed = TRUE,
              collapsible = TRUE,
              closable = FALSE,
              solidHeader = TRUE,
              width = 4,
              h2("Is my stack temperature too high?"),
              h4("Faults:"),
              boxPlus(
                title = "Stack temperature is higher than expected or not modulating with burner",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 12,
                tags$ul(
                  tags$li("Tubes are fouled."),
                  tags$li("Burner modulation not operating properly.")
                )
              )
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
              plottingOutput(id = "trend23")
            )
          ),
          
          fluidRow(
            width = 12,
            boxPlus(
              title = "Question 1",
              collapsed = TRUE,
              collapsible = TRUE,
              closable = FALSE,
              solidHeader = TRUE,
              width = 4,
              h2("Is the HWST failing to follow its setpoint?"),
              h4("Faults:"),
              boxPlus(
                title = "HWST does not follow its setpoint",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 12,
                tags$ul(
                  tags$li("Control loop not operating properly."),
                  tags$li("Aquastat not working.")
                )
              )
            ),
            
            boxPlus(
              title = "Question 2",
              collapsed = TRUE,
              collapsible = TRUE,
              closable = FALSE,
              solidHeader = TRUE,
              width = 4,
              h2(" Is there hunting?"),
              h4("Faults:"),
              boxPlus(
                title = "HWST is hunting",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 12,
                tags$ul(
                  tags$li("Aquastat operating differential is not set properly.")
                )
              )
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
                plottingOutput(id = "trend26")
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Is the Zone Temperature not meeting its Zone Temperature Set-point?"),
                h4("Faults:"),
                boxPlus(
                  title = "Zone temperature does not meet its set point",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Thermostat / VAV damper control loop is not working."),
                    tags$li("VAV box is starved or stuffed.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 2",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Is the deadband not wide enough (below 5℉), allowing alternating heating and cooling to occur?"),
                h4("Faults:"),
                boxPlus(
                  title = "Deadband (number of degrees between heating and cooling setpoints) is below 5℉",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Bad setpoints cause alternating heating / cooling: Increase the deadband to at least 5℉.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 3",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Is the zone temperature not floating toward the setback temperature during unoccupied times?"),
                h4("Faults:"),
                boxPlus(
                  title = "Zone temperature does not float toward the setback temperature during unoccupied times",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  width = 12,
                  tags$ul(
                    tags$li("Zone temperature controls not working to allow zone temp to float."),
                    tags$li("For a zone temperature setback on the air system, the perimeter heating system is independently heating the space during unoccupied times. ")
                  )
                ),
                boxPlus(
                  title = "Zone temperature does not float toward the setback temperature during unoccupied times",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Zone temperature setbacks should be reduced to 55-60 °F during heating season, and raised to 80-85℉ during cooling season. Incremental changes / trial and error needed, especially for a leaky envelope and/or if your building takes a long time to reach occupied zone temperature setpoints. Check to see how your building responds and move to a more aggressive setback if everything is okay.")
                  )
                )
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
                plottingOutput(id = "trend2737a")
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
                plottingOutput(id = "trend27b")
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Is the system failing to meet the ZTSP-A?"),
                h4("Faults:"),
                boxPlus(
                  title = "Failing to meet ZTSP-A",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Check if the HCV opens or modulates its position (or burners fire) as a response to the call for heat."),
                    tags$li("Ensure that the DAT is appropriate and that the fan is on."),
                    tags$li("If there is a control loop between DAT, HCV, and ZTSP, tune it."),
                    tags$li("If the HCV (or burners) and DAT are fine, change the HWST set point so the ZTSP-A can be met."),
                    tags$li("If the above does not get to the issue, check your perimeter system:"),
                    tags$li("For underheating, check that there is heat provided by the perimeter system."),
                    tags$li("For overheating, reduce the heating from the perimeter system.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 2",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Are there frequent HCV fluctuations or is there burner cycling?"),
                h4("Faults:"),
                boxPlus(
                  title = "Heating coil valve fluctuations or burner(s) is/are short-cycling",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("The interaction of the perimeter and air systems may be causing the instability. Check controls and/or PID loop for the AHU DAT and that for the perimeter system HWST.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 3",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Is the supply fan on during unoccupied times?"),
                h4("Faults:"),
                boxPlus(
                  title = "Supply fan is on during unoccupied times",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Does your building use setbacks and/or early startups? Cycling to meet setbacks and starting before occupied times might be OK."),
                    tags$li("Is the programmed schedule correct?")
                  )
                )
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 4",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("If there are nighttime setbacks, are both systems running at night?"),
                h4("Faults:"),
                boxPlus(
                  title = "Both systems run at night to meet nighttime setbacks",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Can the nighttime setbacks be met solely with the perimeter system? Doing so will eliminate fan operation. This may require changing your HWST set point or HW reset settings.")
                  )
                )
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
                plottingOutput(id = "trend28b")
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Are you failing to meet your ZTSP-A?"),
                h4("Faults:"),
                boxPlus(
                  title = "Failing to meet ZTSP-A",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Check if the VAV dampers modulate their positions to meet ZTSP-A. If not, tune it."),
                    tags$li("Check if the HCV modulates its position (or burner(s) go on, modulate, or stage) to meet the DATSP."),
                    tags$li("Check that your DATSP is above the ZTSP-A."),
                    tags$li("Check that the DAT is meeting DATSP. If not, tune the loop."),
                    tags$li("For underheating, check that there is heat provided by the perimeter system. "),
                    tags$li("For underheating, if perimeter system is providing heat, and if HCV is at 100% (or burners on full), and VAV is starved, you may have to increase your HWST set point. "),
                    tags$li("For overheating, reduce the heating from the perimeter system.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 2",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Are there frequent heating coil valve fluctuations or is there burner cycling?"),
                h4("Faults:"),
                boxPlus(
                  title = "Heating coil valve fluctuations or burner(s) is/are short-cycling",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("The interaction of the perimeter and air systems may be causing the instability. Check controls and/or PID loop for the AHU DAT and that for the perimeter system HWST.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 3",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2(" Is the supply fan on during unoccupied times?"),
                h4("Faults:"),
                boxPlus(
                  title = "Supply fan is on during unoccupied times",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Does your building use setbacks and/or early startups? Cycling to meet setbacks and starting before occupied times might be OK."),
                    tags$li("Is the programmed schedule correct?")
                  )
                )
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 4",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Are the VAV damper positions below 50% or above 75%?"),
                h4("Faults:"),
                boxPlus(
                  title = "Most of the VAV damper positions are below 50% or above 75%",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Duct static pressure is set too high or too low."),
                    tags$li("Control loop for VAV damper is not working."),
                    tags$li("DATSP is too high or too low.")
                  )
                ),
                boxPlus(
                  title = "VAV Damper Positions change too frequently",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Check controls or PID loop.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 5",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Is DAT greater or less than ZT? "),
                h4("Faults:"),
                boxPlus(
                  title = "DATSP < ZTSP-A",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Not a recommended configuration, as there is no thermostat for the perimeter system.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 6",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("If there are nighttime setbacks, are both systems running at night?"),
                h4("Faults:"),
                boxPlus(
                  title = "Both systems run at night to meet nighttime setbacks",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Can the nighttime setbacks be met solely with the perimeter system? This may require changing your HWST set point or HW reset settings.")
                  )
                )
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
                plottingOutput(id = "trend29b")
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Does the system fail to meet its DATSP and ZTSP-A?"),
                h4("Faults:"),
                boxPlus(
                  title = "Fails to meet DATSP",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Check the control loop between the HCV and the DAT. Tune if needed.")
                  )
                ),
                boxPlus(
                  title = "Fails to meet ZTSP-A",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("If VAVs, check if the VAV dampers modulate their positions to meet ZTSP-A. If not, tune it."),
                    tags$li("Check that the DAT is meeting DATSP. If not, tune the loop."),
                    tags$li("Check if reheat valves modulate to meet the ZTSP-A."),
                    tags$li("For underheating, check that there is heat provided by the perimeter system. "),
                    tags$li("For underheating, if perimeter system is providing heat, and if HCV is at 100% (or burners on full), and VAV is starved, and the reheat valve is fully open, you may have to increase your DATSP and/or HWST set point. "),
                    tags$li("For overheating, reduce the heating from the perimeter system. ")
                  )
                )
                
              ),
              
              boxPlus(
                title = "Question 2",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Are there frequent heating coil valve fluctuations or is there burner cycling?"),
                h4("Faults:"),
                boxPlus(
                  title = "Heating coil valve fluctuations or burner(s) is/are short-cycling",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("The interaction of the perimeter and air systems may be causing the instability. Check controls and/or PID loop for the AHU DAT and that for the perimeter system HWST.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 3",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Are there frequent valve fluctuations for the reheat coil?"),
                h4("Faults:"),
                boxPlus(
                  title = "Reheat valve hunting",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Check controls or PID loop.")
                  )
                )
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 4",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Is the supply fan on during unoccupied times?"),
                h4("Faults:"),
                boxPlus(
                  title = "Supply fan is on during unoccupied times",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Does your building use setbacks and/or early startups? Cycling to meet setbacks and starting before occupied times might be OK."),
                    tags$li("Is the programmed schedule correct?")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 5",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Is DAT greater or less than ZT?"),
                h4("Faults:"),
                boxPlus(
                  title = "DAT > ZT",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Possible overheating and negating the need for reheats and you lose zone-specific controls; not a recommended configuration.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 6",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Are the VAV damper positions below 50% or above 75%?"),
                h4("Faults:"),
                boxPlus(
                  title = "Most of the VAV damper positions are below 50% or above 75%",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Duct static pressure is set too high or too low."),
                    tags$li("Control loop for VAV damper is not working."),
                    tags$li("DATSP is too high or too low.")
                  )
                ),
                boxPlus(
                  title = "VAV Damper Positions change too frequently",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Check controls or PID loop.")
                  )
                )
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 7",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("What is the maximum HCV position when reheat coils are active?"),
                h4("Faults:"),
                boxPlus(
                  title = "Majority of reheat valves are throttled to typically less than 70%",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Implement HWLDPSP reset so that the maximum HCV position is around 90% open.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 8",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Are the majority of the reheats active?"),
                h4("Faults:"),
                boxPlus(
                  title = "Majority of reheat valves are throttled to typically less than 70%",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Implement HWLDPSP reset so that the maximum HCV position is around 90% open.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 9",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("If there are nighttime setbacks, are both systems running at night?"),
                h4("Faults:"),
                boxPlus(
                  title = "Both systems run at night to meet nighttime setbacks",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Can the nighttime setbacks be met solely with the perimeter system? This may require changing your HWST set point or HW reset settings.")
                  )
                )
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
                plottingOutput(id = "trend30b")
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Are there frequent heating coil valve fluctuations or is there burner cycling?"),
                h4("Faults:"),
                boxPlus(
                  title = "Heating coil valve fluctuations or burner(s) is/are short-cycling",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("The interaction of the perimeter and air systems may be causing the instability. Check controls and/or PID loop for the AHU DAT and that for the perimeter system HWST.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 2",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Does the RAT fail to meet its setpoint?"),
                h4("Faults:"),
                boxPlus(
                  title = "RATSP is not met",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Check controls sequence – see that DAT modulates to meet the RATSP, and that the HCV modulates to meet the DATSP. May need to tune the control loop.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 3",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Does RAT fail to change in order to meet the RATSP?"),
                h4("Faults:"),
                boxPlus(
                  title = "If RAT<RATSP despite increasing DAT",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Check for air infiltration in the zones."),
                    tags$li("HWST may be too low to meet the load. Increase HWSTSP or change HW reset settings")
                  )
                )
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 4",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Is the supply fan on during unoccupied times?"),
                h4("Faults:"),
                boxPlus(
                  title = "Supply fan is on during unoccupied times",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Does your building use setbacks and/or early startups? Cycling to meet setbacks and starting before occupied times might be OK."),
                    tags$li("Is the programmed schedule correct?")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 5",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Are your zone temperatures uneven?"),
                h4("Faults:"),
                boxPlus(
                  title = "Zone temperatures are uneven – some too hot, some too cold",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Check air balance."),
                    tags$li("Check for air infiltration in cold zones.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 6",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("If there are nighttime setbacks, are both systems running at night?"),
                h4("Faults:"),
                boxPlus(
                  title = "Both systems run at night to meet nighttime setbacks",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Can the nighttime setbacks be met solely with the perimeter system? This may require changing your HWST set point or HW reset settings.")
                  )
                )
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
                plottingOutput(id = "trend31b")
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Does the system fail to meet its DATSP?"),
                h4("Faults:"),
                boxPlus(
                  title = "Not meeting DATSP",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Does the HCV modulate to meet DATSP? If not, tune the control loop.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 2",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Are your zone and return temperatures too hot or cold?"),
                h4("Faults:"),
                boxPlus(
                  title = "Zone temps too hot or too cold",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("If the control loop between DAT and DATSP is working, adjust the DATSP or HWSTSP until the zone temperature or return temperatures are in an appropriate range."),
                    tags$li("If valve positions (both for heating coils and for perimeter system) are all wide open or throttled, consider changing loop differential pressure set points for either or both hot water loops.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 3",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Is the supply fan on during unoccupied times?"),
                h4("Faults:"),
                boxPlus(
                  title = "Supply fan is on during unoccupied times",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("If air systems can be turned off at night, schedule it to do so. Remember freeze protection!")
                  )
                )
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 4",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Are there frequent heating coil valve fluctuations or is there burner cycling?"),
                h4("Faults:"),
                boxPlus(
                  title = "Heating coil valve fluctuations or burner(s) is/are short-cycling",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("The interaction of the perimeter and air systems may be causing the instability. Check controls and/or PID loop for the AHU DAT and that for the perimeter system HWST.")
                  )
                )
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
                plottingOutput(id = "trend32b")
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Are your zone or return temperatures too hot or cold?"),
                h4("Faults:"),
                boxPlus(
                  title = "Zones too hot or too cold",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("This system does not have many controls or set points available. Adjustments are typically manual for systems like these, and may include trial and error with the following settings:"),
                    tags$ul(
                      tags$li("HWSTSP"),
                      tags$li("LDPSP (may not be any of these)"),
                      tags$li("Schedules"),
                      tags$li("Valve positions (hot water to perimeter and/or HCV)")
                    )
                  )
                )
              ),
              
              boxPlus(
                title = "Question 2",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Is the supply fan on during unoccupied times?"),
                h4("Faults:"),
                boxPlus(
                  title = "Supply fan is on during unoccupied times",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("If air systems can be turned off at night, schedule it to do so. Remember freeze protection!")
                  )
                )
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
                plottingOutput(id = "trend33b")
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Do zone temperatures fail to meet their setpoints?"),
                h4("Faults:"),
                boxPlus(
                  title = "ZTs not meeting their setpoints",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("If ZTSP-P > ZTSP-A, the perimeter system controls meeting the ZTSP. In this case:"),
                    tags$li("Check that perimeter system valves serving the zones are operating properly."),
                    tags$li("Check that HWSTSP is sufficient to meet the load."),
                    tags$li("If ZTSP-P < ZTSP-A, the air system controls meeting the ZTSP. In this case:"),
                    tags$li("Check that the control loop between the DAT and ZTSP-A is tuned properly (if this loop exists)."),
                    tags$li("Check that the HCV valve (or burner) modulates to meet the ZTSP-A (If this loop exists)."),
                    tags$li("Check the HCV position; if fully open and zone temps too cold, increase LDPSP and/or HWSTSP (or HW reset settings).")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 2",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Is the supply fan on during unoccupied times?"),
                h4("Faults:"),
                boxPlus(
                  title = "Supply fan is on during unoccupied times",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("If air systems can be turned off at night, schedule it to do so. Remember freeze protection!")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 3",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Are there frequent heating coil valve fluctuations or burner cycling?"),
                h4("Faults:"),
                boxPlus(
                  title = "Heating coil valve fluctuations or burner(s) is/are short-cycling",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("The interaction of the perimeter and air systems may be causing the instability. Check controls and/or PID loop for the AHU DAT and that for the perimeter system HWST.")
                  )
                )
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 4",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Are your ZTSP-P and ZTSP-A within one or two degrees of each other?"),
                h4("Faults:"),
                boxPlus(
                  title = "ZTSP-P and ZTSP-A are within 1-2°F of each other",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Select the system to dominate heating and set that ZTSP significantly higher (at least 5°F) across all zones served. Be sure this is true for all zones, otherwise the second system will remain on to serve the zone (or zones) where the rule is not followed.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 5",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("If there are nighttime setbacks, are both systems running at night?"),
                h4("Faults:"),
                boxPlus(
                  title = "Both systems run at night to meet nighttime setbacks",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Can the nighttime setbacks be met solely with the perimeter system? This may require changing your HWST set point or HW reset settings.")
                  )
                )
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
                plottingOutput(id = "trend34b")
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Do zone temperatures fail to meet their setpoints? IF YES, ask Qs. 1a–c, too!"),
                h4("Faults:"),
                boxPlus(
                  title = "Zones not meeting their set points",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("If ZTSP-P > ZTSP-A, the perimeter system controls meeting the ZTSP. In this case:"),
                    tags$li("Check that perimeter system valves serving the zones are operating properly."),
                    tags$li("Check that HWSTSP is sufficient to meet the load."),
                    tags$li("If ZTSP-P < ZTSP-A, the air system controls meeting the ZTSP. In this case: "),
                    tags$li("Check that the zone thermostats are controlling the VAVs properly. "),
                    tags$li("Check that the HCV valve (or burner) modulates to meet the DATSP."),
                    tags$li("Check the HCV position; if fully open and zone temps too cold, increase LDPSP and/or HWSTSP (or HW reset settings).")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 1a",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Is DAT > ZT when ZTSP-P (or TRVSP) > ZTSP-A?"),
                h4("Faults:"),
                boxPlus(
                  title = "DAT>ZTSP-A when ZTSP-P (or TRVSP)>ZTSP-A",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("This is not a recommended setup. Potential overheating in the zones, suggest reducing VAV Damper Position to min positions and lower DATSP.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 1b",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Is DAT < ZT when ZTSP-P (or TRVSP) < ZTSP-A? "),
                h4("Faults:"),
                boxPlus(
                  title = "DAT<ZTSP-A when ZTSP-P (or TRVSP) < ZTSP-A",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("This is not a recommended setup. This will cause underheating in the zones. Increase DATSP or ZTSP-P. ")
                  )
                )
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1c",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("When ZTSP-P (or TRVSP) > ZTSP-A and DAT < ZT, does the VAV damper fail to modulate to minimum position?"),
                h4("Faults:"),
                boxPlus(
                  title = "VAV dampers are not at minimum position at DAT < ZTSP-A when ZTSP-P (or TRVSP)>ZTSP-A",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("In this scenario, you want the VAV to go to minimum position. The damper should close when the zone temperature exceeds ZTSP-A. But the VAV is not at minimum position, and simultaneous heating and cooling is occurring.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 2",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Is the supply fan on during unoccupied times?"),
                h4("Faults:"),
                boxPlus(
                  title = "Supply fan is on during unoccupied times",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("If air systems can be turned off at night, schedule it to do so. Remember freeze protection!")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 3",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Are there frequent heating coil valve fluctuations or burner cycling?"),
                h4("Faults:"),
                boxPlus(
                  title = "Heating coil valve fluctuations or burner(s) is/are short-cycling",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("The interaction of the perimeter and air systems may be causing the instability. Check controls and/or PID loop for the AHU DAT and that for the perimeter system HWST.")
                  )
                )
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 4",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Are the VAV damper positions below 50% or above 75%?"),
                h4("Faults:"),
                boxPlus(
                  title = "Most of the VAV damper positions are below 50% or above 75%",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Duct static pressure is set too high or too low."),
                    tags$li("Control loop for VAV damper is not working."),
                    tags$li("DATSP is too high or too low.")
                  )
                ),
                boxPlus(
                  title = "VAV Damper Positions change too frequently",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Check controls or PID loop. ")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 5",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Are your ZTSP-P and ZTSP-A within one or two degrees of each other?"),
                h4("Faults:"),
                boxPlus(
                  title = "ZTSP-P and ZTSP-A are within 1-2°F of each other",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Select the system to dominate heating and set that ZTSP significantly higher (at least 5°F) across all zones served. Be sure this is true for all zones, otherwise the second system will remain on to serve the zone (or zones) where the rule is not followed.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 6",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("If there are nighttime setbacks, are both systems running at night?"),
                h4("Faults:"),
                boxPlus(
                  title = "Both systems run at night to meet nighttime setbacks",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Can the nighttime setbacks be met solely with the perimeter system? This may require changing your HWST set point or HW reset settings.")
                  )
                )
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
                plottingOutput(id = "trend36b")
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Is DAT having trouble meeting the RATSP?"),
                h4("Faults:"),
                boxPlus(
                  title = "RATSP is not met",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Check controls sequence – see that DAT modulates to meet the RATSP, and that the HCV modulates to meet the DATSP. May need to tune the control loop.")
                  )
                ),
                boxPlus(
                  title = "RAT<RATSP despite increasing DAT",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Check for air infiltration in the zones."),
                    tags$li("HWST may be too low to meet the load. Increase HWSTSP or change HW reset settings.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 2",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Is the system having trouble meeting your ZTSP-P? "),
                h4("Faults:"),
                boxPlus(
                  title = "Zone temperatures are uneven – some too hot, some too cold",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Check air balance."),
                    tags$li("Check for air infiltration in cold zones.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 3",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Is the supply fan on during unoccupied times?"),
                h4("Faults:"),
                boxPlus(
                  title = "Supply fan is on during unoccupied times",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("If air systems can be turned off at night, schedule it to do so. Remember freeze protection!")
                  )
                )
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 4",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Is the ZTSP-P < RATSP?"),
                h4("Faults:"),
                boxPlus(
                  title = "ZTSP-P < RATSP",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("This configuration is not recommended. It’s better to meet your heating requirements with your perimeter system. Change the settings.")
                  )
                )
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
                plottingOutput(id = "trend37b")
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Are you having trouble meeting  ZTSP-P?"),
                h4("Faults:"),
                boxPlus(
                  title = "Zone temps too hot or too cold",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Check that perimeter system valves serving the zones are operating properly."),
                    tags$li("Check that HWSTSP is sufficient to meet the load.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 2",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Are you having trouble meeting DATSP?"),
                h4("Faults:"),
                boxPlus(
                  title = "Not meeting DATSP",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("Does the HCV modulate to meet DATSP? If not, tune the control loop.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 3",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Is the supply fan on during unoccupied times?"),
                h4("Faults:"),
                boxPlus(
                  title = "Supply fan is on during unoccupied times",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("If air systems can be turned off at night, schedule it to do so. Remember freeze protection!")
                  )
                )
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 4",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                width = 4,
                h2("Are there frequent heating coil valve fluctuations or is there burner cycling?"),
                h4("Faults:"),
                boxPlus(
                  title = "Heating coil valve fluctuations or burner(s) is/are short-cycling",
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  solidHeader = TRUE,
                  width = 12,
                  tags$ul(
                    tags$li("The interaction of the perimeter and air systems may be causing the instability. Check controls and/or PID loop for the AHU DAT and that for the perimeter system HWST.")
                  )
                )
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


