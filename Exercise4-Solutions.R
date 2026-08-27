############################################################
# EXERCISE 4
############################################################
# Dataset: cleaned airquality data
############################################################

# Load required package
library(ggplot2)


# ----------------------------------------------------------
# BAR GRAPH
# ----------------------------------------------------------

# 1. Create a bar graph showing the average Ozone for each month
# ----------------------------------------------------------

# Calculate average Ozone for each month
avg_ozone <- aggregate(
  Ozone ~ Month,
  data = airquality_ozone,
  FUN = mean
)

# View the result
avg_ozone

# Create the bar graph
ggplot(avg_ozone, aes(x = Month, y = Ozone)) +
  geom_col()


# 2. Add an appropriate title
# ----------------------------------------------------------

ggplot(avg_ozone, aes(x = Month, y = Ozone)) +
  geom_col() +
  labs(
    title = "Average Ozone by Month"
  )


# 3. Add appropriate axis labels
# ----------------------------------------------------------

ggplot(avg_ozone, aes(x = Month, y = Ozone)) +
  geom_col() +
  labs(
    title = "Average Ozone by Month",
    x = "Month",
    y = "Average Ozone Concentration"
  )


# 4. Change the appearance of the bars
# ----------------------------------------------------------

ggplot(avg_ozone, aes(x = Month, y = Ozone)) +
  geom_col(
    fill = "steelblue",
    color = "black"
  ) +
  labs(
    title = "Average Ozone by Month",
    x = "Month",
    y = "Average Ozone Concentration"
  ) +
  theme_minimal()


# Alternative appearance using different colours
ggplot(avg_ozone, aes(x = Month, y = Ozone, fill = Month)) +
  geom_col(color = "black") +
  labs(
    title = "Average Ozone by Month",
    x = "Month",
    y = "Average Ozone Concentration"
  ) +
  theme_minimal() +
  theme(legend.position = "none")


# 5. What does the height of each bar represent?
# ----------------------------------------------------------

# Answer:
# The height of each bar represents the average Ozone
# concentration for that particular month.
#
# A taller bar means that the average Ozone concentration
# was higher during that month.


# ----------------------------------------------------------
# HISTOGRAM
# ----------------------------------------------------------

# 6. Create a histogram showing the distribution of Ozone
# ----------------------------------------------------------

ggplot(airquality_ozone, aes(x = Ozone)) +
  geom_histogram()


# 7. Add an appropriate title
# ----------------------------------------------------------

ggplot(airquality_ozone, aes(x = Ozone)) +
  geom_histogram() +
  labs(
    title = "Distribution of Ozone Concentration",
    x = "Ozone Concentration",
    y = "Frequency"
  )


# 8. Change the number of bins
# ----------------------------------------------------------

# Example: 10 bins

ggplot(airquality_ozone, aes(x = Ozone)) +
  geom_histogram(
    bins = 10,
    fill = "skyblue",
    color = "black"
  ) +
  labs(
    title = "Distribution of Ozone Concentration - 10 Bins",
    x = "Ozone Concentration",
    y = "Frequency"
  )


# Try 20 bins

ggplot(airquality_ozone, aes(x = Ozone)) +
  geom_histogram(
    bins = 20,
    fill = "skyblue",
    color = "black"
  ) +
  labs(
    title = "Distribution of Ozone Concentration - 20 Bins",
    x = "Ozone Concentration",
    y = "Frequency"
  )


# 9. Try different bin widths
# ----------------------------------------------------------

# Bin width = 10

ggplot(airquality_ozone, aes(x = Ozone)) +
  geom_histogram(
    binwidth = 10,
    fill = "lightgreen",
    color = "black"
  ) +
  labs(
    title = "Ozone Distribution - Bin Width 10",
    x = "Ozone Concentration",
    y = "Frequency"
  )


# Bin width = 20

ggplot(airquality_ozone, aes(x = Ozone)) +
  geom_histogram(
    binwidth = 20,
    fill = "orange",
    color = "black"
  ) +
  labs(
    title = "Ozone Distribution - Bin Width 20",
    x = "Ozone Concentration",
    y = "Frequency"
  )


# Bin width = 5

ggplot(airquality_ozone, aes(x = Ozone)) +
  geom_histogram(
    binwidth = 5,
    fill = "purple",
    color = "black"
  ) +
  labs(
    title = "Ozone Distribution - Bin Width 5",
    x = "Ozone Concentration",
    y = "Frequency"
  )


# 10. Which version communicates the distribution better? Why?
# ----------------------------------------------------------

# Answer:
# A moderate bin width, such as 10, generally communicates
# the distribution well.
#
# Very small bins can make the histogram look noisy and make
# it difficult to identify the overall pattern.
#
# Very large bins can hide important details in the data.
#
# Therefore, a bin width of around 10 provides a reasonable
# balance between detail and readability for this dataset.


# ----------------------------------------------------------
# PIE CHART
# ----------------------------------------------------------

# 11. Create a frequency table showing observations for each month
# ----------------------------------------------------------

month_frequency <- table(airquality_ozone$Month)

# Display frequency table
month_frequency


# Alternative:
month_frequency <- table(airquality$Month)
month_frequency


# 12. Convert the frequency table into a suitable data frame
#     for plotting
# ----------------------------------------------------------

month_df <- as.data.frame(month_frequency)

# Rename columns
names(month_df) <- c("Month", "Frequency")

# View data frame
month_df


# ----------------------------------------------------------
# 13. Create a pie chart showing the proportion of observations
#     from each month
# ----------------------------------------------------------

ggplot(month_df, aes(x = "", y = Frequency, fill = Month)) +
  geom_col(width = 1) +
  coord_polar(theta = "y")


# ----------------------------------------------------------
# 14. Add appropriate labels
# ----------------------------------------------------------

ggplot(month_df, aes(x = "", y = Frequency, fill = Month)) +
  geom_col(width = 1, color = "white") +
  coord_polar(theta = "y") +
  labs(
    title = "Proportion of Observations by Month",
    fill = "Month"
  ) +
  theme_void()


# Add percentage labels

month_df$Percentage <- month_df$Frequency / sum(month_df$Frequency) * 100

ggplot(month_df, aes(x = "", y = Frequency, fill = Month)) +
  geom_col(width = 1, color = "white") +
  coord_polar(theta = "y") +
  geom_text(
    aes(
      label = paste0(round(Percentage, 1), "%")
    ),
    position = position_stack(vjust = 0.5)
  ) +
  labs(
    title = "Proportion of Observations by Month",
    fill = "Month"
  ) +
  theme_void()


# ----------------------------------------------------------
# 15. Is a pie chart the best way to communicate this
#     information?
# ----------------------------------------------------------

# Answer:
# No. A pie chart is not necessarily the best visualization
# because comparing the sizes of similar slices can be
# difficult.
#
# A bar chart would be a better alternative because the
# frequencies for each month can be compared more easily.
#
# Example of the alternative:

ggplot(month_df, aes(x = Month, y = Frequency)) +
  geom_col(
    fill = "steelblue",
    color = "black"
  ) +
  labs(
    title = "Number of Observations by Month",
    x = "Month",
    y = "Number of Observations"
  ) +
  theme_minimal()


############################################################
# FINAL SUMMARY
############################################################

# BAR GRAPH:
# Shows the average Ozone concentration for each month.
#
# HISTOGRAM:
# Shows the distribution of Ozone values.
#
# PIE CHART:
# Shows the proportion of observations belonging to each
# month.
#
# The bar chart is generally easier than the pie chart for
# comparing the number of observations across months.
############################################################
