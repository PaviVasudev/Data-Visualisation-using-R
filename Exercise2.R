############################################################
# EXERCISE 2
############################################################

# Dataset: airquality
# ----------------------------------------------------------
# 1. UNDERSTAND THE DATA
# ----------------------------------------------------------
# 1. Load the airquality dataset.
# 2. Display the dataset.
# 3. Find the number of rows and columns.
# 4. Display the column names.
# 5. Examine the structure of the dataset.
# 6. Generate a statistical summary.
# 7. What does one row represent?

# ----------------------------------------------------------
# 2. CHECK DATA QUALITY
# ----------------------------------------------------------
# 8. Check for missing values in each column.
# 9. Find the total number of missing values.
# 10. Calculate the percentage of missing values in each column.
# 11. Which column has the most missing values?
# 12. Check whether Ozone contains any zero values.
# 13. Check whether duplicate rows exist.

# ----------------------------------------------------------
# 3. TRANSFORM THE DATA
# ----------------------------------------------------------

# 14. Convert Month into a factor.
# 15. Convert Month into numerical values: Eg: May is 5
# 16. Create a Date variable using Month and Day.

# ----------------------------------------------------------
# 4. HANDLE MISSING VALUES
# ----------------------------------------------------------

# 17. Calculate the mean Ozone value without handling missing values.
# 18. Calculate the mean Ozone while ignoring NA values.
# 19. Calculate the median Ozone while ignoring NA values.
# 20. Create a dataset containing only complete rows.
# 21. Compare the dimensions of the original and cleaned datasets.
# 22. Create a dataset containing only rows where Ozone is available.

# ----------------------------------------------------------
# 5. PREPARE FOR ANALYSIS
# ----------------------------------------------------------

# 23. Select only:
#     Date
#     Month
#     Ozone
#     Temp
#     Wind

# 24. Filter out rows where Ozone is missing.
# 25. Calculate the average Ozone for each month.
# 26. Calculate the average Temperature for each month.
# 27. Create one summary table containing:
#     Month
#     Average Ozone
#     Average Temperature
#     Average Wind
