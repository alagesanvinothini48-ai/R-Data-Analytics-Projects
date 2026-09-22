library(shiny)

# ============================================================
# DATA
# ============================================================

# 1. Student Performance Data
student <- data.frame(
  Student_ID = 101:110,
  Gender = c("Female","Male","Female","Male","Female",
             "Male","Female","Male","Female","Male"),
  Study_Hours = c(3,5,2,1,4,6,2,3,1,4),
  Attendance = c(82,91,68,55,87,95,72,76,50,85),
  Internal_Marks = c(72,84,55,42,79,91,61,58,39,73),
  Final_Mark = c(78,88,60,38,82,94,65,57,35,76),
  Result = c("Pass","Pass","Pass","Fail","Pass",
             "Pass","Pass","Pass","Fail","Pass")
)

# 2. Personal Expense Data
expense <- data.frame(
  Date = c("01-Sep","02-Sep","03-Sep","04-Sep","05-Sep",
           "06-Sep","07-Sep","08-Sep","09-Sep","10-Sep"),
  Category = c("Food","Travel","Education","Shopping","Food",
               "Travel","Entertainment","Food","Education","Shopping"),
  Amount = c(180,120,500,350,220,150,250,160,300,450),
  Payment_Mode = c("UPI","Cash","UPI","Card","UPI",
                   "UPI","Card","Cash","UPI","Card")
)

# 3. Weather Data
weather <- data.frame(
  Date = c("01-Sep","02-Sep","03-Sep","04-Sep","05-Sep",
           "06-Sep","07-Sep","08-Sep","09-Sep","10-Sep"),
  Temperature = c(31,32,30,29,33,34,31,30,32,33),
  Humidity = c(68,70,75,78,65,62,72,76,69,66),
  Rainfall = c(2.1,0,5.4,8.2,0,0,3.5,6.1,1.2,0),
  Wind_Speed = c(10,12,9,8,14,15,11,9,13,14)
)

# 4. Supermarket Sales Data
sales <- data.frame(
  Product = c("Rice","Milk","Bread","Soap","Apple",
              "Biscuits","Shampoo","Coffee","Eggs","Juice"),
  Category = c("Grocery","Dairy","Bakery","Personal Care","Fruits",
               "Snacks","Personal Care","Beverage","Dairy","Beverage"),
  Quantity = c(12,20,15,10,18,25,8,10,30,12),
  Price = c(60,30,40,45,25,20,120,90,7,55),
  Sales = c(720,600,600,450,450,500,960,900,210,660),
  Profit = c(96,80,90,70,72,75,160,135,35,99)
)


# ============================================================
# USER INTERFACE
# ============================================================

ui <- navbarPage(
  
  title = "R Data Analytics Dashboard",
  
  # HOME
  tabPanel(
    "Home",
    
    br(),
    
    h1("R Data Analytics Dashboard",
       align = "center"),
    
    h3("Four Simple Data Analysis Projects",
       align = "center"),
    
    br(),
    
    fluidRow(
      column(
        3,
        wellPanel(
          h3("🎓 Student"),
          p("Student performance and academic analysis.")
        )
      ),
      
      column(
        3,
        wellPanel(
          h3("💰 Expense"),
          p("Personal expense and spending analysis.")
        )
      ),
      
      column(
        3,
        wellPanel(
          h3("🌦️ Weather"),
          p("Temperature, rainfall and weather analysis.")
        )
      ),
      
      column(
        3,
        wellPanel(
          h3("🛒 Sales"),
          p("Supermarket sales and profit analysis.")
        )
      )
    ),
    
    br(),
    
    h3("Technology Used",
       align = "center"),
    
    p("R Programming | RStudio | Shiny | Data Visualization",
      align = "center")
  ),
  
  
  # ==========================================================
  # STUDENT PERFORMANCE
  # ==========================================================
  
  tabPanel(
    "Student Performance",
    
    br(),
    
    h2("Student Performance Analysis"),
    
    fluidRow(
      
      column(
        4,
        wellPanel(
          h4("Average Final Mark"),
          h2(round(mean(student$Final_Mark), 2))
        )
      ),
      
      column(
        4,
        wellPanel(
          h4("Highest Final Mark"),
          h2(max(student$Final_Mark))
        )
      ),
      
      column(
        4,
        wellPanel(
          h4("Passed Students"),
          h2(sum(student$Result == "Pass"))
        )
      )
    ),
    
    plotOutput("studentPlot"),
    
    h3("Student Dataset"),
    
    tableOutput("studentTable")
  ),
  
  
  # ==========================================================
  # EXPENSE
  # ==========================================================
  
  tabPanel(
    "Expense Analysis",
    
    br(),
    
    h2("Personal Expense Analysis"),
    
    fluidRow(
      
      column(
        4,
        wellPanel(
          h4("Total Expense"),
          h2(paste("Rs.", sum(expense$Amount)))
        )
      ),
      
      column(
        4,
        wellPanel(
          h4("Average Expense"),
          h2(paste("Rs.", round(mean(expense$Amount), 2)))
        )
      ),
      
      column(
        4,
        wellPanel(
          h4("Highest Expense"),
          h2(paste("Rs.", max(expense$Amount)))
        )
      )
    ),
    
    plotOutput("expensePlot"),
    
    h3("Expense Dataset"),
    
    tableOutput("expenseTable")
  ),
  
  
  # ==========================================================
  # WEATHER
  # ==========================================================
  
  tabPanel(
    "Weather Analysis",
    
    br(),
    
    h2("Weather Data Analysis"),
    
    fluidRow(
      
      column(
        4,
        wellPanel(
          h4("Average Temperature"),
          h2(paste(round(mean(weather$Temperature), 2), "°C"))
        )
      ),
      
      column(
        4,
        wellPanel(
          h4("Maximum Temperature"),
          h2(paste(max(weather$Temperature), "°C"))
        )
      ),
      
      column(
        4,
        wellPanel(
          h4("Total Rainfall"),
          h2(paste(sum(weather$Rainfall), "mm"))
        )
      )
    ),
    
    plotOutput("weatherPlot"),
    
    h3("Weather Dataset"),
    
    tableOutput("weatherTable")
  ),
  
  
  # ==========================================================
  # SUPERMARKET SALES
  # ==========================================================
  
  tabPanel(
    "Supermarket Sales",
    
    br(),
    
    h2("Supermarket Sales Analysis"),
    
    fluidRow(
      
      column(
        4,
        wellPanel(
          h4("Total Sales"),
          h2(paste("Rs.", sum(sales$Sales)))
        )
      ),
      
      column(
        4,
        wellPanel(
          h4("Total Profit"),
          h2(paste("Rs.", sum(sales$Profit)))
        )
      ),
      
      column(
        4,
        wellPanel(
          h4("Highest Sale"),
          h2(paste("Rs.", max(sales$Sales)))
        )
      )
    ),
    
    plotOutput("salesPlot"),
    
    h3("Supermarket Dataset"),
    
    tableOutput("salesTable")
  )
)


# ============================================================
# SERVER
# ============================================================

server <- function(input, output, session) {
  
  
  # STUDENT GRAPH
  output$studentPlot <- renderPlot({
    
    plot(
      student$Study_Hours,
      student$Final_Mark,
      main = "Study Hours vs Final Mark",
      xlab = "Study Hours",
      ylab = "Final Mark",
      pch = 19
    )
    
  })
  
  
  output$studentTable <- renderTable({
    student
  })
  
  
  # EXPENSE GRAPH
  output$expensePlot <- renderPlot({
    
    totals <- tapply(
      expense$Amount,
      expense$Category,
      sum
    )
    
    barplot(
      totals,
      main = "Category-wise Expenses",
      xlab = "Category",
      ylab = "Amount",
      las = 2
    )
    
  })
  
  
  output$expenseTable <- renderTable({
    expense
  })
  
  
  # WEATHER GRAPH
  output$weatherPlot <- renderPlot({
    
    plot(
      weather$Temperature,
      type = "o",
      main = "Daily Temperature Trend",
      xlab = "Day",
      ylab = "Temperature (°C)",
      pch = 19
    )
    
  })
  
  
  output$weatherTable <- renderTable({
    weather
  })
  
  
  # SALES GRAPH
  output$salesPlot <- renderPlot({
    
    barplot(
      sales$Sales,
      names.arg = sales$Product,
      main = "Product-wise Sales",
      xlab = "Product",
      ylab = "Sales",
      las = 2
    )
    
  })
  
  
  output$salesTable <- renderTable({
    sales
  })
  
}


# ============================================================
# RUN APPLICATION
# ============================================================

shinyApp(
  ui = ui,
  server = server
)