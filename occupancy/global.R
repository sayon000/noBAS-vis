#This application allows the user create and download an 'occupancy schedule' csv file
#An occupancy schedule .csv file can be used in other noBAS plotting applications using code from modules.R

library(shiny)
library(shinyjs)
library(DT)
library(shinythemes)

TZ='UTC' #avoid timezone errors
DAY_MIN <- as.POSIXlt("00:00",tz=TZ,"%H:%M")
DAY_MAX <- as.POSIXlt("23:59",tz=TZ,"%H:%M")
DAY_START <- as.POSIXlt("09:00",tz=TZ,"%H:%M")
DAY_END <- as.POSIXlt("17:00",tz=TZ,"%H:%M")
STARTUP_START <- as.POSIXlt("7:00",tz=TZ,"%H:%M")
STEP <- 900 #15 minutes
TIME_FORM = "%I:%M %p"