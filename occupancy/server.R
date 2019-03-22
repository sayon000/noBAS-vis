#Server

server <- function(input, output, session) {
  #return diff_time in seconds between two times
  time_diff <- function(time1,time2){
    as.integer(difftime(time1,time2,units='secs'))
  }
  
  occData <- reactive({
    if (!is.null(input$occFile)) {
      d1 <- input$occFile$datapath
      d1 <- read.csv(d1, na.strings = 'NA')
      colnames(d1) <-
        c("ind",
          "day",
          "startup_start",
          "startup_end",
          "occ_start",
          "occ_end")
      
      #check for empty schedule
      if (is.na(d1[1, 3]) &&
          is.na(d1[2, 3]) &&
          is.na(d1[3, 3]) &&
          is.na(d1[4, 3]) &&
          is.na(d1[5, 3]) && is.na(d1[6, 3]) && is.na(d1[7, 3])) {
        return(NA)
      }
      else{
        return(d1)
      }
    }
    else{
      return (NA)
    }
  })
  
  #disable/enable timeinputs for unoccupied/occupied
  observeEvent(input$sun_occ, {
    if (input$sun_occ == FALSE) {
      disable('sun_slider')
      disable('sun_startup')
    } else{
      enable('sun_slider')
      enable('sun_startup')
    }
  })
  
  
  observeEvent(input$mon_occ, {
    if (input$mon_occ == FALSE) {
      disable('mon_slider')
      disable('mon_startup')
    } else{
      enable('mon_slider')
      enable('mon_startup')
    }
  })
  
  observeEvent(input$tue_occ, {
    if (input$tue_occ == FALSE) {
      disable('tue_slider')
      disable('tue_startup')
    } else{
      enable('tue_slider')
      enable('tue_startup')
    }
  })
  
  observeEvent(input$wed_occ, {
    if (input$wed_occ == FALSE) {
      disable('wed_slider')
      disable('wed_startup')
    } else{
      enable('wed_slider')
      enable('wed_startup')
    }
  })
  
  observeEvent(input$thu_occ, {
    if (input$thu_occ == FALSE) {
      disable('thu_slider')
      disable('thu_startup')
    } else{
      enable('thu_slider')
      enable('thu_startup')
    }
  })
  
  observeEvent(input$fri_occ, {
    if (input$fri_occ == FALSE) {
      disable('fri_slider')
      disable('fri_startup')
    } else{
      enable('fri_slider')
      enable('fri_startup')
    }
  })
  
  observeEvent(input$sat_occ, {
    if (input$sat_occ == FALSE) {
      disable('sat_slider')
      disable('sat_startup')
    } else{
      enable('sat_slider')
      enable('sat_startup')
    }
  })
  
  ####----Slider Behavior---####
  
  sun_startup_end <- reactive({
    input$sun_startup[2]
  })
  sun_occ_start <- reactive({
    input$sun_slider[1]
  })
  
  observeEvent(sun_startup_end(), {
    diff <- time_diff(input$sun_slider[1], input$sun_slider[2]) * -1
    updateSliderInput(session,
                      'sun_slider',
                      value = c(sun_startup_end(), sun_startup_end() + diff))
  })
  
  observeEvent(sun_occ_start(), {
    diff <- time_diff(input$sun_startup[1], input$sun_startup[2])
    updateSliderInput(session,
                      'sun_startup',
                      value = c(sun_occ_start() + diff, sun_occ_start()))
  })
  
  mon_startup_end <- reactive({
    input$mon_startup[2]
  })
  mon_occ_start <- reactive({
    input$mon_slider[1]
  })
  
  observeEvent(mon_startup_end(), {
    diff <- time_diff(input$mon_slider[1], input$mon_slider[2]) * -1
    updateSliderInput(session,
                      'mon_slider',
                      value = c(mon_startup_end(), mon_startup_end() + diff))
  })
  
  observeEvent(mon_occ_start(), {
    diff <- time_diff(input$mon_startup[1], input$mon_startup[2])
    updateSliderInput(session,
                      'mon_startup',
                      value = c(mon_occ_start() + diff, mon_occ_start()))
  })
  
  tue_startup_end <- reactive({
    input$tue_startup[2]
  })
  tue_occ_start <- reactive({
    input$tue_slider[1]
  })
  
  observeEvent(tue_startup_end(), {
    diff <- time_diff(input$tue_slider[1], input$tue_slider[2]) * -1
    updateSliderInput(session,
                      'tue_slider',
                      value = c(tue_startup_end(), tue_startup_end() + diff))
  })
  
  observeEvent(tue_occ_start(), {
    diff <- time_diff(input$tue_startup[1], input$tue_startup[2])
    updateSliderInput(session,
                      'tue_startup',
                      value = c(tue_occ_start() + diff, tue_occ_start()))
  })
  
  wed_startup_end <- reactive({
    input$wed_startup[2]
  })
  wed_occ_start <- reactive({
    input$wed_slider[1]
  })
  
  observeEvent(wed_startup_end(), {
    diff <- time_diff(input$wed_slider[1], input$wed_slider[2]) * -1
    updateSliderInput(session,
                      'wed_slider',
                      value = c(wed_startup_end(), wed_startup_end() + diff))
  })
  
  observeEvent(wed_occ_start(), {
    diff <- time_diff(input$wed_startup[1], input$wed_startup[2])
    updateSliderInput(session,
                      'wed_startup',
                      value = c(wed_occ_start() + diff, wed_occ_start()))
  })
  
  thu_startup_end <- reactive({
    input$thu_startup[2]
  })
  thu_occ_start <- reactive({
    input$thu_slider[1]
  })
  
  observeEvent(thu_startup_end(), {
    diff <- time_diff(input$thu_slider[1], input$thu_slider[2]) * -1
    updateSliderInput(session,
                      'thu_slider',
                      value = c(thu_startup_end(), thu_startup_end() + diff))
  })
  
  observeEvent(thu_occ_start(), {
    diff <- time_diff(input$thu_startup[1], input$thu_startup[2])
    updateSliderInput(session,
                      'thu_startup',
                      value = c(thu_occ_start() + diff, thu_occ_start()))
  })
  
  fri_startup_end <- reactive({
    input$fri_startup[2]
  })
  fri_occ_start <- reactive({
    input$fri_slider[1]
  })
  
  observeEvent(fri_startup_end(), {
    diff <- time_diff(input$fri_slider[1], input$fri_slider[2]) * -1
    updateSliderInput(session,
                      'fri_slider',
                      value = c(fri_startup_end(), fri_startup_end() + diff))
  })
  
  observeEvent(fri_occ_start(), {
    diff <- time_diff(input$fri_startup[1], input$fri_startup[2])
    updateSliderInput(session,
                      'fri_startup',
                      value = c(fri_occ_start() + diff, fri_occ_start()))
  })
  
  sat_startup_end <- reactive({
    input$sat_startup[2]
  })
  sat_occ_start <- reactive({
    input$sat_slider[1]
  })
  
  observeEvent(sat_startup_end(), {
    diff <- time_diff(input$sat_slider[1], input$sat_slider[2]) * -1
    updateSliderInput(session,
                      'sat_slider',
                      value = c(sat_startup_end(), sat_startup_end() + diff))
  })
  
  observeEvent(sat_occ_start(), {
    diff <- time_diff(input$sat_startup[1], input$sat_startup[2])
    updateSliderInput(session,
                      'sat_startup',
                      value = c(sat_occ_start() + diff, sat_occ_start()))
  })
  
  #Prep Timeinputs
  #NOTE: inputs sun_start, sun_end etc aree of class POSIXlt
  sun <- reactive({
    if (input$sun_occ == FALSE) {
      return(c('NA', 'NA', 'NA'))
    }
    else{
      startup_start <-
        strftime(input$sun_startup[1], format = TIME_FORM, tz = TZ)
      startup_end <-
        strftime(input$sun_startup[2], format = TIME_FORM, tz = TZ)
      start <-
        strftime(input$sun_slider[1], format = TIME_FORM, tz = TZ)
      end <-
        strftime(input$sun_slider[2], format = TIME_FORM, tz = TZ)
      
      sun <- c(startup_start, startup_end, start, end)
      return(sun)
    }
  })
  
  mon <- reactive({
    if (input$mon_occ == FALSE) {
      return(c('NA', 'NA', 'NA'))
    } else{
      startup_start <-
        strftime(input$mon_startup[1], format = TIME_FORM, tz = TZ)
      startup_end <-
        strftime(input$mon_startup[2], format = TIME_FORM, tz = TZ)
      start <-
        strftime(input$mon_slider[1], format = TIME_FORM, tz = TZ)
      end <-
        strftime(input$mon_slider[2], format = TIME_FORM, tz = TZ)
      
      mon <- c(startup_start, startup_end, start, end)
      return(mon)
    }
  })
  
  tue <- reactive({
    if (input$tue_occ == FALSE) {
      return(c('NA', 'NA', 'NA'))
    } else{
      startup_start <-
        strftime(input$tue_startup[1], format = TIME_FORM, tz = TZ)
      startup_end <-
        strftime(input$tue_startup[2], format = TIME_FORM, tz = TZ)
      start <-
        strftime(input$tue_slider[1], format = TIME_FORM, tz = TZ)
      end <-
        strftime(input$tue_slider[2], format = TIME_FORM, tz = TZ)
      
      tue <- c(startup_start, startup_end, start, end)
      return(tue)
    }
  })
  
  wed <- reactive({
    if (input$wed_occ == FALSE) {
      return(c('NA', 'NA', 'NA'))
    } else{
      startup_start <-
        strftime(input$wed_startup[1], format = TIME_FORM, tz = TZ)
      startup_end <-
        strftime(input$wed_startup[2], format = TIME_FORM, tz = TZ)
      start <-
        strftime(input$wed_slider[1], format = TIME_FORM, tz = TZ)
      end <-
        strftime(input$wed_slider[2], format = TIME_FORM, tz = TZ)
      
      wed <- c(startup_start, startup_end, start, end)
      return(wed)
    }
  })
  
  thu <- reactive({
    if (input$thu_occ == FALSE) {
      return(c('NA', 'NA', 'NA'))
    } else{
      startup_start <-
        strftime(input$thu_startup[1], format = TIME_FORM, tz = TZ)
      startup_end <-
        strftime(input$thu_startup[2], format = TIME_FORM, tz = TZ)
      start <-
        strftime(input$thu_slider[1], format = TIME_FORM, tz = TZ)
      end <-
        strftime(input$thu_slider[2], format = TIME_FORM, tz = TZ)
      
      thu <- c(startup_start, startup_end, start, end)
      return(thu)
    }
  })
  
  fri <- reactive({
    if (input$fri_occ == FALSE) {
      return(c('NA', 'NA', 'NA'))
    } else{
      startup_start <-
        strftime(input$fri_startup[1], format = TIME_FORM, tz = TZ)
      startup_end <-
        strftime(input$fri_startup[2], format = TIME_FORM, tz = TZ)
      start <-
        strftime(input$fri_slider[1], format = TIME_FORM, tz = TZ)
      end <-
        strftime(input$fri_slider[2], format = TIME_FORM, tz = TZ)
      
      fri <- c(startup_start, startup_end, start, end)
      return(fri)
    }
  })
  
  sat <- reactive({
    if (input$sat_occ == FALSE) {
      return(c('NA', 'NA', 'NA'))
    } else{
      startup_start <-
        strftime(input$sat_startup[1], format = TIME_FORM, tz = TZ)
      startup_end <-
        strftime(input$sat_startup[2], format = TIME_FORM, tz = TZ)
      start <-
        strftime(input$sat_slider[1], format = TIME_FORM, tz = TZ)
      end <-
        strftime(input$sat_slider[2], format = TIME_FORM, tz = TZ)
      
      sat <- c(startup_start, startup_end, start, end)
      return(sat)
    }
  })
  
  #Flag for when download_button pressed
  rv <- reactiveValues(download_flag = 0)
  
  #dataframe to write to file
  occupancy_preview <- eventReactive({
    input$update_preview
    rv$download_flag
  }
  , ignoreNULL = FALSE, {
    df <- data.frame(matrix(ncol = 5, nrow = 7))
    x <-
      c("day",
        "startup_start",
        'startup_end',
        'occupied_start',
        'occupied_end')
    colnames(df) <- x
    
    #Standard Week
    sunday <- c('sun', sun()[1], sun()[2], sun()[3], sun()[4])
    df[1,] <- sunday
    
    monday <- c('mon', mon()[1], mon()[2], mon()[3], mon()[4])
    df[2,] <- monday
    
    tuesday <- c('tue', tue()[1], tue()[2], tue()[3], tue()[4])
    df[3,] <- tuesday
    
    wednesday <- c('wed', wed()[1], wed()[2], wed()[3], wed()[4])
    df[4,] <- wednesday
    
    thursday <- c('thu', thu()[1], thu()[2], thu()[3], thu()[4])
    df[5,] <- thursday
    
    friday <- c('fri', fri()[1], fri()[2], fri()[3], fri()[4])
    df[6,] <- friday
    
    saturday <- c('sat', sat()[1], sat()[2], sat()[3], sat()[4])
    df[7,] <- saturday
    
    return(df)
  })
  
  occupancy <- reactive({
    df <- data.frame(matrix(ncol = 5, nrow = 7))
    x <-
      c("day",
        "startup_start",
        'startup_end',
        'occupied_start',
        'occupied_end')
    colnames(df) <- x
    
    #Standard Week
    sunday <- c('sun', sun()[1], sun()[2], sun()[3], sun()[4])
    df[1,] <- sunday
    
    monday <- c('mon', mon()[1], mon()[2], mon()[3], mon()[4])
    df[2,] <- monday
    
    tuesday <- c('tue', tue()[1], tue()[2], tue()[3], tue()[4])
    df[3,] <- tuesday
    
    wednesday <- c('wed', wed()[1], wed()[2], wed()[3], wed()[4])
    df[4,] <- wednesday
    
    thursday <- c('thu', thu()[1], thu()[2], thu()[3], thu()[4])
    df[5,] <- thursday
    
    friday <- c('fri', fri()[1], fri()[2], fri()[3], fri()[4])
    df[6,] <- friday
    
    saturday <- c('sat', sat()[1], sat()[2], sat()[3], sat()[4])
    df[7,] <- saturday
    
    return(df)
  })
  
  output$occ_table <-
    renderDataTable(occupancy_preview(), options = list(bLengthChange = F))
  
  observe({
    toggleState('occ_csv',
                condition = input$occ_filename != "" |
                  is.null(input$occ_filename))
  })
  output$occ_csv <- downloadHandler(
    filename = function() {
      paste(input$occ_filename, ".csv", sep = "")
    },
    content = function(file) {
      write.csv(occupancy(), file, na = 'NA')
      
      #update occupancy_preview
      rv$download_flag <- rv$download_flag + 1
    },
    contentType = "text/csv"
  )
}
