library(shinydashboard)


server <- function(input, output, session) {
  #actions to move between tabs using buttons should be here
 
  observeEvent(input$AHUTab,{
    updateTabItems(session, 'tabs', selected = "AHU")
  })  
  
  observeEvent(input$CHPTab,{
    updateTabItems(session,'tabs',selected = "ChillerPlant")
  }) 
  
  observeEvent(input$BPTab,{
    updateTabItems(session,'tabs',selected = "BoilerPlant")
  })
  
  observeEvent(input$ZTab,{
    updateTabItems(session,'tabs',selected = "Zone")
  })
  
  observeEvent(input$PTab,{
    updateTabItems(session,'tabs',selected = "Perimeter")
  })
  
  observeEvent(input$HTab,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTab2,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTab3,{
    updateTabItems(session,'tabs',selected = "Home")
  })
 
  observeEvent(input$HTab4,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  
  observeEvent(input$HTab5,{
    updateTabItems(session,'tabs',selected = "Home")
  })
  #end of button actions
  
  #start of trend 1
  fan_trend_t1 <- callModule(csvFile,"fanstat-t1",
                           targetColumns=reactive({c("Motor","Fan")}),
                           stateChange=reactive({TRUE}),
                           periodicity15=reactive({TRUE}),
                           name=reactive({"Fan"}),
                           color=reactive({"gray"}),
                           axis=reactive({'y1'}))
  
  
  
  all_data_t1 <- reactive({
    list(fan_trend_t1())
  })
  
  date_range_t1 <- callModule(dateRange,"placeholder-id",data=all_data_t1)
  occupancyRects_t1 <- callModule(occupancy,"occ1",date_range_t1)
  
  callModule(plotting,"trend1",data=all_data_t1,occupancyRects=occupancyRects_t1,y1label='Fan Status')
  #end of trend 1
  
  #start of trend 2b
  fan_trend_t2b <- callModule(csvFile,"fanstat-t2b",
                             targetColumns=reactive({c("Motor","Fan")}),
                             stateChange=reactive({TRUE}),
                             periodicity15=reactive({TRUE}),
                             name=reactive({"Fan"}),
                             color=reactive({"gray"}),
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
  
  #end of trend 2b
  
  #start of trend 3 NOTE: FIX THIS WHEN YOU GET ACTUAL DATA
  
  oad_trend_t3 <- callModule(csvFile,"OAD3",
                              targetColumns=reactive({c("Temp","oad","OAD")}),
                              stateChange=reactive({FALSE}),
                              periodicity15=reactive({TRUE}),
                              name=reactive({"OAD"}),
                              color=reactive({"yellow"}),
                              axis=reactive({'y1'}))
  
  oad_trend_t3 <- callModule(csvFile,"CO2-3",
                             targetColumns=reactive({c("CO2","ppm","PPM")}),
                             stateChange=reactive({FALSE}),
                             periodicity15=reactive({TRUE}),
                             name=reactive({"CO2"}),
                             color=reactive({"purple"}),
                             axis=reactive({'y1'}))
  
  all_data_t3 <- reactive({
    list(oad_trend_t3(),oad_trend_t3())
  })
  
  date_range_t3 <- callModule(dateRange,"placeholder-id",data=all_data_t3)
  occupancyRects_t3 <- callModule(occupancy,"occ3",date_range_t3)
  
  callModule(plotting,"trend3",data=all_data_t3,occupancyRects=occupancyRects_t3,y1label='Temp (°F)')
  
  
  #end of trend 3
  
  #start of trend 13a
  
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
   
  #end of trend 13a
   
  #start of trend 19a
   
   hwst_trend_t19a <- callModule(csvFile,"HWST19a",
                                  targetColumns=reactive({c("Temp","hwrt","HWST")}),
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
   
  #end of trend 19a
   
  #start of trend 26
  
   zt_trend_t26 <- callModule(csvFile,"ZT26",
                                 targetColumns=reactive({c("Temp","zt","ZT")}),
                                 stateChange=reactive({FALSE}),
                                 periodicity15=reactive({TRUE}),
                                 name=reactive({"Zone Temp"}),
                                 color=reactive({"green"}),
                                 axis=reactive({'y1'}))
   
   ztsp_trend_t26 <- callModule(csvFile,"ZTsp26",
                                 targetColumns=reactive({c("Temp","ztsp","ZTSP")}),
                                 stateChange=reactive({FALSE}),
                                 periodicity15=reactive({TRUE}),
                                 name=reactive({"Zone Temp SP"}),
                                 color=reactive({"red"}),
                                 axis=reactive({'y1'}))
   
   ztsbsp_trend_t26 <- callModule(csvFile,"ZTsbsp26",
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
   
  #end of trend 26
   
  #start of trend 27
   
   dat_trend_t27 <- callModule(csvFile,"DAT27",
                              targetColumns=reactive({c("Temp","dat","DAT")}),
                              stateChange=reactive({FALSE}),
                              periodicity15=reactive({TRUE}),
                              name=reactive({"DAT"}),
                              color=reactive({"blue"}),
                              axis=reactive({'y1'}))
   
   zt_trend_t27 <- callModule(csvFile,"ZT27",
                               targetColumns=reactive({c("Temp","zt","ZT")}),
                               stateChange=reactive({FALSE}),
                               periodicity15=reactive({TRUE}),
                               name=reactive({"DAT"}),
                               color=reactive({"green"}),
                               axis=reactive({'y1'}))
   
   ztsp_trend_t27 <- callModule(csvFile,"ZTsp-a27",
                               targetColumns=reactive({c("Temp","ztsp","ZTSP")}),
                               stateChange=reactive({FALSE}),
                               periodicity15=reactive({TRUE}),
                               name=reactive({"DAT"}),
                               color=reactive({"red"}),
                               axis=reactive({'y1'}))
   
   fan_trend_t27 <- callModule(csvFile,"fanstat-t27",
                              targetColumns=reactive({c("Motor","Fan")}),
                              stateChange=reactive({TRUE}),
                              periodicity15=reactive({TRUE}),
                              name=reactive({"Fan"}),
                              color=reactive({"gray"}),
                              axis=reactive({'y2'}))
   
   all_data_t27 <- reactive({
     list(dat_trend_t27(),zt_trend_t27(),ztsp_trend_t27(),fan_trend_t27())
   })
   
   date_range_t27 <- callModule(dateRange,"placeholder-id",data=all_data_t27)
   occupancyRects_t27 <- callModule(occupancy,"occ27",date_range_t27)
   
   callModule(plotting,"trend27",data=all_data_t27,occupancyRects=occupancyRects_t27,y1label='Temp (°F)',y2label='Status')
   
  #end of trend 27
}
