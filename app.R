#' ---
#' title: "Data Engineering Project: Analysis of Sales Database"
#' author: "Rahul Das"
#' date: "Oct 30th, 2022"
#' ---

# source file for Shiny UI
source("./ui.R")
# source file for Shiny server
source("./server.R")
# Create Shiny object
shinyApp(ui = ui, server = server)
