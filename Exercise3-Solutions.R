############################################################
# EXERCISE 3
############################################################

# Dataset: cleaned airquality data
############################################################


# ----------------------------------------------------------
# 1. Load ggplot2
# ----------------------------------------------------------

library(ggplot2)


# ----------------------------------------------------------
# 2. Create a basic plot using ggplot()
# ----------------------------------------------------------

ggplot(data = airquality_ozone)


# ----------------------------------------------------------
# 3. What happens if you provide only the dataset?
# ----------------------------------------------------------

ggplot(data = airquality_ozone)

# Answer:
# A blank plot is created because ggplot() knows which dataset
# to use, but no variables or geometric objects have been
# specified yet.
#
# We need to add aesthetics (aes()) and a geometry such as
# geom_point(), geom_line(), etc.


# ----------------------------------------------------------
# 4. Map Temperature to the x-axis
# ----------------------------------------------------------

ggplot(
  data = airquality_ozone,
  aes(x = Temp)
)


# ----------------------------------------------------------
# 5. Map Ozone to the y-axis
# ----------------------------------------------------------

ggplot(
  data = airquality_ozone,
  aes(x = Temp, y = Ozone)
)


# ----------------------------------------------------------
# 6. Add points to the plot
# ----------------------------------------------------------

ggplot(
  data = airquality_ozone,
  aes(x = Temp, y = Ozone)
) +
  geom_point()


# ----------------------------------------------------------
# 7. What does each point represent?
# ----------------------------------------------------------

# Answer:
# Each point represents one daily observation in the
# airquality dataset.
#
# The x-coordinate represents the Temperature for that day.
# The y-coordinate represents the Ozone level for that day.
#
# Therefore, each point shows the relationship between
# temperature and ozone for one observation.


# ----------------------------------------------------------
# 8. Change the x-axis variable to Wind
# ----------------------------------------------------------

ggplot(
  data = airquality_ozone,
  aes(x = Wind, y = Ozone)
) +
  geom_point()


# ----------------------------------------------------------
# 9. Add a title to the plot
# ----------------------------------------------------------

ggplot(
  data = airquality_ozone,
  aes(x = Wind, y = Ozone)
) +
  geom_point() +
  ggtitle("Relationship Between Wind and Ozone")


# ----------------------------------------------------------
# 10. Add meaningful x and y axis labels
# ----------------------------------------------------------

ggplot(
  data = airquality_ozone,
  aes(x = Wind, y = Ozone)
) +
  geom_point() +
  labs(
    title = "Relationship Between Wind and Ozone",
    x = "Wind Speed (mph)",
    y = "Ozone Concentration"
  )


############################################################
# FINAL PLOT
############################################################

# A cleaner version using the cleaned Ozone dataset:

ggplot(
  data = airquality_ozone,
  aes(x = Wind, y = Ozone)
) +
  geom_point() +
  labs(
    title = "Relationship Between Wind Speed and Ozone",
    x = "Wind Speed (mph)",
    y = "Ozone Concentration"
  ) +
  theme_minimal()


############################################################
# END OF EXERCISE 3
############################################################
