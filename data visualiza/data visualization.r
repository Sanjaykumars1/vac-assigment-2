# Importing Dataset
student_data <- read.csv("Students_data.csv", stringsAsFactors = FALSE)

# Viewing Dataset
View(student_data)

# Datatypes Check
str(student_data)

# Datatype Conversion
student_data$gender <- as.factor(student_data$gender)
student_data$lunch <- as.factor(student_data$lunch)
student_data$test_preparation <- as.factor(student_data$test_preparation)
student_data$parentaleducation <- as.factor(student_data$parentaleducation)

# Datatypes Recheck
str(student_data)

# Express Table for people test_preparation
prop.table(table(student_data$test_preparation))

# Importing Library
library(ggplot2)


# students who prepared test
ggplot(student_data, aes(x = test_preparation)) + theme_classic() + 
  geom_bar() + 
  labs(y = "student count", title = "test preparation")


# test preparation w.r.t gender
ggplot(student_data, aes(x = gender, fill = test_preparation)) + theme_light() + 
  geom_bar() + 
  labs(y = "student", 
       title = "student_data test preparation w.r.t gender")


# Plot for test prep w.r.t lunch
ggplot(student_data, aes(x = lunch, fill = test_preparation)) + theme_light() + 
  geom_bar() + 
  labs(y = "student count", 
       title = "test prep w.r.t lunch category")


# student_data test prep w.r.t lunch and gender
ggplot(student_data, aes(x = gender, fill = test_preparation)) + theme_light() + 
  facet_grid(~lunch) + geom_bar() + 
  labs(y = "student count", 
       title = "student_data test prep w.r.t lunch and gender")


# Pie chart 
ggplot(student_data, aes(x = "", fill = test_preparation)) + 
  geom_bar(position = "fill") + 
  facet_grid(~lunch) + coord_polar(theta = "y")


# Density plot
ggplot(student_data, aes(x = race, fill = test_preparation)) + theme_bw() + 
  facet_wrap(gender~lunch) + geom_density(alpha = 0.5) + 
  labs(y = "race", x = "test_preparation", 
       title = "student_data test_prep by race, lunch and gender")
