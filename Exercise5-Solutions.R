############################################################
# EXERCISE 5
############################################################

# Load the dataset
data(iris)

# Load ggplot2
library(ggplot2)


############################################################
# PART A: SCATTER PLOT
############################################################

# 1. Create a scatter plot with:
#    X-axis    -> Sepal.Length
#    Y-axis    -> Petal.Length
# ----------------------------------------------------------

ggplot(
  iris,
  aes(x = Sepal.Length, y = Petal.Length)
) +
  geom_point()


# 2. Change the colour of all points
# ----------------------------------------------------------

ggplot(
  iris,
  aes(x = Sepal.Length, y = Petal.Length)
) +
  geom_point(color = "blue")


# Other colours you can try:
# "red"
# "green"
# "purple"
# "orange"


# 3. Map Species to the colour aesthetic
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Sepal.Length,
    y = Petal.Length,
    colour = Species
  )
) +
  geom_point()

# Answer:
# When Species is placed inside aes(), ggplot2 maps the
# different Species categories to different colours.
#
# Because Species is a categorical variable, ggplot2
# automatically assigns different colours to each category.
#
# When colour = "blue" is placed outside aes(), all points
# have the same blue colour.


# 4. Map Species to the shape aesthetic
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Sepal.Length,
    y = Petal.Length,
    shape = Species
  )
) +
  geom_point()


# 5. Map Species to BOTH colour and shape
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Sepal.Length,
    y = Petal.Length,
    colour = Species,
    shape = Species
  )
) +
  geom_point()


# 6. Create the same plot but map Species to size
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Sepal.Length,
    y = Petal.Length,
    size = Species
  )
) +
  geom_point()

# Note:
# Mapping a categorical variable to size is possible,
# but it is generally less effective than colour or shape
# for distinguishing categories.


# 7. Add an appropriate title
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Sepal.Length,
    y = Petal.Length,
    colour = Species
  )
) +
  geom_point() +
  labs(
    title = "Sepal Length vs Petal Length by Species"
  )


# 8. Change the x-axis label
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Sepal.Length,
    y = Petal.Length,
    colour = Species
  )
) +
  geom_point() +
  labs(
    title = "Sepal Length vs Petal Length by Species",
    x = "Sepal Length (cm)"
  )


# 9. Change the y-axis label
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Sepal.Length,
    y = Petal.Length,
    colour = Species
  )
) +
  geom_point() +
  labs(
    title = "Sepal Length vs Petal Length by Species",
    x = "Sepal Length (cm)",
    y = "Petal Length (cm)"
  )


############################################################
# PART B: EXPERIMENT WITH AESTHETICS
############################################################

# 10. Create a scatter plot of:
#     Sepal.Width vs Petal.Width
# ----------------------------------------------------------

ggplot(
  iris,
  aes(x = Sepal.Width, y = Petal.Width)
) +
  geom_point()


# 11. Colour the points based on Species
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Sepal.Width,
    y = Petal.Width,
    colour = Species
  )
) +
  geom_point()


# 12. Try changing the point size
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Sepal.Width,
    y = Petal.Width,
    colour = Species
  )
) +
  geom_point(size = 4)


# 13. Try changing the point transparency
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Sepal.Width,
    y = Petal.Width,
    colour = Species
  )
) +
  geom_point(alpha = 0.5)


# alpha:
# 1.0 = completely opaque
# 0.5 = partially transparent
# 0.2 = highly transparent


# 14. Try changing the point shape
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Sepal.Width,
    y = Petal.Width,
    colour = Species
  )
) +
  geom_point(shape = 17)


# Common shapes:
# 16 = filled circle
# 17 = filled triangle
# 15 = filled square
# 18 = filled diamond


# 15. Combine at least TWO different aesthetics
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Sepal.Width,
    y = Petal.Width,
    colour = Species,
    shape = Species
  )
) +
  geom_point(
    size = 3,
    alpha = 0.7
  )


############################################################
# PART C: BOX PLOT
############################################################

# 20. Create a box plot showing Petal.Length for each Species
# ----------------------------------------------------------

ggplot(
  iris,
  aes(x = Species, y = Petal.Length)
) +
  geom_boxplot()


# 21. Change the colour of the boxes
# ----------------------------------------------------------

ggplot(
  iris,
  aes(x = Species, y = Petal.Length)
) +
  geom_boxplot(color = "blue")


# 22. Map Species to the fill aesthetic
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Species,
    y = Petal.Length,
    fill = Species
  )
) +
  geom_boxplot()


# 23. Try using both colour and fill
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Species,
    y = Petal.Length,
    fill = Species,
    colour = Species
  )
) +
  geom_boxplot()


# 24. Change the transparency of the boxes
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Species,
    y = Petal.Length,
    fill = Species
  )
) +
  geom_boxplot(alpha = 0.6)


# 25. Add an appropriate title
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Species,
    y = Petal.Length,
    fill = Species
  )
) +
  geom_boxplot(alpha = 0.6) +
  labs(
    title = "Petal Length by Iris Species"
  )


# 26. Change the x-axis and y-axis labels
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Species,
    y = Petal.Length,
    fill = Species
  )
) +
  geom_boxplot(alpha = 0.6) +
  labs(
    title = "Petal Length by Iris Species",
    x = "Iris Species",
    y = "Petal Length (cm)"
  )


# 27. Try a different theme
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Species,
    y = Petal.Length,
    fill = Species
  )
) +
  geom_boxplot(alpha = 0.6) +
  labs(
    title = "Petal Length by Iris Species",
    x = "Iris Species",
    y = "Petal Length (cm)"
  ) +
  theme_minimal()


# Other themes you can try:
# theme_classic()
# theme_bw()
# theme_light()
# theme_dark()


############################################################
# PART D: LINE PLOT
############################################################

# Create a small dataset for this exercise

temperature <- data.frame(
  Day = 1:7,
  Temperature = c(29, 30, 31, 30, 32, 33, 31)
)


# 28. Create a line plot showing Temperature against Day
# ----------------------------------------------------------

ggplot(
  temperature,
  aes(x = Day, y = Temperature)
) +
  geom_line()


# 29. Add points to the line plot
# ----------------------------------------------------------

ggplot(
  temperature,
  aes(x = Day, y = Temperature)
) +
  geom_line() +
  geom_point()


# 30. Change the colour of the line
# ----------------------------------------------------------

ggplot(
  temperature,
  aes(x = Day, y = Temperature)
) +
  geom_line(color = "blue") +
  geom_point()


# 31. Change the thickness of the line
# ----------------------------------------------------------

ggplot(
  temperature,
  aes(x = Day, y = Temperature)
) +
  geom_line(
    color = "blue",
    linewidth = 1.5
  ) +
  geom_point()


# 32. Change the size of the points
# ----------------------------------------------------------

ggplot(
  temperature,
  aes(x = Day, y = Temperature)
) +
  geom_line(
    color = "blue",
    linewidth = 1.5
  ) +
  geom_point(size = 4)


# 33. Change the shape of the points
# ----------------------------------------------------------

ggplot(
  temperature,
  aes(x = Day, y = Temperature)
) +
  geom_line(
    color = "blue",
    linewidth = 1.5
  ) +
  geom_point(
    size = 4,
    shape = 17
  )


# 34. Make the points partially transparent
# ----------------------------------------------------------

ggplot(
  temperature,
  aes(x = Day, y = Temperature)
) +
  geom_line(
    color = "blue",
    linewidth = 1.5
  ) +
  geom_point(
    size = 4,
    shape = 17,
    alpha = 0.6
  )


# 35. Add a suitable title and axis labels
# ----------------------------------------------------------

ggplot(
  temperature,
  aes(x = Day, y = Temperature)
) +
  geom_line(
    color = "blue",
    linewidth = 1.5
  ) +
  geom_point(
    size = 4,
    shape = 17,
    alpha = 0.6
  ) +
  labs(
    title = "Daily Temperature",
    x = "Day",
    y = "Temperature (°C)"
  ) +
  theme_minimal()


############################################################
# PART E: FACETING
############################################################

# 36. Create a scatter plot of:
#     Sepal.Length vs Petal.Length
#     Colour the points according to Species
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Sepal.Length,
    y = Petal.Length,
    colour = Species
  )
) +
  geom_point()


# 37. Create separate panels for each Species using faceting
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Sepal.Length,
    y = Petal.Length,
    colour = Species
  )
) +
  geom_point() +
  facet_wrap(~ Species)


# 38. Change the number of rows used by the facets
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Sepal.Length,
    y = Petal.Length,
    colour = Species
  )
) +
  geom_point() +
  facet_wrap(
    ~ Species,
    nrow = 3
  )


# 39. Change the number of columns used by the facets
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Sepal.Length,
    y = Petal.Length,
    colour = Species
  )
) +
  geom_point() +
  facet_wrap(
    ~ Species,
    ncol = 3
  )


# 40. Add an appropriate title to the faceted plot
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Sepal.Length,
    y = Petal.Length,
    colour = Species
  )
) +
  geom_point() +
  facet_wrap(
    ~ Species,
    ncol = 3
  ) +
  labs(
    title = "Sepal Length vs Petal Length by Species",
    x = "Sepal Length (cm)",
    y = "Petal Length (cm)"
  ) +
  theme_minimal()


############################################################
# PART F: CUSTOMISE THE COMPLETE PLOT
############################################################

# Starting plot

ggplot(
  iris,
  aes(
    x = Sepal.Length,
    y = Petal.Length,
    colour = Species
  )
) +
  geom_point()


# 41. Change the point size
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Sepal.Length,
    y = Petal.Length,
    colour = Species
  )
) +
  geom_point(size = 4)


# 42. Change the point transparency
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Sepal.Length,
    y = Petal.Length,
    colour = Species
  )
) +
  geom_point(
    size = 4,
    alpha = 0.6
  )


# 43. Change the point shape
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Sepal.Length,
    y = Petal.Length,
    colour = Species
  )
) +
  geom_point(
    size = 4,
    alpha = 0.6,
    shape = 16
  )


# 44. Add a meaningful title and subtitle
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Sepal.Length,
    y = Petal.Length,
    colour = Species
  )
) +
  geom_point(
    size = 4,
    alpha = 0.6,
    shape = 16
  ) +
  labs(
    title = "Relationship Between Sepal and Petal Length",
    subtitle = "Comparison of three Iris species"
  )


# 45. Change the x-axis label
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Sepal.Length,
    y = Petal.Length,
    colour = Species
  )
) +
  geom_point(
    size = 4,
    alpha = 0.6,
    shape = 16
  ) +
  labs(
    title = "Relationship Between Sepal and Petal Length",
    subtitle = "Comparison of three Iris species",
    x = "Sepal Length (cm)"
  )


# 46. Change the y-axis label
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Sepal.Length,
    y = Petal.Length,
    colour = Species
  )
) +
  geom_point(
    size = 4,
    alpha = 0.6,
    shape = 16
  ) +
  labs(
    title = "Relationship Between Sepal and Petal Length",
    subtitle = "Comparison of three Iris species",
    x = "Sepal Length (cm)",
    y = "Petal Length (cm)"
  )


# 47. Change the legend title
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Sepal.Length,
    y = Petal.Length,
    colour = Species
  )
) +
  geom_point(
    size = 4,
    alpha = 0.6,
    shape = 16
  ) +
  labs(
    title = "Relationship Between Sepal and Petal Length",
    subtitle = "Comparison of three Iris species",
    x = "Sepal Length (cm)",
    y = "Petal Length (cm)",
    colour = "Iris Species"
  )


# 48. Move the legend to a different position
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Sepal.Length,
    y = Petal.Length,
    colour = Species
  )
) +
  geom_point(
    size = 4,
    alpha = 0.6,
    shape = 16
  ) +
  labs(
    title = "Relationship Between Sepal and Petal Length",
    subtitle = "Comparison of three Iris species",
    x = "Sepal Length (cm)",
    y = "Petal Length (cm)",
    colour = "Iris Species"
  ) +
  theme(
    legend.position = "bottom"
  )


# 49. Apply a different ggplot2 theme
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Sepal.Length,
    y = Petal.Length,
    colour = Species
  )
) +
  geom_point(
    size = 4,
    alpha = 0.6,
    shape = 16
  ) +
  labs(
    title = "Relationship Between Sepal and Petal Length",
    subtitle = "Comparison of three Iris species",
    x = "Sepal Length (cm)",
    y = "Petal Length (cm)",
    colour = "Iris Species"
  ) +
  theme_classic() +
  theme(
    legend.position = "bottom"
  )


# 50. Change the size of the plot title
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Sepal.Length,
    y = Petal.Length,
    colour = Species
  )
) +
  geom_point(
    size = 4,
    alpha = 0.6
  ) +
  labs(
    title = "Relationship Between Sepal and Petal Length",
    subtitle = "Comparison of three Iris species",
    x = "Sepal Length (cm)",
    y = "Petal Length (cm)",
    colour = "Iris Species"
  ) +
  theme_classic() +
  theme(
    legend.position = "bottom",
    plot.title = element_text(size = 18)
  )


# 51. Change the size of the axis text
# ----------------------------------------------------------

ggplot(
  iris,
  aes(
    x = Sepal.Length,
    y = Petal.Length,
    colour = Species
  )
) +
  geom_point(
    size = 4,
    alpha = 0.6
  ) +
  labs(
    title = "Relationship Between Sepal and Petal Length",
    subtitle = "Comparison of three Iris species",
    x = "Sepal Length (cm)",
    y = "Petal Length (cm)",
    colour = "Iris Species"
  ) +
  theme_classic() +
  theme(
    legend.position = "bottom",
    plot.title = element_text(size = 18),
    axis.text = element_text(size = 12)
  )


# 52. FINAL CUSTOMISED VERSION
#     Combining at least FIVE customisations
# ----------------------------------------------------------

final_plot <- ggplot(
  iris,
  aes(
    x = Sepal.Length,
    y = Petal.Length,
    colour = Species
  )
) +
  
  # Customisation 1: point size
  # Customisation 2: transparency
  # Customisation 3: point shape
  geom_point(
    size = 4,
    alpha = 0.7,
    shape = 16
  ) +
  
  # Customisation 4, 5, 6, 7: title, subtitle and labels
  labs(
    title = "Relationship Between Sepal and Petal Length",
    subtitle = "Comparison of three Iris species",
    x = "Sepal Length (cm)",
    y = "Petal Length (cm)",
    colour = "Iris Species"
  ) +
  
  # Customisation 8: theme
  theme_classic() +
  
  # Customisation 9: legend position
  # Customisation 10: title size
  # Customisation 11: axis text size
  theme(
    legend.position = "bottom",
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
      size = 13
    ),
    legend.title = element_text(
      size = 12,
      face = "bold"
    )
  )


# Display the final plot
final_plot


############################################################
# END OF EXERCISE 5
############################################################
