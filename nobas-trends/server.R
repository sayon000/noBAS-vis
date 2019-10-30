library(shinydashboard)

server <- function(input, output, session) {
  
  #actions to move between tabs using buttons should be here
 
  ###Start of trend buttons#######
  
  observeEvent(input$SplashTab,{
    updateTabItems(session, 'tabs', selected = "Home")
    js$ScrollUp()
  }) 
  
  observeEvent(input$HomeTab,{
    updateTabItems(session,'tabs',selected = "Home")
    js$ScrollUp()
  })
  
  observeEvent(input$AHUTab,{
    updateTabItems(session, 'tabs', selected = "AHU")
    js$ScrollUp()
  })  
  
  observeEvent(input$trend1Tab,{
    updateTabItems(session,'tabs',selected = "trend1")
    js$ScrollUp()
  })
  
  observeEvent(input$trend2bTab,{
    updateTabItems(session,'tabs',selected = "trend2b")
    js$ScrollUp()
  })
  
  observeEvent(input$trend3Tab,{
    updateTabItems(session,'tabs',selected = 'trend3')
    js$ScrollUp()
  })
  
  observeEvent(input$trend4cTab,{
    updateTabItems(session,'tabs',selected = 'trend4c')
    js$ScrollUp()
  })
  
  observeEvent(input$trend4dTab,{
    updateTabItems(session,'tabs',selected = 'trend4d')
    js$ScrollUp()
  })
  
  observeEvent(input$trend5aTab,{
    updateTabItems(session,'tabs',selected = 'trend5a')
    js$ScrollUp()
  })
  
  observeEvent(input$trend7Tab,{
    updateTabItems(session,'tabs',selected = 'trend7')
    js$ScrollUp()
  })
  
  observeEvent(input$trend8aTab,{
    updateTabItems(session,'tabs',selected = 'trend8a')
    js$ScrollUp()
  })
  
  observeEvent(input$trend8bTab,{
    updateTabItems(session,'tabs',selected = 'trend8b')
    js$ScrollUp()
  })
  
  observeEvent(input$trend10Tab,{
    updateTabItems(session,'tabs',selected = 'trend10')
    js$ScrollUp()
  })
  
  observeEvent(input$trend12Tab,{
    updateTabItems(session,'tabs',selected = 'trend12')
    js$ScrollUp()
  })
  
  observeEvent(input$trend13aTab,{
    updateTabItems(session,'tabs',selected = 'trend13a')
    js$ScrollUp()
  })
  
  observeEvent(input$trend14aTab,{
    updateTabItems(session,'tabs',selected = 'trend14a')
    js$ScrollUp()
  })
  
  observeEvent(input$trend15Tab,{
    updateTabItems(session,'tabs',selected = 'trend15')
    js$ScrollUp()
  })
  
  observeEvent(input$trend17Tab,{
    updateTabItems(session,'tabs',selected = 'trend17')
    js$ScrollUp()
  })
  
  observeEvent(input$trend18Tab,{
    updateTabItems(session,'tabs',selected = 'trend18')
    js$ScrollUp()
  })
  
  observeEvent(input$trend19aTab,{
    updateTabItems(session,'tabs',selected = 'trend19a')
    js$ScrollUp()
  })
  
  observeEvent(input$trend20aTab,{
    updateTabItems(session,'tabs',selected = 'trend20a')
    js$ScrollUp()
  })
  
  observeEvent(input$trend21Tab,{
    updateTabItems(session,'tabs',selected = 'trend21')
    js$ScrollUp()
  })
  
  observeEvent(input$trend22Tab,{
    updateTabItems(session,'tabs',selected = 'trend22')
    js$ScrollUp()
  })
  
  observeEvent(input$trend23Tab,{
    updateTabItems(session,'tabs',selected = 'trend23')
    js$ScrollUp()
  })
  
  observeEvent(input$trend26Tab,{
    updateTabItems(session,'tabs',selected = 'trend26')
    js$ScrollUp()
  })
  
  observeEvent(input$trend2737aTab,{
    updateTabItems(session,'tabs',selected = 'trend2737a')
    js$ScrollUp()
  })
  
  observeEvent(input$trend27bTab,{
    updateTabItems(session,'tabs',selected = 'trend27b')
    js$ScrollUp()
  })
  
  observeEvent(input$trend28bTab,{
    updateTabItems(session,'tabs',selected = 'trend28b')
    js$ScrollUp()
  })
  
  observeEvent(input$trend29bTab,{
    updateTabItems(session,'tabs',selected = 'trend29b')
    js$ScrollUp()
  })
  
  observeEvent(input$trend30bTab,{
    updateTabItems(session,'tabs',selected = 'trend30b')
    js$ScrollUp()
  })
  
  observeEvent(input$trend31bTab,{
    updateTabItems(session,'tabs',selected = 'trend31b')
    js$ScrollUp()
  })
  
  observeEvent(input$trend32bTab,{
    updateTabItems(session,'tabs',selected = 'trend32b')
    js$ScrollUp()
  })
  
  observeEvent(input$trend33bTab,{
    updateTabItems(session,'tabs',selected = 'trend33b')
    js$ScrollUp()
  })
  
  observeEvent(input$trend34bTab,{
    updateTabItems(session,'tabs',selected = 'trend34b')
    js$ScrollUp()
  })
  
  observeEvent(input$trend36bTab,{
    updateTabItems(session,'tabs',selected = 'trend36b')
    js$ScrollUp()
  })
  
  observeEvent(input$trend37bTab,{
    updateTabItems(session,'tabs',selected = 'trend37b')
    js$ScrollUp()
  })
  
  observeEvent(input$AcroTab,{
    updateTabItems(session,'tabs',selected = 'AcroTab')
    js$ScrollUp()
  })

  observeEvent(input$CHPTab,{
    updateTabItems(session,'tabs',selected = "ChillerPlant")
    js$ScrollUp()
  }) 
  
  observeEvent(input$BPTab,{
    updateTabItems(session,'tabs',selected = "BoilerPlant")
    js$ScrollUp()
  })
  
  observeEvent(input$ZTab,{
    updateTabItems(session,'tabs',selected = "Zone")
    js$ScrollUp()
  })
  
  observeEvent(input$PTab,{
    updateTabItems(session,'tabs',selected = "Perimeter")
    js$ScrollUp()
  })
  
  #####end of trend tab buttons#########
  
  ###Start of home buttons####
  
  observeEvent(input$HTabCP,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabBP,{
    updateTabItems(session,'tabs',selected = "Home")
  })
 
  observeEvent(input$HTabZ,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabP,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt1,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt2b,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt3,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt4c,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt4d,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt5a,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt7,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt8a,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt8b,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt10,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt12,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt13a,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt14a,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt15,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt17,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt18,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt19a,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt20a,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt21,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt22,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt23,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt26,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt2737a,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt27b,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt28b,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt29b,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt30b,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt31a,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt31b,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt32a,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt32b,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt33a,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt33b,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt34a,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt34b,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt35a,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt36a,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt36b,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt37a,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabt37b,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTabAcro,{
    updateTabItems(session,'tabs',selected= "Home")
  })
  
  ####END OF Buttons for getting home#####
  
  #####Start of previous tab pages#####
  observeEvent(input$Prevtabt1,{
    updateTabItems(session,'tabs',selected = "AHU")
    js$ScrollUp()
  })
  
  observeEvent(input$Prevtabt2b,{
    updateTabItems(session,'tabs',selected = "AHU")
    js$ScrollUp()
  })
  
  observeEvent(input$Prevtabt3,{
    updateTabItems(session,'tabs',selected = "AHU")
    js$ScrollUp()
  })
  
  observeEvent(input$Prevtabt4c,{
    updateTabItems(session,'tabs',selected = "AHU")
    js$ScrollUp()
  })
  
  observeEvent(input$Prevtabt4d,{
    updateTabItems(session,'tabs',selected = "AHU")
    js$ScrollUp()
  })
  
  observeEvent(input$Prevtabt5a,{
    updateTabItems(session,'tabs',selected = "AHU")
    js$ScrollUp()
  })
  
  observeEvent(input$Prevtabt7,{
    updateTabItems(session,'tabs',selected = "AHU")
    js$ScrollUp()
  })
  
  observeEvent(input$Prevtabt8a,{
    updateTabItems(session,'tabs',selected = "AHU")
    js$ScrollUp()
  })
  
  observeEvent(input$Prevtabt8b,{
    updateTabItems(session,'tabs',selected = "AHU")
    js$ScrollUp()
  })
  
  observeEvent(input$Prevtabt10,{
    updateTabItems(session,'tabs',selected = "AHU")
    js$ScrollUp()
  })
  
  observeEvent(input$Prevtabt12,{
    updateTabItems(session,'tabs',selected = "ChillerPlant")
    js$ScrollUp()
  })
  
  observeEvent(input$Prevtabt13a,{
    updateTabItems(session,'tabs',selected = "ChillerPlant")
    js$ScrollUp()
  })
  
  observeEvent(input$Prevtabt14a,{
    updateTabItems(session,'tabs',selected = "ChillerPlant")
    js$ScrollUp()
  })
  
  observeEvent(input$Prevtabt15,{
    updateTabItems(session,'tabs',selected = "ChillerPlant")
    js$ScrollUp()
  })
  
  
  observeEvent(input$Prevtabt17,{
    updateTabItems(session,'tabs',selected = "BoilerPlant")
    js$ScrollUp()
  })
  
  observeEvent(input$Prevtabt18,{
    updateTabItems(session,'tabs',selected = "BoilerPlant")
    js$ScrollUp()
  })
  
  observeEvent(input$Prevtabt19a,{
    updateTabItems(session,'tabs',selected = "BoilerPlant")
    js$ScrollUp()
  })
  
  observeEvent(input$Prevtabt20a,{
    updateTabItems(session,'tabs',selected = "BoilerPlant")
    js$ScrollUp()
  })
  
  observeEvent(input$Prevtabt21,{
    updateTabItems(session,'tabs',selected = "BoilerPlant")
    js$ScrollUp()
  })
  
  observeEvent(input$Prevtabt22,{
    updateTabItems(session,'tabs',selected = "BoilerPlant")
    js$ScrollUp()
  })
  
  observeEvent(input$Prevtabt23,{
    updateTabItems(session,'tabs',selected = "BoilerPlant")
    js$ScrollUp()
  })
  
  
  observeEvent(input$Prevtabt26,{
    updateTabItems(session,'tabs',selected = "Zone")
  })
  
  observeEvent(input$Prevtabt2737a,{
    updateTabItems(session,'tabs',selected = "Perimeter")
  })
  
  observeEvent(input$Prevtabt27b,{
    updateTabItems(session,'tabs',selected = "Perimeter")
  })
  
  observeEvent(input$Prevtabt28b,{
    updateTabItems(session,'tabs',selected = "Perimeter")
  })
  
  observeEvent(input$Prevtabt29b,{
    updateTabItems(session,'tabs',selected = "Perimeter")
  })
  
  observeEvent(input$Prevtabt30b,{
    updateTabItems(session,'tabs',selected = "Perimeter")
  })
  
  observeEvent(input$Prevtabt31a,{
    updateTabItems(session,'tabs',selected = "Perimeter")
  })
  
  observeEvent(input$Prevtabt31b,{
    updateTabItems(session,'tabs',selected = "Perimeter")
  })
  
  observeEvent(input$Prevtabt32a,{
    updateTabItems(session,'tabs',selected = "Perimeter")
  })
  
  observeEvent(input$Prevtabt32b,{
    updateTabItems(session,'tabs',selected = "Perimeter")
  })
  
  observeEvent(input$Prevtabt33a,{
    updateTabItems(session,'tabs',selected = "Perimeter")
  })
  
  observeEvent(input$Prevtabt33b,{
    updateTabItems(session,'tabs',selected = "Perimeter")
  })
  
  observeEvent(input$Prevtabt34a,{
    updateTabItems(session,'tabs',selected = "Perimeter")
  })
  
  observeEvent(input$Prevtabt34b,{
    updateTabItems(session,'tabs',selected = "Perimeter")
  })
  
  observeEvent(input$Prevtabt35a,{
    updateTabItems(session,'tabs',selected = "Perimeter")
  })
  
  observeEvent(input$Prevtabt36a,{
    updateTabItems(session,'tabs',selected = "Perimeter")
  })
  
  observeEvent(input$Prevtabt36b,{
    updateTabItems(session,'tabs',selected = "Perimeter")
  })
  
  observeEvent(input$Prevtabt37a,{
    updateTabItems(session,'tabs',selected = "Perimeter")
  })
  
  observeEvent(input$Prevtabt37b,{
    updateTabItems(session,'tabs',selected = "Perimeter")
  })
  ######end of previous tabs#####
  
  #####end of button actions####
  
  ###start of trend 1####
  fan_trend_t1 <- callModule(csvFile,"fant1",
                           targetColumns=reactive({c("Motor","Fan")}),
                           stateChange=reactive({TRUE}),
                           periodicity15=reactive({TRUE}),
                           name=reactive({"Fan"}),
                           color=reactive({"black"}),
                           axis=reactive({'y1'}))
  
  
  
  all_data_t1 <- reactive({
    list(fan_trend_t1())
  })
  
  date_range_t1 <- callModule(dateRange,"placeholder-id",data=all_data_t1)
  occupancyRects_t1 <- callModule(occupancy,"occ1",date_range_t1)
  
  callModule(plotting,"trend1",data=all_data_t1,occupancyRects=occupancyRects_t1,y1label='Fan Status')
  #end of trend 1
  
  #start of trend 2b
  fan_trend_t2b <- callModule(csvFile,"fant2b",
                             targetColumns=reactive({c("Motor","Fan")}),
                             stateChange=reactive({TRUE}),
                             periodicity15=reactive({TRUE}),
                             name=reactive({"Fan"}),
                             color=reactive({"black"}),
                             axis=reactive({'y2'}))
  
  oat_trend_t2b <- callModule(csvFile,"OAT2b",
                            targetColumns=reactive({c("Temp","oat","OAT")}),
                            stateChange=reactive({FALSE}),
                            periodicity15=reactive({TRUE}),
                            name=reactive({"OAT"}),
                            color=reactive({"green"}),
                            axis=reactive({'y1'}))
  
  mat_trend_t2b <- callModule(csvFile,"MAT2b",
                              targetColumns=reactive({c("Temp","mat","MAT")}),
                              stateChange=reactive({FALSE}),
                              periodicity15=reactive({TRUE}),
                              name=reactive({"MAT"}),
                              color=reactive({"orange"}),
                              axis=reactive({'y1'}))
  
  rat_trend_t2b <- callModule(csvFile,"RAT2b",
                              targetColumns=reactive({c("Temp","rat","RAT")}),
                              stateChange=reactive({FALSE}),
                              periodicity15=reactive({TRUE}),
                              name=reactive({"RAT"}),
                              color=reactive({"Red"}),
                              axis=reactive({'y1'}))
  
  all_data_t2b <- reactive({
    list(fan_trend_t2b(),oat_trend_t2b(),mat_trend_t2b(),rat_trend_t2b())
  })
  
  date_range_t2b <- callModule(dateRange,"placeholder-id",data=all_data_t2b)
  occupancyRects_t2b <- callModule(occupancy,"occ2b",date_range_t2b)
  
  callModule(plotting,"trend2b",data=all_data_t2b,occupancyRects=occupancyRects_t2b,y1label='Temp (°F)',y2label='Status')
  
  ####end of trend 2b#######
  
  #start of trend 3 NOTE: FIX THIS WHEN YOU GET ACTUAL DATA
  
  oad_trend_t3 <- callModule(csvFile,"OAD3",
                              targetColumns=reactive({c("Oad","oad","OAD")}),
                              stateChange=reactive({FALSE}),
                              periodicity15=reactive({TRUE}),
                              name=reactive({"OAD"}),
                              color=reactive({"black"}),
                              axis=reactive({'y1'}))
  
  co2_trend_t3 <- callModule(csvFile,"CO2-3",
                             targetColumns=reactive({c("CO2","ppm","PPM")}),
                             stateChange=reactive({FALSE}),
                             periodicity15=reactive({TRUE}),
                             name=reactive({"CO2"}),
                             color=reactive({"purple"}),
                             axis=reactive({'y2'}))
  
  all_data_t3 <- reactive({
    list(oad_trend_t3(),co2_trend_t3())
  })
  
  date_range_t3 <- callModule(dateRange,"placeholder-id",data=all_data_t3)
  occupancyRects_t3 <- callModule(occupancy,"occ3",date_range_t3)
  
  callModule(plotting,"trend3",data=all_data_t3,occupancyRects=occupancyRects_t3,y1label='Position (%)',y2label = 'CO2 (ppm)')
  
  
  ####end of trend 3####
  
  #####start of trend 4c####
  
  oad_trend_t4c <- callModule(csvFile,"OAD4c",
                             targetColumns=reactive({c("Temp","oad","OAD")}),
                             stateChange=reactive({FALSE}),
                             periodicity15=reactive({TRUE}),
                             name=reactive({"OAD"}),
                             color=reactive({"yellow"}),
                             axis=reactive({'y1'}))
  
  hcv_trend_t4c <- callModule(csvFile,"HCV4c",
                             targetColumns=reactive({c("Temp","hcv","HCV")}),
                             stateChange=reactive({FALSE}),
                             periodicity15=reactive({TRUE}),
                             name=reactive({"HCV"}),
                             color=reactive({"red"}),
                             axis=reactive({'y1'}))
  
  hwst_trend_t4c <- callModule(csvFile,"HWST4c",
                             targetColumns=reactive({c("Temp","hwst","HWST")}),
                             stateChange=reactive({FALSE}),
                             periodicity15=reactive({TRUE}),
                             name=reactive({"OAD"}),
                             color=reactive({"orange"}),
                             axis=reactive({'y1'}))
  
  all_data_t4c <- reactive({
    list(oad_trend_t4c(),hcv_trend_t4c(),hwst_trend_t4c())
  })
  
  date_range_t4c <- callModule(dateRange,"placeholder-id",data=all_data_t4c)
  occupancyRects_t4c <- callModule(occupancy,"occ4c",date_range_t4c)
  
  callModule(plotting,"trend4c",data=all_data_t4c,occupancyRects=occupancyRects_t4c,y1label='Temp (°F)')
  
  #####end of trend 4c####
  
  #####start of trend 4d#####
  
  fan_trend_t4d <- callModule(csvFile,"fant4d",
                             targetColumns=reactive({c("Motor","Fan")}),
                             stateChange=reactive({TRUE}),
                             periodicity15=reactive({TRUE}),
                             name=reactive({"Fan"}),
                             color=reactive({"black"}),
                             axis=reactive({'y2'}))
  
  hwp_trend_t4d <- callModule(csvFile,"HWP4d",
                             targetColumns=reactive({c("Motor","Fan")}),
                             stateChange=reactive({TRUE}),
                             periodicity15=reactive({TRUE}),
                             name=reactive({"HWP"}),
                             color=reactive({"red"}),
                             axis=reactive({'y2'}))
  
  all_data_t4d <- reactive({
    list(fan_trend_t4d(),hwp_trend_t4d())
  })
  
  date_range_t4d <- callModule(dateRange,"placeholder-id",data=all_data_t4d)
  occupancyRects_t4d <- callModule(occupancy,"occ4d",date_range_t4d)
  
  callModule(plotting,"trend4d",data=all_data_t4d,occupancyRects=occupancyRects_t4d,y2label='Status')
  
  #####end of trend 4d#####
  
  #####start of trend 5a####
  
  fan_trend_t5a <- callModule(csvFile,"fant5a",
                              targetColumns=reactive({c("Motor","Fan")}),
                              stateChange=reactive({TRUE}),
                              periodicity15=reactive({TRUE}),
                              name=reactive({"Fan"}),
                              color=reactive({"black"}),
                              axis=reactive({'y2'}))
  
  oat_trend_t5a <- callModule(csvFile,"OAT5a",
                              targetColumns=reactive({c("Temp","oat","OAT")}),
                              stateChange=reactive({FALSE}),
                              periodicity15=reactive({TRUE}),
                              name=reactive({"OAT"}),
                              color=reactive({"green"}),
                              axis=reactive({'y1'}))
  
  mat_trend_t5a <- callModule(csvFile,"MAT5a",
                              targetColumns=reactive({c("Temp","mat","MAT")}),
                              stateChange=reactive({FALSE}),
                              periodicity15=reactive({TRUE}),
                              name=reactive({"MAT"}),
                              color=reactive({"orange"}),
                              axis=reactive({'y1'}))
  
  rat_trend_t5a <- callModule(csvFile,"RAT5a",
                              targetColumns=reactive({c("Temp","rat","RAT")}),
                              stateChange=reactive({FALSE}),
                              periodicity15=reactive({TRUE}),
                              name=reactive({"RAT"}),
                              color=reactive({"Red"}),
                              axis=reactive({'y1'}))
  
  all_data_t5a <- reactive({
    list(fan_trend_t5a(),oat_trend_t5a(),mat_trend_t5a(),rat_trend_t5a())
  })
  
  date_range_t5a <- callModule(dateRange,"placeholder-id",data=all_data_t5a)
  occupancyRects_t5a <- callModule(occupancy,"occ5a",date_range_t5a)
  
  callModule(plotting,"trend5a",data=all_data_t5a,occupancyRects=occupancyRects_t5a,y1label='Temp (°F)',y2label='Status')
  
  
  ####end of trend 5a#####
  
  #####start of trend 7####
  
  fan_trend_t7 <- callModule(csvFile,"fant7",
                              targetColumns=reactive({c("Motor","Fan")}),
                              stateChange=reactive({TRUE}),
                              periodicity15=reactive({TRUE}),
                              name=reactive({"Fan"}),
                              color=reactive({"black"}),
                              axis=reactive({'y2'}))
  
  dat_trend_t7 <- callModule(csvFile,"DAT7",
                              targetColumns=reactive({c("Temp","dat","DAT")}),
                              stateChange=reactive({FALSE}),
                              periodicity15=reactive({TRUE}),
                              name=reactive({"DAT"}),
                              color=reactive({"blue"}),
                              axis=reactive({'y1'}))
  
  datsp_trend_t7 <- callModule(csvFile,"DATSP7",
                              targetColumns=reactive({c("Temp","datsp","DATSP")}),
                              stateChange=reactive({FALSE}),
                              periodicity15=reactive({TRUE}),
                              name=reactive({"DATSP"}),
                              color=reactive({'#5ab0f2'}),
                              axis=reactive({'y1'}))
  
  
  all_data_t7 <- reactive({
    list(fan_trend_t7(),dat_trend_t7(),datsp_trend_t7())
  })
  
  date_range_t7 <- callModule(dateRange,"placeholder-id",data=all_data_t7)
  occupancyRects_t7 <- callModule(occupancy,"occ7",date_range_t7)
  
  callModule(plotting,"trend7",data=all_data_t7,occupancyRects=occupancyRects_t7,y1label='Temp (°F)',y2label='Status')
  
  
  #####end of trend 7####
  
  
  #####start of trend 8a####

  compressor1_trend_t8a <- callModule(csvFile,"Compressor1-t8a",
                             targetColumns=reactive({c("Temp","compressor","COMPRESSOR")}),
                             stateChange=reactive({FALSE}),
                             periodicity15=reactive({TRUE}),
                             name=reactive({"Compressor 1"}),
                             color=reactive({"gray"}),
                             axis=reactive({'y2'}))
  
  compressor2_trend_t8a <- callModule(csvFile,"Compressor1-t8b",
                             targetColumns=reactive({c("Temp","compressor","COMPRESSOR")}),
                             stateChange=reactive({FALSE}),
                             periodicity15=reactive({TRUE}),
                             name=reactive({"Compressor 2"}),
                             color=reactive({"brown"}),
                             axis=reactive({'y2'}))
  
  all_data_t8a <- reactive({
    list(compressor1_trend_t8a(),compressor2_trend_t8a())
  })
  
  date_range_t8a <- callModule(dateRange,"placeholder-id",data=all_data_t8a)
  occupancyRects_t8a <- callModule(occupancy,"occ8a",date_range_t8a)
  
  callModule(plotting,"trend8a",data=all_data_t8a,occupancyRects=occupancyRects_t8a,y2label='Status')
  
  
  ####end of trend 8a#####
  
  #####start of trend 8b####
  
  burner1_trend_t8b <- callModule(csvFile,"Burner1-t8b",
                                      targetColumns=reactive({c("Temp","burner","BURNER")}),
                                      stateChange=reactive({FALSE}),
                                      periodicity15=reactive({TRUE}),
                                      name=reactive({"Burner 1"}),
                                      color=reactive({"gray"}),
                                      axis=reactive({'y2'}))
  
  burner2_trend_t8b <- callModule(csvFile,"Burner2-t8b",
                                      targetColumns=reactive({c("Temp","burner","BURNER")}),
                                      stateChange=reactive({FALSE}),
                                      periodicity15=reactive({TRUE}),
                                      name=reactive({"Burner 2"}),
                                      color=reactive({"brown"}),
                                      axis=reactive({'y2'}))
  
  all_data_t8b <- reactive({
    list(burner1_trend_t8b(),burner2_trend_t8b())
  })
  
  date_range_t8b <- callModule(dateRange,"placeholder-id",data=all_data_t8b)
  occupancyRects_t8b <- callModule(occupancy,"occ8b",date_range_t8b)
  
  callModule(plotting,"trend8b",data=all_data_t8b,occupancyRects=occupancyRects_t8b,y2label='Status')
  
  ####end of trend 8b#####
  
  ####start of trend 10####
  
  fan_trend_t10 <- callModule(csvFile,"fant10",
                              targetColumns=reactive({c("Motor","Fan")}),
                              stateChange=reactive({TRUE}),
                              periodicity15=reactive({TRUE}),
                              name=reactive({"Fan"}),
                              color=reactive({"black"}),
                              axis=reactive({'y2'}))
  
  mat_trend_t10 <- callModule(csvFile,"MAT10",
                              targetColumns=reactive({c("Temp","mat","MAT")}),
                              stateChange=reactive({FALSE}),
                              periodicity15=reactive({TRUE}),
                              name=reactive({"MAT"}),
                              color=reactive({"orange"}),
                              axis=reactive({'y1'}))
  
  dat_trend_t10 <- callModule(csvFile,"DAT10",
                              targetColumns=reactive({c("Temp","rat","RAT")}),
                              stateChange=reactive({FALSE}),
                              periodicity15=reactive({TRUE}),
                              name=reactive({"RAT"}),
                              color=reactive({"Red"}),
                              axis=reactive({'y1'}))
  
  all_data_t10 <- reactive({
    list(fan_trend_t10(),mat_trend_t10(),dat_trend_t10())
  })
  
  date_range_t10 <- callModule(dateRange,"placeholder-id",data=all_data_t10)
  occupancyRects_t10 <- callModule(occupancy,"occ10",date_range_t10)
  
  callModule(plotting,"trend10",data=all_data_t10,occupancyRects=occupancyRects_t10,y1label='Temp (°F)',y2label='Status')
  
  
  ####end of trend 10#####
  
  ####start of trend 12####
  
  chwst_trend_t12 <- callModule(csvFile,"CHWST12",
                                 targetColumns=reactive({c("Temp","chwst","CHWST")}),
                                 stateChange=reactive({FALSE}),
                                 periodicity15=reactive({TRUE}),
                                 name=reactive({"CHWST"}),
                                 color=reactive({"blue"}),
                                 axis=reactive({'y1'}))
  
  chwp_trend_t12 <- callModule(csvFile,"CHWP12",
                                 targetColumns=reactive({c("Temp","chwp","CHWP")}),
                                 stateChange=reactive({FALSE}),
                                 periodicity15=reactive({TRUE}),
                                 name=reactive({"CHWP"}),
                                 color=reactive({"gray"}),
                                 axis=reactive({'y2'}))
  
  all_data_t12 <- reactive({
    list(chwst_trend_t12(),chwp_trend_t12())
  })
  
  date_range_t12 <- callModule(dateRange,"placeholder-id",data=all_data_t12)
  occupancyRects_t12 <- callModule(occupancy,"occ12",date_range_t12)
  
  callModule(plotting,"trend12",data=all_data_t12,occupancyRects=occupancyRects_t12,y1label='Temp (°F)',y2label = 'Speed')
  
  #####end of trend 12###
  
  
  ####start of trend 13a####
  
  chwst_trend_t13a <- callModule(csvFile,"CHWST13a",
                              targetColumns=reactive({c("Temp","chwst","CHWST")}),
                              stateChange=reactive({FALSE}),
                              periodicity15=reactive({TRUE}),
                              name=reactive({"CHWST"}),
                              color=reactive({"blue"}),
                              axis=reactive({'y1'}))
 
   chwrt_trend_t13a <- callModule(csvFile,"CHWRT13a",
                              targetColumns=reactive({c("Temp","chwrt","CHWRT")}),
                              stateChange=reactive({FALSE}),
                              periodicity15=reactive({TRUE}),
                              name=reactive({"CHWRT"}),
                              color=reactive({"green"}),
                              axis=reactive({'y1'}))
   
   all_data_t13a <- reactive({
     list(chwst_trend_t13a(),chwrt_trend_t13a())
   })
   
   date_range_t13a <- callModule(dateRange,"placeholder-id",data=all_data_t13a)
   occupancyRects_t13a <- callModule(occupancy,"occ13a",date_range_t13a)
   
   callModule(plotting,"trend13a",data=all_data_t13a,occupancyRects=occupancyRects_t13a,y1label='Temp (°F)')
   
  #######end of trend 13a#######
   
  ######start of trend 14a######
   
   chwst_trend_t14a <- callModule(csvFile,"CHWST14a",
                                  targetColumns=reactive({c("Temp","chwst","CHWST")}),
                                  stateChange=reactive({FALSE}),
                                  periodicity15=reactive({TRUE}),
                                  name=reactive({"CHWST"}),
                                  color=reactive({"blue"}),
                                  axis=reactive({'y1'}))
   
   chwstsp_trend_t14a <- callModule(csvFile,"CHWSTSP14a",
                                  targetColumns=reactive({c("Temp","chwstsp","CHWSTSP")}),
                                  stateChange=reactive({FALSE}),
                                  periodicity15=reactive({TRUE}),
                                  name=reactive({"CHWSTSP"}),
                                  color=reactive({"light blue"}),
                                  axis=reactive({'y1'}))
   
   oat_trend_t14a <- callModule(csvFile,"OAT14a",
                               targetColumns=reactive({c("Temp","oat","OAT")}),
                               stateChange=reactive({FALSE}),
                               periodicity15=reactive({TRUE}),
                               name=reactive({"OAT"}),
                               color=reactive({"green"}),
                               axis=reactive({'y1'}))
   
   all_data_t14a <- reactive({
     list(chwst_trend_t14a(),chwstsp_trend_t14a(),oat_trend_t14a())
   })
   
   date_range_t14a <- callModule(dateRange,"placeholder-id",data=all_data_t14a)
   occupancyRects_t14a <- callModule(occupancy,"occ14a",date_range_t14a)
   
   callModule(plotting,"trend14a",data=all_data_t14a,occupancyRects=occupancyRects_t14a,y1label='Temp (°F)')
   
   
  #####end of trend 14a#####
   
  #####start of trend 15######
  
  cwps_trend_t15 <- callModule(csvFile,"CWPS15",
                              targetColumns=reactive({c("Motor","Fan")}),
                              stateChange=reactive({TRUE}),
                              periodicity15=reactive({TRUE}),
                              name=reactive({"CW Pump"}),
                              color=reactive({"gray"}),
                              axis=reactive({'y1'}))
  
  ctfs_trend_t15 <- callModule(csvFile,"CTFS15",
                             targetColumns=reactive({c("Motor","Fan")}),
                             stateChange=reactive({TRUE}),
                             periodicity15=reactive({TRUE}),
                             name=reactive({"CTF Status"}),
                             color=reactive({"blue"}),
                             axis=reactive({'y1'}))
  
  all_data_t15 <- reactive({
    list(cwps_trend_t15(),ctfs_trend_t15())
  })
  
  date_range_t15 <- callModule(dateRange,"placeholder-id",data=all_data_t15)
  occupancyRects_t15 <- callModule(occupancy,"occ15",date_range_t1)
  
  callModule(plotting,"trend15",data=all_data_t15,occupancyRects=occupancyRects_t15,y1label='Status')
  
  #####end of trend 15######
   
  #####start of trend 17#######
  
  crt_trend_t17 <- callModule(csvFile,"CRT17",
                               targetColumns=reactive({c("Temp","crt","CRT")}),
                               stateChange=reactive({FALSE}),
                               periodicity15=reactive({TRUE}),
                               name=reactive({"CRT"}),
                               color=reactive({"red"}),
                               axis=reactive({'y1'}))
  
  all_data_t17 <- reactive({
    list(crt_trend_t17())
  })
  
  date_range_t17 <- callModule(dateRange,"placeholder-id",data=all_data_t17)
  occupancyRects_t17 <- callModule(occupancy,"occ17",date_range_t17)
  
  callModule(plotting,"trend17",data=all_data_t17,occupancyRects=occupancyRects_t17,y1label='Temp (°F)')
  
  #######end of trend 17######
  
  #######start of trend 18######
  
  bs_trend_t18 <- callModule(csvFile,"BSt18",
                             targetColumns=reactive({c("Motor","Fan")}),
                             stateChange=reactive({TRUE}),
                             periodicity15=reactive({TRUE}),
                             name=reactive({"Boiler Status"}),
                             color=reactive({"gray"}),
                             axis=reactive({'y2'}))
  
  hwst_trend_t18 <- callModule(csvFile,"HWST18",
                              targetColumns=reactive({c("Temp","hwst","HWST")}),
                              stateChange=reactive({FALSE}),
                              periodicity15=reactive({TRUE}),
                              name=reactive({"HWST"}),
                              color=reactive({"red"}),
                              axis=reactive({'y1'}))
  
  hwps_trend_t18 <- callModule(csvFile,"HWPS18",
                             targetColumns=reactive({c("Motor","Fan")}),
                             stateChange=reactive({TRUE}),
                             periodicity15=reactive({TRUE}),
                             name=reactive({"HW Pump"}),
                             color=reactive({"brown"}),
                             axis=reactive({'y2'}))
  
  oat_trend_t18 <- callModule(csvFile,"CRT17",
                              targetColumns=reactive({c("Temp","oat","OAT")}),
                              stateChange=reactive({FALSE}),
                              periodicity15=reactive({TRUE}),
                              name=reactive({"OAT"}),
                              color=reactive({"green"}),
                              axis=reactive({'y1'}))
  
  all_data_t18 <- reactive({
    list(bs_trend_t18(),hwst_trend_t18(),hwps_trend_t18(),oat_trend_t18())
  })
  
  date_range_t18 <- callModule(dateRange,"placeholder-id",data=all_data_t18)
  occupancyRects_t18 <- callModule(occupancy,"occ18",date_range_t18)
  
  callModule(plotting,"trend18",data=all_data_t18,occupancyRects=occupancyRects_t18,y1label='Temp (°F)',y2label = 'Status')
  
  ########end of trend 18#########
  
  ########start of trend 19a########
   
   hwst_trend_t19a <- callModule(csvFile,"HWST19a",
                                  targetColumns=reactive({c("Temp","hwst","HWST")}),
                                  stateChange=reactive({FALSE}),
                                  periodicity15=reactive({TRUE}),
                                  name=reactive({"HWST"}),
                                  color=reactive({"red"}),
                                  axis=reactive({'y1'}))
   
   oat_trend_t19a <- callModule(csvFile,"OAT19a",
                               targetColumns=reactive({c("Temp","oat","OAT")}),
                               stateChange=reactive({FALSE}),
                               periodicity15=reactive({TRUE}),
                               name=reactive({"OAT"}),
                               color=reactive({"green"}),
                               axis=reactive({'y1'}))
   
   all_data_t19a <- reactive({
     list(hwst_trend_t19a(),oat_trend_t19a())
   })
   
   date_range_t19a <- callModule(dateRange,"placeholder-id",data=all_data_t19a)
   occupancyRects_t19a <- callModule(occupancy,"occ19a",date_range_t19a)
   
   callModule(plotting,"trend19a",data=all_data_t19a,occupancyRects=occupancyRects_t19a,y1label='Temp (°F)')
   
  #########end of trend 19a########
   
  #########start of trend 20a#########
   
   hwst_trend_t20a <- callModule(csvFile,"HWST20a",
                                 targetColumns=reactive({c("Temp","hwst","HWST")}),
                                 stateChange=reactive({FALSE}),
                                 periodicity15=reactive({TRUE}),
                                 name=reactive({"HWST"}),
                                 color=reactive({"red"}),
                                 axis=reactive({'y1'}))
   
   hwrt_trend_t20a <- callModule(csvFile,"HWRT20a",
                                targetColumns=reactive({c("Temp","hwrt","HWRT")}),
                                stateChange=reactive({FALSE}),
                                periodicity15=reactive({TRUE}),
                                name=reactive({"HWRT"}),
                                color=reactive({"#940000"}),
                                axis=reactive({'y1'}))
   
   all_data_t20a <- reactive({
     list(hwst_trend_t20a(),hwrt_trend_t20a())
   })
   
   date_range_t20a <- callModule(dateRange,"placeholder-id",data=all_data_t20a)
   occupancyRects_t20a <- callModule(occupancy,"occ20a",date_range_t20a)
   
   callModule(plotting,"trend20a",data=all_data_t20a,occupancyRects=occupancyRects_t20a,y1label='Temp (°F)')
   
   
  ########end of trend 20a#########
   
  #########start of trend 21########
   
   hwrt_trend_t21 <- callModule(csvFile,"HWRT21",
                                 targetColumns=reactive({c("Temp","hwrt","HWRT")}),
                                 stateChange=reactive({FALSE}),
                                 periodicity15=reactive({TRUE}),
                                 name=reactive({"HWRT"}),
                                 color=reactive({"orange"}),
                                 axis=reactive({'y1'}))
   
   all_data_t21 <- reactive({
     list(hwrt_trend_t21())
   })
   
   date_range_t21 <- callModule(dateRange,"placeholder-id",data=all_data_t21)
   occupancyRects_t21 <- callModule(occupancy,"occ21",date_range_t21)
   
   callModule(plotting,"trend21",data=all_data_t21,occupancyRects=occupancyRects_t21,y1label='Temp (°F)')
   
  #######end of trend 21########
   
  ######3start of trend 22#######
   
   bms_trend_t22 <- callModule(csvFile,"BMS22",
                              targetColumns=reactive({c("Motor","Fan")}),
                              stateChange=reactive({TRUE}),
                              periodicity15=reactive({FALSE}),
                              name=reactive({"Burner Status"}),
                              color=reactive({"gray"}),
                              axis=reactive({'y2'}))
   
   stack_trend_t22 <- callModule(csvFile,"STACK22",
                              targetColumns=reactive({c("K-Type")}),
                              stateChange=reactive({FALSE}),
                              periodicity15=reactive({TRUE}),
                              name=reactive({"Stack Temp"}),
                              color=reactive({"red"}),
                              axis=reactive({'y1'}))
   
   all_data_t22 <- reactive({
     list(bms_trend_t22(),stack_trend_t22())
   })
   
   date_range_t22 <- callModule(dateRange,"placeholder-id",data=all_data_t22)
   occupancyRects_t22 <- callModule(occupancy,"occ22",date_range_t22)
   
   callModule(plotting,"trend22",data=all_data_t22,occupancyRects=occupancyRects_t22,y1label='Temp (°F)',y2label = 'Status')
   
   
  ########end of trend 22########
   
  ########start of trend 23#######
   
   hwst_trend_t23 <- callModule(csvFile,"HWST23",
                                 targetColumns=reactive({c("Temp","hwst","HWST")}),
                                 stateChange=reactive({FALSE}),
                                 periodicity15=reactive({TRUE}),
                                 name=reactive({"HWST"}),
                                 color=reactive({"red"}),
                                 axis=reactive({'y1'}))
   
   hwstsp_trend_t23 <- callModule(csvFile,"HWSTSP23",
                                 targetColumns=reactive({c("Temp","hwstsp","HWSTSP")}),
                                 stateChange=reactive({FALSE}),
                                 periodicity15=reactive({TRUE}),
                                 name=reactive({"HWRT"}),
                                 color=reactive({"orange"}),
                                 axis=reactive({'y1'}))
   
   all_data_t23 <- reactive({
     list(hwst_trend_t23(),hwstsp_trend_t23())
   })
   
   date_range_t23 <- callModule(dateRange,"placeholder-id",data=all_data_t23)
   occupancyRects_t23 <- callModule(occupancy,"occ23",date_range_t23)
   
   callModule(plotting,"trend23",data=all_data_t23,occupancyRects=occupancyRects_t23,y1label='Temp (°F)')
   
 ####end of trend 23#######
   
  ####start of trend 26######
  
   zt_trend_t26 <- callModule(csvFile,"ZT26",
                                 targetColumns=reactive({c("Temp","zt","ZT")}),
                                 stateChange=reactive({FALSE}),
                                 periodicity15=reactive({TRUE}),
                                 name=reactive({"ZT"}),
                                 color=reactive({"#ff70c6"}),
                                 axis=reactive({'y1'}))
   
   ztsp_trend_t26 <- callModule(csvFile,"ZTSP26",
                                 targetColumns=reactive({c("Temp","ztsp","ZTSP")}),
                                 stateChange=reactive({FALSE}),
                                 periodicity15=reactive({TRUE}),
                                 name=reactive({"ZTSP"}),
                                 color=reactive({"red"}),
                                 axis=reactive({'y1'}))
   
   ztsbsp_trend_t26 <- callModule(csvFile,"ZTSBSP26",
                                 targetColumns=reactive({c("Temp","ztsbsp","ZTSBSP")}),
                                 stateChange=reactive({FALSE}),
                                 periodicity15=reactive({TRUE}),
                                 name=reactive({"Zone Temp SB SP"}),
                                 color=reactive({"purple"}),
                                 axis=reactive({'y1'}))
   
   all_data_t26 <- reactive({
     list(zt_trend_t26(),ztsp_trend_t26(),ztsbsp_trend_t26())
   })
   
   date_range_t26 <- callModule(dateRange,"placeholder-id",data=all_data_t26)
   occupancyRects_t26 <- callModule(occupancy,"occ26",date_range_t26)
   
   callModule(plotting,"trend26",data=all_data_t26,occupancyRects=occupancyRects_t26,y1label='Temp (°F)')
  ######end of trend 26#####
  
  ######start of trend 2737a#######
   
   burner_trend_t2737a <- callModule(csvFile,"Burner-t2737a",
                              targetColumns=reactive({c("Motor","Fan")}),
                              stateChange=reactive({TRUE}),
                              periodicity15=reactive({TRUE}),
                              name=reactive({"Burner"}),
                              color=reactive({"red"}),
                              axis=reactive({'y2'}))
   
   boiler_trend_t2737a <- callModule(csvFile,"Boiler-t2737a",
                                     targetColumns=reactive({c("Motor","Fan")}),
                                     stateChange=reactive({TRUE}),
                                     periodicity15=reactive({TRUE}),
                                     name=reactive({"Boiler"}),
                                     color=reactive({"yellow"}),
                                     axis=reactive({'y2'}))
   
   mat_trend_t2737a <- callModule(csvFile,"MAT2737a",
                               targetColumns=reactive({c("Temp","mat","MAT")}),
                               stateChange=reactive({FALSE}),
                               periodicity15=reactive({TRUE}),
                               name=reactive({"MAT"}),
                               color=reactive({"orange"}),
                               axis=reactive({'y1'}))
   
   dat_trend_t2737a <- callModule(csvFile,"DAT2737a",
                              targetColumns=reactive({c("Temp","dat","DAT")}),
                              stateChange=reactive({FALSE}),
                              periodicity15=reactive({TRUE}),
                              name=reactive({"DAT"}),
                              color=reactive({"blue"}),
                              axis=reactive({'y1'}))
   
   hcv_trend_t2737a <- callModule(csvFile,"HCV2737a",
                                targetColumns=reactive({c("Temp","hcv","HCV")}),
                                stateChange=reactive({FALSE}),
                                periodicity15=reactive({TRUE}),
                                name=reactive({"HCV"}),
                                color=reactive({"brown"}),
                                axis=reactive({'y1'}))
   
   all_data_t2737a <- reactive({
     list(burner_trend_t2737a(),boiler_trend_t2737a(),mat_trend_t2737a(),dat_trend_t2737a(),hcv_trend_t2737a())
   })
   
   date_range_t2737a <- callModule(dateRange,"placeholder-id",data=all_data_t2737a)
   occupancyRects_t2737a <- callModule(occupancy,"occ2737a",date_range_t2737a)
   
   callModule(plotting,"trend2737a",data=all_data_t2737a,occupancyRects=occupancyRects_t2737a,y1label='Temp (°F)/Position',y2label = 'Status')
   
  #######end of trend 2737a########
   
    
  ########start of trend 27b#######
   
   dat_trend_t27b <- callModule(csvFile,"DAT27b",
                              targetColumns=reactive({c("Temp","dat","DAT")}),
                              stateChange=reactive({FALSE}),
                              periodicity15=reactive({TRUE}),
                              name=reactive({"DAT"}),
                              color=reactive({"blue"}),
                              axis=reactive({'y1'}))
   
   zt_trend_t27b <- callModule(csvFile,"ZT27b",
                               targetColumns=reactive({c("Temp","zt","ZT")}),
                               stateChange=reactive({FALSE}),
                               periodicity15=reactive({TRUE}),
                               name=reactive({"ZT"}),
                               color=reactive({"#ff70c6"}),
                               axis=reactive({'y1'}))
   
   ztspa_trend_t27b <- callModule(csvFile,"ZTSP-A27b",
                               targetColumns=reactive({c("Temp","ztspa","ZTSPA")}),
                               stateChange=reactive({FALSE}),
                               periodicity15=reactive({TRUE}),
                               name=reactive({"ZTSP-A"}),
                               color=reactive({"#966891"}),
                               axis=reactive({'y1'}))
   
   fan_trend_t27b <- callModule(csvFile,"fant27b",
                              targetColumns=reactive({c("Motor","Fan")}),
                              stateChange=reactive({TRUE}),
                              periodicity15=reactive({TRUE}),
                              name=reactive({"Fan"}),
                              color=reactive({"black"}),
                              axis=reactive({'y2'}))
   
   all_data_t27b <- reactive({
     list(dat_trend_t27b(),zt_trend_t27b(),ztspa_trend_t27b(),fan_trend_t27b())
   })
   
   date_range_t27b <- callModule(dateRange,"placeholder-id",data=all_data_t27b)
   occupancyRects_t27b <- callModule(occupancy,"occ27b",date_range_t27b)
   
   callModule(plotting,"trend27b",data=all_data_t27b,occupancyRects=occupancyRects_t27b,y1label='Temp (°F)',y2label='Status')
   
  ######end of trend 27b########
   
  #######start of trend 28b#######
   
   dat_trend_t28b <- callModule(csvFile,"DAT28b",
                                targetColumns=reactive({c("Temp","dat","DAT")}),
                                stateChange=reactive({FALSE}),
                                periodicity15=reactive({TRUE}),
                                name=reactive({"DAT"}),
                                color=reactive({"blue"}),
                                axis=reactive({'y1'}))
   
   datsp_trend_t28b <- callModule(csvFile,"DATSP28b",
                                targetColumns=reactive({c("Temp","datsp","DATSP")}),
                                stateChange=reactive({FALSE}),
                                periodicity15=reactive({TRUE}),
                                name=reactive({"DATSP"}),
                                color=reactive({"orange"}),
                                axis=reactive({'y1'}))
   
   zt_trend_t28b <- callModule(csvFile,"ZT28b",
                               targetColumns=reactive({c("Temp","zt","ZT")}),
                               stateChange=reactive({FALSE}),
                               periodicity15=reactive({TRUE}),
                               name=reactive({"ZT"}),
                               color=reactive({"#ff70c6"}),
                               axis=reactive({'y1'}))
   
   ztspa_trend_t28b <- callModule(csvFile,"ZTSP-A28b",
                                  targetColumns=reactive({c("Temp","ztspa","ZTSPA")}),
                                  stateChange=reactive({FALSE}),
                                  periodicity15=reactive({TRUE}),
                                  name=reactive({"ZTSP-A"}),
                                  color=reactive({"red"}),
                                  axis=reactive({'y1'}))
   
   fan_trend_t28b <- callModule(csvFile,"fant28b",
                                targetColumns=reactive({c("Motor","Fan")}),
                                stateChange=reactive({TRUE}),
                                periodicity15=reactive({TRUE}),
                                name=reactive({"Fan"}),
                                color=reactive({"black"}),
                                axis=reactive({'y2'}))
   
   all_data_t28b <- reactive({
     list(dat_trend_t28b(),datsp_trend_t28b(),zt_trend_t28b(),ztspa_trend_t28b(),fan_trend_t28b())
   })
   
   date_range_t28b <- callModule(dateRange,"placeholder-id",data=all_data_t28b)
   occupancyRects_t28b <- callModule(occupancy,"occ28b",date_range_t28b)
   
   callModule(plotting,"trend28b",data=all_data_t28b,occupancyRects=occupancyRects_t28b,y1label='Temp (°F)',y2label='Status')
   
   ########end of trend 28b##########
   
   #########start of trend 29b#########

   dat_trend_t29b <- callModule(csvFile,"DAT29b",
                                targetColumns=reactive({c("Temp","dat","DAT")}),
                                stateChange=reactive({FALSE}),
                                periodicity15=reactive({TRUE}),
                                name=reactive({"DAT"}),
                                color=reactive({"blue"}),
                                axis=reactive({'y1'}))
   
   datsp_trend_t29b <- callModule(csvFile,"DATSP29b",
                                  targetColumns=reactive({c("Temp","datsp","DATSP")}),
                                  stateChange=reactive({FALSE}),
                                  periodicity15=reactive({TRUE}),
                                  name=reactive({"DATSP"}),
                                  color=reactive({"orange"}),
                                  axis=reactive({'y1'}))
   
   ztspa_trend_t29b <- callModule(csvFile,"ZTSP-A29b",
                                  targetColumns=reactive({c("Temp","ztspa","ZTSPA")}),
                                  stateChange=reactive({FALSE}),
                                  periodicity15=reactive({TRUE}),
                                  name=reactive({"ZTSP-A"}),
                                  color=reactive({"red"}),
                                  axis=reactive({'y1'}))
   
   fan_trend_t29b <- callModule(csvFile,"fant29b",
                                targetColumns=reactive({c("Motor","Fan")}),
                                stateChange=reactive({TRUE}),
                                periodicity15=reactive({TRUE}),
                                name=reactive({"Fan"}),
                                color=reactive({"black"}),
                                axis=reactive({'y2'}))
   
   all_data_t29b <- reactive({
     list(dat_trend_t29b(),datsp_trend_t29b(),ztspa_trend_t29b(),fan_trend_t29b())
   })
   
   date_range_t29b <- callModule(dateRange,"placeholder-id",data=all_data_t29b)
   occupancyRects_t29b <- callModule(occupancy,"occ29b",date_range_t29b)
   
   callModule(plotting,"trend29b",data=all_data_t29b,occupancyRects=occupancyRects_t29b,y1label='Temp (°F)',y2label='Status')
   
   ########end of trend 29b#########
   
   ########start of trend 30b########
   
   ratsp_trend_t30b <- callModule(csvFile,"RATSP30b",
                                targetColumns=reactive({c("Temp","ratsp","RATSP")}),
                                stateChange=reactive({FALSE}),
                                periodicity15=reactive({TRUE}),
                                name=reactive({"RATSP"}),
                                color=reactive({"yellow"}),
                                axis=reactive({'y1'}))
   
   rat_trend_t30b <- callModule(csvFile,"RAT30b",
                                  targetColumns=reactive({c("Temp","rat","RAT")}),
                                  stateChange=reactive({FALSE}),
                                  periodicity15=reactive({TRUE}),
                                  name=reactive({"RAT"}),
                                  color=reactive({"red"}),
                                  axis=reactive({'y1'}))
   
   dat_trend_t30b <- callModule(csvFile,"DAT30b",
                                  targetColumns=reactive({c("Temp","dat","DAT")}),
                                  stateChange=reactive({FALSE}),
                                  periodicity15=reactive({TRUE}),
                                  name=reactive({"DAT"}),
                                  color=reactive({"blue"}),
                                  axis=reactive({'y1'}))
   
   zt_trend_t30b <- callModule(csvFile,"ZT30b",
                                  targetColumns=reactive({c("Temp","zt","ZT")}),
                                  stateChange=reactive({FALSE}),
                                  periodicity15=reactive({TRUE}),
                                  name=reactive({"ZT"}),
                                  color=reactive({"#ff70c6"}),
                                  axis=reactive({'y1'}))
   
   fan_trend_t30b <- callModule(csvFile,"fant30b",
                                targetColumns=reactive({c("Motor","Fan")}),
                                stateChange=reactive({TRUE}),
                                periodicity15=reactive({TRUE}),
                                name=reactive({"Fan"}),
                                color=reactive({"black"}),
                                axis=reactive({'y2'}))
   
   all_data_t30b <- reactive({
     list(ratsp_trend_t30b(),rat_trend_t30b(),dat_trend_t30b(),zt_trend_t30b(),fan_trend_t30b())
   })
   
   date_range_t30b <- callModule(dateRange,"placeholder-id",data=all_data_t30b)
   occupancyRects_t30b <- callModule(occupancy,"occ30b",date_range_t30b)
   
   callModule(plotting,"trend30b",data=all_data_t30b,occupancyRects=occupancyRects_t30b,y1label='Temp (°F)',y2label='Status')
   
   
   #########end of trend 30b##########
   
   ##########start of trend 31b##########
   
   dat_trend_t31b <- callModule(csvFile,"DAT31b",
                                targetColumns=reactive({c("Temp","dat","DAT")}),
                                stateChange=reactive({FALSE}),
                                periodicity15=reactive({TRUE}),
                                name=reactive({"DAT"}),
                                color=reactive({"blue"}),
                                axis=reactive({'y1'}))
   
   
   datsp_trend_t31b <- callModule(csvFile,"DATSP31b",
                                targetColumns=reactive({c("Temp","datsp","DATSP")}),
                                stateChange=reactive({FALSE}),
                                periodicity15=reactive({TRUE}),
                                name=reactive({"DATSP"}),
                                color=reactive({"cyan"}),
                                axis=reactive({'y1'}))
   
   zt_trend_t31b <- callModule(csvFile,"ZT31b",
                               targetColumns=reactive({c("Temp","zt","ZT")}),
                               stateChange=reactive({FALSE}),
                               periodicity15=reactive({TRUE}),
                               name=reactive({"ZT"}),
                               color=reactive({"#ff70c6"}),
                               axis=reactive({'y1'}))
   
   rat_trend_t31b <- callModule(csvFile,"RAT31b",
                                targetColumns=reactive({c("Temp","rat","RAT")}),
                                stateChange=reactive({FALSE}),
                                periodicity15=reactive({TRUE}),
                                name=reactive({"RAT"}),
                                color=reactive({"red"}),
                                axis=reactive({'y1'}))
   
   all_data_t31b <- reactive({
     list(dat_trend_t31b(),datsp_trend_t31b(),zt_trend_t31b(),rat_trend_t31b())
   })
   
   date_range_t31b <- callModule(dateRange,"placeholder-id",data=all_data_t31b)
   occupancyRects_t31b <- callModule(occupancy,"occ31b",date_range_t31b)
   
   callModule(plotting,"trend31b",data=all_data_t31b,occupancyRects=occupancyRects_t31b,y1label='Temp (°F)')
   
   #########end of trend 31b#########
   
   #########start of trend 32b##########
   
   hwst_trend_t32b <- callModule(csvFile,"HWST32b",
                                targetColumns=reactive({c("Temp","hwst","HWST")}),
                                stateChange=reactive({FALSE}),
                                periodicity15=reactive({TRUE}),
                                name=reactive({"HWST"}),
                                color=reactive({"red"}),
                                axis=reactive({'y1'}))
   
   
   hwrt_trend_t32b <- callModule(csvFile,"HWRT32b",
                                  targetColumns=reactive({c("Temp","hwrt","HWRT")}),
                                  stateChange=reactive({FALSE}),
                                  periodicity15=reactive({TRUE}),
                                  name=reactive({"HWRT"}),
                                  color=reactive({"orange"}),
                                  axis=reactive({'y1'}))
   
   zt_trend_t32b <- callModule(csvFile,"ZT32b",
                               targetColumns=reactive({c("Temp","zt","ZT")}),
                               stateChange=reactive({FALSE}),
                               periodicity15=reactive({TRUE}),
                               name=reactive({"ZT"}),
                               color=reactive({"#ff70c6"}),
                               axis=reactive({'y1'}))
   
   
   all_data_t32b <- reactive({
     list(hwst_trend_t32b(),hwrt_trend_t32b(),zt_trend_t32b())
   })
   
   date_range_t32b <- callModule(dateRange,"placeholder-id",data=all_data_t32b)
   occupancyRects_t32b <- callModule(occupancy,"occ32b",date_range_t32b)
   
   callModule(plotting,"trend32b",data=all_data_t32b,occupancyRects=occupancyRects_t32b,y1label='Temp (°F)')
   
   ##########end of trend 32b###########
   
   ##########start of trend 33b########
   
   zt_trend_t33b <- callModule(csvFile,"ZT33b",
                               targetColumns=reactive({c("Temp","zt","ZT")}),
                               stateChange=reactive({FALSE}),
                               periodicity15=reactive({TRUE}),
                               name=reactive({"ZT"}),
                               color=reactive({"#ff70c6"}),
                               axis=reactive({'y1'}))
   
   ztspp_trend_t33b <- callModule(csvFile,"ZTSP-P33b",
                                  targetColumns=reactive({c("Temp","ztspp","ZTSPP")}),
                                  stateChange=reactive({FALSE}),
                                  periodicity15=reactive({TRUE}),
                                  name=reactive({"ZTSP-P"}),
                                  color=reactive({"#ff9987"}),
                                  axis=reactive({'y1'}))
   
   ztspa_trend_t33b <- callModule(csvFile,"ZTSP-A33b",
                                  targetColumns=reactive({c("Temp","ztspa","ZTSPA")}),
                                  stateChange=reactive({FALSE}),
                                  periodicity15=reactive({TRUE}),
                                  name=reactive({"ZTSP-A"}),
                                  color=reactive({"#ba475a"}),
                                  axis=reactive({'y1'}))

   fan_trend_t33b <- callModule(csvFile,"fant33b",
                                targetColumns=reactive({c("Motor","Fan")}),
                                stateChange=reactive({TRUE}),
                                periodicity15=reactive({TRUE}),
                                name=reactive({"Fan"}),
                                color=reactive({"black"}),
                                axis=reactive({'y2'}))
   
   dat_trend_t33b <- callModule(csvFile,"DAT33b",
                                targetColumns=reactive({c("Temp","dat","DAT")}),
                                stateChange=reactive({FALSE}),
                                periodicity15=reactive({TRUE}),
                                name=reactive({"DAT"}),
                                color=reactive({"blue"}),
                                axis=reactive({'y1'}))
   
   all_data_t33b <- reactive({
     list(zt_trend_t33b(),ztspp_trend_t33b(),ztspa_trend_t33b(),fan_trend_t33b(),dat_trend_t33b())
   })
   
   date_range_t33b <- callModule(dateRange,"placeholder-id",data=all_data_t33b)
   occupancyRects_t33b <- callModule(occupancy,"occ33b",date_range_t33b)
   
   callModule(plotting,"trend33b",data=all_data_t33b,occupancyRects=occupancyRects_t33b,y1label='Temp (°F)',y2label='Status')
   
   ##########end of trend 33b#########
   
   ###########start of trend 34b#########
   
   dat_trend_t34b <- callModule(csvFile,"DAT34b",
                                targetColumns=reactive({c("Temp","dat","DAT")}),
                                stateChange=reactive({FALSE}),
                                periodicity15=reactive({TRUE}),
                                name=reactive({"DAT"}),
                                color=reactive({"blue"}),
                                axis=reactive({'y1'}))
   
   datsp_trend_t34b <- callModule(csvFile,"DATSP34b",
                                targetColumns=reactive({c("Temp","datsp","DATSP")}),
                                stateChange=reactive({FALSE}),
                                periodicity15=reactive({TRUE}),
                                name=reactive({"DATSP"}),
                                color=reactive({"aquamarine"}),
                                axis=reactive({'y1'}))
   
   zt_trend_t34b <- callModule(csvFile,"ZT34b",
                               targetColumns=reactive({c("Temp","zt","ZT")}),
                               stateChange=reactive({FALSE}),
                               periodicity15=reactive({TRUE}),
                               name=reactive({"ZT"}),
                               color=reactive({"#ff70c6"}),
                               axis=reactive({'y1'}))
   
   ztspp_trend_t34b <- callModule(csvFile,"ZTSP-P34b",
                                  targetColumns=reactive({c("Temp","ztspp","ZTSPP")}),
                                  stateChange=reactive({FALSE}),
                                  periodicity15=reactive({TRUE}),
                                  name=reactive({"ZTSP-P"}),
                                  color=reactive({"#ba475a"}),
                                  axis=reactive({'y1'}))
   
   ztspa_trend_t34b <- callModule(csvFile,"ZTSP-A34b",
                                  targetColumns=reactive({c("Temp","ztspa","ZTSPA")}),
                                  stateChange=reactive({FALSE}),
                                  periodicity15=reactive({TRUE}),
                                  name=reactive({"ZTSP-A"}),
                                  color=reactive({"brown"}),
                                  axis=reactive({'y1'}))
   
   fan_trend_t34b <- callModule(csvFile,"fant34b",
                                targetColumns=reactive({c("Motor","Fan")}),
                                stateChange=reactive({TRUE}),
                                periodicity15=reactive({TRUE}),
                                name=reactive({"Fan"}),
                                color=reactive({"black"}),
                                axis=reactive({'y2'}))
   
   all_data_t34b <- reactive({
     list(dat_trend_t34b(),datsp_trend_t34b(),zt_trend_t34b(),ztspp_trend_t34b(),ztspa_trend_t34b(),fan_trend_t34b())
   })
   
   date_range_t34b <- callModule(dateRange,"placeholder-id",data=all_data_t34b)
   occupancyRects_t34b <- callModule(occupancy,"occ34b",date_range_t34b)
   
   callModule(plotting,"trend34b",data=all_data_t34b,occupancyRects=occupancyRects_t34b,y1label='Temp (°F)',y2label='Status')
   
   
   ########end of trend 34b#########
   
   #########start of trend 36b#######
   
   ratsp_trend_t36b <- callModule(csvFile,"RATSP36b",
                               targetColumns=reactive({c("Temp","ratsp","RATSP")}),
                               stateChange=reactive({FALSE}),
                               periodicity15=reactive({TRUE}),
                               name=reactive({"RATSP"}),
                               color=reactive({"orange"}),
                               axis=reactive({'y1'}))
   
   rat_trend_t36b <- callModule(csvFile,"RAT36b",
                                  targetColumns=reactive({c("Temp","rat","RAT")}),
                                  stateChange=reactive({FALSE}),
                                  periodicity15=reactive({TRUE}),
                                  name=reactive({"RAT"}),
                                  color=reactive({"red"}),
                                  axis=reactive({'y1'}))
   
   dat_trend_t36b <- callModule(csvFile,"DAT36b",
                                targetColumns=reactive({c("Temp","dat","DAT")}),
                                stateChange=reactive({FALSE}),
                                periodicity15=reactive({TRUE}),
                                name=reactive({"DAT"}),
                                color=reactive({"blue"}),
                                axis=reactive({'y1'}))
   
   zt_trend_t36b <- callModule(csvFile,"ZT36b",
                               targetColumns=reactive({c("Temp","zt","ZT")}),
                               stateChange=reactive({FALSE}),
                               periodicity15=reactive({TRUE}),
                               name=reactive({"ZT"}),
                               color=reactive({"#ff70c6"}),
                               axis=reactive({'y1'}))
   
   ztspp_trend_t36b <- callModule(csvFile,"ZTSP-P36b",
                                  targetColumns=reactive({c("Temp","ztspp","ZTSPP")}),
                                  stateChange=reactive({FALSE}),
                                  periodicity15=reactive({TRUE}),
                                  name=reactive({"ZTSP-P"}),
                                  color=reactive({"#ba475a"}),
                                  axis=reactive({'y1'}))
   
   fan_trend_t36b <- callModule(csvFile,"fant36b",
                                targetColumns=reactive({c("Motor","Fan")}),
                                stateChange=reactive({TRUE}),
                                periodicity15=reactive({TRUE}),
                                name=reactive({"Fan"}),
                                color=reactive({"black"}),
                                axis=reactive({'y2'}))
   
   all_data_t36b <- reactive({
     list(ratsp_trend_t36b(),rat_trend_t36b(),dat_trend_t36b(),zt_trend_t36b(),ztspp_trend_t36b(),fan_trend_t36b())
   })
   
   date_range_t36b <- callModule(dateRange,"placeholder-id",data=all_data_t36b)
   occupancyRects_t36b <- callModule(occupancy,"occ36b",date_range_t36b)
   
   callModule(plotting,"trend36b",data=all_data_t36b,occupancyRects=occupancyRects_t36b,y1label='Temp (°F)',y2label='Status')
   
   ############end of trend 36b############
   
   ##############start of trend 37b##############
   
   dat_trend_t37b <- callModule(csvFile,"DAT37b",
                                targetColumns=reactive({c("Temp","dat","DAT")}),
                                stateChange=reactive({FALSE}),
                                periodicity15=reactive({TRUE}),
                                name=reactive({"DAT"}),
                                color=reactive({"blue"}),
                                axis=reactive({'y1'}))
   
   datsp_trend_t37b <- callModule(csvFile,"DAT37b",
                                targetColumns=reactive({c("Temp","datsp","DATSP")}),
                                stateChange=reactive({FALSE}),
                                periodicity15=reactive({TRUE}),
                                name=reactive({"DATSP"}),
                                color=reactive({"aquamarine"}),
                                axis=reactive({'y1'}))
   
   zt_trend_t37b <- callModule(csvFile,"ZT37b",
                               targetColumns=reactive({c("Temp","zt","ZT")}),
                               stateChange=reactive({FALSE}),
                               periodicity15=reactive({TRUE}),
                               name=reactive({"ZT"}),
                               color=reactive({"#ff70c6"}),
                               axis=reactive({'y1'}))
   
   ztspp_trend_t37b <- callModule(csvFile,"ZTSP-P37b",
                                  targetColumns=reactive({c("Temp","ztspp","ZTSPP")}),
                                  stateChange=reactive({FALSE}),
                                  periodicity15=reactive({TRUE}),
                                  name=reactive({"ZTSP-P"}),
                                  color=reactive({"#ba475a"}),
                                  axis=reactive({'y1'}))
   
   rat_trend_t37b <- callModule(csvFile,"RAT37b",
                                targetColumns=reactive({c("Temp","rat","RAT")}),
                                stateChange=reactive({FALSE}),
                                periodicity15=reactive({TRUE}),
                                name=reactive({"RAT"}),
                                color=reactive({"red"}),
                                axis=reactive({'y1'}))
   
   all_data_t37b <- reactive({
     list(dat_trend_t37b(),datsp_trend_t37b(),zt_trend_t37b(),ztspp_trend_t37b(),rat_trend_t37b())
   })
   
   date_range_t37b <- callModule(dateRange,"placeholder-id",data=all_data_t37b)
   occupancyRects_t37b <- callModule(occupancy,"occ37b",date_range_t37b)
   
   callModule(plotting,"trend37b",data=all_data_t37b,occupancyRects=occupancyRects_t37b,y1label='Temp (°F)')
   
   
   ########end of trend 37b########
   
   ######Acronym Table#######
   
   acronymFile <- "acronyms.csv" ###edit associated table for the acronyms
   acroTable <- read_csv(acronymFile)
   output$acroTable <- renderTable({ head( acroTable, n = 30 )},
                                    hover = TRUE,
                                    spacing = 'm'
                                   )
}
