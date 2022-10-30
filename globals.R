
########################################################################################################
# This global script installs, loads and executes all the required packages and project files.
########################################################################################################
# Installed Packages
# install.packages("RSQL")
# install.packages("RSQLite")
# install.packages("dplyr")
# install.packages("naniar")
# install.packages("ggplot2")
# install.packages("shiny")
# install.packages("shinythemes")
# install.packages("tidyverse")
########################################################################################################
# Loads the required packages.
library("RSQL") # Generate and process SQL queries in R.
library("RSQLite") # Can create an in-memory database.
library("dplyr") # A package for making data manipulation easier.
library("naniar") # Facilitates the plotting of missing values and examination of imputations
library("ggplot2") # Plotting package to create complex plots from the data frame. 
library("shiny") # makes it easy to build interactive web apps straight from R.
library("shinythemes") # easily alter the overall appearance of your Shiny application
library("forcats") # solve common problems with factors, changing the order of levels or the values.
library("tidyverse") # Provides helpful functions and sample data to use in R.
########################################################################################################
# Creates placeholder for a database and stores it in 'con' object
con <- dbConnect(drv = RSQLite::SQLite(), dbname = ":memory:")
########################################################################################################
# Run the source files to execute the SQL queries
source("./CustomerDetails.R")
source("./EmployeeDetails.R")
source("./ProductDetails.R")
source("./SalesDetails.R")
########################################################################################################
# Returns a list of tables stored within the database
dbListTables(con) 
########################################################################################################
# Read the table contents and store to dataframe. 
# Can be used instead of (SELECT *) query.
df_customer <- dbReadTable(con, "Customers") 
df_employee <- dbReadTable(con, "Employees")
df_product <- dbReadTable(con, "Products")  
df_sale <- dbReadTable(con, "Sales")  

# find the structure of data
str(df_customer)

# Close the db connection
dbDisconnect(con)

# Source file for finding the revenue and no. of units sold among product categories.
source("./insights-1.R")  

# Source file for finding the sales by product.
source("./insights-2.R")

# Source file for finding customer loyalty.
source("./insights-3.R")
########################################################################################################