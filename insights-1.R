
# Function definition for getting product category revenue details
model <- function(model_name) {
  df_product %>%
  filter(grepl(model_name, Name)) %>%
  inner_join(df_sale, by = "ProductID") %>%
  group_by(ProductID) %>%
  mutate(SalesAmount = Quantity * Price) %>%
  summarise(Quantity = sum(Quantity), SalesAmount = sum(SalesAmount)) 
}

# Function definition for getting no. of units sold for the product category.
unit_sale <- function(model_name) {
  df_product %>%
  filter(grepl(model_name, Name)) %>%
  inner_join(df_sale, by = "ProductID") %>%
  group_by(ProductID) %>%
  summarise(Quantity = sum(Quantity)) %>%
  summarise(Q = sum(Quantity))
}

# Regex for finding Road bike and mountain bike from data set.
road_bike <- "^(Road)-(\\d{3})(-?W?)\\s(\\w{3,6})\\s(\\d{2})$"
mountain_bike <- "^(Mountain)-(\\d{3})(-?W?)\\s(\\w{5,6})\\s(\\d{2})$"

# Function call for product category: 'Road Bike' revenue details.
road_bike_revenue <- model(road_bike) %>%
  summarize(RoadBikeSales = sum(SalesAmount))

# Function call for finding no. of 'Road Bike' units sold.
road_units_sold <- unit_sale(road_bike)

# Function call for product category: 'Mountain Bike' revenue details.
mountain_bike_revenue <- model(mountain_bike) %>%
  summarize(MountainBikeSales = sum(SalesAmount))

# Function call for finding no. of 'Mountain Frame' units sold.
mountain_units_sold <- unit_sale(mountain_bike)

# Function call for finding Total Revenue from sales.
total_sales_revenue <- model("") %>%
  summarize(SalesTotal = sum(SalesAmount))
# Function call for finding total no. of units sold.
total_units_sold <- unit_sale("")

# create data frame revenue_summary using existing data frames.
revenue_summary <- data.frame(road_bike_revenue, mountain_bike_revenue, total_sales_revenue)
str(revenue_summary) # shows structure of data frame.

# Compute the percentage of revenue obtained from combined sales of Road bike and Mountain bike.
revenue_pct <- round(((road_bike_revenue + mountain_bike_revenue) / total_sales_revenue) * 100, digits = 2)

# We need to transpose the data frame to the long format;
# for that we use the gather() function.
t_revenue_summary <- revenue_summary %>% 
  gather(key = "Category", value = "SalesAmount", 1, 2, 3)

#Plot the column graph.

g <- ggplot(t_revenue_summary, aes(x = Category, y = SalesAmount))
g + geom_col()
