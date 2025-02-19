#Krishna Soni
# Introduction to Analytics
# 02/01/2025

# Load necessary libraries
library(tidyverse)


# ===============================
# Part 1: Data Loading and Exploration
# ===============================

# Load the dataset 
data <- read.csv("mba_decision_dataset.csv")


str(data)
summary(data)

# Display the first few rows of the dataset
head(data)

# Display the names of the columns
print(names(data))

# Check for missing values
missing_values <- colSums(is.na(data))
print(missing_values)

# ===============================
# Part 2: Descriptive Statistics
# ===============================

# Summary statistics for numeric columns
num_summary <- data %>%
  summarise(
    Age_mean = mean(Age, na.rm = TRUE),
    Age_sd = sd(Age, na.rm = TRUE),
    GPA_mean = mean(Undergraduate.GPA, na.rm = TRUE),
    Salary_mean = mean(Annual.Salary.Before.MBA, na.rm = TRUE),
    Experience_mean = mean(Years.of.Work.Experience, na.rm = TRUE)
  )
print(num_summary)

# Frequency of categorical variables
gender_freq <- table(data$Gender)
print(gender_freq)

# ===============================
# Part 3: Data Visualization
# ===============================

# Histogram of Age
ggplot(data, aes(x = Age)) +
  geom_histogram(binwidth = 1, fill = "blue", color = "black") +
  labs(title = "Distribution of Age", x = "Age", y = "Frequency")

# Boxplot of Undergraduate GPA by Gender
ggplot(data, aes(x = Gender, y = Undergraduate.GPA, fill = Gender)) +
  geom_boxplot() +
  labs(title = "Undergraduate GPA by Gender", x = "Gender", y = "Undergraduate GPA")

# Scatter plot of Salary vs Experience
ggplot(data, aes(x = Years.of.Work.Experience, y = Annual.Salary.Before.MBA)) +
  geom_point(color = "red", alpha = 0.5) +
  labs(title = "Salary vs. Years of Work Experience", x = "Years of Work Experience", y = "Annual Salary Before MBA")

