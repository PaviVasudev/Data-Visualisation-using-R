############################################################
# EXERCISE 2 - AIRQUALITY DATASET
############################################################

# ----------------------------------------------------------
# 1. UNDERSTAND THE DATA
# ----------------------------------------------------------

# 1. Load the airquality dataset
data("airquality")

# 2. Display the dataset
airquality

# 3. Find the number of rows and columns
nrow(airquality)
ncol(airquality)

# Answer:
# 153 rows and 6 columns

# Or:
dim(airquality)


# 4. Display the column names
names(airquality)

# Answer:
# "Ozone" "Solar.R" "Wind" "Temp" "Month" "Day"


# 5. Examine the structure of the dataset
str(airquality)

# This shows:
# - Ozone: numeric
# - Solar.R: numeric
# - Wind: numeric
# - Temp: integer
# - Month: integer
# - Day: integer


# 6. Generate a statistical summary
summary(airquality)

# The summary gives:
# - Minimum
# - 1st Quartile
# - Median
# - Mean
# - 3rd Quartile
# - Maximum
# for numerical columns.
# It also shows the number of NA values.


# 7. What does one row represent?
#
# One row represents one daily observation of air quality
# and weather conditions.
#
# The observations are from New York during May to September
# 1973.
#
# Variables include:
# - Ozone concentration
# - Solar radiation
# - Wind speed
# - Temperature
# - Month
# - Day


# ----------------------------------------------------------
# 2. CHECK DATA QUALITY
# ----------------------------------------------------------

# 8. Check for missing values in each column
colSums(is.na(airquality))

# Expected result:
# Ozone   = 37
# Solar.R = 7
# Wind    = 0
# Temp    = 0
# Month   = 0
# Day     = 0


# 9. Find the total number of missing values
sum(is.na(airquality))

# Answer:
# 44


# 10. Calculate percentage of missing values in each column
colMeans(is.na(airquality)) * 100

# Expected approximately:
# Ozone   = 24.18%
# Solar.R = 4.58%
# Wind    = 0%
# Temp    = 0%
# Month   = 0%
# Day     = 0


# Alternative:
missing_percentage <- colSums(is.na(airquality)) / nrow(airquality) * 100
missing_percentage


# 11. Which column has the most missing values?
which.max(colSums(is.na(airquality)))

# Answer:
# Ozone has the most missing values.
#
# It contains 37 missing values.


# 12. Check whether Ozone contains any zero values
any(airquality$Ozone == 0, na.rm = TRUE)

# Answer:
# FALSE
#
# There are no zero values in Ozone.


# 13. Check whether duplicate rows exist
anyDuplicated(airquality)

# Answer:
# 0
#
# Therefore, there are no duplicate rows.

# Another way:
any(duplicated(airquality))


# ----------------------------------------------------------
# 3. TRANSFORM THE DATA
# ----------------------------------------------------------

# 14. Convert Month into a factor

airquality$Month <- factor(
  airquality$Month,
  levels = 5:9,
  labels = c("May", "June", "July", "August", "September")
)

# Check:
str(airquality$Month)
table(airquality$Month)


# 15. Convert Month into numerical values
#     Example: May is 5

# Since the original Month values were 5-9,
# we can create a new numerical Month variable.

airquality$Month_Num <- as.numeric(as.character(airquality$Month))

# IMPORTANT:
# The above approach will NOT work after using text labels
# such as "May", "June", etc.
#
# Therefore, the safer approach is to create the numerical
# variable before converting Month to a factor.

# Let's reload the original dataset and do this correctly.

data("airquality")

airquality$Month_Num <- airquality$Month

# Check:
head(airquality[, c("Month", "Month_Num")])


# Now convert Month to a factor
airquality$Month <- factor(
  airquality$Month,
  levels = 5:9,
  labels = c("May", "June", "July", "August", "September")
)

# Check:
head(airquality[, c("Month", "Month_Num")])


# 16. Create a Date variable using Month and Day

airquality$Date <- as.Date(
  paste(1973, airquality$Month_Num, airquality$Day, sep = "-"),
  format = "%Y-%m-%d"
)

# Check the result:
head(airquality[, c("Date", "Month", "Day")])

# Note:
# The original dataset represents May-September 1973,
# so we use 1973 as the year.


# ----------------------------------------------------------
# 4. HANDLE MISSING VALUES
# ----------------------------------------------------------

# 17. Calculate the mean Ozone value without handling
#     missing values

mean(airquality$Ozone)

# Answer:
# NA
#
# R returns NA because Ozone contains missing values.


# 18. Calculate the mean Ozone while ignoring NA values

mean(airquality$Ozone, na.rm = TRUE)

# Answer:
# Approximately 42.13


# 19. Calculate the median Ozone while ignoring NA values

median(airquality$Ozone, na.rm = TRUE)

# Answer:
# 31


# 20. Create a dataset containing only complete rows

airquality_complete <- na.omit(airquality)

# Or:
airquality_complete <- airquality[complete.cases(airquality), ]

# Display:
head(airquality_complete)


# 21. Compare the dimensions of the original and cleaned datasets

dim(airquality)
dim(airquality_complete)

# Original:
# 153 rows x 7 columns
#
# Cleaned:
# 111 rows x 7 columns
#
# 42 rows were removed because they contained at least
# one missing value.


# 22. Create a dataset containing only rows where Ozone
#     is available

airquality_ozone <- airquality[!is.na(airquality$Ozone), ]

# Check dimensions:
dim(airquality_ozone)

# Number of rows:
nrow(airquality_ozone)

# Answer:
# 116 rows


# ----------------------------------------------------------
# 5. PREPARE FOR ANALYSIS
# ----------------------------------------------------------

# 23. Select only:
#     Date
#     Month
#     Ozone
#     Temp
#     Wind

analysis_data <- airquality[, c(
  "Date",
  "Month",
  "Ozone",
  "Temp",
  "Wind"
)]

# Display:
head(analysis_data)


# 24. Filter out rows where Ozone is missing

analysis_data_clean <- analysis_data[
  !is.na(analysis_data$Ozone),
]

# Check:
head(analysis_data_clean)

# Number of observations:
nrow(analysis_data_clean)

# Answer:
# 116 observations


# 25. Calculate the average Ozone for each month

average_ozone <- aggregate(
  Ozone ~ Month,
  data = analysis_data_clean,
  FUN = mean
)

average_ozone


# Approximate results:
# May        23.615
# June       29.444
# July       59.115
# August     59.962
# September  31.174


# 26. Calculate the average Temperature for each month

average_temp <- aggregate(
  Temp ~ Month,
  data = analysis_data,
  FUN = mean
)

average_temp


# Approximate results:
# May        65.55
# June       79.10
# July       83.90
# August     83.97
# September  76.90


# 27. Create one summary table containing:
#     Month
#     Average Ozone
#     Average Temperature
#     Average Wind

# Calculate average Ozone
avg_ozone <- aggregate(
  Ozone ~ Month,
  data = analysis_data_clean,
  FUN = mean
)

# Calculate average Temperature
avg_temp <- aggregate(
  Temp ~ Month,
  data = analysis_data,
  FUN = mean
)

# Calculate average Wind
avg_wind <- aggregate(
  Wind ~ Month,
  data = analysis_data,
  FUN = mean
)

# Combine the results
summary_table <- merge(avg_ozone, avg_temp, by = "Month")
summary_table <- merge(summary_table, avg_wind, by = "Month")

# Rename columns
names(summary_table) <- c(
  "Month",
  "Average_Ozone",
  "Average_Temperature",
  "Average_Wind"
)

# Display final summary table
summary_table


############################################################
# FINAL SUMMARY
############################################################

# The final summary table shows the monthly averages for:
# - Ozone
# - Temperature
# - Wind
#
# From the results, July and August have the highest
# average Ozone concentrations.
#
# May has the lowest average Ozone concentration.
#
# July and August also have the highest average temperatures.
############################################################
