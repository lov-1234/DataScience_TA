# Exercise 1: Astronomical Statistical Unit

# Load the AU data from the provided CSV file
au_data <- read.csv("../../3/AU.csv")

# Display the data
print(au_data)



















# a. What is the population in this experiment?
# The population is all possible measurements of the distance between Earth and the Sun.

# b. What is the parameter of interest?
# The parameter of interest is the distance from the Earth to the Sun, measured in millions of miles.

# c. How good is the sample from the population? Evaluate representativeness, bias, and size.
# This sample contains measurements from 15 studies conducted over time.
# If we look at the plot shown in the previous tutorial and see the values that we can have. We find that the values in this study are 
# rather centered around the true value. Which is not representative of the population.
# ------------------------------------------------------------------------------

# Exercise 2: Isaac Newton as a Historian

# Load the kings data from the provided CSV file
kings_data <- read.csv("../../3/kings.csv")

# Display the data
print(kings_data)







# a. What is the population and parameter of interest?
# The population is all reigns of kings throughout history, and the parameter of interest is the average reign of a king.

# b. Calculate the average reign for each epoch and store it in a vector AR.
AR <- kings_data$Years / kings_data$Number_of_kings
cat("Average Reign for each Kingdom:\n")
print(AR)




# c. Estimate the parameter of interest (mean of AR)
mean_AR <- mean(AR)
cat("Estimated average reign based on sample:", mean_AR, "years\n")


std_dev <- function(data) {
  sum_var <- sum(sqrt(1/(length(data) - 1)) * )
}






# d. Newton's estimate: standard deviation of average reigns
# i. Calculate the standard deviation of the average reigns
std_dev_AR <- sd(AR)
cat("Standard deviation of average reigns:", std_dev_AR, "\n")








calculate_mean <- function(data) {
  # Calculate the sum of the data and divide by the length (number of elements)
  mean_value <- sum(data) / length(data)
  return(mean_value)
}









# Function to calculate the standard deviation
calculate_standard_deviation <- function(data) {
  # First, calculate the mean
  mean_value <- calculate_mean(data)
  
  # Calculate the sum of squared differences from the mean
  squared_diffs <- (data - mean_value)^2
  
  # Standard deviation is the square root of the average squared difference
  std_dev <- sqrt(sum(squared_diffs) / (length(data) - 1))
  
  return(std_dev)
}








# ii. Does the standard deviation explain Newton's observation?
# Newton's estimate of 18 to 20 years might reflect his understanding of variability in reign lengths.







# iii. Calculate the standard error of the average reigns
std_error_AR <- std_dev_AR / sqrt(length(AR))
cat("Standard error of the average reigns:", std_error_AR, "\n")






# Conclusion:
# Newton's estimate of the reign duration aligns with the fact that there is variability (standard deviation),
# and the standard error helps quantify uncertainty in the sample mean.
