col_names <- c("a", "b", "c")
df <- tibble(a = c(1, 2, 3), b = c(4, 5, 6), c = c(7, 8, 9))
dep_var = "b"
subset(df, select = -which(colnames(df) %in% dep_var))

