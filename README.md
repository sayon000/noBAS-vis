# noBAS-vis
R shiny data visualization tools for noBAS BRT analysis.

## Input Requirements (IMPORTANT)
This project assumes all input files are acquired by HOBOware or HOBOware mobile in .csv format.
Files obtained through other means *will not work*. 

Additionally, any given application within this project is configured to expect particular substrings
within the .csv column headers. For instance the date-time columns are identified by the string "Date"...
In the case of the boiler-cycling application, motor status columns are identified by "Motor" and
stack temperature columns by "K-Type." These Labels are set when the loggers themselves are initialized.
Therefore if a motor on-off logger is configured with a label other than "Motor", any .csv files
retreived from the logger will not function within the boiler-cycling application. These substrings are
specified by the targetColumns parameter of the csvFile module. 

### Example: 
```
  stack1_trend <- callModule(csvFile,"file1",
                             targetColumns=reactive({c("K-Type")}), 
                             stateChange=reactive({FALSE}), 
                             periodicity15=reactive({TRUE}),
                             name=reactive({"Stack Temp 1"}),
                             color=reactive({"red"}))
  
  motor1_trend <- callModule(csvFile,"file2",
                             targetColumns=reactive({c("Motor")}), 
                             stateChange=reactive({TRUE}), 
                             periodicity15=reactive({FALSE}),
                             name=reactive({"Motor Status 1"}),
                             color=reactive({"gray"}))

```
