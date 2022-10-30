
# replace the value 'NULL' in column 'MiddleInitial' with NA.
# unite columns FirstName, MiddleInitial, LastName with 'Customer Name' column
df_customer <- df_customer %>% 
  replace_with_na(replace = list(MiddleInitial = "NULL")) %>%
  unite(col = "CustomerName", FirstName, MiddleInitial, LastName, sep = " ", na.rm = TRUE)

# unite columns FirstName, MiddleInitial, LastName with 'Employee Name' column
df_employee <- df_employee %>% 
  unite(col = "EmployeeName", FirstName, MiddleInitial, LastName, sep = " ")

# data frame created by joining all the tables
df_merge_tables <- df_product %>%
  inner_join(df_sale, by = "ProductID") %>%
  inner_join(df_customer, by = "CustomerID") %>%
  inner_join(df_employee, by = c("SalesPersonID" = "EmployeeID")) %>%
  mutate(SalesAmount = Quantity * Price)

# total sales summary 
total_sales_summary <- df_merge_tables %>%
  select(ProductID, Name, EmployeeName, CustomerName, Price, Quantity, SalesAmount)

# products on sale with price(priced more than £0)
priced_products <- total_sales_summary%>%
  filter(Price>0) %>%
  distinct(ProductID, .keep_all = TRUE) %>%
  arrange(desc(Price)) %>%
  select(ProductID, Name, Price)

# Top priced products
high_price <- priced_products %>%
  head(n =10)

# Low priced products
low_price <- priced_products %>%
  arrange(Price) %>%
  head(n =10)

# Top Performing (Sales)
high_units <- total_sales_summary %>%
  group_by(ProductID, Name) %>%
  summarise(Quantity = sum(Quantity)) %>%
  arrange(desc(Quantity)) %>%
  head(n = 10)

# Least Performing (Sales)
low_units <- total_sales_summary %>%
  group_by(ProductID, Name) %>%
  summarise(Quantity = sum(Quantity)) %>%
  arrange(Quantity) %>%
  head(n = 10)

# Top Performing (Revenue)
high_revenue <- total_sales_summary %>%
  group_by(ProductID, Name) %>%
  summarise(SalesAmount = sum(SalesAmount)) %>%
  arrange(desc(SalesAmount)) %>%
  head(n = 10)

# Least Performing (Revenue)
low_revenue <- total_sales_summary %>%
  group_by(ProductID, Name) %>%
  summarise(SalesAmount = sum(SalesAmount)) %>%
  filter(SalesAmount>0) %>%
  arrange(SalesAmount) %>%
  head(n = 10)

# induvidual product sales function
p_sales <- function(p_id) {
  total_sales_summary %>%
    group_by(ProductID) %>%
    filter(ProductID %in% p_id) 
}

# induvidual product sales summary function
p_sales_summary <- function(p_id) {
  total_sales_summary %>%
    group_by(ProductID) %>%
    filter(ProductID %in% p_id) %>%
    summarise(Quantity = sum(Quantity), SalesAmount = sum(SalesAmount)) %>%
    mutate(Sales_Percentage = (Quantity/total_units_sold)*100, Revenue_Percentage = (SalesAmount/total_sales_revenue)*100)
}

# total products listed: 504
Total <- nrow(df_product)
# active products (at least one sale): 300
OnSale <- nrow(df_merge_tables)
# products priced above £0: 205
nonfree <- nrow(priced_products)
# products which are not in sale: 204
NotInSale <- Total - OnSale
# free products on sale: 95
free <- OnSale - nonfree



prod_stats <- data.frame(free, nonfree, NotInSale, OnSale, Total)

prod_stats <- prod_stats %>%
  gather(key = "Category", value = "Quantity", 1, 2, 3, 4, 5)

# Percentage of non-free products on Sale: 68.33%
pct_nonfree_sale <- round((nonfree/OnSale) * 100, 2)

# Percentage of free products on Sale: 31.67%
pct_free_sale <- round((free/OnSale) * 100, 2)

# Percentage of products on Sale: 59.52%
pct_on_sale <- round((OnSale/Total) * 100, 2)

# Percentage of products not in Sale: 40.48%
pct_off_sale <- round((NotInSale/Total) * 100, 2)

