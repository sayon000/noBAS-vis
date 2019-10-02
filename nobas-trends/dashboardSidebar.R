sidebar <- dashboardSidebar(disable = TRUE,
  sidebarMenu(
    id = "tabs",
    menuItem("Home", tabName = "Home", icon = icon("home")),
    menuItem("AHU Trends", tabName = "AHU", icon = icon("wind")),
    menuItem("Chiller Plant Trends", tabName = "ChillerPlant", icon = icon("icicles")),
    menuItem("Boiler Plant Trends", tabName = "BoilerPlant", icon = icon("thermometer-full")),
    menuItem("Zone Trends", tabName = "Zone", icon = icon("coin")),
    menuItem("Perimeter Trends", tabName = "Perimeter", icon = icon("expand")),
    menuItem("Testing", tabName = "AHUmain", icon = icon("accusoft")),
    menuItem("Trend ONE", tabName = "trend1", icon = icon("accusoft")),
    menuItem('Trend Two', tabName = "trend2b", icon = icon("accusoft")),
    menuItem('Trend Three', tabName = 'trend3', icon = icon('accusoft')),
    menuItem('Trend 13a',tabName = 'trend13a',icon = icon('wind')),
    menuItem('Trend 19a', tabName = 'trend19a', icon = icon("expand")),
    menuItem('Trend 26', tabName = 'trend26', icon = icon("accusoft")),
    menuItem('Trend 27',tabName = 'trend27', icon = icon('queen'))
  )
)


#USE THE SIDEBAR MENU SO THAT YOU CAN FOLLOW WHAT HAPPENS IN THE BRT TOOL
#Link to it: https://www.cunybpl.org/nobas-brt-user-guide-v3/