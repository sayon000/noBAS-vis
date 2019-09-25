# noBAS-vis
This repository is a suite of R Shiny Applications for noBAS (No Building Automation System) BRT (Building Retuning) data logger trending. 

### Project Structure

Each **application** (boiler-cycling,hot-water-reset,fan-scheduling...) is reliant on the **noBASutilities** package from this repository. It can be installed with:

	
	devtools::install_github('cunybpl/noBAS-vis/noBASutilities')

##### Components of noBASutilities:
* modules.R: shiny [modules](https://shiny.rstudio.com/articles/modules.html). These functions contain blocks of ui and server code which can be called in other applications. 
* data_processing.R: utility functions for data cleansing, transformation, and plotting inside/outside of the shiny context. 

___

### Input Requirements (IMPORTANT)
This project assumes all input files are acquired by HOBOware or HOBOware mobile in .csv format. Files obtained through other likely *will not work*. 

***Additionally,* any given application within this project is configured to expect particular substrings within the .csv column headers.** For instance the date-time columns are identified by the substring "Date".Where applicable, this project aims to be consistent with default labels provided by HOBOware software.

*Therefore*, it is important to be mindful of these labels when deploying data loggers. When initializing a logger in HOBOware, look for a field such as "Measurement" or "Label." These fields should correspond to the substrings outlined here:

* boiler-cycling *

>**Stack Temp**: *K-Type*

>**Motor Status**: *Motor*,*Fan*

* hot-water-reset *

>**Outside Air Temp**: *Temp*,*oat*,*OAT*

>**Hot Water Set Temp**: *Temp*,*hwst*,*HWST*

* fan-scheduling *

>**Fan Status**:*Motor*,*Fan*

( * assumes 1 matching trend per .csv file)

**Note**: If a header contains more than 1 of these substrings (*Motor,Fan*...), only the first matching column encounterd will be selected for trending. When using a single file containing multiple trends, these substrings must be according configured (ie. *hwst1, hwst2*).

#### Example: 

In the case of the boiler-cycling application, motor status columns are identified by "*Motor*"  or '*Fan*", and stack temperature columns by "*K-Type*." These Labels are set when the loggers themselves are initialized in HOBOware.

Therefore if a motor on-off logger is configured with a label other than "*Motor*" or "*Fan*", any .csv files retreived from the logger will not function within the boiler-cycling application. These substrings are specified by the targetColumns parameter of the csvFile module. 

**server.R**
```
  stack1_trend <- callModule(csvFile,"file1",
                             targetColumns=reactive({c("K-Type")}), 
                             stateChange=reactive({FALSE}), 
                             periodicity15=reactive({TRUE}),
                             name=reactive({"Stack Temp 1"}),
                             color=reactive({"red"}),
                             axis=reactive({'y1'}))
  
  motor1_trend <- callModule(csvFile,"file2",
                             targetColumns=reactive({c("Motor","Fan")}), 
                             stateChange=reactive({TRUE}), 
                             periodicity15=reactive({FALSE}),
                             name=reactive({"Motor Status 1"}),
                             color=reactive({"gray"}),
                             axis=reactive({'y2'}))

```
___

### Learning Resources for future BPL interns

Datacamp offers  a free two month subscription through your microsoft student account.  

Courses I'd recommend for learning R/shiny:

* https://www.datacamp.com/courses/free-introduction-to-r
* https://www.datacamp.com/courses/building-web-applications-in-r-with-shiny
* https://www.datacamp.com/courses/building-dashboards-with-shinydashboard
* https://www.datacamp.com/courses/building-web-applications-in-r-with-shiny-case-studies
* https://www.datacamp.com/courses/working-with-the-rstudio-ide-part-2

Info on Shiny Modules:

* https://shiny.rstudio.com/articles/modules.html
* https://www.rstudio.com/resources/webinars/understanding-shiny-modules/
* https://beta.rstudioconnect.com/content/2816/Shiny-Modules.html


### Master Link To The Web Application Product
* https://sayon000.shinyapps.io/nobas-trends/
