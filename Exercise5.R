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
# 2. Change the colour of all points.
# 3. Map Species to the colour aesthetic.
#    Observe what happens when colour is mapped
#    inside aes() instead of being specified outside it.
# 4. Map Species to the shape aesthetic.
# 5. Map Species to BOTH colour and shape.
# 6. Create the same plot but map Species to size.
# 7. Add an appropriate title.
# 8. Change the x-axis label.
# 9. Change the y-axis label.

############################################################
# PART B: EXPERIMENT WITH AESTHETICS
############################################################

# 10. Create a scatter plot of: Sepal.Width vs Petal.Width
# 11. Colour the points based on Species.
# 12. Try changing the point size.
# 13. Try changing the point transparency.
# 14. Try changing the point shape.
# 15. Combine at least TWO different aesthetics in the same plot.

############################################################
# PART C: BOX PLOT
############################################################

# 20. Create a box plot showing Petal.Length for each Species.
# 21. Change the colour of the boxes.
# 22. Map Species to the fill aesthetic.
# 23. Try using both colour and fill.
# 24. Change the transparency of the boxes.
# 25. Add an appropriate title.
# 26. Change the x-axis and y-axis labels.
# 27. Try a different theme.


############################################################
# PART D: LINE PLOT
############################################################

# Create a small dataset for this exercise.

temperature <- data.frame(
  Day = 1:7,
  Temperature = c(29, 30, 31, 30, 32, 33, 31)
)

# 28. Create a line plot showing Temperature against Day.
# 29. Add points to the line plot.
# 30. Change the colour of the line.
# 31. Change the thickness of the line.
# 32. Change the size of the points.
# 33. Change the shape of the points.
# 34. Make the points partially transparent.
# 35. Add a suitable title and axis labels.

############################################################
# PART E: FACETING
############################################################

# 36. Create a scatter plot of:
#     Sepal.Length vs Petal.Length
#     Colour the points according to Species.
# 37. Create separate panels for each Species using faceting.
# 38. Change the number of rows used by the facets.
# 39. Change the number of columns used by the facets.
# 40. Add an appropriate title to the faceted plot.


############################################################
# PART F: CUSTOMISE THE COMPLETE PLOT
############################################################

ggplot(
  iris,
  aes(
    x = Sepal.Length,
    y = Petal.Length,
    colour = Species
  )
) +
  geom_point()

# 41. Change the point size.
# 42. Change the point transparency.
# 43. Change the point shape.
# 44. Add a meaningful title and subtitle.
# 45. Change the x-axis label.
# 46. Change the y-axis label
# 47. Change the legend title.
# 48. Move the legend to a different position.
# 49. Apply a different ggplot2 theme.
# 50. Change the size of the plot title.
# 51. Change the size of the axis text.
# 52. Create a final customised version of the plot combining at least FIVE customisations.
