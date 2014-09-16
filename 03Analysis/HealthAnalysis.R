library("ggplot2", lib.loc="/Library/Frameworks/R.framework/Versions/3.0/Resources/library")
library("lubridate", lib.loc="/Library/Frameworks/R.framework/Versions/3.0/Resources/library")
options(java.parameters="-Xmx2g")
library(rJava)
library(RJDBC)

jdbcDriver <- JDBC(driverClass="oracle.jdbc.OracleDriver", classPath="/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home/ojdbc6.jar")

# In the following, use your username and password instead of "CS347_prof", "orcl_prof" once you have an Oracle account
possibleError <- tryCatch(
  jdbcConnection <- dbConnect(jdbcDriver, "jdbc:oracle:thin:@128.83.138.158:1521:orcl", "C##cs347_jl46853", "orcl_jl46853"),
  error=function(e) e
)
if(!inherits(possibleError, "error")){
  healths <- dbGetQuery(jdbcConnection, "select race, num_lab_procedures, gender, age.age, age.time_in_hospital as ath, health.time_in_hospital as time_in_hospital from age, health")
  healths2 <- dbGetQuery(jdbcConnection, "select gender, num_lab_procedures from health where gender = 'Male' or gender = 'Female'")
  dbDisconnect(jdbcConnection)
}
head(healths)

ggplot(healths, aes(TIME_IN_HOSPITAL)) + geom_histogram()
ggplot(data = healths) + geom_density(aes(x = TIME_IN_HOSPITAL, fill = "gray50"))
ggplot(healths, aes(x = AGE, y = NUM_LAB_PROCEDURES)) + geom_point()
ggplot(subset(healths, AGE == "[20-30)" | AGE == "[70-80)"), aes(x = AGE, y = NUM_LAB_PROCEDURES)) + geom_point()
ggplot(subset(healths, GENDER == "Male" | GENDER == "Female"), aes(x = paste(GENDER, RACE, sep='-'), y = NUM_LAB_PROCEDURES)) + 
  geom_point() + theme(axis.text.x = element_text(angle = 90, hjust = 1))

head(healths2)

ggplot(healths2, aes(NUM_LAB_PROCEDURES, fill=GENDER)) + 
  geom_density(alpha=.5) + scale_fill_manual(values = c("orange", "purple"))
