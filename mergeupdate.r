#non destructve update of na vals in df1

df1 <- data.frame(col1 = c("A", "B", "C", "D","E"),
                  col2 = c(1, 2, 3, 4,5),
                  col3 = c(10, NA, 30, 40,NA))

df2 <- data.frame(col1 = c("B", "D"),
                  col2 = c(2, 4),
                  col3 = c(122, 4000))
#we can subset here instead of df1 and this will target just na rows for col3
merged_df <- merge(df1, df2, by = c("col1", "col2"), all.x = TRUE)

# Update values in col3 of df1 if they are NA, using values from df2
merged_df$col3.x <- ifelse(is.na(merged_df$col3.x), merged_df$col3.y, merged_df$col3.x)

# Select relevant columns
result_df <- merged_df[, c("col1", "col2", "col3.x")]

# Rename columns for clarity
colnames(result_df) <- c("col1", "col2", "col3")
result_df
