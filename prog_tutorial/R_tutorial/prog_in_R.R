# Introduction to R Programming

# This section will introduce you to the basics of R programming, widely used in statistics and data science.

# 1. Basic Syntax in R

print("Hello, World!")

# 2. Variables and Data Types in R
# You can store data in variables. R supports different data types like numeric, character, and boolean.

name <- "Alice"
age <- 25
height <- 5.4
is_student <- TRUE

cat("Name:", name, "Age:", age, "Height:", height, "Student:", is_student, "\n")

# 3. Vectors in R
# Vectors are a basic data structure in R, similar to arrays in Python.

numbers <- c(1, 2, 3, 4, 5)
print(numbers)

# You can also perform operations on vectors.
squared_numbers <- numbers^2
print(squared_numbers)

# 4. Data Frames in R
# Data frames are similar to Pandas DataFrames in Python. They are used to store tabular data.

data <- data.frame(Name = c("Alice", "Bob", "Charlie"), Age = c(25, 30, 35), Height = c(5.4, 5.7, 6.0))
print(data)

# 5. Control Structures in R
# Like Python, R also has control structures like if, for, and while loops.

# If statement
if (age >= 18) {
  print("You are an adult.")
} else {
  print("You are a minor.")
}

# For loop
for (i in 1:5) {
  print(paste("Iteration", i))
}

# While loop
count <- 0
while (count < 3) {
  print(paste("Count is", count))
  count <- count + 1
}

# 6. Functions in R
# You can define your own functions in R.

greet <- function(name) {
  return(paste("Hello,", name))
}

print(greet("Alice"))

# 7. Introduction to Data Manipulation in R
# R also provides powerful tools for data manipulation. Let's explore some basic examples.

# Creating a data frame
data <- data.frame(Name = c("Alice", "Bob", "Charlie"), Salary = c(50000, 60000, 70000))

# Selecting a column
print(data$Name)

# Filtering rows
high_salary <- subset(data, Salary > 55000)
print(high_salary)

# Summarizing data
mean_salary <- mean(data$Salary)
print(paste("Average Salary:", mean_salary))

# 8. Plotting in R
# R provides basic plotting functionality for data visualization.

# Creating a simple plot
plot(numbers, squared_numbers, type="b", col="blue", main="Numbers vs Squared Numbers", xlab="Numbers", ylab="Squared Numbers")
