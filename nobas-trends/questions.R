####This contains the questions that appear in each trend chart#####

###STEP 2 IS TO MAKE EVERYTHING LOOK BIGGER####
#####UNIVERSAL CONSTANTS#######

QUESTION_PROMPT <- "Check each question to see if you are in good operation"

#NAMES OF PLOTS#
trend1_name <- "Trend 1: Fan Status"
trend2a_name <- "Trend 2a: OA Control Using OAD"
trend2b_name <- "Trend 2b: OA Control Using OAF"
trend3_name <- "Trend 3: Minimum OAD Position"
trend4c_name <- "Trend 4c: Simultaneous Heating & Cooling"
trend4d_name <- "Trend 4d: Simultaneous Heating & Cooling"
trend5a_name <- "Trend 5a: Economizing Using Temperature or Enthalpy"
trend7_name <- "Trend 7: DAT Control"
trend8a_name <- "Trend 8a: Compressor Cycling & Staging"
trend8b_name <- "Trend 8b: Burner Cycling & Staging"
trend10_name <- "Trend 10: Heating/Cooling Mode"
trend12_name <- "Trend Chart 12: Chiller Plant Schedule"
trend13a_name <- "Trend Chart 13a: Chilled Water Delta T"
trend14a_name <- "Trend Chart 14a: ChWST Reset"
trend15_name <- "Trend Chart 15: Cooling Tower Scheduling"
trend17_name <- "Trend Chart 17: Steam Boiler Condensate Return Temperature"
trend18_name <- "Trend Chart 18: Boiler Plant Scheduling"
trend19a_name <- "Trend Chart 19a: Hot Water Temperature Reset"
trend20a_name <- "Trend Chart 20a: Hot Water Loop: Delta T"
trend21_name <- "Trend Chart 21: Condensing Boiler Efficiency"
trend22_name <- "Trend Chart 22: Boiler Cycling & Staging"
trend23_name <- "Trend Chart 23: Hot Water Temperature Hunting"
trend26_name <- "Trend Chart 26: Zone Temperature Setpoint"
trend2737a_name <- "Trend Chart 27-37a: Heating Status"
trend27b_name <- "Trend Chart 27b: Constant Volume Air System With a Heating Coil or Burner"
trend28b_name <- "Trend Chart 28b: VAV without Reheats"
trend29b_name <- "Trend Chart 29b: VAV with Reheats"
trend30b_name <- "Trend Chart 30b: DAT Modulates Based on RAT"
trend31b_name <- "Trend Chart 31b: Constant Volume Air System with a DATSP"
trend32b_name <- "Trend Chart 32b: Constant Volume Air System without a DATSP"
trend33b_name <- "Trend Chart 33b: Constant Volume On/Off Air System With a Heating Coil or Burner"
trend34b_name <- "Trend Chart 34b: VAV without Reheats"
trend36b_name <- "Trend Chart 36b: DAT based on RAT"
trend37b_name <- "Trend Chart 37b: Constant Volume Air System Based on DAT"



####Let's make this all navset panels instead of just boxes#####
#####Trend 1#####
trend1_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
  tabPanel(div(class = "navTitles","Questions"),
           h1(QUESTION_PROMPT)
  ),
  tabPanel(div(class="navPanels", "Question 1"),
           h2("Are the fans running during unoccupied hours?"),
           div(class="faultTitle",strong("Faults:")),
           boxPlus(
             title = div(class="faultTitle",strong("Fans are on during unoccupied hours")),
             collapsed = TRUE,
             collapsible = TRUE,
             closable = FALSE,
             solidHeader = TRUE,
             width = 12,
             div(class="questionStuff",
                tags$ul(
                  tags$li("Do they need to be on for any reason, e.g. meeting setbacks? Might have to trend zone temps and setback temps."),
                  tags$li("Are you using outside air for pre-cooling overnight?"),
                  tags$li("Can the amount of time the fan runs during unoccupied periods be reduced?")
                )
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
    tabPanel(div(class = "navTitles","Questions"),
    h1(QUESTION_PROMPT)
             ),
    tabPanel(
      div(class="navPanels", "Question 1"),
      h2("Is the OAD open during unoccupied times?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = div(class="faultTitle",strong("OAD is open during unoccupied times.")),
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        div(class="questionStuff",
          tags$ul(
            tags$li("Do they need to be open for any reason?"),
            tags$li("Are there times when OAD can be closed for a few hours?"),
            tags$li("Do you have the right occupancy schedule?"),
            tags$li("Is your AHU scheduled according to your occupancy schedule?"),
            tags$li("Are your dampers closing when your AHU is off?")
          )
        )
      )
    ),
    
    tabPanel(
      div(class="navPanels","Question 2"),
      h2("Is the OAD open during startup when conditions are not favorable for economizing?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = div(class="faultTitle",strong("OAD is open during startup when conditions are not favorable for economizing.")),
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        div(class="questionStuff",
          tags$ul(
            tags$li("Do they need to be open for any reason?"),
            tags$li("If not, can the BAS have controls to keep OAD closed during startup?")
          )
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 3"),
      h2("Are your dampers open more than the minimum position during occupied hours when not economizing?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = div(class="faultTitle",strong("OAD position is not set to minimum position during occupied hours when conditions are not favorable for economizing.")),
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
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = div(class="faultTitle",strong("Overventilation")),
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
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = div(class="faultTitle",strong("Underventilation")),
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
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = div(class="faultTitle",strong("Failure to close when commanded")),
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
        title = div(class="faultTitle",strong("High Leakage Rate when closed")),
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
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(
      div(class="navPanels", "Question 1"),
      h2("Is the OAD open during unoccupied times?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = div(class="faultTitle",strong("OAD is open during unoccupied times.")),
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
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = div(class="faultTitle",strong("OAD is open during startup when conditions are not favorable for economizing.")),
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
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = div(class="faultTitle",strong("OAD position is not set to minimum position during occupied hours when conditions are not favorable for economizing.")),
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
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = div(class="faultTitle",strong("Overventilation")),
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
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = div(class="faultTitle",strong("Underventilation")),
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
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = div(class="faultTitle",strong("Failure to close when commanded")),
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
        title = div(class="faultTitle",strong("High Leakage Rate when closed")),
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
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(div(class="navPanels", "Question 1"),
             h2("Does the maximum CO2 level of densely occupied zones exceed 900 ppm for hours at a time?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = div(class="faultTitle",strong("The maximum CO2 level of densely occupied zones exceeds 900 ppm for hours at a time")),
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
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
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = div(class="faultTitle",strong("The minimum OAD position is providing too much fresh air to the zones")),
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
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
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(div(class="navPanels", "Question 1"),
             h2("Are you economizing with your HCV open?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = div(class="faultTitle",strong("Simultaneous cooling and heating (When not humidifying)")),
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
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(div(class="navPanels", "Question 1"),
             h2("Are you economizing with your HCV open?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = div(class="faultTitle",strong("Simultaneous cooling and heating (When not humidifying)")),
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
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(div(class="navPanels", "Question 1"),
             h2("Are you in cooling mode?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = div(class="faultTitle",strong("Not in cooling mode")),
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
             div(class="faultTitle",strong("Faults:")),
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
             div(class="faultTitle",strong("Faults:")),
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
#####Trend 7######
trend7_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(div(class="navPanels", "Question 1"),
             h2(" Is the system having trouble meeting the DATSP?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "DAT does not meet DATSP",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("Does the HCV/CCV respond to the signal?"),
                 tags$li("Are there any leaks in HCV/CCV?"),
                 tags$li("Is the AHU undersized?")
               )
             )
    ),
    
    tabPanel(div(class="navPanels", "Question 2"),
             h2(" Is the DAT hunting/stable?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "DAT hunting",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("What is the operating differential? Can it be increased?"),
                 tags$li("Is the compressor/burner staging operating correctly? (see trend charts 8a and 8b)"),
                 tags$li("Is there unstable heating/cooling coil valve modulation?"),
                 tags$li("Does your PID control loop need to be tuned?")
               )
             )
    ),
    
    tabPanel(div(class="navPanels", "Question 3"),
             h2("For a dynamic DATSP: Is the DATSP erratic or unstable?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "Erratic DATSP",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("What is controlling the DATSP?"),
                 tags$li("Can you plot the parameters associated with the control loop? (use short duration intervals, e.g. 1 minute)")
               )
             )
    )
  )
)

#####Trend 8a #####

trend8a_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(div(class="navPanels", "Question 1"),
             h2("Are the compressors short cycling?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "Short cycling",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("DAT / DATSP operating differential is too tight."),
                 tags$li("PID loop is out of tune.")
               )
             )
    ),
    
    tabPanel(div(class="navPanels", "Question 2"),
             h2("Are the compressors not staged properly?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "Compressors are not staged properly",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("Staging controls not operating properly.")
               )
             )
    )
  )
)
#####Trend 8b######
trend8b_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(div(class="navPanels", "Question 1"),
             h2("Are the burners short cycling?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "Short cycling",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("DAT / DATSP operating differential is too tight."),
                 tags$li("PID loop is out of tune.")
               )
             )
    ),
    
    tabPanel(div(class="navPanels", "Question 2"),
             h2("Are the burners not staged properly?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "Burners are not staged properly",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("Staging controls not operating properly.")
               )
             )
    )
  )
)
#####Trend 10#####
trend10_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(div(class="navPanels", "Question 1"),
             h2("Is the AHU in cooling or heating mode? "),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "NO FAULTS (expand for details)",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("If MAT < DAT, heating mode"),
                 tags$li("If MAT > DAT, cooling mode"),
                 tags$li("Knowing whether you are in heating or cooling mode will help with the diagnosis of the other trend charts.")
               )
             )
    )
  )
)
#####Trend 12#####
trend12_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(div(class="navPanels", "Question 1"),
             h2("Is the chiller not following the occupancy (and start up) schedule?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "Chiller does not follow the schedule",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("Chiller is on for another reason, such as to satisfy cooling needs for a data center."),
                 tags$li("Chiller is scheduled at odd times to address demand charges."),
                 tags$li("Chiller is not scheduled properly.")
               )
             )
    )
  )
)
#####Trend 13a#####
trend13a_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(div(class="navPanels", "Question 1"),
             h2("Is my Delta-T (ChWST and ChWRT differential) too small? "),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "Delta-T is too small (such as below 10°F when the load is high)",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("LDP is set too high, creating a high ChW flow rate and low Delta T. Incrementally decrease the LDP setpoint to avoid not getting enough flow to zones that are far away.")
               )
             )
    ),
    
    tabPanel(div(class="navPanels", "Question 2"),
             h2("LDP not properly maintained by modulating pump speed?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "LDP is not maintained well",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("LDP sensor problem."),
                 tags$li("Control loop problem.")
               )
             )
    ),
    
    tabPanel(div(class="navPanels", "Question 3"),
             h2("Does pump speed not vary?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "Pump speed constant when LDP varies",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("Control loop not operating.")
               )
             ),
             
             boxPlus(
               title = "Pump speed constant, LDP constant",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("The VFD may not be working."),
                 tags$li("Piping problem: 3-way valves instead of 2-way valves prevent variable pressure."),
                 tags$li("Bypass loop could be opened.")
               )
             )
    )
  )
)
#####Trend 14a######
trend14a_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(div(class="navPanels", "Question 1"),
             h2("Does your ChWST-SP not have a reset schedule? What is it based on? (such as OAT, occupancy, maximum cooling coil valve position)"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "No ChWST-SP reset",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("ChWST reset was never set up"),
                 tags$li("Can it be automated?")
               )
             )
    ),
    
    tabPanel(div(class="navPanels", "Question 2"),
             h2("Are your maximum CCV positions below 90%?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "The maximum CCV position is often well below 90%",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("ChWST-SP is too low"),
                 tags$li("Can you have your BAS programmed to dynamically reset the ChWST-SP to adjust so that the maximum CCV position is always 90%?")
               )
             )
    )
  )
)

#####Trend 15#######
trend15_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(div(class="navPanels", "Question 1"),
             h2("Are the fans on during unoccupied hours?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "Cooling tower fans run for many hours before occupancy",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("Standard start up time based on the worst day of the year."),
                 tags$li("Can scheduling be more aggressive without introducing a significant risk of not reaching comfort during the day?")
               )
             )
    ),
    
    tabPanel(div(class="navPanels", "Question 2"),
             h2("Are the fans short cycling? (turning on and off in short periods of time)"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "Fans short cycling",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("Control loop not operating properly and/or needs tuning."),
                 tags$li("The condenser water supply temperature needs to be reset.")
               )
             )
    )
  )
)
#####Trend 17#####
trend17_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(div(class="navPanels", "Question 1"),
             h2("Is the condensate return temperature too high?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "Condensate return temperature is too high",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("Faulty steam traps.")
               )
          )
    )
  )
)
#####Trend 18#####
trend18_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(div(class="navPanels", "Question 1"),
             h2("Is the boiler not following the occupancy schedule?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "Boiler does not follow the occupancy schedule",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("Not scheduled properly: change the boiler schedule"),
                 tags$li("Boiler needed for meeting zone setback temperatures"),
                 tags$li("Boiler needed for freeze protection below 38 ℉ (can boiler not operate above OAT = 38℉")
               )
             )
    ),
    
    tabPanel(div(class="navPanels", "Question 2"),
             h2("Is the boiler running when heating should be locked out? (such as 50℉) "),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "Boiler is running when heating should be locked out",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("Disabling cutoff temperature not operating"),
                 tags$li("No cutoff temperature is programmed"),
                 tags$li("Boiler must operate to provide other services such as DHW, Pool Heating, etc. ")
               )
             )
    )
  )
)
#####Trend 19a######
trend19a_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(div(class="navPanels", "Question 1"),
             h2("Is HW reset failing to work properly or not aggressive enough?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "No HW reset",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("No HW reset is available."),
                 tags$li("HW reset controller not set properly."),
                 tags$li("HW reset controller not working."),
                 tags$li("If HW is solely for heating coils, consider programming HWST-SP based on a maximum HCV position of 90%.")
               )
             ),
             
             boxPlus(
               title = "HW reset is ineffective",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("Is the control loop functioning properly?")
               )
             )
    ),
    
    tabPanel(div(class="navPanels", "Question 2"),
             h2("Is your average HCV position well below 50%?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "The average HCV position is often well below 50% (for systems where HW is used solely for heating coils)",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("HWST-SP is generally too high. ")
               )
             )
    ),
    
    tabPanel(div(class="navPanels", "Question 3"),
             h2("Is your maximum HCV position well below 90%?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "The maximum HCV position is often well below 90% (for systems where HW is used solely for heating coils) ",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("If HW is solely for heating coils, consider programming HWST-SP based on meeting a maximum HCV position of 90%.")
               )
             )
    )
  )
)

#####Trend 20a#####
trend20a_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(div(class="navPanels", "Question 1"),
             h2("Is my delta T (HWST - HWRT) too small? "),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "Delta T too small (below 10°F) during high load times",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("Hot water is being over-pumped.")
               )
             )
    ),
    
    tabPanel(div(class="navPanels", "Question 2"),
             h2("Is LDP not properly maintained by modulating pump speed?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "LDP is not maintained well",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("LDP sensor problem."),
                 tags$li("Control loop problem.")
               )
             )
    ),
    
    tabPanel(div(class="navPanels", "Question 3"),
             h2("Does pump speed fail to vary?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "Pump speed constant when LDP varies",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("Control loop not working.")
               )
             ),
             boxPlus(
               title = "Pump speed constant, LDP constant",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("Piping problem: 3-way valves instead of 2-way valves prevent variable pressure.")
               )
             )
    )
  )
)
#####Trend 21
#####Trend 21#####
trend21_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(div(class="navPanels", "Question 1"),
             h2("Is the condensate return temperature too high?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "Is HWRT above 130°F?",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("Over-pumping minimizes delta T. Reduce LDP-SP to reduce pump speed, causing HWRT to drop."),
                 tags$li("HWST too high for a condensing boiler with a good Delta-T. Incrementally reduce HWST, ensuring all zone heating needs are satisfied.")
               )
             )
    )
  )
)
#####Trend 22 #####
trend22_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(div(class="navPanels", "Question 1"),
             h2("Is the boiler short cycling?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "Short cycling",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("The boiler could be oversized."),
                 tags$li("Pressuretrols/ aquastats are not set properly (such as operating differential too small) or out of calibration."),
                 tags$li("The boiler may be overfiring."),
                 tags$li("The lead-lag controller is not programmed/ working properly. ")
               )
             )
    ),
    
    tabPanel(div(class="navPanels", "Question 2"),
             h2("Does Stack temperature show that my burner is cycling on/off or modulating?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "Stack temperature is higher than expected or not modulating with burner",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("Tubes are fouled."),
                 tags$li("Burner modulation not operating properly.")
               )
             )
    ),
    
    tabPanel(div(class="navPanels", "Question 3"),
             h2("Is my stack temperature too high?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "Stack temperature is higher than expected or not modulating with burner",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("Tubes are fouled."),
                 tags$li("Burner modulation not operating properly.")
               )
             )
    )
  )
)
#####Trend 23#####
trend23_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(div(class="navPanels", "Question 1"),
             h2("Is the HWST failing to follow its setpoint?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "HWST does not follow its setpoint",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("Control loop not operating properly."),
                 tags$li("Aquastat not working.")
               )
             )
    ),
    
    tabPanel(div(class="navPanels", "Question 2"),
             h2(" Is there hunting?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "HWST is hunting",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("Aquastat operating differential is not set properly.")
               )
             )
    )
  )
)
#####Trend 26#####
trend26_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(div(class="navPanels", "Question 1"),
             h2("Is the Zone Temperature not meeting its Zone Temperature Set-point?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "Zone temperature does not meet its set point",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("Thermostat / VAV damper control loop is not working."),
                 tags$li("VAV box is starved or stuffed.")
               )
             )
    ),
    
    tabPanel(div(class="navPanels", "Question 2"),
             h2("Is the deadband not wide enough (below 5℉), allowing alternating heating and cooling to occur?"),
             h4("Faults:"),
             boxPlus(
               title = "Deadband (number of degrees between heating and cooling setpoints) is below 5℉",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("Bad setpoints cause alternating heating / cooling: Increase the deadband to at least 5℉.")
               )
             )
    ),
    
    tabPanel(div(class="navPanels", "Question 3"),
             h2("Is the zone temperature not floating toward the setback temperature during unoccupied times?"),
             h4("Faults:"),
             boxPlus(
               title = "Zone temperature does not float toward the setback temperature during unoccupied times",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("Zone temperature controls not working to allow zone temp to float."),
                 tags$li("For a zone temperature setback on the air system, the perimeter heating system is independently heating the space during unoccupied times. ")
               )
             ),
             boxPlus(
               title = "Zone temperature does not float toward the setback temperature during unoccupied times",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("Zone temperature setbacks should be reduced to 55-60 °F during heating season, and raised to 80-85℉ during cooling season. Incremental changes / trial and error needed, especially for a leaky envelope and/or if your building takes a long time to reach occupied zone temperature setpoints. Check to see how your building responds and move to a more aggressive setback if everything is okay.")
               )
             )
    )
  )
)

#####Trend 2737a#####
trend2737a_panel <- box(
  solidHeader = TRUE,
  h2("No Questions Here")
)
#####Trend 27b#####
trend27b_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(
      div(class="navPanels", "Question 1"),
      h2("Is the system failing to meet the ZTSP-A?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Failing to meet ZTSP-A",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Check if the HCV opens or modulates its position (or burners fire) as a response to the call for heat."),
          tags$li("Ensure that the DAT is appropriate and that the fan is on."),
          tags$li("If there is a control loop between DAT, HCV, and ZTSP, tune it."),
          tags$li("If the HCV (or burners) and DAT are fine, change the HWST set point so the ZTSP-A can be met."),
          tags$li("If the above does not get to the issue, check your perimeter system:"),
          tags$li("For underheating, check that there is heat provided by the perimeter system."),
          tags$li("For overheating, reduce the heating from the perimeter system.")
        )
      )
    ),
    
    tabPanel(
      div(class="navPanels","Question 2"),
      h2("Are there frequent HCV fluctuations or is there burner cycling?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Heating coil valve fluctuations or burner(s) is/are short-cycling",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("The interaction of the perimeter and air systems may be causing the instability. Check controls and/or PID loop for the AHU DAT and that for the perimeter system HWST.")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 3"),
      h2("Is the supply fan on during unoccupied times?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Supply fan is on during unoccupied times",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Does your building use setbacks and/or early startups? Cycling to meet setbacks and starting before occupied times might be OK."),
          tags$li("Is the programmed schedule correct?")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 4"),
      h2("If there are nighttime setbacks, are both systems running at night?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Both systems run at night to meet nighttime setbacks",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Can the nighttime setbacks be met solely with the perimeter system? Doing so will eliminate fan operation. This may require changing your HWST set point or HW reset settings.")
        )
      )
    )
  )
)
#####Trend 28b#####
trend28b_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(
      div(class="navPanels", "Question 1"),
      h2("Are you failing to meet your ZTSP-A?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Failing to meet ZTSP-A",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Check if the VAV dampers modulate their positions to meet ZTSP-A. If not, tune it."),
          tags$li("Check if the HCV modulates its position (or burner(s) go on, modulate, or stage) to meet the DATSP."),
          tags$li("Check that your DATSP is above the ZTSP-A."),
          tags$li("Check that the DAT is meeting DATSP. If not, tune the loop."),
          tags$li("For underheating, check that there is heat provided by the perimeter system. "),
          tags$li("For underheating, if perimeter system is providing heat, and if HCV is at 100% (or burners on full), and VAV is starved, you may have to increase your HWST set point. "),
          tags$li("For overheating, reduce the heating from the perimeter system.")
        )
      )
    ),
    
    tabPanel(
      div(class="navPanels","Question 2"),
      h2("Are there frequent heating coil valve fluctuations or is there burner cycling?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Heating coil valve fluctuations or burner(s) is/are short-cycling",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("The interaction of the perimeter and air systems may be causing the instability. Check controls and/or PID loop for the AHU DAT and that for the perimeter system HWST.")
        )
      )
    ),
    
    tabPanel(
      div(class="navPanels","Question 3"),
      h2(" Is the supply fan on during unoccupied times?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Supply fan is on during unoccupied times",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Does your building use setbacks and/or early startups? Cycling to meet setbacks and starting before occupied times might be OK."),
          tags$li("Is the programmed schedule correct?")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 4"),
      h2("Are the VAV damper positions below 50% or above 75%?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Most of the VAV damper positions are below 50% or above 75%",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Duct static pressure is set too high or too low."),
          tags$li("Control loop for VAV damper is not working."),
          tags$li("DATSP is too high or too low.")
        )
      ),
      boxPlus(
        title = "VAV Damper Positions change too frequently",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Check controls or PID loop.")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 5"),
      h2("Is DAT greater or less than ZT? "),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "DATSP < ZTSP-A",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Not a recommended configuration, as there is no thermostat for the perimeter system.")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 6"),
      h2("If there are nighttime setbacks, are both systems running at night?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Both systems run at night to meet nighttime setbacks",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Can the nighttime setbacks be met solely with the perimeter system? This may require changing your HWST set point or HW reset settings.")
        )
      )
    )
  )
)
#####Trend 29b#####
trend29b_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(
      div(class="navPanels", "Question 1"),
      h2("Does the system fail to meet its DATSP and ZTSP-A?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Fails to meet DATSP",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Check the control loop between the HCV and the DAT. Tune if needed.")
        )
      ),
      boxPlus(
        title = "Fails to meet ZTSP-A",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("If VAVs, check if the VAV dampers modulate their positions to meet ZTSP-A. If not, tune it."),
          tags$li("Check that the DAT is meeting DATSP. If not, tune the loop."),
          tags$li("Check if reheat valves modulate to meet the ZTSP-A."),
          tags$li("For underheating, check that there is heat provided by the perimeter system. "),
          tags$li("For underheating, if perimeter system is providing heat, and if HCV is at 100% (or burners on full), and VAV is starved, and the reheat valve is fully open, you may have to increase your DATSP and/or HWST set point. "),
          tags$li("For overheating, reduce the heating from the perimeter system. ")
        )
      )
    ),
    
    tabPanel(
      div(class="navPanels","Question 2"),
      h2("Are there frequent heating coil valve fluctuations or is there burner cycling?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Heating coil valve fluctuations or burner(s) is/are short-cycling",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("The interaction of the perimeter and air systems may be causing the instability. Check controls and/or PID loop for the AHU DAT and that for the perimeter system HWST.")
        )
      )
    ),
    
    tabPanel(
      div(class="navPanels","Question 3"),
      h2("Are there frequent valve fluctuations for the reheat coil?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Reheat valve hunting",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Check controls or PID loop.")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 4"),
      h2("Is the supply fan on during unoccupied times?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Supply fan is on during unoccupied times",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Does your building use setbacks and/or early startups? Cycling to meet setbacks and starting before occupied times might be OK."),
          tags$li("Is the programmed schedule correct?")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 5"),
      h2("Is DAT greater or less than ZT?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "DAT > ZT",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Possible overheating and negating the need for reheats and you lose zone-specific controls; not a recommended configuration.")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 6"),
      h2("Are the VAV damper positions below 50% or above 75%?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Most of the VAV damper positions are below 50% or above 75%",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Duct static pressure is set too high or too low."),
          tags$li("Control loop for VAV damper is not working."),
          tags$li("DATSP is too high or too low.")
        )
      ),
      boxPlus(
        title = "VAV Damper Positions change too frequently",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Check controls or PID loop.")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 7"),
      h2("What is the maximum HCV position when reheat coils are active?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Majority of reheat valves are throttled to typically less than 70%",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Implement HWLDPSP reset so that the maximum HCV position is around 90% open.")
        )
      )
    ),
    
    tabPanel(
      div(class="navPanels","Question 8"),
      h2("Are the majority of the reheats active?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Majority of reheat valves are throttled to typically less than 70%",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Implement HWLDPSP reset so that the maximum HCV position is around 90% open.")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 9"),
      h2("If there are nighttime setbacks, are both systems running at night?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Both systems run at night to meet nighttime setbacks",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Can the nighttime setbacks be met solely with the perimeter system? This may require changing your HWST set point or HW reset settings.")
        )
      )
    )
  )
)
#####Trend 30b#####
trend30b_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(
      div(class="navPanels", "Question 1"),
      h2("Are there frequent heating coil valve fluctuations or is there burner cycling?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Heating coil valve fluctuations or burner(s) is/are short-cycling",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("The interaction of the perimeter and air systems may be causing the instability. Check controls and/or PID loop for the AHU DAT and that for the perimeter system HWST.")
        )
      )
    ),
    
    tabPanel(
      div(class="navPanels","Question 2"),
      h2("Does the RAT fail to meet its setpoint?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "RATSP is not met",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Check controls sequence – see that DAT modulates to meet the RATSP, and that the HCV modulates to meet the DATSP. May need to tune the control loop.")
        )
      )
    ),
    
    tabPanel(
      div(class="navPanels","Question 3"),
      h2("Does RAT fail to change in order to meet the RATSP?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "If RAT<RATSP despite increasing DAT",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Check for air infiltration in the zones."),
          tags$li("HWST may be too low to meet the load. Increase HWSTSP or change HW reset settings")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 4"),
      h2("Is the supply fan on during unoccupied times?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Supply fan is on during unoccupied times",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Does your building use setbacks and/or early startups? Cycling to meet setbacks and starting before occupied times might be OK."),
          tags$li("Is the programmed schedule correct?")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 5"),
      h2("Are your zone temperatures uneven?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Zone temperatures are uneven – some too hot, some too cold",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Check air balance."),
          tags$li("Check for air infiltration in cold zones.")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 6"),
      h2("If there are nighttime setbacks, are both systems running at night?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Both systems run at night to meet nighttime setbacks",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Can the nighttime setbacks be met solely with the perimeter system? This may require changing your HWST set point or HW reset settings.")
        )
      )
    )
  )
)
#####Trend 31b#####
trend31b_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(
      div(class="navPanels", "Question 1"),
      h2("Does the system fail to meet its DATSP?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Not meeting DATSP",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Does the HCV modulate to meet DATSP? If not, tune the control loop.")
        )
      )
    ),
    
    tabPanel(
      div(class="navPanels","Question 2"),
      h2("Are your zone and return temperatures too hot or cold?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Zone temps too hot or too cold",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("If the control loop between DAT and DATSP is working, adjust the DATSP or HWSTSP until the zone temperature or return temperatures are in an appropriate range."),
          tags$li("If valve positions (both for heating coils and for perimeter system) are all wide open or throttled, consider changing loop differential pressure set points for either or both hot water loops.")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 3"),
      h2("Is the supply fan on during unoccupied times?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Supply fan is on during unoccupied times",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("If air systems can be turned off at night, schedule it to do so. Remember freeze protection!")
        )
      )
    ),
    
    tabPanel(
      div(class="navPanels","Question 4"),
      h2("Are there frequent heating coil valve fluctuations or is there burner cycling?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Heating coil valve fluctuations or burner(s) is/are short-cycling",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("The interaction of the perimeter and air systems may be causing the instability. Check controls and/or PID loop for the AHU DAT and that for the perimeter system HWST.")
        )
      )
    )
  )
)
#####Trend 32b#####
trend32b_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(div(class="navPanels", "Question 1"),
             h2("Are your zone or return temperatures too hot or cold?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "Zones too hot or too cold",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("This system does not have many controls or set points available. Adjustments are typically manual for systems like these, and may include trial and error with the following settings:"),
                 tags$ul(
                   tags$li("HWSTSP"),
                   tags$li("LDPSP (may not be any of these)"),
                   tags$li("Schedules"),
                   tags$li("Valve positions (hot water to perimeter and/or HCV)")
                 )
               )
             )
    ),
    
    tabPanel(div(class="navPanels", "Question 2"),
             h2("Is the supply fan on during unoccupied times?"),
             div(class="faultTitle",strong("Faults:")),
             boxPlus(
               title = "Supply fan is on during unoccupied times",
               collapsed = TRUE,
               collapsible = TRUE,
               closable = FALSE,
               solidHeader = TRUE,
               width = 12,
               tags$ul(
                 tags$li("If air systems can be turned off at night, schedule it to do so. Remember freeze protection!")
               )
             )
    )
  )
)
#####Trend 33b#####
trend33b_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(
      div(class="navPanels", "Question 1"),
      h2("Do zone temperatures fail to meet their setpoints?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "ZTs not meeting their setpoints",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("If ZTSP-P > ZTSP-A, the perimeter system controls meeting the ZTSP. In this case:"),
          tags$li("Check that perimeter system valves serving the zones are operating properly."),
          tags$li("Check that HWSTSP is sufficient to meet the load."),
          tags$li("If ZTSP-P < ZTSP-A, the air system controls meeting the ZTSP. In this case:"),
          tags$li("Check that the control loop between the DAT and ZTSP-A is tuned properly (if this loop exists)."),
          tags$li("Check that the HCV valve (or burner) modulates to meet the ZTSP-A (If this loop exists)."),
          tags$li("Check the HCV position; if fully open and zone temps too cold, increase LDPSP and/or HWSTSP (or HW reset settings).")
        )
      )
    ),
    
    tabPanel(
      div(class="navPanels","Question 2"),
      h2("Is the supply fan on during unoccupied times?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Supply fan is on during unoccupied times",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("If air systems can be turned off at night, schedule it to do so. Remember freeze protection!")
        )
      )
    ),
    
    tabPanel(
      div(class="navPanels","Question 3"),
      h2("Are there frequent heating coil valve fluctuations or burner cycling?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Heating coil valve fluctuations or burner(s) is/are short-cycling",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("The interaction of the perimeter and air systems may be causing the instability. Check controls and/or PID loop for the AHU DAT and that for the perimeter system HWST.")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 4"),
      h2("Are your ZTSP-P and ZTSP-A within one or two degrees of each other?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "ZTSP-P and ZTSP-A are within 1-2°F of each other",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Select the system to dominate heating and set that ZTSP significantly higher (at least 5°F) across all zones served. Be sure this is true for all zones, otherwise the second system will remain on to serve the zone (or zones) where the rule is not followed.")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 5"),
      h2("If there are nighttime setbacks, are both systems running at night?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Both systems run at night to meet nighttime setbacks",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Can the nighttime setbacks be met solely with the perimeter system? This may require changing your HWST set point or HW reset settings.")
        )
      )
    )
  )
)
#####Trend 34b#####
trend34b_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(
      div(class="navPanels", "Question 1"),
      h2("Do zone temperatures fail to meet their setpoints? IF YES, ask Qs. 1a–c, too!"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Zones not meeting their set points",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("If ZTSP-P > ZTSP-A, the perimeter system controls meeting the ZTSP. In this case:"),
          tags$li("Check that perimeter system valves serving the zones are operating properly."),
          tags$li("Check that HWSTSP is sufficient to meet the load."),
          tags$li("If ZTSP-P < ZTSP-A, the air system controls meeting the ZTSP. In this case: "),
          tags$li("Check that the zone thermostats are controlling the VAVs properly. "),
          tags$li("Check that the HCV valve (or burner) modulates to meet the DATSP."),
          tags$li("Check the HCV position; if fully open and zone temps too cold, increase LDPSP and/or HWSTSP (or HW reset settings).")
        )
      )
    ),
    
    tabPanel(
      div(class="navPanels","Question 1a"),
      h2("Is DAT > ZT when ZTSP-P (or TRVSP) > ZTSP-A?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "DAT>ZTSP-A when ZTSP-P (or TRVSP)>ZTSP-A",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("This is not a recommended setup. Potential overheating in the zones, suggest reducing VAV Damper Position to min positions and lower DATSP.")
        )
      )
    ),
    
    tabPanel(
      div(class="navPanels","Question 1b"),
      h2("Is DAT < ZT when ZTSP-P (or TRVSP) < ZTSP-A? "),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "DAT<ZTSP-A when ZTSP-P (or TRVSP) < ZTSP-A",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("This is not a recommended setup. This will cause underheating in the zones. Increase DATSP or ZTSP-P. ")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 1c"),
      h2("When ZTSP-P (or TRVSP) > ZTSP-A and DAT < ZT, does the VAV damper fail to modulate to minimum position?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "VAV dampers are not at minimum position at DAT < ZTSP-A when ZTSP-P (or TRVSP)>ZTSP-A",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("In this scenario, you want the VAV to go to minimum position. The damper should close when the zone temperature exceeds ZTSP-A. But the VAV is not at minimum position, and simultaneous heating and cooling is occurring.")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 2"),
      h2("Is the supply fan on during unoccupied times?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Supply fan is on during unoccupied times",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("If air systems can be turned off at night, schedule it to do so. Remember freeze protection!")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 3"),
      h2("Are there frequent heating coil valve fluctuations or burner cycling?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Heating coil valve fluctuations or burner(s) is/are short-cycling",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("The interaction of the perimeter and air systems may be causing the instability. Check controls and/or PID loop for the AHU DAT and that for the perimeter system HWST.")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 4"),
      h2("Are the VAV damper positions below 50% or above 75%?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Most of the VAV damper positions are below 50% or above 75%",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Duct static pressure is set too high or too low."),
          tags$li("Control loop for VAV damper is not working."),
          tags$li("DATSP is too high or too low.")
        )
      ),
      boxPlus(
        title = "VAV Damper Positions change too frequently",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Check controls or PID loop. ")
        )
      )
    ),
    
    tabPanel(
      div(class="navPanels","Question 5"),
      h2("Are your ZTSP-P and ZTSP-A within one or two degrees of each other?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "ZTSP-P and ZTSP-A are within 1-2°F of each other",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Select the system to dominate heating and set that ZTSP significantly higher (at least 5°F) across all zones served. Be sure this is true for all zones, otherwise the second system will remain on to serve the zone (or zones) where the rule is not followed.")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 6"),
      h2("If there are nighttime setbacks, are both systems running at night?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Both systems run at night to meet nighttime setbacks",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Can the nighttime setbacks be met solely with the perimeter system? This may require changing your HWST set point or HW reset settings.")
        )
      )
    )
  )
)
#####Trend 36b#####
trend36b_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(
      div(class="navPanels", "Question 1"),
      h2("Is DAT having trouble meeting the RATSP?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "RATSP is not met",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Check controls sequence – see that DAT modulates to meet the RATSP, and that the HCV modulates to meet the DATSP. May need to tune the control loop.")
        )
      ),
      boxPlus(
        title = "RAT<RATSP despite increasing DAT",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Check for air infiltration in the zones."),
          tags$li("HWST may be too low to meet the load. Increase HWSTSP or change HW reset settings.")
        )
      )
    ),
    
    tabPanel(
      div(class="navPanels","Question 2"),
      h2("Is the system having trouble meeting your ZTSP-P? "),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Zone temperatures are uneven – some too hot, some too cold",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Check air balance."),
          tags$li("Check for air infiltration in cold zones.")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 3"),
      h2("Is the supply fan on during unoccupied times?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Supply fan is on during unoccupied times",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("If air systems can be turned off at night, schedule it to do so. Remember freeze protection!")
        )
      )
    ),
    
    tabPanel(
      div(class="navPanels","Question 4"),
      h2("Is the ZTSP-P < RATSP?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "ZTSP-P < RATSP",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("This configuration is not recommended. It’s better to meet your heating requirements with your perimeter system. Change the settings.")
        )
      )
    )
  )
)
#####Trend 37b#####
trend37b_panel <- box(
  width = 12,
  solidHeader = TRUE,
  navlistPanel(
    tabPanel(div(class = "navTitles","Questions"),
             h1(QUESTION_PROMPT)
    ),
    tabPanel(
      div(class="navPanels", "Question 1"),
      h2("Are you having trouble meeting  ZTSP-P?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Zone temps too hot or too cold",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Check that perimeter system valves serving the zones are operating properly."),
          tags$li("Check that HWSTSP is sufficient to meet the load.")
        )
      )
    ),
    
    tabPanel(
      div(class="navPanels","Question 2"),
      h2("Are you having trouble meeting DATSP?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Not meeting DATSP",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("Does the HCV modulate to meet DATSP? If not, tune the control loop.")
        )
      )
    ),
    tabPanel(
      div(class="navPanels","Question 3"),
      h2("Is the supply fan on during unoccupied times?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Supply fan is on during unoccupied times",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("If air systems can be turned off at night, schedule it to do so. Remember freeze protection!")
        )
      )
    ),
    
    tabPanel(
      div(class="navPanels","Question 4"),
      h2("Are there frequent heating coil valve fluctuations or is there burner cycling?"),
      div(class="faultTitle",strong("Faults:")),
      boxPlus(
        title = "Heating coil valve fluctuations or burner(s) is/are short-cycling",
        collapsed = TRUE,
        collapsible = TRUE,
        closable = FALSE,
        solidHeader = TRUE,
        width = 12,
        tags$ul(
          tags$li("The interaction of the perimeter and air systems may be causing the instability. Check controls and/or PID loop for the AHU DAT and that for the perimeter system HWST.")
        )
      )
    )
  )
)