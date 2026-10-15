# 1. Load the required libraries (Install them first if needed using install.packages)
install.packages("tidyverse")
install.packages("writexl")
library(tidyverse)
library(writexl)

# 2. Load the dataset
df <- read_csv("netflix_titles.csv")

# 3. Clean: Drop rows where crucial columns have missing (NA) values
df_clean <- df %>% drop_na(title, country, release_year)

# 4. Analyze: Count how many Movies vs. TV Shows exist
type_counts <- df_clean %>% count(type)
print(type_counts)

# 5. Visualize: Create a clean bar chart using ggplot2
ggplot(type_counts, aes(x = type, y = n, fill = type)) +
  geom_bar(stat = "identity", color = "black") +
  scale_fill_manual(values = c("Movie" = "red", "TV Show" = "black")) +
  labs(title = "Netflix Content: Movies vs TV Shows", 
       x = "Content Type", 
       y = "Count") +
  theme_minimal()

# Save the chart as an image
ggsave("netflix_chart_r.png", width = 6, height = 4)

# 6. EXPORT ALTERNATIVE: Saves as a CSV which Excel opens perfectly automatically
write_csv(df_clean, "cleaned_netflix_data_r.csv")
print("Project complete! Your clean CSV file has been saved successfully.")

