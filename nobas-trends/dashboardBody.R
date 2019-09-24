body <- dashboardBody(
  tabItems(
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
              box(
                #should b called perimeter and air
                title = "Perimeter and Air Charts",
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
              title = "AHU Trend Graphs",
              id = "AHUTrends",
              
              tabBox(
                width = 12,
                tabPanel('Trend 1',
                         csvFileInput(id='fanstat-t1',label='Fan Status'),
                         occupancyInput(id='occ1',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                         plottingOutput(id='trend1')
                ),
                tabPanel('Trend 2b',
                         csvFileInput(id = 'fanstat-t2b', label = 'Fan Status'),
                         csvFileInput(id = 'OAT2b', label = 'Outside Air Temperature'),
                         csvFileInput(id = 'MAT2b', label = 'Mixed Air Temperature'),
                         csvFileInput(id = 'RAT2b', label = 'Return Air Temperature'),
                         occupancyInput(id='occ2b',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                         plottingOutput(id = 'trend2b')
                         
                ),
                tabPanel('Trend 3',
                         csvFileInput(id ='OAD3', label = 'OAD Position'),
                         csvFileInput(id = "CO2-3", label = "CO2 Level"),
                         occupancyInput(id='occ3',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                         plottingOutput(id = 'trend3')
                  
                )
              )
            ),
            actionButton('HTab',"Home")
          ),
    
    tabItem(tabName = "ChillerPlant",
            fluidRow(
              title = 'Chiller Plant Trends',
              id = 'CHPTrends',
              tabBox(
                width = 12,
                tabPanel('Trend 13a',
                         csvFileInput(id = 'CHWST13a', label = 'Chilled Water Supply Temperature'),
                         csvFileInput(id = "CHWRT13a", label = 'Chilled Water Return Temperature'),
                         occupancyInput(id='occ13a',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                         plottingOutput(id = 'trend13a')
                         
                )
              )
            ),
            actionButton('HTab2',"Home")
    ),
    tabItem(tabName = "BoilerPlant",
            fluidRow(
              title = "Boiler Plant Trends",
              id = "BPTrends",
              tabBox(
                width = 12,
                tabPanel('Trend 19a',
                         csvFileInput(id = 'HWST19a', label = "Hot Water Supply Temperature"),
                         csvFileInput(id = "OAT19a", label = "Outside Air Temperature"),
                         occupancyInput(id='occ19a',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                         plottingOutput(id = 'trend19a')
                  
                )
              )
            ),
            actionButton('HTab3',"Home")
    ),
    tabItem(tabName = "Zone",
            fluidRow(
              title = "Zone",
              id = "ZTrends",
              tabBox(
                width = 12,
                tabPanel('Trend 26',
                         csvFileInput(id = 'ZT26', label = "Zone Temperature"),
                         csvFileInput(id = 'ZTsp26', label = 'Zone Temperature Setpoint'),
                         csvFileInput(id = 'ZTsbsp26', label = 'Zone Temperature Setpoint'),
                         occupancyInput(id='occ26',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                         plottingOutput(id = 'trend26')
                  
                )
              )
            ),
            actionButton('HTab4',"Home")
    ),
    tabItem(tabName = "Perimeter",
            fluidRow(
              title = "Perimeter",
              id = "PTrends",
              tabBox(
                width = 12,
                tabPanel('Trend 27',
                         csvFileInput(id = 'DAT27', label = 'Discharge Air Temperature'),
                         csvFileInput(id = 'ZT27', label = "Zone Temperature"),
                         csvFileInput(id = 'ZTsp-a27',label = 'Zone Temperature Setpoint'),
                         csvFileInput(id = 'fanstat-t27',label = 'Fan Status'),
                         occupancyInput(id='occ27',"https://cunybpl.shinyapps.io/nobas-occupancy/"),
                         plottingOutput(id = 'trend27')
                  
                )
              )
            ),
            actionButton('HTab5',"Home")
    )
      
  )
)
