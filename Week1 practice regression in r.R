setwd("C:\\Users\\User\\Desktop\\19학년도 회귀분석 및 실습\\Data\\Week1 Data")

# Import csv file
# The csv file can be imported using read.csv
# Argument 
# header : A logical value indicating whether the file contains the names of the variables as its first line
# stringsAsFactors : should character vectors be converted to factors?
iris_1 = read.csv("iris1.csv", header = TRUE, stringsAsFactors = FALSE)

# Returns the first parts of a data
head(iris_1)

# five number summary + mean by columns
summary(iris_1)

# Import xls or xlsx file
# The xls or xlsx file can be imported using read_xls or read_xlsx from readxl package
# Argument
# sheet : Sheet to read
# col_names : TRUE to use the first row as column names
require(readxl)
iris_xlsx = read_xlsx("iris.xlsx", sheet = 1, col_names = TRUE)

# tbl as data.frame
iris_xlsx = as.data.frame(iris_xlsx)

# summarise data
head(iris_xlsx)
summary(iris_xlsx)

# Sorting data by specified columns values
iris_xlsx[order(iris_xlsx$Species, decreasing = FALSE), ]
iris_xlsx[order(iris_xlsx$Sepal.Length, decreasing = FALSE), ]
iris_xlsx[order(iris_xlsx$Sepal.Length, decreasing = TRUE), ]
iris_xlsx[order(iris_xlsx$Sepal.Length, iris_xlsx$Sepal.Width, decreasing = TRUE), ]

# order a data by one descending and one ascending
iris_xlsx[order(iris_xlsx$Sepal.Length, rev(iris_xlsx$Sepal.Width), decreasing = TRUE), ]

# Creating new variables
iris_xlsx$dummy = ifelse(iris_xlsx$Species == "setosa", 1, 0) # "dummy is a name of new variable"

# Merging two data.frame
iris_2 = read.csv("iris2.csv", header = TRUE, stringsAsFactors = FALSE)
iris_3 = read.csv("iris3.csv", header = TRUE, stringsAsFactors = FALSE)
iris_4 = read.csv("iris4.csv", header = TRUE, stringsAsFactors = FALSE)


# Two matrix combine by columns
cbind_data = cbind(iris_1, iris_2)

# Two matrix combine by rows
rbind_data = rbind(iris_1, iris_2)

# Merging tow data.frame by specified columns
merged_data = merge(iris_3, iris_4, by = "Species")

# Export data
# Export csv file
write.csv(merged_data, file = "C:/users/user/desktop/merged_data.csv")

# Export txt file
write.table(merged_data, file = "C:/users/user/desktop/merged_data.txt")

# Export xls or xlsx
require(xlsx)
write.xlsx(merged_data, file = "C:/users/user/desktop/merged_data.xlsx")