############################################################
# EXERCISE 1: R BASICS & DATA FRAME OPERATIONS
############################################################

# 1. Load the mtcars dataset
data(mtcars)

# 2. Display the complete dataset
mtcars

# 3. Display the first 6 rows
head(mtcars)

# 4. Display the last 6 rows
tail(mtcars)

# 5. Find the number of rows and columns
nrow(mtcars)
ncol(mtcars)

# Or
dim(mtcars)

# 6. Display the column names
names(mtcars)

# 7. Examine the structure of the dataset
str(mtcars)

# 8. Display the statistical summary
summary(mtcars)

# 9. Select only the mpg column
mtcars$mpg

# Alternative
mtcars[, "mpg"]

# 10. Select the mpg and hp columns
mtcars[, c("mpg", "hp")]

# 11. Select the first 10 rows
mtcars[1:10, ]

# 12. Select rows where mpg is greater than 20
mtcars[mtcars$mpg > 20, ]

# 13. Select cars having more than 100 horsepower
mtcars[mtcars$hp > 100, ]

# 14. Create a new data frame containing mpg, hp and wt
new_data <- mtcars[, c("mpg", "hp", "wt")]

new_data

# 15. Calculate the average mpg
mean(mtcars$mpg)

# 16. Calculate the maximum horsepower
max(mtcars$hp)

# 17. Create a new column:
# Power_to_Weight = hp / wt

mtcars$Power_to_Weight <- mtcars$hp / mtcars$wt

# 18. Display the updated dataset
mtcars
