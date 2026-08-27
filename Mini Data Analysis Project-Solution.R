############################################################
# MINI DATA ANALYSIS PROJECT
############################################################

# ----------------------------------------------------------
# 1. CREATE THE DATASET
# ----------------------------------------------------------

sales <- data.frame(
  employee = c("A", "B", "C", "D", "E", "F", "G", "H"),
  department = c(
    "Sales", "Sales", "IT", "IT",
    "HR", "HR", "Sales", "IT"
  ),
  age = c(25, 30, 28, 35, 26, 32, 29, 31),
  salary = c(
    40000, 55000, 60000, 75000,
    45000, 65000, 50000, 70000
  ),
  experience = c(2, 5, 3, 8, 2, 7, 4, 6)
)


# ----------------------------------------------------------
# 2. LOAD GGplot2
# ----------------------------------------------------------

library(ggplot2)


# ----------------------------------------------------------
# DATA INSPECTION
# ----------------------------------------------------------

# Display first 5 rows
head(sales, 5)


# Check dimensions
dim(sales)

# Answer:
# 8 rows and 5 columns


# Number of rows
nrow(sales)


# Number of columns
ncol(sales)


# Display column names
names(sales)

# Answer:
# employee
# department
# age
# salary
# experience


# Examine structure
str(sales)


# Generate statistical summary
summary(sales)


# ----------------------------------------------------------
# ANALYSIS
# ----------------------------------------------------------

# Average salary
average_salary <- mean(sales$salary)

average_salary

# Answer:
# 57500


# Median salary
median_salary <- median(sales$salary)

median_salary

# Answer:
# 57500


# Highest-paid employee
highest_paid <- sales[sales$salary == max(sales$salary), ]

highest_paid

# Answer:
# Employee D
# Salary = 75000


# Lowest-paid employee
lowest_paid <- sales[sales$salary == min(sales$salary), ]

lowest_paid

# Answer:
# Employee A
# Salary = 40000


# Employees earning more than 60,000
salary_above_60000 <- sales[sales$salary > 60000, ]

salary_above_60000

# Answer:
# Employee D = 75000
# Employee F = 65000
# Employee H = 70000


# Employees with more than 5 years of experience
experience_above_5 <- sales[sales$experience > 5, ]

experience_above_5

# Answer:
# Employee D = 8 years
# Employee F = 7 years
# Employee H = 6 years


# ----------------------------------------------------------
# AVERAGE SALARY BY DEPARTMENT
# ----------------------------------------------------------

average_salary_department <- aggregate(
  salary ~ department,
  data = sales,
  FUN = mean
)

average_salary_department

# Expected result:
#
# department    salary
# HR            55000
# IT            68333.33
# Sales         48333.33


# ----------------------------------------------------------
# AVERAGE EXPERIENCE BY DEPARTMENT
# ----------------------------------------------------------

average_experience_department <- aggregate(
  experience ~ department,
  data = sales,
  FUN = mean
)

average_experience_department

# Expected result:
#
# department    experience
# HR            4.5
# IT            5.67
# Sales         3.67


# ----------------------------------------------------------
# COUNT EMPLOYEES IN EACH DEPARTMENT
# ----------------------------------------------------------

employee_count <- table(sales$department)

employee_count

# Expected result:
#
# HR       IT     Sales
# 2        3      3


# Convert frequency table to data frame
employee_count_df <- as.data.frame(employee_count)

names(employee_count_df) <- c(
  "department",
  "employee_count"
)

employee_count_df


# ----------------------------------------------------------
# CREATE SENIORITY COLUMN
# ----------------------------------------------------------

sales$seniority <- ifelse(
  sales$experience >= 5,
  "Senior",
  "Junior"
)

# Display updated dataset
sales


# Expected:
#
# A = Junior
# B = Senior
# C = Junior
# D = Senior
# E = Junior
# F = Senior
# G = Junior
# H = Senior


# Convert seniority into a factor
sales$seniority <- factor(
  sales$seniority,
  levels = c("Junior", "Senior")
)


# ----------------------------------------------------------
# VISUALISATION 1: SALARY HISTOGRAM
# ----------------------------------------------------------

ggplot(
  sales,
  aes(x = salary)
) +
  geom_histogram(
    bins = 5,
    fill = "steelblue",
    colour = "black",
    alpha = 0.8
  ) +
  labs(
    title = "Distribution of Employee Salaries",
    x = "Salary",
    y = "Number of Employees"
  ) +
  theme_minimal()


# ----------------------------------------------------------
# VISUALISATION 2: SALARY BOX PLOT
# ----------------------------------------------------------

ggplot(
  sales,
  aes(y = salary)
) +
  geom_boxplot(
    fill = "lightblue",
    colour = "darkblue",
    alpha = 0.7
  ) +
  labs(
    title = "Distribution of Employee Salaries",
    y = "Salary"
  ) +
  theme_classic()


# ----------------------------------------------------------
# VISUALISATION 3:
# SALARY VS EXPERIENCE SCATTER PLOT
# ----------------------------------------------------------

ggplot(
  sales,
  aes(
    x = experience,
    y = salary
  )
) +
  geom_point(
    colour = "darkgreen",
    size = 4,
    alpha = 0.8
  ) +
  labs(
    title = "Salary vs Years of Experience",
    x = "Years of Experience",
    y = "Salary"
  ) +
  theme_minimal()


# ----------------------------------------------------------
# VISUALISATION 4:
# SCATTER PLOT COLOURED BY DEPARTMENT
# ----------------------------------------------------------

ggplot(
  sales,
  aes(
    x = experience,
    y = salary,
    colour = department
  )
) +
  geom_point(
    size = 5,
    alpha = 0.8
  ) +
  labs(
    title = "Salary vs Experience by Department",
    subtitle = "Employees grouped by department",
    x = "Years of Experience",
    y = "Salary",
    colour = "Department"
  ) +
  theme_classic()


# ----------------------------------------------------------
# SCATTER PLOT USING MULTIPLE AESTHETICS
# ----------------------------------------------------------

ggplot(
  sales,
  aes(
    x = experience,
    y = salary,
    colour = department,
    shape = seniority
  )
) +
  geom_point(
    size = 5,
    alpha = 0.8
  ) +
  labs(
    title = "Salary and Experience Analysis",
    subtitle = "Colour represents department; shape represents seniority",
    x = "Years of Experience",
    y = "Salary",
    colour = "Department",
    shape = "Seniority"
  ) +
  theme_minimal()


# ----------------------------------------------------------
# VISUALISATION 5:
# EMPLOYEE COUNT BY DEPARTMENT
# ----------------------------------------------------------

ggplot(
  employee_count_df,
  aes(
    x = department,
    y = employee_count,
    fill = department
  )
) +
  geom_col(
    colour = "black",
    alpha = 0.8
  ) +
  labs(
    title = "Number of Employees by Department",
    x = "Department",
    y = "Number of Employees",
    fill = "Department"
  ) +
  theme_minimal()


# ----------------------------------------------------------
# EMPLOYEE COUNT BY DEPARTMENT
# WITH DIFFERENT THEME
# ----------------------------------------------------------

ggplot(
  employee_count_df,
  aes(
    x = department,
    y = employee_count,
    fill = department
  )
) +
  geom_col(
    colour = "black",
    alpha = 0.75
  ) +
  labs(
    title = "Employee Count by Department",
    subtitle = "Distribution of employees across departments",
    x = "Department",
    y = "Number of Employees"
  ) +
  theme_classic() +
  theme(
    legend.position = "none",
    plot.title = element_text(
      size = 18,
      face = "bold"
    ),
    axis.text = element_text(
      size = 12
    ),
    axis.title = element_text(
      size = 13
    )
  )


############################################################
# FINAL CUSTOMISED VISUALISATION
############################################################

# Combining:
# - colour aesthetic
# - shape aesthetic
# - point size
# - transparency
# - title
# - subtitle
# - axis labels
# - legend titles
# - custom theme
# - customised text sizes

ggplot(
  sales,
  aes(
    x = experience,
    y = salary,
    colour = department,
    shape = seniority
  )
) +
  geom_point(
    size = 5,
    alpha = 0.75
  ) +
  labs(
    title = "Employee Salary and Experience Analysis",
    subtitle = "Salary compared with years of experience",
    x = "Years of Experience",
    y = "Annual Salary",
    colour = "Department",
    shape = "Seniority"
  ) +
  theme_classic() +
  theme(
    plot.title = element_text(
      size = 18,
      face = "bold"
    ),
    plot.subtitle = element_text(
      size = 12
    ),
    axis.text = element_text(
      size = 12
    ),
    axis.title = element_text(
      size = 13,
      face = "bold"
    ),
    legend.title = element_text(
      size = 12,
      face = "bold"
    ),
    legend.position = "right"
  )


############################################################
# OPTIONAL: SUMMARY TABLE
############################################################

# Create a complete department summary

department_summary <- aggregate(
  cbind(salary, experience) ~ department,
  data = sales,
  FUN = mean
)

department_summary


# Add employee count

department_count <- aggregate(
  employee ~ department,
  data = sales,
  FUN = length
)

names(department_count)[2] <- "employee_count"

# Combine both tables

department_summary <- merge(
  department_summary,
  department_count,
  by = "department"
)

# Rename columns

names(department_summary) <- c(
  "Department",
  "Average_Salary",
  "Average_Experience",
  "Employee_Count"
)

department_summary


############################################################
# END OF MINI DATA ANALYSIS PROJECT
############################################################
