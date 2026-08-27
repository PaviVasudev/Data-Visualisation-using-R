# ============================================================
# STAGE 1: UNDERSTAND THE DATA
# ============================================================

# Load the dataset
heart <- read.csv("heart_health.csv")

# View the first few rows
head(heart)

# View the last few rows
tail(heart)

# Number of rows and columns
dim(heart)

# Column names
names(heart)

# Understand data types
str(heart)

# Statistical summary
summary(heart)

# ============================================================
# STAGE 2: CHECK DATA QUALITY
# ============================================================

# Check for missing values
colSums(is.na(heart))

# Check total missing values
sum(is.na(heart))

# Check for duplicate rows
sum(duplicated(heart))

# Check unique values of the target variable
unique(heart$target)

# Check how many observations belong to each target category
table(heart$target)

# ============================================================
# STAGE 3: UNDERSTAND VARIABLES
# ============================================================

# Age of the patient
summary(heart$age)

# Resting blood pressure
summary(heart$trestbps)

# Cholesterol
summary(heart$chol)

# Maximum heart rate achieved
summary(heart$thalach)

# Heart disease outcome
table(heart$target)

# ============================================================
# STAGE 4: CLEAN & TRANSFORM
# ============================================================

# Convert target into a categorical variable
heart$target <- as.factor(heart$target)

# Check the result
str(heart$target)

# Create a new variable for blood pressure category

heart$BP_Category <- ifelse(
  heart$trestbps >= 140,
  "High",
  "Normal"
)

# Check the new variable
table(heart$BP_Category)

# ============================================================
# STAGE 5: KEY METRICS
# ============================================================

# Average age
mean(heart$age)

# Average resting blood pressure
mean(heart$trestbps)

# Average cholesterol
mean(heart$chol)

# Average maximum heart rate
mean(heart$thalach)

# Average resting blood pressure by target group

aggregate(
  trestbps ~ target,
  data = heart,
  FUN = mean
)

# ============================================================
# STAGE 6: VISUALIZATION
# ============================================================

#Question: What does the age distribution of our patients look like?

library(ggplot2)

ggplot(
  heart,
  aes(x = age)
) +
  geom_histogram() +
  labs(
    title = "Distribution of Patient Age",
    x = "Age",
    y = "Number of Patients"
  )

#Question: How is blood pressure related to age?

ggplot(
  heart,
  aes(
    x = age,
    y = trestbps
  )
) +
  geom_point() +
  labs(
    title = "Resting Blood Pressure vs Age",
    x = "Age",
    y = "Resting Blood Pressure"
  )

#R isn't just a visualization tool. We can also use it to model relationships between variables

ggplot(
  heart,
  aes(
    x = age,
    y = trestbps
  )
) +
  geom_point() +
  geom_smooth(method = "lm") +
  labs(
    title = "Resting Blood Pressure vs Age",
    x = "Age",
    y = "Resting Blood Pressure"
  )

# ============================================================
# STAGE 7: SIMPLE LINEAR REGRESSION
# ============================================================

#Predicting resting blood pressure using age using linear regression
#Question: Can we predict resting blood pressure based on age?

model <- lm(
  trestbps ~ age,
  data = heart
)

# View the model
model

# Detailed model results
summary(model)

ggplot(
  heart,
  aes(
    x = age,
    y = trestbps
  )
) +
  geom_point() +
  geom_smooth(
    method = "lm",
    se = FALSE
  ) +
  labs(
    title = "Linear Regression: Age vs Resting Blood Pressure",
    x = "Age",
    y = "Resting Blood Pressure"
  )
#the flow is Data -> Pattern -> Model -> Prediction
