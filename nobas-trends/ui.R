library(shinydashboard)
source('dashboardHeader.R')
source('dashboardSidebar.R')
source('dashboardBody.R')

#to edit this stuff, go to the respective R file

ui <- dashboardPage(
  header,
  sidebar,
  body
)
