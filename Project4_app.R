library(shiny)

# Supermarket Sales Data
sales <- data.frame(
  Product = c(
    "Rice", "Milk", "Bread", "Soap", "Apple",
    "Biscuits", "Shampoo", "Coffee", "Eggs", "Juice"
  ),
  
  Category = c(
    "Grocery", "Dairy", "Bakery", "Personal Care", "Fruits",
    "Snacks", "Personal Care", "Beverage", "Dairy", "Beverage"
  ),
  
  Quantity = c(12, 20, 15, 10, 18, 25, 8, 10, 30, 12),
  
  Price = c(60, 30, 40, 45, 25, 20, 120, 90, 7, 55),
  
  Sales = c(720, 600, 600, 450, 450,
            500, 960, 900, 210, 660),
  
  Profit = c(96, 80, 90, 70, 72,
             75, 160, 135, 35, 99)
)


# User Interface
ui <- navbarPage(
  
  "Supermarket Sales Dashboard",
  
  
  tabPanel(
    "Dashboard",
    
    br(),
    
    h1(
      "Supermarket Sales Analysis",
      align = "center"
    ),
    
    h3(
      "R Programming Data Analytics Project",
      align = "center"
    ),
    
    br(),
    
    
    fluidRow(
      
      column(
        4,
        wellPanel(
          h3("Total Sales"),
          h2(paste("Rs.", sum(sales$Sales)))
        )
      ),
      
      column(
        4,
        wellPanel(
          h3("Total Profit"),
          h2(paste("Rs.", sum(sales$Profit)))
        )
      ),
      
      column(
        4,
        wellPanel(
          h3("Highest Sale"),
          h2(paste("Rs.", max(sales$Sales)))
        )
      )
    ),
    
    
    br(),
    
    
    h3("Project Objective"),
    
    p(
      "This project analyzes supermarket sales data
      using R programming. It calculates total sales,
      total profit and highest product sales."
    )
  ),
  
  
  tabPanel(
    "Sales Chart",
    
    br(),
    
    h2("Product-wise Sales"),
    
    plotOutput("salesPlot")
  ),
  
  
  tabPanel(
    "Sales Data",
    
    br(),
    
    h2("Supermarket Sales Dataset"),
    
    tableOutput("salesTable")
  )
)


# Server
server <- function(input, output, session) {
  
  
  output$salesPlot <- renderPlot({
    
    barplot(
      sales$Sales,
      names.arg = sales$Product,
      main = "Product-wise Sales",
      xlab = "Product",
      ylab = "Sales (Rs.)",
      las = 2
    )
    
  })
  
  
  output$salesTable <- renderTable({
    sales
  })
  
}


# Run Application
shinyApp(
  ui = ui,
  server = server
)