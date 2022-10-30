
# source file for accessing database and data frame objects
source("./globals.R")

# populate the product names in the Product selectinput var
choiceNames1 <- setNames(df_product$ProductID, df_product$Name)
# populate the product names in the Product selectinput var
choiceNames2 <- setNames(df_customer$CustomerID, df_customer$CustomerName)

# Define UI
ui <- fluidPage(theme = shinythemes::shinytheme("cerulean"),
                navbarPage(
                  "Matrix Manufacturing and Retail",
                  tabPanel("Insight 1",
                           headerPanel("Product Category Comparison: Road Bike vs Mountain Bike"),
                           mainPanel(
                             plotOutput("plot1"),
                             tags$u(h3("Key Insights")),
                             tags$ul(h4("1. No. of Road bike units sold is more than Mountain bikes.(160 > 150).")),
                             tags$ul(h4("2. Revenue from Road bikes is greater than Mountain bikes.(272760.1 > 229822.0).")),
                             tags$ul(h4("3. Road bike and Mountain bike combined accounts for 47.47% of the total revenue.")),
                             shiny::br(),
                           ) # mainPanel
                  ), # Insight 1, tabPanel
                  
                  tabPanel("Insight 2", 
                           headerPanel("Sales Breakdown"),
                           # sidebarPanel
                           sidebarPanel(
                             h4("All Product List"),
                             selectInput("var", 
                                         label = "Product Name:", 
                                         choices = choiceNames1, 
                             ),
                             actionButton("submitbutton1", "Submit", class = "btn btn-primary"),
                             
                             tags$hr(style = "height:1px;border:none;color:#3eaae8;background-color:#3eaae8;"),
                             h4("Product Performance"),
                             radioButtons("rb", "Choose one:",
                                          choiceNames = list(
                                            "Top Performing (Revenue)",
                                            "Least Performing (Revenue)",
                                            "Top Performing (Sales)",
                                            "Least Performing (Sales)",
                                            "Top Priced Products on Sale",
                                            "Least Priced Products on Sale",
                                            "Product Statistics"
                                          ),
                                          choiceValues = list(
                                            "high_revenue",
                                            "low_revenue",
                                            "high_units",
                                            "low_units",
                                            "high_price",
                                            "low_price",
                                            "prod_stats"
                                          )),
                             actionButton("submitbutton2", "Submit", class = "btn btn-primary"),
                           ), # sidebarPanel
                           
                           # mainPanel
                           mainPanel(
                             h4("Product Sales List and Summary"),
                             tags$hr(style = "height:1px;border:none;color:#333;background-color:#333;"),
                             textOutput("output1"),
                             tableOutput('tabledata1'),
                             tags$hr(style = "height:1px;border:none;color:#3eaae8;background-color:#3eaae8;"),
                             textOutput("output2"),
                             tableOutput('tabledata2'),
                             tags$hr(style = "height:1px;border:none;color:#333;background-color:#333;"),
                             h4("Product Performance Details"),
                             textOutput("output3"),
                             tableOutput('tabledata3'),
                             tags$hr(style = "height:1px;border:none;color:#3eaae8;background-color:#3eaae8;"),
                             plotOutput("plot2"),
                             tags$hr(style = "height:1px;border:none;color:#333;background-color:#333;"),
                           ), # mainPanel
                           
                  ), # Insight 2, tabPanel
                  tabPanel("Insight 3", 
                           headerPanel("Customer Loyalty"),
                           # sidebarPanel
                           sidebarPanel(
                             h4("All Customer List"),
                             selectInput("var1", 
                                         label = "Customer Name:", 
                                         choices = choiceNames2, 
                                         selected = choiceNames2[1]
                             ),
                             actionButton("submitbutton3", "Submit", class = "btn btn-primary"),
                             
                             tags$hr(style = "height:1px;border:none;color:#3eaae8;background-color:#3eaae8;"),
                             h4("Customer Loyalty"),
                             radioButtons("rb1", "Choose one:",
                                          choiceNames = list(
                                            "Top Customers (Revenue)",
                                            "Top Customers (Sales)",
                                            "Top Returning Customers",
                                            "Customer Number Stats.",
                                            "Customer Revenue Stats.",
                                            "Customer Purchase Stats."
                                          ),
                                          choiceValues = list(
                                            "cust_purchase_amt",
                                            "cust_purchase_qty",
                                            "top_ret_cust",
                                            "cust_num_stats",
                                            "cust_rev_stats",
                                            "cust_pur_stats"
                                          )),
                             actionButton("submitbutton4", "Submit", class = "btn btn-primary"),
                           ), # sidebarPanel
                           
                           # mainPanel
                           mainPanel(
                             h4("Customer Sales List and Summary"),
                             tags$hr(style = "height:1px;border:none;color:#333;background-color:#333;"),
                             textOutput("output4"),
                             tableOutput('tabledata4'),
                             tags$hr(style = "height:1px;border:none;color:#3eaae8;background-color:#3eaae8;"),
                             textOutput("output5"),
                             tableOutput('tabledata5'),
                             tags$hr(style = "height:1px;border:none;color:#333;background-color:#333;"),
                             h4("Customer Loyalty Details"),
                             textOutput("output6"),
                             tableOutput('tabledata6'),
                             tags$hr(style = "height:1px;border:none;color:#3eaae8;background-color:#3eaae8;"),
                             plotOutput("plot3"),
                             tags$hr(style = "height:1px;border:none;color:#333;background-color:#333;"),
                           ), # mainPanel
                  ), # Insight 3, tabPanel
                  
                  tabPanel("Summary",
                           headerPanel("Summary on Insights"),
                           mainPanel(
                             tags$u(h3("Key Insights: Road bike vs Mountain bike comparison")),
                             tags$ul(h4("1. No. of Road bike units sold is more than Mountain bikes.(160 > 150).")),
                             tags$ul(h4("2. Revenue from Road bikes is greater than Mountain bikes.(272760.1 > 229822.0).")),
                             tags$ul(h4("3. Road bike and Mountain bike combined accounts for 47.47% of the total revenue.")),
                             shiny::br(),
                             tags$u(h3("Key Insights: Sales Breakdown")),
                             tags$ul(h4("1. No. of total products listed: 504")),
                             tags$ul(h4("2. No. of active products (at least one sale): 300")),
                             tags$ul(h4("3. No. of products priced above £0(non-free): 205")),
                             tags$ul(h4("4. No. of products which never went on sale: 204")),
                             tags$ul(h4("5. No. of free products (priced: £0) on sale: 95")),
                             tags$ul(h4("6. Percentage of products on Sale: 59.52%")),
                             tags$ul(h4("7. Percentage of products not in Sale: 40.48%")),
                             shiny::br(),
                             tags$u(h3("Key Insights: Customer Loyalty")),
                             shiny::br(),
                             tags$u(h4("Customer Number Stats.")),
                             tags$ul(h4("1. No. of total customers listed: 360")),
                             tags$ul(h4("2. No. of active customers (at least one purchase): 300")),
                             tags$ul(h4("3. No. of returning customers (more than one purchase): 73")),
                             tags$ul(h4("4. Percentage of returning customers 20.28%")),
                             shiny::br(),
                             tags$u(h4("Customer Revenue Stats.")),
                             tags$ul(h4("1. Revenue from all customers: £1058762.3")),
                             tags$ul(h4("2. Revenue from returning customers: £589392.8")),
                             tags$ul(h4("3. Revenue from other customers: £469369.5")),
                             tags$ul(h4("4. Percentage of Revenue from returning customers: 55.67%")),
                             shiny::br(),
                             tags$u(h4("Customer Purchase Stats.")),
                             tags$ul(h4("1. Quantity of Sales by all customers: 1681")),
                             tags$ul(h4("2. Quantity of Sales by returning customers: 9418")),
                             tags$ul(h4("3. Quantity of Sales by other customers: 740")),
                             tags$ul(h4("4. Percentage of Sales from returning customers: 55.98%")),
                             shiny::br(),
                           ) # mainPanel
                  ), # Summary tabPanel
                  tabPanel("Recommendation",
                           headerPanel("Advises based on Project Findings"),
                           mainPanel(
                             tags$u(h3("Key Insights: Road bike vs Mountain bike comparison")),
                             tags$ul(h4("1. No. of Road bike units sold is more than Mountain bikes.(160 > 150).")),
                             tags$ul(h4("2. Revenue from Road bikes is greater than Mountain bikes.(272760.1 > 229822.0).")),
                             tags$ul(h4("3. Road bike and Mountain bike combined accounts for 47.47% of the total revenue.")),
                             shiny::br(),
                             tags$u(h3("Key Insights: Sales Breakdown")),
                             tags$ul(h4("1. No. of total products listed: 504")),
                             tags$ul(h4("2. No. of active products (at least one sale): 300")),
                             tags$ul(h4("3. No. of products priced above £0(non-free): 205")),
                             tags$ul(h4("4. No. of products which never went on sale: 204")),
                             tags$ul(h4("5. No. of free products (priced: £0) on sale: 95")),
                             tags$ul(h4("6. Percentage of non-free products on Sale: 68.33%")),
                             tags$ul(h4("7. Percentage of free products on Sale: 31.67%")),
                             tags$ul(h4("8. Percentage of products on Sale: 59.52%")),
                             tags$ul(h4("9. Percentage of products not in Sale: 40.48%")),
                             shiny::br(),
                             tags$u(h3("Key Insights: Customer Loyalty")),
                             shiny::br(),
                             tags$u(h4("Customer Number Stats.")),
                             tags$ul(h4("1. No. of total customers listed: 360")),
                             tags$ul(h4("2. No. of active customers (at least one purchase): 300")),
                             tags$ul(h4("3. No. of returning customers (more than one purchase): 73")),
                             tags$ul(h4("4. Percentage of returning customers 20.28%")),
                             shiny::br(),
                             tags$u(h4("Customer Revenue Stats.")),
                             tags$ul(h4("1. Revenue from all customers: £1058762.3")),
                             tags$ul(h4("2. Revenue from returning customers: £589392.8")),
                             tags$ul(h4("3. Revenue from other customers: £469369.5")),
                             tags$ul(h4("4. Percentage of Revenue from returning customers: 55.67%")),
                             shiny::br(),
                             tags$u(h4("Customer Purchase Stats.")),
                             tags$ul(h4("1. Quantity of Sales by all customers: 1681")),
                             tags$ul(h4("2. Quantity of Sales by returning customers: 9418")),
                             tags$ul(h4("3. Quantity of Sales by other customers: 740")),
                             tags$ul(h4("4. Percentage of Sales from returning customers: 55.98%")),
                             shiny::br(),
                           ) # mainPanel
                  ), # Summary tabPanel
                ) # navbarPage
) # fluidPage
