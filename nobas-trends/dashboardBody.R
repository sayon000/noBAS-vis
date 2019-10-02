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
    
    # AHU Tab Content
    tabItem(tabName = 'AHU',
            fluidRow(
              width = 12,
              
              box(
                width = 4,
                h1(strong('Trend Chart 1')),
                h2('Fan Schedule'),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li("Occupancy Schedule"),
                  tags$li("Supply Fan Status")
                ),
                h3('Question to ask'),
                tags$ol(
                  tags$li("Are the fans running during unoccupied hours?")
                ),
                actionButton('trend1Tab',"Trend 1")
              ),
              
              box(
                width = 4,
                h1(strong('Trend Chart 2b')),
                h2('OA Control Using OAD'),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li("Occupancy Schedule"),
                  tags$li("Supply Fan Status"),
                  tags$li("OAT"),
                  tags$li("MAT"),
                  tags$li("RAT")
                ),
                h3('Questions to ask'),
                tags$ol(
                  tags$li("Is the OAD open during unoccupied times? "),
                  tags$li("Is the OAD open during startup when conditions are not favorable for economizing?"),
                  tags$li("Are your dampers open more than the minimum position during occupied hours when not economizing?"),
                  tags$li("Are you over-ventilating? (OAD > 20%)"),
                  tags$li("Are you under-ventilating? (OAD < 10%)")
                ),
                actionButton('trend2bTab','Trend 2b')
              ),
              
              box(
                width = 4,
                h1(strong('Trend Chart 3')),
                h2("Minimum OAD Position"),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li("Occupancy Schedule"),
                  tags$li("OAD Position"),
                  tags$li("CO2 Level")
                ),
                h3('Question to ask'),
                tags$ol(
                  tags$li("Does the maximum CO2 level of densely occupied zones exceed 900 ppm for hours at a time?"),
                  tags$li("Do CO2 levels of densely occupied zones never exceed 750 ppm?")
                ),
                actionButton('trend3Tab','Trend 3')
              )
            ),
            
            fluidRow(
              width = 12,
              box(
                width = 4,
                
              )
            ),
            
            fluidRow(
              box(
                width = 2,
                actionButton('HTabAHU',"Home")
              )
            )
            
    ),
    
    #Trend 1 Plot Begin
    tabItem(tabName = "trend1",
            fluidRow(
              box(title = "Trend 1: Fan Status",
                width = 12,
                csvFileInput(id='fanstat-t1',label='Fan Status'),
                occupancyInput(id='occ1',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                plottingOutput(id='trend1')
              )
            ),
            fluidRow(
              box(
                width = 3,
                h3('Question to ask'),
                tags$ul(
                  tags$li("Are the fans running during unoccupied hours?")
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
    #Trend 1 Plot End
    
    #Trend 2b Plot Begin
    tabItem(tabName = "trend2b",
            fluidRow(
              box(title = "Trend 2b: OA Control Using OAD",
                width = 12,
                csvFileInput(id = 'fanstat-t2b', label = 'Fan Status'),
                csvFileInput(id = 'OAT2b', label = 'Outside Air Temperature'),
                csvFileInput(id = 'MAT2b', label = 'Mixed Air Temperature'),
                csvFileInput(id = 'RAT2b', label = 'Return Air Temperature'),
                occupancyInput(id='occ2b',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                plottingOutput(id = 'trend2b')
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
    
    #Trend 2b Plot End
    
    #Trend 3 Plot End
    
    tabItem(tabName = "trend3",
            fluidRow(
              box(title = "Trend 3: Minimum OAD Position",
                width = 12,
                csvFileInput(id ='OAD3', label = 'OAD Position'),
                csvFileInput(id = "CO2-3", label = "CO2 Level"),
                occupancyInput(id='occ3',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                plottingOutput(id = 'trend3')
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
    
    #Trend 3 Plot End
    
    #Chiller Home Page Begin
    
    tabItem(tabName = "ChillerPlant",
           fluidRow(
            width = 12,
            box(
              width = 4,
              h1(strong('Trend Chart 13a')),
              h2('Chilled Water Delta T'),
              h3('Parameters to trend'),
              tags$ul(
                tags$li("Occupancy Schedule"),
                tags$li("Chilled Water Supply Temperature"),
                tags$li("Chilled Water Return Temperature")
              ),
              h3('Questions to ask'),
              tags$ol(
                tags$li("Is my Delta-T (ChWST and ChWRT differential) too small?"),
                tags$li("LDP not properly maintained by modulating pump speed?"),
                tags$li("Does pump speed not vary?")
              ),
              
              actionButton('trend13aTab','Trend 13a')
              )
            ),
            
           fluidRow(
              width = 3,
              box(
                actionButton('HTabCP',"Home")
              )
            )
            
            
    ),
    
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
    
    tabItem(tabName = "BoilerPlant",
            fluidRow(
              box(
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
              width = 3,
              box(
                actionButton('HTabBP',"Home")
              )
            )
            
    ),
    
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
                csvFileInput(id = 'ZTsp26', label = 'Zone Temperature Setpoint'),
                csvFileInput(id = 'ZTsbsp26', label = 'Zone Temperature Setpoint'),
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
     #START OF PERIMETER TAB   
     tabItem(tabName = "Perimeter",
            fluidRow(
              box(
                width = 4,
                h1(strong('Trend Chart 27')),
                h2('Constant Volume Air System With a Heating Coil or Burner'),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li("Occupancy Schedule"),
                  tags$li("Discharge Air Temperature"),
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
                actionButton('trend27Tab',"Trend 27")
              )
            ),
            fluidRow(
              width = 3,
              box(
                actionButton('HTabP',"Home")
              )
            )
            
    ),
    #END OF PERIMETER TAB
    
    tabItem(tabName = "trend27",
            fluidRow(
              box(
                width = 12,
                csvFileInput(id = 'DAT27', label = 'Discharge Air Temperature'),
                csvFileInput(id = 'ZT27', label = "Zone Temperature"),
                csvFileInput(id = 'ZTsp-a27',label = 'Zone Temperature Setpoint'),
                csvFileInput(id = 'fanstat-t27',label = 'Fan Status'),
                occupancyInput(id='occ27',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                plottingOutput(id = 'trend27')
              )
            ),
            
            fluidRow(
              box(
                width = 3,
                actionButton("Prevtabt27","Previous Page"),
                actionButton("HTabt27","Home")
              )
            )
          )
      
  )
)
