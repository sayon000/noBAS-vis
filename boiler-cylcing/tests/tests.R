source('data_processing.R')

motor1 <- 'boiler-cylcing/tests/motor1.csv'
motor2 <- 'boiler-cylcing/tests/motor2.csv'
stack1 <- 'boiler-cylcing/tests/stacktemp1.csv'
stack2 <- 'boiler-cylcing/tests/stacktemp2.csv'

motor1 <- read_csv(motor1, skip = 1)
motor2 <- read_csv(motor2, skip = 1)
stack1 <- read_csv(stack1, skip = 1)
stack2 <- read_csv(stack2, skip = 1)

motor1 <- process_data(motor1,state_change_data = TRUE)
motor2 <- process_data(motor2,state_change_data = TRUE,periodicity_15 = TRUE)
stack1 <- process_data(stack1,periodicity_15 = TRUE)
stack2 <- process_data(stack2)