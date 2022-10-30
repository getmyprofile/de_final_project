
# all sales by customer
sales_by_customer <- df_merge_tables %>%
  select(CustomerID, CustomerName, ProductID, Name, Price, Quantity, SalesAmount)

# top 10 customer sales by sales amount 
cust_purchase_amt <- sales_by_customer %>%
  group_by(CustomerID, CustomerName) %>%
  summarise(SalesAmount = sum(SalesAmount)) %>%
  arrange(desc(SalesAmount)) %>%
  head(n = 10)

# top 10 customer sales by quantity
cust_purchase_qty <- sales_by_customer %>%
  group_by(CustomerID, CustomerName) %>%
  summarise(Quantity = sum(Quantity)) %>%
  arrange(desc(Quantity)) %>%
  head(n = 10)

# all sales by frequency of purchase
cust_purchase_freq <- sales_by_customer %>%
  group_by(CustomerID, CustomerName) %>%
  summarise(Visits = n(), Quantity = sum(Quantity), SalesAmount = sum(SalesAmount)) %>%
  arrange(desc(Visits))

# finding the returning customers
returning_customers <- cust_purchase_freq %>%
  filter(Visits>1)

# top 10 returning customers
top_ret_cust <- returning_customers %>%
  arrange(desc(SalesAmount)) %>%
  head(n = 10)

# induvidual customer sales function
cust_sales <- function(c_id) {
  sales_by_customer %>%
    group_by(CustomerID) %>%
    filter(CustomerID %in% c_id) 
}

# induvidual customer sales summary function
cust_sales_summary <- function(c_id) {
  sales_by_customer %>%
    group_by(CustomerID) %>%
    filter(CustomerID %in% c_id) %>%
    summarise(Quantity = sum(Quantity), SalesAmount = sum(SalesAmount)) %>%
    mutate(Sales_Percentage = (Quantity/total_units_sold)*100, Revenue_Percentage = (SalesAmount/total_sales_revenue)*100)
}

# total customers listed: 360
tot_cust <- nrow(df_customer)
# active customers (at least one purchase): 300
act_cust <- nrow(sales_by_customer)
# returning customers (more than one purchase): 73
ret_cust <- nrow(returning_customers)
# percentage of returning customers 20.28%
ret_cust_pct <- round((ret_cust/tot_cust) * 100, 2)

# revenue from returning customers: 589393.8
ret_cust_rev <- returning_customers %>%
  summarise(SalesAmount) %>%
  summarise(Amount = sum(SalesAmount))

# revenue from all customers: 1058762 
cust_rev <- sales_by_customer %>%
  summarise(SalesAmount) %>%
  summarise(Amount = sum(SalesAmount))

# revenue from other customers: 469369.5
other_cust_rev <- cust_rev - ret_cust_rev

# percentage of revenue from returning customers: 55.67%
ret_cust_rev_pct <- round((ret_cust_rev/cust_rev) * 100, 2)

# Quantity of sales by returning customers: 941
ret_cust_sales_qty <- returning_customers %>%
  summarise(Quantity) %>%
  summarise(Quantity = sum(Quantity))

# Quantity of sales by all customers: 1681
cust_sales_qty <- sales_by_customer %>%
  summarise(Quantity) %>%
  summarise(Quantity = sum(Quantity))

# Quantity of sales by other customers: 740
other_cust_qty <- cust_sales_qty - ret_cust_sales_qty

# percentage of sales from returning customers: 55.98%
ret_cust_sales_pct <- round((ret_cust_sales_qty/cust_sales_qty) * 100, 2)

cust_num_stats <- data.frame(ret_cust, act_cust, tot_cust)
names(cust_num_stats) <- c("Ret. Customers", "Active Customers", "Total Customers")

# customer number stats
cust_num_stats <- cust_num_stats %>%
  gather(key = "Category", value = "Number", 1, 2, 3)

cust_rev_stats <- data.frame(other_cust_rev, ret_cust_rev, cust_rev)
names(cust_rev_stats) <- c("Other Customers", "Ret. Customers", "All Customers")

# customer revenue stats
cust_rev_stats <- cust_rev_stats %>%
  gather(key = "Category", value = "Number", 1, 2, 3)

cust_pur_stats <- data.frame(other_cust_qty, ret_cust_sales_qty, cust_sales_qty)
names(cust_pur_stats) <- c("Other Customers", "Ret. Customers", "All Customers")

# customer purchase stats
cust_pur_stats <- cust_pur_stats %>%
  gather(key = "Category", value = "Number", 1, 2, 3)
