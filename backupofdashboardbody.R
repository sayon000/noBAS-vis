fluidRow(
              width = 12,

            box(
                title = "Trend Chart 1: Fan Schedule",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                background = 'navy',
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

            box(
              title = "Trend Chart 2a: OA Control Using OAD",
              collapsed = TRUE,
              collapsible = TRUE,
              closable = FALSE,
              solidHeader = TRUE,
              background = 'navy',
              width = 4,
              h1(strong('Trend Chart 2a')),
              h2('OA Control Using OAD'),
              h3('Parameters to trend'),
              tags$ul(
                tags$li(csvFileInput(id = 'fant2a', label = 'Fan Status')),
                tags$li(csvFileInput(id = 'OAD2a', label = 'Outside Air Damper Position (OAD)')),
                tags$li(occupancyInput(id='occ2a',"https://cunybpl.shinyapps.io/nobas-occupancy/"))
              ),
              actionButton('trend2aTab','Trend 2a')
            ),


              box(
                title = "Trend Chart 2b: OA Control Using OAF",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                background = 'navy',
                width = 4,
                h1(strong('Trend Chart 2b')),
                h2('OA Control Using OAF'),
                h3('Parameters to trend'),
                tags$ul(
                  tags$li(csvFileInput(id = 'fant2b', label = 'Fan Status')),
                  tags$li(csvFileInput(id = 'OAT2b', label = 'Outside Air Temperature (OAT)')),
                  tags$li(csvFileInput(id = 'MAT2b', label = 'Mixed Air Temperature (MAT)')),
                  tags$li(csvFileInput(id = 'RAT2b', label = 'Return Air Temperature (RAT)')),
                  tags$li(occupancyInput(id='occ2b',"https://cunybpl.shinyapps.io/nobas-occupancy/"))
                ),
                actionButton('trend2bTab','Trend 2b')
              )


            ),
            #first row end

            #second row begin
            fluidRow(
              width = 12,

              box(
                title = "Trend Chart 3: Minimum OAD Position",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                background = 'navy',
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
              ),

              boxPlus(
                title = "Trend Chart 4c: Simultaneous Heating & Cooling",
                collapsed = TRUE,
                collapsible = TRUE,
                closable = FALSE,
                solidHeader = TRUE,
                background = 'navy',
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
                solidHeader = TRUE,
                background = 'navy',
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
              )


            ),
           #second row end

           #third row begin

           fluidRow(
             width = 12,

             boxPlus(
               title = "Trend Chart 5a: Economizing Using Temperature or Enthalpy",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               background = 'navy',
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
             ),

             boxPlus(
               title = "Trend Chart 7: DAT Control",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               background = 'navy',
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
               solidHeader = TRUE,
               background = 'navy',
               h1(strong('Trend Chart 8a')),
               h2("Compressor Cycling & Staging"),
               h3('Parameters to trend'),
               tags$ul(
                 tags$li(csvFileInput(id = 'Compressor1-t8a', label = 'Compressor 1 Status')),
                 tags$li(csvFileInput(id = 'Compressor2-t8a', label = 'Compressor 2 Status')),
                 tags$li(occupancyInput(id='occ8a',"https://cunybpl.shinyapps.io/nobas-occupancy/"))
               ),
               actionButton('trend8aTab','Trend 8a')
             )

           ),

           #third row end

           #fourth row begin

           fluidRow(
             width = 12,

             boxPlus(
               width = 4,
               title = "Trend Chart 8b: Burner Cycling & Staging",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               background = 'navy',
               h1(strong('Trend Chart 8b')),
               h2("Burner Cycling & Staging"),
               h3('Parameters to trend'),
               tags$ul(
                 tags$li(csvFileInput(id = 'Burner1-t8b', label = 'Burner 1 Status')),
                 tags$li(csvFileInput(id = 'Burner2-t8b', label = 'Burner 2 Status')),
                 tags$li(occupancyInput(id='occ8b',"https://cunybpl.shinyapps.io/nobas-occupancy/"))
               ),
               actionButton('trend8bTab','Trend 8b')
             ),

             boxPlus(
               title = "Trend Chart 10: Heating/Cooling Mode",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               background = 'navy',
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
