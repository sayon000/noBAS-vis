
source('../../data_processing.R')

stack1_f <- 'stacktemp1.csv'
stack2_f <- 'stacktemp2.csv'

#TODO: Parse col_types and discard by col_names parttern matching
#https://stackoverflow.com/questions/15666226/how-to-drop-columns-by-name-pattern-in-r

stack1 <- process_data(stack1_f,periodicity_15 = TRUE,target_columns=c("K-Type"))
stack2 <- process_data(stack2_f,periodicity_15 = TRUE,target_columns=c("K-Type"))

stack1_trend <- list(name='Stack1',index=index(stack1),values=coredata(stack1),color='red')
stack2_trend <- list(name='Stack2',index=index(stack2),values=coredata(stack2),color='blue')

fullPlot(discreteData = list(stack1_trend,stack2_trend))
