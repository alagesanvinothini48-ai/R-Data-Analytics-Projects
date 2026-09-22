library(shiny)

# Personal Expense Data
expense <- data.frame(
  Date = c("01-Sep","02-Sep","03-Sep","04-Sep","05-Sep",
           "06-Sep","07-Sep","08-Sep","09-Sep","10-Sep"),
  Category = c("Food","Travel","Education","Shopping","Food",
               "Travel","Entertainment","Food","Education","Shopping"),
  Amount = c(180,120,500,350,220,150,250,160,300,450),
  Payment_Mode = c("UPI","Cash","UPI","Card","UPI",
                   "UPI","Card","Cash","UPI","Card")
)

# User Interface
ui <- navbarPage(
  
  "Personal Expense Analysis",
  
  tabPanel(
    "Dashboard",
    
    br(),
    
    h1("Personal Expense Analysis", align = "center"),
    
    h3("R Programming Data Analytics Project",
       align = "center"),
    
    br(),
    
    fluidRow(
      
      column(
        4,
        wellPanel(
          h3("Total Expense"),
          h2(paste("Rs.", sum(expense$Amount)))
        )
      ),
      
      column(
        4,
        wellPanel(
          h3("Average Expense"),
          h2(paste("Rs.", round(mean(expense$Amount), 2)))
        )
      ),
      
      column(
        4,
        wellPanel(
          h3("Highest Expense"),
          h2(paste("Rs.", max(expense$Amount)))
        )
      )
    ),
    
    br(),
    
    h3("Project Objective"),
    
    p("This project analyzes personal spending using R.
      It calculates total, average and highest expenses
      and displays category-wise spending.")
  ),
  
  
  tabPanel(
    "Expense Chart",
    
    br(),
    
    h2("Category-wise Expense"),
    
    plotOutput("expensePlot")
  ),
  
  
  tabPanel(
    "Expense Data",
    
    br(),
    
    h2("Expense Dataset"),
    
    tableOutput("expenseTable")
  )
)


# Server
server <- function(input, output, session) {
  
  output$expensePlot <- renderPlot({
    
    totals <- tapply(
      expense$Amount,
      expense$Category,
      sum
    )
    
    barplot(
      totals,
      main = "Category-wise Personal Expenses",
      xlab = "Category",
      ylab = "Amount (Rs.)",
      las = 2
    )
  })
  
  
  output$expenseTable <- renderTable({
    expense
  })
}


# Run Application
shinyApp(
  ui = ui,
  server = server
)