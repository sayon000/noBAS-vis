sidebar <- dashboardSidebar(disable = TRUE,
  sidebarMenu(
    id = "tabs",
    menuItem("Home", tabName = "Home", icon = icon("home")),
    menuItem("AHU Trends", tabName = "AHU", icon = icon("wind")),
    menuItem("Chiller Plant Trends", tabName = "ChillerPlant", icon = icon("icicles")),
    menuItem("Boiler Plant Trends", tabName = "BoilerPlant", icon = icon("thermometer-full")),
    menuItem("Zone Trends", tabName = "Zone", icon = icon("coin")),
    menuItem("Perimeter Trends", tabName = "Perimeter", icon = icon("expand"))
  )
)


#USE THE SIDEBAR MENU SO THAT YOU CAN FOLLOW WHAT HAPPENS IN THE BRT TOOL
#Link to it: https://www.cunybpl.org/nobas-brt-user-guide-v3/