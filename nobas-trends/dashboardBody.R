body <- dashboardBody(
  tabItems(
    tabItem(tabName = "Splash",
            title = "Nope",
            fluidRow(class = 'text-center',
                     h1("NoBAS Trend Charts")
              
            )
    ),
    # First tab content
    tabItem(tabName = "Home",
           fluidRow( 
              
             box(
                title = "Air Handling Unit Charts",
                width = 3,
                height = 300,
                img(src='https://www.cunybpl.org/wp-content/uploads/2018/11/ahu-150x150.png', 
                    align = "left",
                    width = '75%',
                    length = '75%'),
                actionButton('AHUTab',"Air Handling Units")
              ),
              
             box(
                title = "Chiller Plant Charts",
                width = 3,
                height = 300,
                img(src='https://www.cunybpl.org/wp-content/uploads/2018/11/kisspng-chiller-hvac-free-cooling-condenser-refrigeration-advertising-carrier-5ae772db19a570.4527380615251176591051-300x173.jpg',
                    align = 'left',
                    width = '75%',
                    length = '75%'),
                actionButton('CHPTab',"Chiller Plant")
              ),
              
              box(
                title = "Boiler Plant Charts",
                width = 3,
                height = 300,
                img(src='http://tmiclimatesolutions.com/img/uhs-boiler-skid.jpg',
                    align = 'left',
                    width = '75%',
                    length = '75%'),
                actionButton('BPTab',"Boiler Plant")
              ),
             
              box(
                title = "Zone Charts",
                width = 3,
                height = 300,
                img(src='https://www.cunybpl.org/wp-content/uploads/2018/12/image1044_5-150x150.png',
                    align = 'left',
                    width = '75%',
                    length = '75%'),
                actionButton('ZTab',"Zone Charts")
              )
           ),

           fluidRow(
              
             box(title = "Perimeter and Air Charts",
                width = 3,
                height = 300,
                img(src="http://machineryequipmentonline.com/hvac-machinery/wp-content/uploads/2015/12/HVAC-LICENSING-EXAM-STUDY-GUIDE-0073_thumb.jpg",
                    align = 'left',
                    width = '100%',
                    length = '100%'),
                actionButton('PTab',"Perimeter And Air")
            ),
            
            box(
              width = 9,
              img(src="https://raw.githubusercontent.com/cunybpl/noBAS-vis/master/bpl-logo.png",
                  align = 'left',
                  width = '100%',
                  length = '100%'
                  )
            )
          )
    ),
    
    ########################################AHU TAB START##################################################
    # AHU Tab Content start
    tabItem(tabName = 'AHU',
            #FIRST ROW Start
            fluidRow(
              width = 12,

              boxPlus(
                title = "Trend Chart 1: Fan Schedule",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h1(strong('Trend Chart 1')),
                h2('Fan Schedule'),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li(csvFileInput(id='fant1',label='Fan Status')),
                  tags$li(occupancyInput(id='occ1',"https://cunybpl.shinyapps.io/nobas-occupancy/"))
                ),
                actionButton('trend1Tab',"Trend 1")
              ),
              
              boxPlus(
                title = "Trend 2: OA Control Using OAD",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h1(strong('Trend Chart 2b')),
                h2('OA Control Using OAD'),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li(csvFileInput(id = 'fant2b', label = 'Fan Status')),
                  tags$li(csvFileInput(id = 'OAT2b', label = 'Outside Air Temperature')),
                  tags$li(csvFileInput(id = 'MAT2b', label = 'Mixed Air Temperature')),
                  tags$li(csvFileInput(id = 'RAT2b', label = 'Return Air Temperature')),
                  tags$li(occupancyInput(id='occ2b',"https://cunybpl.shinyapps.io/nobas-occupancy/"))
                ),
                actionButton('trend2bTab','Trend 2b')
              ),
              
              boxPlus(
                title = "Trend 3: Minimum OAD Position",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h1(strong('Trend Chart 3')),
                h2("Minimum OAD Position"),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li(csvFileInput(id ='OAD3', label = 'OAD Position')),
                  tags$li(csvFileInput(id = "CO2-3", label = "CO2 Level")),
                  tags$li(occupancyInput(id='occ3',"https://cunybpl.shinyapps.io/nobas-occupancy/"))
                ),
                actionButton('trend3Tab','Trend 3')
              )
            ),
            #first row end
            
            #second row begin
            fluidRow(
              width = 12,
              boxPlus(
                title = "Trend Chart 4c: Simultaneous Heating & Cooling",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h1(strong('Trend Chart 4c')),
                h2("Simultaneous Heating & Cooling"),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li(csvFileInput(id ='OAD4c', label = 'OAD Position')),
                  tags$li(csvFileInput(id = "HCV4c", label = "Heating Coil Valve")),
                  tags$li(csvFileInput(id = "HWST4c", label = "Hot Water Supply Temperature")),
                  tags$li(occupancyInput(id='occ4c',"https://cunybpl.shinyapps.io/nobas-occupancy/"))
                ),
                actionButton('trend4cTab','Trend 4c')
              ),
              
              boxPlus(
                title = "Trend Chart 4d: Simultaneous Heating & Cooling",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h1(strong('Trend Chart 4d')),
                h2("Simultaneous Heating & Cooling"),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li(csvFileInput(id ='fant4d', label = 'Supply Fan Status')),
                  tags$li(csvFileInput(id = "HWP4d", label = "Hot Water Pump Status")),
                  tags$li(occupancyInput(id='occ4d',"https://cunybpl.shinyapps.io/nobas-occupancy/"))
                ),
                actionButton('trend4dTab','Trend 4d')
              ),
              
              boxPlus(
                title = "Trend Chart 5a: Economizing Using Temperature or Enthalpy",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h1(strong('Trend Chart 5a')),
                h2("Economizing Using Temperature or Enthalpy"),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li(csvFileInput(id = 'fant5a', label = 'Fan Status')),
                  tags$li(csvFileInput(id = 'OAT5a', label = 'Outside Air Temperature')),
                  tags$li(csvFileInput(id = 'MAT5a', label = 'Mixed Air Temperature')),
                  tags$li(csvFileInput(id = 'RAT5a', label = 'Return Air Temperature')),
                  tags$li(occupancyInput(id='occ5a',"https://cunybpl.shinyapps.io/nobas-occupancy/"))
                ),
                actionButton('trend5aTab','Trend 5a')
              )
            ),
           #second row end
           
           #third row begin
           
           fluidRow(
             width = 12,
             boxPlus(
               title = "Trend Chart 7: DAT Control",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               width = 4,
               h1(strong('Trend Chart 7')),
               h2("DAT Control"),
               h3('Parameters to trend'),
               tags$ul(
                 tags$li(csvFileInput(id = 'fant7', label = 'Fan Status')),
                 tags$li(csvFileInput(id = 'DAT7', label = 'Discharge Air Temperature')),
                 tags$li(csvFileInput(id = 'DATSP7', label = 'Discharge Air Temperature Set Point')),
                 tags$li(occupancyInput(id='occ7',"https://cunybpl.shinyapps.io/nobas-occupancy/"))
               ),
               actionButton('trend7Tab','Trend 7')
             ),
             
             boxPlus(
               width = 4,
               title = "Trend Chart 8a: Compressor Cycling & Staging",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               h1(strong('Trend Chart 8a')),
               h2("Compressor Cycling & Staging"),
               h3('Parameters to trend'),
               tags$ul(
                 tags$li(csvFileInput(id = 'Compressor1-t8a', label = 'Compressor 1 Status')),
                 tags$li(csvFileInput(id = 'Compressor2-t8a', label = 'Compressor 2 Status')),
                 tags$li(occupancyInput(id='occ8a',"https://cunybpl.shinyapps.io/nobas-occupancy/"))
               ),
               actionButton('trend8aTab','Trend 8a')
             ),
             
             boxPlus(
               width = 4,
               title = "Trend Chart 8b: Burner Cycling & Staging",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               h1(strong('Trend Chart 8b')),
               h2("Burner Cycling & Staging"),
               h3('Parameters to trend'),
               tags$ul(
                 tags$li(csvFileInput(id = 'Burner1-t8b', label = 'Burner 1 Status')),
                 tags$li(csvFileInput(id = 'Burner2-t8b', label = 'Burner 2 Status')),
                 tags$li(occupancyInput(id='occ8b',"https://cunybpl.shinyapps.io/nobas-occupancy/"))
               ),
               actionButton('trend8bTab','Trend 8b')
             )
             
           ),
           
           #third row end
           
           #fourth row begin
           
           fluidRow(
             width = 12,
             
             boxPlus(
               title = "Trend Chart 10: Heating/Cooling Mode",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               width = 4,
               h1(strong('Trend Chart 10')),
               h2("Heating/Cooling Mode"),
               h3('Parameters to trend'),
               tags$ul(
                 tags$li(csvFileInput(id ='fant10', label = 'Supply Fan Status')),
                 tags$li(csvFileInput(id = "MAT10", label = "Mixed Air Temperature")),
                 tags$li(csvFileInput(id = "DAT10", label = "Discharge Air Temperature")),
                 tags$li(occupancyInput(id='occ10',"https://cunybpl.shinyapps.io/nobas-occupancy/"))
               ),
               actionButton('trend10Tab','Trend 10')
             )
             
           ),
           
           
           #fourth row end
           
            fluidRow(
              box(
                width = 2,
                actionButton('HTabAHU',"Home")
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
                plottingOutput(id='trend1')
              )
            ),
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h2('Are the fans running during unoccupied hours?'),
                h4('Faults:'),
                boxPlus(
                  title = 'Fans are on during unoccupied hours',
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  width = 12,
                  tags$ul(
                    tags$li("Do they need to be on for any reason, e.g. meeting setbacks? Might have to trend zone temps and setback temps."),
                    tags$li("Are you using outside air for pre-cooling overnight?"),
                    tags$li("Can the amount of time the fan runs during unoccupied periods be reduced?")
                  )
                )
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt1","Previous Page"),
                actionButton("HTabt1","Home")
              )
            )
    ),
    
    #####Trend 2b Plot#####
    tabItem(tabName = "trend2b",
            fluidRow(
              box(title = "Trend 2b: OA Control Using OAD",
                width = 12,
                plottingOutput(id = 'trend2b')
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h2('Is the OAD open during unoccupied times?'),
                h4('Faults:'),
                boxPlus(
                  title = 'OAD is open during unoccupied times.',
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  width = 12,
                  tags$ul(
                    tags$li("Do they need to be open for any reason?"),
                    tags$li("Are there times when OAD can be closed for a few hours?"),
                    tags$li("Do you have the right occupancy schedule?"),
                    tags$li("Is your AHU scheduled according to your occupancy schedule?"),
                    tags$li("Are your dampers closing when your AHU is off?")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 2",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h2('Is the OAD open during startup when conditions are not favorable for economizing?'),
                h4('Faults:'),
                boxPlus(
                  title = 'OAD is open during startup when conditions are not favorable for economizing.',
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  width = 12,
                  tags$ul(
                    tags$li("Do they need to be open for any reason?"),
                    tags$li("If not, can the BAS have controls to keep OAD closed during startup?")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 3",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h2('Are your dampers open more than the minimum position during occupied hours when not economizing?'),
                h4('Faults:'),
                boxPlus(
                  title = 'OAD position is not set to minimum position during occupied hours when conditions are not favorable for economizing.',
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  width = 12,
                  tags$ul(
                    tags$li("Are the zones served by this AHU required to run on 100% outside air?"),
                    tags$li("Does demand control ventilation require more or less OA?")
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
                width = 4,
                h2('Are you over-ventilating? (OAD > 20%)'),
                h4('Faults:'),
                boxPlus(
                  title = 'Overventilation',
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  width = 12,
                  tags$ul(
                    tags$li("Is there any reason that the minimum damper position should be greater than 20% (special CO2 requirement, demand control ventilation)?"),
                    tags$li("Is it working properly?"),
                    tags$li("Check your CO2 in high occupancy load zones. Use Trend Chart 6.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 5",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h2('Are you under-ventilating? (OAD < 10%)'),
                h4('Faults:'),
                boxPlus(
                  title = 'Underventilation',
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  width = 12,
                  tags$ul(
                    tags$li("Is there any reason that the minimum damper position should be less than 10% (special CO2 requirement, demand control ventilation)?"),
                    tags$li("Check your CO2 in high occupancy load zones. Use Trend Chart 6.")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 6",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h2('Are Questions 1, 2, and 3 occurring simultaneously?'),
                h4('Faults:'),
                boxPlus(
                  title = 'Failure to close when commanded',
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  width = 12,
                  tags$ul(
                    tags$li("Is the OAF high when the OAD is at minimum position or closed?"),
                    tags$li("What controls are enabled that could affect the damper position? Do they contradict?")
                  )
                ),
                
                boxPlus(
                  title = 'High Leakage Rate when closed',
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  width = 12,
                  tags$ul(
                    tags$li("Is the OAF high when the OAD is at minimum position or closed?"),
                    tags$li("Is the CO2 concentration similar to when the damper is open, irregardless of occupant load?"),
                    tags$li("What position does the BAS consider fully closed? Does that correlate to the actual position?")
                  )
                )
              )
            ),
            
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt2b","Previous Page"),
                actionButton("HTabt2b","Home")
              )
            )
          ),
    
    ###Trend 3 Plot####
    
    tabItem(tabName = "trend3",
            fluidRow(
              box(title = "Trend 3: Minimum OAD Position",
                width = 12,
                plottingOutput(id = 'trend3')
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h2('Does the maximum CO2 level of densely occupied zones exceed 900 ppm for hours at a time?'),
                h4('Faults:'),
                boxPlus(
                  title = 'The maximum CO2 level of densely occupied zones exceeds 900 ppm for hours at a time',
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  width = 12,
                  tags$ul(
                    tags$li("Is the CO2 sensor calibrated? Is it located in a place that reflects room CO2?"),
                    tags$li("Is there demand control ventilation? Is it working properly?"),
                    tags$li("Can the minimum OAD position be increased?")
                  )
                )
              ),
              
              boxPlus(
                title = "Question 2",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h2('Do CO2 levels of densely occupied zones never exceed 750 ppm?'),
                h4('Faults:'),
                boxPlus(
                  title = 'The minimum OAD position is providing too much fresh air to the zones',
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  width = 12,
                  tags$ul(
                    tags$li("Is the CO2 sensor calibrated? Is it located in a place that reflects room CO2?"),
                    tags$li("Is there demand control ventilation? Is it working properly?"),
                    tags$li("Can the minimum OAD position be decreased?")
                  )
                )
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt3","Previous Page"),
                actionButton("HTabt3","Home")
              )
            )
          ),
    
    
    #####Trend 4c######
    
    tabItem(tabName = "trend4c",
            fluidRow(
              box(title = "Trend 4c: Simultaneous Heating & Cooling",
                  width = 12,
                  plottingOutput(id = 'trend4c')
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h2('Are you economizing with your HCV open?'),
                h4('Faults:'),
                boxPlus(
                  title = 'Simultaneous cooling and heating (When not humidifying)',
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  width = 12,
                  tags$ul(
                    tags$li("Check economizing settings and lockouts. Economizing should be disabled when heating and HCV should  be closed when economizing. Ensure that your Air Handler is not in cooling mode when it shouldn’t be.")
                  )
                )
              )
            ),
            
            
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt4c","Previous Page"),
                actionButton("HTabt4c","Home")
              )
            )
    ),
    
    ####Trend 4d####
    
    tabItem(tabName = "trend4d",
            fluidRow(
              box(title = "Trend 4d: Simultaneous Heating & Cooling",
                  width = 12,
                  plottingOutput(id = 'trend4d')
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h2('Are you economizing with your HCV open?'),
                h4('Faults:'),
                boxPlus(
                  title = 'Simultaneous cooling and heating (When not humidifying)',
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
                  width = 12,
                  tags$ul(
                    tags$li("Check economizing settings and lockouts. Economizing should be disabled when heating and HCV should  be closed when economizing. Ensure that your Air Handler is not in cooling mode when it shouldn’t be.")
                  )
                )
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt4d","Previous Page"),
                actionButton("HTabt4d","Home")
              )
            )
    ),
    
    #####Trend 5a######
    
    tabItem(tabName = "trend5a",
            fluidRow(
              box(title = "Trend 5a: Economizing Using Temperature or Enthalpy",
                  width = 12,
                  plottingOutput(id = 'trend5a')
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h2('Are you in cooling mode?'),
                h4('Faults:'),
                boxPlus(
                  title = 'Not in cooling mode',
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
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
                width = 4,
                h2('Is MAT not between OAT and RAT? (OAF)'),
                h4('Faults:'),
                boxPlus(
                  title = 'MAT is not between OAT and RAT',
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
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
                width = 4,
                h2('Should you be economizing? Are you not?'),
                h4('Faults:'),
                boxPlus(
                  title = 'Economizer not following the sequence of operations',
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
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
                actionButton("Prevtabt5a","Previous Page"),
                actionButton("HTabt5a","Home")
              )
            )
    ),
    
    #######Trend 7#######
    
    tabItem(tabName = "trend7",
            fluidRow(
              box(title = "Trend 7: DAT Control",
                  width = 12,
                  csvFileInput(id = 'fant7', label = 'Fan Status'),
                  csvFileInput(id = 'DAT7', label = 'Discharge Air Temperature'),
                  csvFileInput(id = 'DATSP7', label = 'Discharge Air Temperature Set Point'),
                  occupancyInput(id='occ7',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                  plottingOutput(id = 'trend7')
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h2(' Is the system having trouble meeting the DATSP?'),
                h4('Faults:'),
                boxPlus(
                  title = 'DAT does not meet DATSP',
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
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
                width = 4,
                h2(' Is the DAT hunting/stable?'),
                h4('Faults:'),
                boxPlus(
                  title = 'DAT hunting',
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
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
                width = 4,
                h2('For a dynamic DATSP: Is the DATSP erratic or unstable?'),
                h4('Faults:'),
                boxPlus(
                  title = 'Erratic DATSP',
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
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
                actionButton("Prevtabt7","Previous Page"),
                actionButton("HTabt7","Home")
              )
            )
    ),
    
    #####Trend 8a#####
    
    tabItem(tabName = "trend8a",
            fluidRow(
              box(title = "Trend 8a: Compressor/Burner Cycling & Staging",
                  width = 12,
                  plottingOutput(id = 'trend8a')
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h2('Are the compressors short cycling?'),
                h4('Faults:'),
                boxPlus(
                  title = 'Short cycling',
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
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
                width = 4,
                h2('Are the compressors not staged properly?'),
                h4('Faults:'),
                boxPlus(
                  title = 'Compressors are not staged properly',
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
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
                actionButton("Prevtabt8a","Previous Page"),
                actionButton("HTabt8a","Home")
              )
            )
    ),
    
    #######Trend 8b######
    
    tabItem(tabName = "trend8b",
            fluidRow(
              box(title = "Trend 8b: Burner Cycling & Staging",
                  width = 12,
                  plottingOutput(id = 'trend8b')
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h2('Are the burners short cycling?'),
                h4('Faults:'),
                boxPlus(
                  title = 'Short cycling',
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
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
                width = 4,
                h2('Are the burners not staged properly?'),
                h4('Faults:'),
                boxPlus(
                  title = 'Burners are not staged properly',
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
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
                actionButton("Prevtabt8b","Previous Page"),
                actionButton("HTabt8b","Home")
              )
            )
    ),
    
    
    ######Trend 10######
    
    tabItem(tabName = "trend10",
            fluidRow(
              box(title = "Trend 10: Heating/Cooling Mode",
                  width = 12,
                  plottingOutput(id = 'trend10')
              )
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Question 1",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h2('Is the AHU in cooling or heating mode? '),
                h4('Faults:'),
                boxPlus(
                  title = 'NO FAULTS (expand for details)',
                  collapsed = TRUE,
                  collapsible = TRUE,
                  closable = FALSE,
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
                actionButton("Prevtabt10","Previous Page"),
                actionButton("HTabt10","Home")
              )
            )
            
            
    ),
    
    #Trend 10 Plot End
    ###################################AHU CONTENT END####################
    
    ###################################Chiller Start######################
    #Chiller Home Page Begin
    
    tabItem(tabName = "ChillerPlant",
           fluidRow(
            width = 12,
            
            boxPlus(
              title = "Trend Chart 12",
              collapsed = TRUE,
              collapsible = TRUE,
              closable = FALSE,
              width = 4,
              h1(strong('Trend Chart 12')),
              h2('Chiller Plant Schedule'),
              h3('Parameters to trend'),
              tags$ul(
                tags$li("Occupancy Schedule"),
                tags$li("ChWST"),
                tags$li("Chilled Water Pump Speed")
              ),
              
              actionButton('trend12Tab','Trend 12')
            ),
            
            
            boxPlus(
              title = "Trend Chart 13a",
              collapsed = TRUE,
              collapsible = TRUE,
              closable = FALSE,
              width = 4,
              h1(strong('Trend Chart 13a')),
              h2('Chilled Water Delta T'),
              h3('Parameters to trend'),
              tags$ul(
                tags$li("Occupancy Schedule"),
                tags$li("ChWST"),
                tags$li("ChWRT")
              ),
              
              actionButton('trend13aTab','Trend 13a')
              ),
            
            boxPlus(
              title = "Trend Chart 14a",
              collapsed = TRUE,
              collapsible = TRUE,
              closable = FALSE,
              width = 4,
              h1(strong('Trend Chart 14a')),
              h2('ChWST Reset'),
              h3('Parameters to trend'),
              tags$ul(
                tags$li("Occupancy Schedule"),
                tags$li("ChWST"),
                tags$li("ChWST-SP"),
                tags$li("OAT")
              ),
              h3('Questions to ask'),
              tags$ol(
                tags$li("Does your ChWST-SP not have a reset schedule? What is it based on? (such as OAT, occupancy, maximum cooling coil valve position)"),
                tags$li("Are your maximum CCV positions below 90%?")
              ),
              
              actionButton('trend14aTab','Trend 14a')
            )
            
            ),
           
          fluidRow(
              width = 12,
              boxPlus(
                title = "Trend Chart 15",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h1(strong('Trend Chart 15')),
                h2('Cooling Tower Scheduling'),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li("Occupancy Schedule"),
                  tags$li("CW Pump Status"),
                  tags$li("Cooling Tower Fan Status or Speed")
                ),
                h3('Questions to ask'),
                tags$ol(
                  tags$li("Are the fans on during unoccupied hours?"),
                  tags$li("Are the fans short cycling? (turning on and off in short periods of time)")
                ),
                
                actionButton('trend15Tab','Trend 15')
              )
            ),
          
          fluidRow(
              width = 3,
              box(
                actionButton('HTabCP',"Home")
              )
            )
            
            
    ),
    
    ################CHILLER PLANT PLOTS########################
    #start trend 12
    
    tabItem(tabName = "trend12",
            fluidRow(
              box(
                width = 12,
                csvFileInput(id = 'CHWST12', label = 'Chilled Water Supply Temperature'),
                csvFileInput(id = "CHWP12", label = 'Chilled Water Pump Speed'),
                occupancyInput(id='occ12',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                plottingOutput(id = 'trend12')
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt12","Previous Page"),
                actionButton("HTabt12","Home")
              )
            )
            
    ),
    
    #end trend 12
    
    #start trend 13a
    
    tabItem(tabName = "trend13a",
            fluidRow(
            box(
              width = 12,
              csvFileInput(id = 'CHWST13a', label = 'Chilled Water Supply Temperature'),
              csvFileInput(id = "CHWRT13a", label = 'Chilled Water Return Temperature'),
              occupancyInput(id='occ13a',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
              plottingOutput(id = 'trend13a')
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt13a","Previous Page"),
                actionButton("HTabt13a","Home")
              )
            )
      
    ),
    
    #end trend 13a
    
    #start trend 14a
    
    tabItem(tabName = "trend14a",
            fluidRow(
              box(
                width = 12,
                csvFileInput(id = 'CHWST14a', label = 'Chilled Water Supply Temperature'),
                csvFileInput(id = "CHWSTSP14a", label = 'Chilled Water Supply Temperature Set Point'),
                csvFileInput(id = "OAT14a", label = 'Outside Air Temperature'),
                occupancyInput(id='occ14a',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                plottingOutput(id = 'trend14a')
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt14a","Previous Page"),
                actionButton("HTabt14a","Home")
              )
            )
            
    ),
    
    #end trend 14a
    
    #start trend 15
    
    tabItem(tabName = "trend15",
            fluidRow(
              box(
                width = 12,
                csvFileInput(id = 'CWPS15', label = 'Chilled Water Pump Status'),
                csvFileInput(id = "CTFS15", label = 'Cooling Tower Fan Status'),
                occupancyInput(id='occ15',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                plottingOutput(id = 'trend15')
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt15","Previous Page"),
                actionButton("HTabt15","Home")
              )
            )
            
    ),
    
    #end trend 15
    ##################################Chiller End################
    
    ##################################Boiler Start###################
    tabItem(tabName = "BoilerPlant",
            fluidRow(
              boxPlus(
                title = "Trend Chart 17",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h1(strong('Trend Chart 17')),
                h2('Steam Boiler Condensate Return Temperature'),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li("Occupancy Schedule"),
                  tags$li("Condensate Return Temperature")
                ),
                h3('Questions to ask'),
                tags$ol(
                  tags$li("Is the condensate return temperature too high?")
                ),
                actionButton('trend17Tab',"Trend 17")
              ),
              
              boxPlus(
                title = "Trend Chart 18",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h1(strong('Trend Chart 18')),
                h2('Boiler Plant Scheduling'),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li("Occupancy Schedule"),
                  tags$li("Boiler Status"),
                  tags$li("HWST"),
                  tags$li("HW Pump Status"),
                  tags$li("OAT")
                ),
                h3('Questions to ask'),
                tags$ol(
                  tags$li("Is the boiler not following the occupancy schedule?"),
                  tags$li("Is the boiler running when heating should be locked out? (such as 50℉)")
                ),
                actionButton('trend18Tab',"Trend 18")
              ),
              
              boxPlus(
                title = "Trend Chart 19a",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h1(strong('Trend Chart 19a')),
                h2('Hot Water Temperature Reset'),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li("Occupancy Schedule"),
                  tags$li("Hot Water Supply Temperature"),
                  tags$li("Outside Air Temperature")
                ),
                h3('Questions to ask'),
                tags$ol(
                  tags$li("Is HW reset failing to work properly or not aggressive enough?"),
                  tags$li("Is your average HCV position well below 50%? "),
                  tags$li("Is your maximum HCV position well below 90%? ")
                ),
                actionButton('trend19aTab',"Trend 19a")
              )
            ),
            
            fluidRow(
              width = 12,
              
              boxPlus(
                title = "Trend Chart 20a",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h1(strong('Trend Chart 20a')),
                h2('Hot Water Loop: Delta T'),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li("Occupancy Schedule"),
                  tags$li("Hot Water Supply Temperature"),
                  tags$li("Hot Water Return Temperature")
                ),
                h3('Questions to ask'),
                tags$ol(
                  tags$li("Is HW reset failing to work properly or not aggressive enough?"),
                  tags$li("Is your average HCV position well below 50%? "),
                  tags$li("Is your maximum HCV position well below 90%? ")
                ),
                actionButton('trend20aTab',"Trend 20a")
              ),
              
              boxPlus(
                title = "Trend Chart 21",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h1(strong('Trend Chart 21')),
                h2('Condensing Boiler Efficiency'),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li("Occupancy Schedule"),
                  tags$li("How Water Return Temperature")
                ),
                h3('Questions to ask'),
                tags$ol(
                  tags$li("Is HW reset failing to work properly or not aggressive enough?"),
                  tags$li("Is your average HCV position well below 50%? "),
                  tags$li("Is your maximum HCV position well below 90%? ")
                ),
                actionButton('trend21Tab',"Trend 21")
              ),
              
              boxPlus(
                title = "Trend Chart 22",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h1(strong('Trend Chart 22')),
                h2('Boiler Cycling & Staging'),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li("Occupancy Schedule"),
                  tags$li("Burner Motor Status"),
                  tags$li("Stack Temperature")
                ),
                h3('Questions to ask'),
                tags$ol(
                  tags$li("Is HW reset failing to work properly or not aggressive enough?"),
                  tags$li("Is your average HCV position well below 50%? "),
                  tags$li("Is your maximum HCV position well below 90%? ")
                ),
                actionButton('trend22Tab',"Trend 22")
              )
              
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Trend Chart 23",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h1(strong('Trend Chart 23')),
                h2('Hot Water Temperature Hunting'),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li("Occupancy Schedule"),
                  tags$li("Hot Water Supply Temperature"),
                  tags$li("How Water Supply Temperature Set Point")
                ),
                h3('Questions to ask'),
                tags$ol(
                  tags$li("Is HW reset failing to work properly or not aggressive enough?"),
                  tags$li("Is your average HCV position well below 50%? "),
                  tags$li("Is your maximum HCV position well below 90%? ")
                ),
                actionButton('trend23Tab',"Trend 23")
              )
            ),
            
            fluidRow(
              width = 3,
              box(
                actionButton('HTabBP',"Home")
              )
            )
            
    ),
    #end boiler tab
    
    #########START BOILER PLOT#####################
    
    
    #start of trend 17
    
    tabItem(tabName = "trend17",
            fluidRow(
              box(
                width = 12,
                csvFileInput(id = 'CRT17', label = "Condensate Return Temperature"),
                occupancyInput(id='occ17',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                plottingOutput(id = 'trend17')
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt17","Previous Page"),
                actionButton("HTabt17","Home")
              )
            )
            
    ),
    
    #end of trend 17
    
    #start of trend 18
    
    tabItem(tabName = "trend18",
            fluidRow(
              box(
                width = 12,
                csvFileInput(id = 'BS18', label = "Boiler Status"),
                csvFileInput(id = 'HWST18', label = "Hot Water Supply Temperature"),
                csvFileInput(id = 'HWPS18', label = "Hot Water Pump Status"),
                csvFileInput(id = "OAT18", label = "Outside Air Temperature"),
                occupancyInput(id='occ18',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                plottingOutput(id = 'trend18')
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt18","Previous Page"),
                actionButton("HTabt18","Home")
              )
            )
            
    ),
    
    #end of trend 18
    
    #start of trend 19a
    tabItem(tabName = "trend19a",
            fluidRow(
              box(
                width = 12,
                csvFileInput(id = 'HWST19a', label = "Hot Water Supply Temperature"),
                csvFileInput(id = "OAT19a", label = "Outside Air Temperature"),
                occupancyInput(id='occ19a',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                plottingOutput(id = 'trend19a')
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt19a","Previous Page"),
                actionButton("HTabt19a","Home")
              )
            )
      
    ),
    
    #end of trend 19a
    
    #start of trend 20a
    
    tabItem(tabName = "trend20a",
            fluidRow(
              box(
                width = 12,
                csvFileInput(id = 'HWST20a', label = "Hot Water Supply Temperature"),
                csvFileInput(id = "HWRT20a", label = "Hot Water Return Temperature"),
                occupancyInput(id='occ20a',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                plottingOutput(id = 'trend20a')
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt20a","Previous Page"),
                actionButton("HTabt20a","Home")
              )
            )
            
    ),
    
    #end of trend 20a
    
    #start of trend 21
    
    tabItem(tabName = "trend21",
            fluidRow(
              box(
                width = 12,
                csvFileInput(id = "HWRT21", label = "Hot Water Return Temperature"),
                occupancyInput(id='occ21',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                plottingOutput(id = 'trend21')
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt21","Previous Page"),
                actionButton("HTabt21","Home")
              )
            )
            
    ),
    
    
    #end of trend 21
    
    #start of trend 22
    tabItem(tabName = "trend22",
            fluidRow(
              box(
                width = 12,
                csvFileInput(id = "BMS22", label = "Burner Motor Status"),
                csvFileInput(id = "STACK22", label = "Stack Temperature"),
                occupancyInput(id='occ22',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                plottingOutput(id = 'trend22')
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt22","Previous Page"),
                actionButton("HTabt22","Home")
              )
            )
            
    ),
    #end of trend 22
   
    
    #start of trend 23
    
    tabItem(tabName = "trend23",
            fluidRow(
              box(
                width = 12,
                csvFileInput(id = "HWST23", label = "Hot Water Supply Temperature"),
                csvFileInput(id = "HWSTSP23", label = "Hot Water Supply Temperature Set Point"),
                occupancyInput(id='occ23',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                plottingOutput(id = 'trend23')
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt23","Previous Page"),
                actionButton("HTabt23","Home")
              )
            )
            
    ),
    
    #end of trend 23
    
    #######END OF BOILER#################
    
    #######START OF ZONE##############
    
    tabItem(tabName = "Zone",
            fluidRow(
              box(
                width = 4,
                h1(strong('Trend Chart 26')),
                h2('Zone Temperature Setpoint'),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li("Occupancy Schedule"),
                  tags$li("Zone Temperatures"),
                  tags$li("Zone Temperature Setpoints"),
                  tags$li("Zone Temperature Setback Setpoints")
                ),
                h3('Questions to ask'),
                tags$ol(
                  tags$li("Is the Zone Temperature not meeting its Zone Temperature Set-point?"),
                  tags$li("Is the deadband not wide enough (below 5℉), allowing alternating heating and cooling to occur?"),
                  tags$li("Is the zone temperature not floating toward the setback temperature during unoccupied times?")
                ),
                actionButton('trend26Tab',"Trend 26")
              )
            ),
            actionButton('HTabZ',"Home")
    ),
    
    tabItem(tabName = "trend26",
            fluidRow(
              box(
                width = 12,
                csvFileInput(id = 'ZT26', label = "Zone Temperature"),
                csvFileInput(id = 'ZTSP26', label = 'Zone Temperature Setpoint'),
                csvFileInput(id = 'ZTSBSP26', label = 'Zone Temperature Setpoint'),
                occupancyInput(id='occ26',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                plottingOutput(id = 'trend26')
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt26","Previous Page"),
                actionButton("HTabt26","Home")
              )
            )
          ),
    
    
    ########END OF ZONE#############
     
    ############START OF PERIMETER TAB######### 
    
     tabItem(tabName = "Perimeter",
            fluidRow(
              width = 12,
              boxPlus(
                title = "Trend Chart 27-37a",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h1(strong('Trend Chart 27-37a')),
                h2('Plotting the "a" Trend Chart For Each Trend'),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li("Occupancy Schedule"),
                  tags$li("Heating Status"),
                  tags$li(tags$ul(
                    tags$li("Burner Status"),
                    tags$li("Boiler Status/HWST"),
                    tags$li("MAT and DAT"),
                    tags$li("HCV Position")
                  ))
                ),
                actionButton('trend2737aTab',"Trend 27-37a")
              ),
              boxPlus(
                title = "Trend Chart 27b",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h1(strong('Trend Chart 27b')),
                h2('Constant Volume Air System With a Heating Coil or Burner'),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li("Occupancy Schedule"),
                  tags$li("Discharge Air Temperature"),
                  tags$li("Zone Temperature"),
                  tags$li("Zone Temperature Setpoint (Air System)"),
                  tags$li("Supply Fan Status")
                ),
                h3('Questions to ask'),
                tags$ol(
                  tags$li("Is the system failing to meet the ZTSP-A?"),
                  tags$li("Are there frequent HCV fluctuations or is there burner cycling?"),
                  tags$li("Is the supply fan on during unoccupied times?"),
                  tags$li("If there are nighttime setbacks, are both systems running at night?")
                ),
                actionButton('trend27bTab',"Trend 27b")
              ),
              boxPlus(
                title = "Trend Chart 28b",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h1(strong('Trend Chart 28b')),
                h2('VAV without Reheats'),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li("Occupancy Schedule"),
                  tags$li("Discharge Air Temperature"),
                  tags$li("Discharge Air Temperature Set Point"),
                  tags$li("Zone Temperature"),
                  tags$li("Zone Temperature Setpoint"),
                  tags$li("Supply Fan Status")
                ),
                h3('Questions to ask'),
                tags$ol(
                  tags$li("Is the system failing to meet the ZTSP-A?"),
                  tags$li("Are there frequent HCV fluctuations or is there burner cycling?"),
                  tags$li("Is the supply fan on during unoccupied times?"),
                  tags$li("If there are nighttime setbacks, are both systems running at night?")
                ),
                actionButton('trend28bTab',"Trend 28b")
              )
              
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Trend Chart 29b",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h1(strong('Trend Chart 29b')),
                h2('VAV with Reheats'),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li("Occupancy Schedule"),
                  tags$li("Discharge Air Temperature"),
                  tags$li("Discharge Air Temperature Setpoint"),
                  tags$li("Zone Temperature Setpoint"),
                  tags$li("Supply Fan Status")
                ),
                h3('Questions to ask'),
                tags$ol(
                  tags$li("Is the system failing to meet the ZTSP-A?"),
                  tags$li("Are there frequent HCV fluctuations or is there burner cycling?"),
                  tags$li("Is the supply fan on during unoccupied times?"),
                  tags$li("If there are nighttime setbacks, are both systems running at night?")
                ),
                actionButton('trend29bTab',"Trend 29b")
              ),
              boxPlus(
                title = "Trend Chart 30b",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h1(strong('Trend Chart 30b')),
                h2('DAT Modulates Based on RAT'),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li("Occupancy Schedule"),
                  tags$li("Discharge Air Temperature"),
                  tags$li("Zone Temperature"),
                  tags$li("Zone Temperature Setpoint (Air System)"),
                  tags$li("Supply Fan Status")
                ),
                h3('Questions to ask'),
                tags$ol(
                  tags$li("Is the system failing to meet the ZTSP-A?"),
                  tags$li("Are there frequent HCV fluctuations or is there burner cycling?"),
                  tags$li("Is the supply fan on during unoccupied times?"),
                  tags$li("If there are nighttime setbacks, are both systems running at night?")
                ),
                actionButton('trend30bTab',"Trend 30b")
              ),
              boxPlus(
                title = "Trend Chart 31b",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h1(strong('Trend Chart 31b')),
                h2('Constant Volume Air System with a DATSP'),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li("Occupancy Schedule"),
                  tags$li("Discharge Air Temperature"),
                  tags$li("Discharge Air Temperature Setpoint"),
                  tags$li("Zone Temperature Setpoint"),
                  tags$li("Supply Fan Status")
                ),
                h3('Questions to ask'),
                tags$ol(
                  tags$li("Is the system failing to meet the ZTSP-A?"),
                  tags$li("Are there frequent HCV fluctuations or is there burner cycling?"),
                  tags$li("Is the supply fan on during unoccupied times?"),
                  tags$li("If there are nighttime setbacks, are both systems running at night?")
                ),
                actionButton('trend31bTab',"Trend 31b")
              )
              
            ),
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Trend Chart 32b",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h1(strong('Trend Chart 32b')),
                h2('Constant Volume Air System with a DATSP'),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li("Occupancy Schedule"),
                  tags$li("Discharge Air Temperature"),
                  tags$li("Discharge Air Temperature Set Point"),
                  tags$li("Zone Temperature"),
                  tags$li("Zone Temperature Setpoint"),
                  tags$li("Supply Fan Status")
                ),
                h3('Questions to ask'),
                tags$ol(
                  tags$li("Is the system failing to meet the ZTSP-A?"),
                  tags$li("Are there frequent HCV fluctuations or is there burner cycling?"),
                  tags$li("Is the supply fan on during unoccupied times?"),
                  tags$li("If there are nighttime setbacks, are both systems running at night?")
                ),
                actionButton('trend32bTab',"Trend 32b")
              ),
              boxPlus(
                title = "Trend Chart 33b",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h1(strong('Trend Chart 33b')),
                h2('CONSTANT VOLUME ON/OFF AIR SYSTEM WITH A HEATING COIL OR BURNER'),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li("Occupancy Schedule"),
                  tags$li("Zone Temperature"),
                  tags$li("Zone Temperature Setpoint (Perimeter)"),
                  tags$li("Zone Temperature Setpoint (Air System)"),
                  tags$li("Supply Fan Status"),
                  tags$li("Discharge Air Temperature")
                ),
                h3('Questions to ask'),
                tags$ol(
                  tags$li("Is the system failing to meet the ZTSP-A?"),
                  tags$li("Are there frequent HCV fluctuations or is there burner cycling?"),
                  tags$li("Is the supply fan on during unoccupied times?"),
                  tags$li("If there are nighttime setbacks, are both systems running at night?")
                ),
                actionButton('trend33bTab',"Trend 33b")
              ),
              boxPlus(
                title = "Trend Chart 34b",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h1(strong('Trend Chart 34b')),
                h2('VAV without Reheats'),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li("Occupancy Schedule"),
                  tags$li("Discharge Air Temperature"),
                  tags$li("Discharge Air Temperature Setpoint"),
                  tags$li("Zone Temperature Setpoint"),
                  tags$li("Supply Fan Status")
                ),
                h3('Questions to ask'),
                tags$ol(
                  tags$li("Is the system failing to meet the ZTSP-A?"),
                  tags$li("Are there frequent HCV fluctuations or is there burner cycling?"),
                  tags$li("Is the supply fan on during unoccupied times?"),
                  tags$li("If there are nighttime setbacks, are both systems running at night?")
                ),
                actionButton('trend34bTab',"Trend 34b")
              )
              
              
            ),
            
            
            fluidRow(
              width = 12,
              boxPlus(
                title = "Trend Chart 36b",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h1(strong('Trend Chart 36b')),
                h2('DAT based on RAT'),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li("Occupancy Schedule"),
                  tags$li("Discharge Air Temperature"),
                  tags$li("Discharge Air Temperature Setpoint"),
                  tags$li("Zone Temperature Setpoint"),
                  tags$li("Supply Fan Status")
                ),
                h3('Questions to ask'),
                tags$ol(
                  tags$li("Is the system failing to meet the ZTSP-A?"),
                  tags$li("Are there frequent HCV fluctuations or is there burner cycling?"),
                  tags$li("Is the supply fan on during unoccupied times?"),
                  tags$li("If there are nighttime setbacks, are both systems running at night?")
                ),
                actionButton('trend36bTab',"Trend 36b")
              ),
              
              boxPlus(
                title = "Trend Chart 37b",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                width = 4,
                h1(strong('Trend Chart 37b')),
                h2('Constant Volume Air System Based on DAT'),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li("Occupancy Schedule"),
                  tags$li("Discharge Air Temperature"),
                  tags$li("Discharge Air Temperature Set Point"),
                  tags$li("Zone Temperature"),
                  tags$li("Zone Temperature Setpoint"),
                  tags$li("Supply Fan Status")
                ),
                h3('Questions to ask'),
                tags$ol(
                  tags$li("Is the system failing to meet the ZTSP-A?"),
                  tags$li("Are there frequent HCV fluctuations or is there burner cycling?"),
                  tags$li("Is the supply fan on during unoccupied times?"),
                  tags$li("If there are nighttime setbacks, are both systems running at night?")
                ),
                actionButton('trend37bTab',"Trend 37b")
              )
            ),
            
            fluidRow(
              width = 3,
              box(
                actionButton('HTabP',"Home")
              )
            )
            
    ),
    #################Start OF PERIMETER Plot##################
    
    tabItem(tabName = "trend2737a",
            fluidRow(
              box(
                width = 12,
                csvFileInput(id = 'Burner-t2737a', label = 'Burner Status'),
                csvFileInput(id = 'Boiler-t2737a', label = 'Boiler Status'),
                csvFileInput(id = 'HWST2737a', label = "Hot Water Supply Temperature"),
                csvFileInput(id = 'MAT2737a', label = "Mixed Air Temperature"),
                csvFileInput(id = 'DAT2737a', label = 'Discharge Air Temperature'),
                csvFileInput(id = 'HCV2737a', label = "Heating Coil Valve Position"),
                occupancyInput(id='occ2737a',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                plottingOutput(id = 'trend2737a')
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt2737a","Previous Page"),
                actionButton("HTabt2737a","Home")
              )
            )
            
    ),
    
    tabItem(tabName = "trend27b",
            fluidRow(
              box(
                width = 12,
                csvFileInput(id = 'DAT27b', label = 'Discharge Air Temperature'),
                csvFileInput(id = 'ZT27b', label = "Zone Temperature"),
                csvFileInput(id = 'ZTSP-A27b',label = 'Zone Temperature Setpoint (Air System)'),
                csvFileInput(id = 'fant27b',label = 'Fan Status'),
                occupancyInput(id='occ27b',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                plottingOutput(id = 'trend27b')
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt27b","Previous Page"),
                actionButton("HTabt27b","Home")
              )
            )
          ),
    tabItem(tabName = "trend28b",
            fluidRow(
              box(
                width = 12,
                csvFileInput(id = 'DAT28b', label = 'Discharge Air Temperature'),
                csvFileInput(id = 'DATSP28b', label = 'Discharge Air Temperature Setpoint'),
                csvFileInput(id = 'ZT28b', label = "Zone Temperature"),
                csvFileInput(id = 'ZTSP-A28b',label = 'Zone Temperature Setpoint (Air System)'),
                csvFileInput(id = 'fant28b',label = 'Fan Status'),
                occupancyInput(id='occ28b',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                plottingOutput(id = 'trend28b')
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt28b","Previous Page"),
                actionButton("HTabt28b","Home")
              )
            )
        ),
    tabItem(tabName = "trend29b",
            fluidRow(
              box(
                width = 12,
                csvFileInput(id = 'DAT29b', label = 'Discharge Air Temperature'),
                csvFileInput(id = 'DATSP29b', label = 'Discharge Air Temperature Setpoint'),
                csvFileInput(id = 'ZTSP-A29b',label = 'Zone Temperature Setpoint (Air System)'),
                csvFileInput(id = 'fant29b',label = 'Fan Status'),
                occupancyInput(id='occ29b',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                plottingOutput(id = 'trend29b')
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt29b","Previous Page"),
                actionButton("HTabt29b","Home")
              )
            )
    ),
    tabItem(tabName = "trend30b",
            fluidRow(
              box(
                width = 12,
                csvFileInput(id = 'RATSP30b', label = 'Return Air Temperature Setpoint'),
                csvFileInput(id = 'RAT30b', label = 'Return Air Temperature'),
                csvFileInput(id = 'DAT30b', label = 'Discharge Air Temperature'),
                csvFileInput(id = 'ZT30b', label = "Zone Temperature"),
                csvFileInput(id = 'fant30b',label = 'Fan Status'),
                occupancyInput(id='occ30b',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                plottingOutput(id = 'trend30b')
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt30b","Previous Page"),
                actionButton("HTabt30b","Home")
              )
            )
            
    ),
    
    
    
    tabItem(tabName = "trend31b",
            fluidRow(
              box(
                width = 12,
                csvFileInput(id = 'DAT31b', label = 'Discharge Air Temperature'),
                csvFileInput(id = 'DATSP31b', label = 'Discharge Air Temperature Setpoint'),
                csvFileInput(id = 'ZT31b',label = 'Zone Temperature'),
                csvFileInput(id = 'RAT31b',label = 'Return Air Temperature'),
                occupancyInput(id='occ31b',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                plottingOutput(id = 'trend31b')
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt31b","Previous Page"),
                actionButton("HTabt31b","Home")
              )
            )
      ),
    
    tabItem(tabName = "trend32b",
            fluidRow(
              box(
                width = 12,
                csvFileInput(id = 'HWST32b', label = 'Perimeter Hot Water Supply Temperature'),
                csvFileInput(id = 'HWRT32b', label = 'Perimeter Hot Water Return Temperature'),
                csvFileInput(id = 'ZT32b',label = 'Zone Temperature'),
                occupancyInput(id='occ32b',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                plottingOutput(id = 'trend32b')
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt32b","Previous Page"),
                actionButton("HTabt32b","Home")
              )
            )
    ),
    
    tabItem(tabName = "trend33b",
            fluidRow(
              box(
                width = 12,
                csvFileInput(id = 'ZT33b',label = 'Zone Temperature'),
                csvFileInput(id = 'ZTSP-P33b', label = 'Zone Temperature Setpoint (Perimeter)'),
                csvFileInput(id = 'ZTSP-A33b', label = 'Zone Temperature Setpoint (Air System)'),
                csvFileInput(id = 'fant33b',label = 'Fan Status'),
                occupancyInput(id='occ33b',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                csvFileInput(id = 'DAT33b', label = 'Discharge Air Temperature'),
                plottingOutput(id = 'trend33b')
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt33b","Previous Page"),
                actionButton("HTabt33b","Home")
              )
            )
    ),
    
    tabItem(tabName = "trend34b",
            fluidRow(
              box(
                width = 12,
                csvFileInput(id = 'DAT34b', label = 'Discharge Air Temperature'),
                csvFileInput(id = 'DATSP34b', label = 'Discharge Air Temperature Setpoint'),
                csvFileInput(id = 'ZT34b',label = 'Zone Temperature'),
                csvFileInput(id = 'ZTSP-P34b', label = 'Zone Temperature Setpoint (Perimeter)'),
                csvFileInput(id = 'ZTSP-A34b', label = 'Zone Temperature Setpoint (Air System)'),
                csvFileInput(id = 'fant34b',label = 'Fan Status'),
                occupancyInput(id='occ34b',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                plottingOutput(id = 'trend34b')
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt34b","Previous Page"),
                actionButton("HTabt34b","Home")
              )
            )
    ),
    
    tabItem(tabName = "trend36b",
            fluidRow(
              box(
                width = 12,
                csvFileInput(id = 'RATSP36b', label = 'Return Air Temperature Setpoint'),
                csvFileInput(id = 'RAT36b', label = 'Return Air Temperature'),
                csvFileInput(id = 'DAT36b', label = 'Discharge Air Temperature'),
                csvFileInput(id = 'ZT36b', label = 'Zone Temperature'),
                csvFileInput(id = 'ZTSP-P36b', label = 'Zone Temperature Setpoint (Perimeter)'),
                csvFileInput(id = 'fant36b',label = 'Fan Status'),
                occupancyInput(id='occ36b',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                plottingOutput(id = 'trend36b')
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt36b","Previous Page"),
                actionButton("HTabt36b","Home")
              )
            )
    ),
    
    tabItem(tabName = "trend37b",
            fluidRow(
              box(
                width = 12,
                csvFileInput(id = 'DAT37b', label = 'Discharge Air Temperature'),
                csvFileInput(id = 'DATSP37b', label = 'Discharge Air Temperature Set Point'),
                csvFileInput(id = 'ZT37b', label = 'Zone Temperature'),
                csvFileInput(id = 'ZTSP-P37b', label = 'Zone Temperature Setpoint (Perimeter)'),
                csvFileInput(id = 'RAT37b', label = 'Return Air Temperature'),
                occupancyInput(id='occ37b',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                plottingOutput(id = 'trend37b')
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt37b","Previous Page"),
                actionButton("HTabt37b","Home")
              )
            )
    )
    #######################END OF PERIMETER PLOT###########
  )
)
