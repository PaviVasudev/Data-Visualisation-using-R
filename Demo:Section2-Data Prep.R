
############################################################
# DATA PREPARATION & VISUALIZATION DEMO
# Dataset: airquality
# STAGE 1: UNDERSTAND YOUR DATA
############################################################

# Load the built-in dataset
data(airquality)
# View the dataset
airquality
# Look at the first few rows
head(airquality)
# Look at the last few rows
tail(airquality)
# Understand the dimensions
# Output = number of rows and number of columns
dim(airquality)
# Number of rows
nrow(airquality)
# Number of columns
ncol(airquality)
# See column names
names(airquality)
# Understand the structure and data types
str(airquality)
# Generate a statistical summary
summary(airquality)

############################################################
# UNDERSTANDING WHAT ONE ROW REPRESENTS
############################################################

# In airquality:
# One row = one day's observation
# Columns:
# Ozone   -> quantitative
# Solar.R -> quantitative
# Wind    -> quantitative
# Temp    -> quantitative
# Month   -> categorical/time-related
# Day     -> time-related


############################################################
# STAGE 2: CHECK DATA QUALITY
############################################################

# Check for missing values in each column
colSums(is.na(airquality))
# Check whether there are ANY missing values
any(is.na(airquality))
# Count the total number of missing values
sum(is.na(airquality))
# Calculate the percentage of missing values
missing_percentage <- colSums(is.na(airquality)) / nrow(airquality) * 100
missing_percentage

############################################################
# UNDERSTANDING NA vs 0
############################################################

# NA = missing / unknown value
# 0  = an actual numeric value
# Check whether Ozone contains any zero values
sum(airquality$Ozone == 0, na.rm = TRUE)
# Check how many NA values Ozone contains
sum(is.na(airquality$Ozone))

############################################################
# CHECK FOR DUPLICATES
############################################################

# Check for duplicate rows
sum(duplicated(airquality))
# View duplicated rows if any exist
airquality[duplicated(airquality), ]

############################################################
# STAGE 3: CLEAN & TRANSFORM
############################################################

# Check the data type of Month
class(airquality$Month)
# Convert Month into a categorical variable
airquality$Month_Factor <- factor(airquality$Month)
# Check the new data type
class(airquality$Month_Factor)
# Look at the unique values
unique(airquality$Month)
# Give Month meaningful labels
airquality$Month_Name <- factor(
  airquality$Month,
  levels = 5:9,
  labels = c(
    "May",
    "June",
    "July",
    "August",
    "September"
  )
)
# Check the result
table(airquality$Month_Name)


############################################################
# CREATE A NEW COLUMN FROM EXISTING COLUMNS
############################################################

# Create a proper Date column using Month and Day

airquality$Date <- as.Date(
  paste(
    1973,
    airquality$Month,
    airquality$Day,
    sep = "-"
  )
)
# Check the new Date column
head(airquality[, c("Month", "Day", "Date")])


############################################################
# HANDLE MISSING VALUES
############################################################

# Calculate average Ozone WITHOUT handling NA
mean(airquality$Ozone)
# Result:
# NA
# Calculate average Ozone while ignoring missing values
mean(
  airquality$Ozone,
  na.rm = TRUE
)
# Median Ozone
median(
  airquality$Ozone,
  na.rm = TRUE
)
# Create a version of the dataset with rows containing
# missing values removed
airquality_complete <- na.omit(airquality)
# Compare dimensions
dim(airquality)
dim(airquality_complete)


############################################################
# STAGE 4: ESTABLISH TABLE RELATIONSHIPS
############################################################

# airquality is a single table, so a join is NOT required.
# In a real-world project, we may have:
# customers
#     |
#     | customer_id
#     |
# transactions
# We would then join the tables using a common key.
# Example syntax:
# merged_data <- merge(
#   table1,
#   table2,
#   by = "ID"
# )
# Or using dplyr:
# library(dplyr)
# merged_data <- left_join(table1, table2, by = "ID")


############################################################
# STAGE 5: IDENTIFY / CALCULATE KEY METRICS
############################################################

# Basic Ozone statistics
mean(airquality$Ozone, na.rm = TRUE)
median(airquality$Ozone, na.rm = TRUE)
min(airquality$Ozone, na.rm = TRUE)
max(airquality$Ozone, na.rm = TRUE)
sd(airquality$Ozone, na.rm = TRUE)

############################################################
# CALCULATE METRICS BY MONTH
############################################################

# Base R approach
monthly_ozone <- aggregate(
  Ozone ~ Month_Name,
  data = airquality,
  FUN = mean,
  na.rm = TRUE
)
monthly_ozone

############################################################
# USING dplyr
############################################################

# Load dplyr
library(dplyr)

# Calculate average Ozone, Temperature and Wind by month
monthly_summary <- airquality %>%
  group_by(Month_Name) %>%
  summarise(
    Average_Ozone = mean(Ozone, na.rm = TRUE),
    Average_Temperature = mean(Temp, na.rm = TRUE),
    Average_Wind = mean(Wind, na.rm = TRUE)
  )
monthly_summary


############################################################
# STAGE 6: OPTIMISE / PREPARE FOR VISUALIZATION
############################################################

# Select only the columns needed for analysis
analysis_data <- airquality %>%
  select(
    Date,
    Month_Name,
    Ozone,
    Temp,
    Wind
  )
# Check the result
head(analysis_data)
# Filter out rows where Ozone is missing
ozone_data <- analysis_data %>%
  filter(!is.na(Ozone))
# Check dimensions
dim(ozone_data)

############################################################
# STAGE 7: VISUALIZE
############################################################

# Load ggplot2
library(ggplot2)

# ----------------------------------------------------------
# VISUALIZATION 1: TEMPERATURE vs OZONE
# ----------------------------------------------------------

ggplot(
  ozone_data,
  aes(
    x = Temp,
    y = Ozone
  )
) +
  geom_point() +
  labs(
    title = "Temperature vs Ozone",
    x = "Temperature",
    y = "Ozone"
  )

# ----------------------------------------------------------
# VISUALIZATION 2: OZONE DISTRIBUTION
# ----------------------------------------------------------

ggplot(
  ozone_data,
  aes(x = Ozone)
) +
  geom_histogram() +
  labs(
    title = "Distribution of Ozone Levels",
    x = "Ozone",
    y = "Frequency"
  )

# ----------------------------------------------------------
# VISUALIZATION 3: OZONE BY MONTH
# ----------------------------------------------------------

ggplot(
  monthly_summary,
  aes(
    x = Month_Name,
    y = Average_Ozone
  )
) +
  geom_col() +
  labs(
    title = "Average Ozone by Month",
    x = "Month",
    y = "Average Ozone"
  )

# ----------------------------------------------------------
# VISUALIZATION 4: TEMPERATURE OVER TIME
# ----------------------------------------------------------

ggplot(
  airquality,
  aes(
    x = Date,
    y = Temp
  )
) +
  geom_line() +
  labs(
    title = "Temperature Over Time",
    x = "Date",
    y = "Temperature"
  )

############################################################
# FINAL CHECK
############################################################

# We have gone through:

# 1. Understand the data
# 2. Check data quality
# 3. Clean and transform
# 4. Establish relationships
# 5. Calculate key metrics
# 6. Optimise / prepare the data
# 7. Visualize and communicate insights
############################################################
