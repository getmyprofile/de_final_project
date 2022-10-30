# Define server function  
server <- function(input, output, session) {
  
  output$plot1 <- renderPlot({
    g <- ggplot(t_revenue_summary, aes(x = fct_inorder(Category), y = SalesAmount, fill = fct_inorder(Category)))
    g + geom_col() + ggtitle("Road Bike vs Mountain Bike") +
      theme(axis.text.x = element_blank(), axis.ticks.x = element_blank(), legend.title = element_blank(), 
            axis.title.x = element_blank(), axis.title.y = element_blank())
  })
  
  output$plot2 <- renderPlot({
    if(input$submitbutton2>0){
      isolate(
        if(input$rb == "high_revenue"){
          g <- ggplot(high_revenue, aes(x = fct_inorder(Name), y = SalesAmount, fill = fct_inorder(Name)))
          g + geom_col() + ggtitle("Top Performing (Revenue)") +
            theme(axis.text.x = element_blank(), axis.ticks.x = element_blank(), legend.title = element_blank(), 
                  axis.title.x = element_blank(), axis.title.y = element_blank())
        }
        else if(input$rb == "low_revenue"){
          g <- ggplot(low_revenue, aes(x = fct_inorder(Name), y = SalesAmount, fill = fct_inorder(Name)))
          g + geom_col() + ggtitle("Least Performing (Revenue)") +
            theme(axis.text.x = element_blank(), axis.ticks.x = element_blank(), legend.title = element_blank(), 
                  axis.title.x = element_blank(), axis.title.y = element_blank())
        }
        else if(input$rb == "high_units"){
          g <- ggplot(high_units, aes(x = fct_inorder(Name), y = Quantity, fill = fct_inorder(Name)))
          g + geom_col() + ggtitle("Top Performing (Sales)") +
            theme(axis.text.x = element_blank(), axis.ticks.x = element_blank(), legend.title = element_blank(), 
                  axis.title.x = element_blank(), axis.title.y = element_blank())
        }
        else if(input$rb == "low_units"){
          g <- ggplot(low_units, aes(x = fct_inorder(Name), y = Quantity, fill = fct_inorder(Name)))
          g + geom_col() + ggtitle("Least Performing (Sales)") +
            theme(axis.text.x = element_blank(), axis.ticks.x = element_blank(), legend.title = element_blank(), 
                  axis.title.x = element_blank(), axis.title.y = element_blank())
        }
        else if(input$rb == "high_price"){
          g <- ggplot(high_price, aes(x = fct_inorder(Name), y = Price, fill = fct_inorder(Name)))
          g + geom_col() + ggtitle("Top Priced Products on Sale") +
            theme(axis.text.x = element_blank(), axis.ticks.x = element_blank(), legend.title = element_blank(), 
                  axis.title.x = element_blank(), axis.title.y = element_blank())
        }
        else if(input$rb == "low_price"){
          g <- ggplot(low_price, aes(x = fct_inorder(Name), y = Price, fill = fct_inorder(Name)))
          g + geom_col() + ggtitle("Least Priced Products on Sale") +
            theme(axis.text.x = element_blank(), axis.ticks.x = element_blank(), legend.title = element_blank(), 
                  axis.title.x = element_blank(), axis.title.y = element_blank())
        }
        else{
          g <- ggplot(prod_stats, aes(x = fct_inorder(Category), y = Quantity, fill = fct_inorder(Category)))
          g + geom_col() + ggtitle("Product Statistics") +
            theme(axis.text.x = element_blank(), axis.ticks.x = element_blank(), legend.title = element_blank(), 
                  axis.title.x = element_blank(), axis.title.y = element_blank())
        }
      )# isolate
    }
    else {
      return("Waiting for input...")
    }
  })
  
  ######plot3
  output$plot3 <- renderPlot({
    if(input$submitbutton4>0){
      isolate(
        if(input$rb1 == "cust_purchase_amt"){
          g <- ggplot(cust_purchase_amt, aes(x = fct_inorder(CustomerName), y = SalesAmount, fill = fct_inorder(CustomerName)))
          g + geom_col() + ggtitle("Top Customers by Revenue") +
            theme(axis.text.x = element_blank(), axis.ticks.x = element_blank(), legend.title = element_blank(), 
                  axis.title.x = element_blank(), axis.title.y = element_blank())
        }
        else if(input$rb1 == "cust_purchase_qty"){
          g <- ggplot(cust_purchase_qty, aes(x = fct_inorder(CustomerName), y = Quantity, fill = fct_inorder(CustomerName)))
          g + geom_col() + ggtitle("Top Customers by Sales") +
            theme(axis.text.x = element_blank(), axis.ticks.x = element_blank(), legend.title = element_blank(), 
                  axis.title.x = element_blank(), axis.title.y = element_blank())
        }
        else if(input$rb1 == "top_ret_cust"){
          g <- ggplot(top_ret_cust, aes(x = fct_inorder(CustomerName), y = SalesAmount, fill = fct_inorder(CustomerName)))
          g + geom_col() + ggtitle("Top Returning Customers") +
            theme(axis.text.x = element_blank(), axis.ticks.x = element_blank(), legend.title = element_blank(), 
                  axis.title.x = element_blank(), axis.title.y = element_blank())
        }
        else if(input$rb1 == "cust_num_stats"){
          g <- ggplot(cust_num_stats, aes(x = fct_inorder(Category), y = Number, fill = fct_inorder(Category)))
          g + geom_col() + ggtitle("Customer Number Statistics") +
            theme(axis.text.x = element_blank(), axis.ticks.x = element_blank(), legend.title = element_blank(), 
                  axis.title.x = element_blank(), axis.title.y = element_blank())
        }
        else if(input$rb1 == "cust_rev_stats"){
          g <- ggplot(cust_rev_stats, aes(x = fct_inorder(Category), y = Number, fill = fct_inorder(Category)))
          g + geom_col() + ggtitle("Customer Revenue Statistics") +
            theme(axis.text.x = element_blank(), axis.ticks.x = element_blank(), legend.title = element_blank(), 
                  axis.title.x = element_blank(), axis.title.y = element_blank())
        }
        else{
          g <- ggplot(cust_pur_stats, aes(x = fct_inorder(Category), y = Number, fill = fct_inorder(Category)))
          g + geom_col() + ggtitle("Customer Purchase Statistics") +
            theme(axis.text.x = element_blank(), axis.ticks.x = element_blank(), legend.title = element_blank(),
                  axis.title.x = element_blank(), axis.title.y = element_blank())
        }
      )# isolate
    }
    else {
      return("Waiting for input...")
    }
  })
  
  output$output1 <- renderText({
    if (input$submitbutton1>0) {
      isolate(paste("Total Sales for ", df_product$Name[df_product$ProductID == input$var]))
    } else {
      return("Server is ready...")
    }
  })
  
  output$output2 <- renderText({
    if (input$submitbutton1>0) {
      isolate(paste("Sales Summary for product ", df_product$Name[df_product$ProductID == input$var]))
    } else {
      return("Waiting for input...")
    }
  })
  
  output$output3 <- renderText({
    if(input$submitbutton2>0){
      isolate(
        if(input$rb == "high_revenue"){
          paste("List of Top Performing Products by Revenue")
        }
        else if(input$rb == "low_revenue"){
          paste("List of Least Performing Products by Revenue *omitted free/priced £0 items")
        }
        else if(input$rb == "high_units"){
          paste("List of Top Performing Products by Sales")
        }
        else if(input$rb == "low_units"){
          paste("List of Least Performing Products by Sales")
        }
        else if(input$rb == "high_price"){
          paste("List of Top Priced Products on Sale")
        }
        else if(input$rb == "low_price"){
          paste("List of Least Priced Products on Sale")
        }
        else{
          paste("Product Statistics")
        }
      )# isolate
    }
    else {
      return("Waiting for input...")
    }
  })
  
  #####output4
  
  output$output4 <- renderText({
    if (input$submitbutton3>0) {
      isolate(paste("Total Sales for customer ", df_customer$CustomerName[df_customer$CustomerID == input$var1]))
    } else {
      return("Server is ready...")
    }
  })
  
  output$output5 <- renderText({
    if (input$submitbutton3>0) {
      isolate(paste("Sales Summary for customer ", df_customer$CustomerName[df_customer$CustomerID == input$var1]))
    } else {
      return("Waiting for input...")
    }
  })
  
  output$output6 <- renderText({
    if(input$submitbutton4>0){
      isolate(
        if(input$rb1 == "cust_purchase_amt"){
          paste("List of Top Customers by Revenue")
        }
        else if(input$rb1 == "cust_purchase_qty"){
          paste("List of Top Customers by Sales")
        }
        else if(input$rb1 == "top_ret_cust"){
          paste("List of Top Returning Customers")
        }
        else if(input$rb1 == "cust_num_stats"){
          paste("Customer Number Statistics")
        }
        else if(input$rb1 == "cust_rev_stats"){
          paste("Customer Revenue Statistics")
        }
        else{
          paste("Customer Purchase Statistics")
        }
      )# isolate
    }
    else {
      return("Waiting for input...")
    }
  })
  
  datasetInput1 <- reactive({
    df <- p_sales(input$var)
    if(!nrow(df)){
      print(paste("No Sales data for product ", df_product$Name[df_product$ProductID == input$var]))
    }
    else{
      df
    }
  })
  
  datasetInput2 <- reactive({
    df1 <- p_sales_summary(input$var)
    if(!nrow(df1)){
      print(paste("No Sales data for product ", df_product$Name[df_product$ProductID == input$var]))
    }
    else{
      df1
    }
  })
  
  datasetInput3 <- reactive({
    if(input$rb == "high_revenue"){
      df2 <- high_revenue
    }
    else if(input$rb == "low_revenue"){
      df2 <- low_revenue
    }
    else if(input$rb == "high_units"){
      df2 <- high_units
    }
    else if(input$rb == "low_units"){
      df2 <- low_units
    }
    else if(input$rb == "high_price"){
      df2 <- high_price
    }
    else if(input$rb == "low_price"){
      df2 <- low_price
    }
    else{
      df2 <- prod_stats
    }
  })
  
  ###datasetinput4
  datasetInput4 <- reactive({
    df3 <- cust_sales(input$var1)
    if(!nrow(df3)){
      print(paste("No Sales data for Customer ", df_customer$CustomerName[df_customer$CustomerID == input$var1]))
    }
    else{
      df3
    }
  })
  
  datasetInput5 <- reactive({
    df4 <- cust_sales_summary(input$var1)
    if(!nrow(df4)){
      print(paste("No Sales data for Customer ", df_customer$CustomerName[df_customer$CustomerID == input$var1]))
    }
    else{
      df4
    }
  })

  datasetInput6 <- reactive({
    if(input$rb1 == "cust_purchase_amt"){
      df5 <- cust_purchase_amt
    }
    else if(input$rb1 == "cust_purchase_qty"){
      df5 <- cust_purchase_qty
    }
    else if(input$rb1 == "top_ret_cust"){
      df5 <- top_ret_cust
    }
    else if(input$rb1 == "cust_num_stats"){
      df5 <- cust_num_stats
    }
    else if(input$rb1 == "cust_rev_stats"){
      df5 <- cust_rev_stats
    }
    else{
      df5 <- cust_pur_stats
    }
  })
  
  output$tabledata1 <- renderTable({
    if (input$submitbutton1>0) {
      isolate(datasetInput1())
    }
  })
  
  output$tabledata2 <- renderTable({
    if (input$submitbutton1>0) {
      isolate(datasetInput2())
    }
  })
  
  output$tabledata3 <- renderTable({
    if (input$submitbutton2>0) {
      isolate(datasetInput3())
    }
  })
  
  ######tabledata4
  output$tabledata4 <- renderTable({
    if (input$submitbutton3>0) {
      isolate(datasetInput4())
    }
  })
  
  output$tabledata5 <- renderTable({
    if (input$submitbutton3>0) {
      isolate(datasetInput5())
    }
  })
  
  output$tabledata6 <- renderTable({
    if (input$submitbutton4>0) {
      isolate(datasetInput6())
    }
  })
  
} # server
