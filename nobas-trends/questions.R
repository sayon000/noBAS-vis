####This contains the questions that appear in each trend chart#####

#####UNIVERSAL CONSTANTS#######

QUESTION_PROMPT <- "Check each question to see if you are in good operation"


####Let's make this all navset panels instead of just boxes#####
#####Trend 1#####
trend1_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
  tabPanel("Questions",
           h1(QUESTION_PROMPT)
  ),
  tabPanel(div(class="navPanels", "Question 1"),
           h2("Are the fans running during unoccupied hours?"),
           h4("Faults:"),
           boxPlus(
             title = "Fans are on during unoccupied hours",
             collapsed = TRUE,
             collapsible = TRUE,
             closable = FALSE,
             solidHeader = TRUE,
             width = 12,
             tags$ul(
               tags$li("Do they need to be on for any reason, e.g. meeting setbacks? Might have to trend zone temps and setback temps."),
               tags$li("Are you using outside air for pre-cooling overnight?"),
               tags$li("Can the amount of time the fan runs during unoccupied periods be reduced?")
             )
           )
        )
      )
  )

######Trend 2a #####

trend2a_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel("Questions",
    h1(QUESTION_PROMPT)
             ),
    tabPanel(
      div(class="navPanels", "Question 1"),
      h2("Is the OAD open during unoccupied times?"),
      h4("Faults:"),
      boxPlus(
        title = "OAD is open during unoccupied times.",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Do they need to be open for any reason?"),
          tags$li("Are there times when OAD can be closed for a few hours?"),
          tags$li("Do you have the right occupancy schedule?"),
          tags$li("Is your AHU scheduled according to your occupancy schedule?"),
          tags$li("Are your dampers closing when your AHU is off?")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 2"),
      h2("Is the OAD open during startup when conditions are not favorable for economizing?"),
      h4("Faults:"),
      boxPlus(
        title = "OAD is open during startup when conditions are not favorable for economizing.",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Do they need to be open for any reason?"),
          tags$li("If not, can the BAS have controls to keep OAD closed during startup?")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 3"),
      h2("Are your dampers open more than the minimum position during occupied hours when not economizing?"),
      h4("Faults:"),
      boxPlus(
        title = "OAD position is not set to minimum position during occupied hours when conditions are not favorable for economizing.",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Are the zones served by this AHU required to run on 100% outside air?"),
          tags$li("Does demand control ventilation require more or less OA?")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 4"),
      h2("Are you over-ventilating? (OAD > 20%)"),
      h4("Faults:"),
      boxPlus(
        title = "Overventilation",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Is there any reason that the minimum damper position should be greater than 20% (special CO2 requirement, demand control ventilation)?"),
          tags$li("Is it working properly?"),
          tags$li("Check your CO2 in high occupancy load zones. Use Trend Chart 6.")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 5"),
      h2("Are you under-ventilating? (OAD < 10%)"),
      h4("Faults:"),
      boxPlus(
        title = "Underventilation",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Is there any reason that the minimum damper position should be less than 10% (special CO2 requirement, demand control ventilation)?"),
          tags$li("Check your CO2 in high occupancy load zones. Use Trend Chart 6.")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 6"),
      h2("Are Questions 1, 2, and 3 occurring simultaneously?"),
      h4("Faults:"),
      boxPlus(
        title = "Failure to close when commanded",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Is the OAF high when the OAD is at minimum position or closed?"),
          tags$li("What controls are enabled that could affect the damper position? Do they contradict?")
        )
      ),
      
      boxPlus(
        title = "High Leakage Rate when closed",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Is the OAF high when the OAD is at minimum position or closed?"),
          tags$li("Is the CO2 concentration similar to when the damper is open, irregardless of occupant load?"),
          tags$li("What position does the BAS consider fully closed? Does that correlate to the actual position?")
        )
      )
    )
  )
)

#####Trend 2b########

trend2b_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel("Questions",
             h1(QUESTION_PROMPT)
    ),
    tabPanel(
      div(class="navPanels", "Question 1"),
      h2("Is the OAD open during unoccupied times?"),
      h4("Faults:"),
      boxPlus(
        title = "OAD is open during unoccupied times.",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Do they need to be open for any reason?"),
          tags$li("Are there times when OAD can be closed for a few hours?"),
          tags$li("Do you have the right occupancy schedule?"),
          tags$li("Is your AHU scheduled according to your occupancy schedule?"),
          tags$li("Are your dampers closing when your AHU is off?")
        )
      )
    ),
    
    tabPanel(
      div(class="navPanels","Question 2"),
      h2("Is the OAD open during startup when conditions are not favorable for economizing?"),
      h4("Faults:"),
      boxPlus(
        title = "OAD is open during startup when conditions are not favorable for economizing.",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        width = 12,
        tags$ul(
          tags$li("Do they need to be open for any reason?"),
          tags$li("If not, can the BAS have controls to keep OAD closed during startup?")
        )
      )
    ),
    
    tabPanel(
      div(class="navPanels","Question 3"),
      h2("Are your dampers open more than the minimum position during occupied hours when not economizing?"),
      h4("Faults:"),
      boxPlus(
        title = "OAD position is not set to minimum position during occupied hours when conditions are not favorable for economizing.",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Are the zones served by this AHU required to run on 100% outside air?"),
          tags$li("Does demand control ventilation require more or less OA?")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 4"),
      h2("Are you over-ventilating? (OAD > 20%)"),
      h4("Faults:"),
      boxPlus(
        title = "Overventilation",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Is there any reason that the minimum damper position should be greater than 20% (special CO2 requirement, demand control ventilation)?"),
          tags$li("Is it working properly?"),
          tags$li("Check your CO2 in high occupancy load zones. Use Trend Chart 6.")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 5"),
      h2("Are you under-ventilating? (OAD < 10%)"),
      h4("Faults:"),
      boxPlus(
        title = "Underventilation",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Is there any reason that the minimum damper position should be less than 10% (special CO2 requirement, demand control ventilation)?"),
          tags$li("Check your CO2 in high occupancy load zones. Use Trend Chart 6.")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 6"),
      h2("Are Questions 1, 2, and 3 occurring simultaneously?"),
      h4("Faults:"),
      boxPlus(
        title = "Failure to close when commanded",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Is the OAF high when the OAD is at minimum position or closed?"),
          tags$li("What controls are enabled that could affect the damper position? Do they contradict?")
        )
      ),
      
      boxPlus(
        title = "High Leakage Rate when closed",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Is the OAF high when the OAD is at minimum position or closed?"),
          tags$li("Is the CO2 concentration similar to when the damper is open, irregardless of occupant load?"),
          tags$li("What position does the BAS consider fully closed? Does that correlate to the actual position?")
        )
      )
    )
  )
)

#####Trend 3#######

trend3_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel("Questions",
             h1(QUESTION_PROMPT)
    ),
    tabPanel(div(class="navPanels", "Question 1"),
             h2("Does the maximum CO2 level of densely occupied zones exceed 900 ppm for hours at a time?"),
             h4("Faults:"),
             boxPlus(
               title = "The maximum CO2 level of densely occupied zones exceeds 900 ppm for hours at a time",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               width = 12,
               tags$ul(
                 tags$li("Is the CO2 sensor calibrated? Is it located in a place that reflects room CO2?"),
                 tags$li("Is there demand control ventilation? Is it working properly?"),
                 tags$li("Can the minimum OAD position be increased?")
               )
             )
          ),
    
    tabPanel(div(class="navPanels", "Question 2"),
             h2("Do CO2 levels of densely occupied zones never exceed 750 ppm?"),
             h4("Faults:"),
             boxPlus(
               title = "The minimum OAD position is providing too much fresh air to the zones",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               width = 12,
               tags$ul(
                 tags$li("Is the CO2 sensor calibrated? Is it located in a place that reflects room CO2?"),
                 tags$li("Is there demand control ventilation? Is it working properly?"),
                 tags$li("Can the minimum OAD position be decreased?")
               )
             )
    )
  )
)

#####Trend 4c######
trend4c_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel("Questions",
             h1(QUESTION_PROMPT)
    ),
    tabPanel(div(class="navPanels", "Question 1"),
             h2("Are you economizing with your HCV open?"),
             h4("Faults:"),
             boxPlus(
               title = "Simultaneous cooling and heating (When not humidifying)",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("Check economizing settings and lockouts. Economizing should be disabled when heating and HCV should  be closed when economizing. Ensure that your Air Handler is not in cooling mode when it shouldn’t be.")
               )
             )
    )
  )
)

#####Trend 4d######

trend4d_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel("Questions",
             h1(QUESTION_PROMPT)
    ),
    tabPanel(div(class="navPanels", "Question 1"),
             h2("Are you economizing with your HCV open?"),
             h4("Faults:"),
             boxPlus(
               title = "Simultaneous cooling and heating (When not humidifying)",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("Check economizing settings and lockouts. Economizing should be disabled when heating and HCV should  be closed when economizing. Ensure that your Air Handler is not in cooling mode when it shouldn’t be.")
               )
             )
    )
  )
)

#####Trend 5a#####

trend5a_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel("Questions",
             h1(QUESTION_PROMPT)
    ),
    tabPanel(div(class="navPanels", "Question 1"),
             h2("Are you in cooling mode?"),
             h4("Faults:"),
             boxPlus(
               title = "Not in cooling mode",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("(See trend chart 2) If not in cooling mode, you should not be economizing."),
                 tags$li("The BAS does not know how to disable economizing while in heating mode."),
                 tags$li("Reprogram/disable economizing during heating.")
               )
             )
    ),
    
    tabPanel(div(class="navPanels", "Question 2"),
             h2("Is MAT not between OAT and RAT? (OAF)"),
             h4("Faults:"),
             boxPlus(
               title = "MAT is not between OAT and RAT",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("The temperature sensors are not calibrated properly."),
                 tags$li("The temperature sensors may not be properly located (ie. away from heating/cooling coils).")
               )
             )
    ),
    
    tabPanel(div(class="navPanels", "Question 3"),
             h2("Should you be economizing? Are you not?"),
             h4("Faults:"),
             boxPlus(
               title = "Economizer not following the sequence of operations",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("Operator override."),
                 tags$li("There may be issues with sensor calibration (e.g. humidity, temperature)."),
                 tags$li("OAD damper or actuator malfunction."),
                 tags$li("BAS is not executing economizing operations."),
                 tags$li("Is the economizing function overridden by another loop, such as DCV?")
               )
             )
    )
  )
)