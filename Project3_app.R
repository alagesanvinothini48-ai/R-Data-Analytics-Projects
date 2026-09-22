library(shiny)

# Weather Data
weather <- data.frame(
  Day = c("Monday", "Tuesday", "Wednesday", "Thursday",
          "Friday", "Saturday", "Sunday"),
  Temperature = c(32, 34, 33, 31, 35, 36, 34),
  Humidity = c(70, 65, 72, 68, 60, 58, 63),
  Rainfall = c(5, 0, 8, 12, 2, 0, 4),
  Wind_Speed = c(12, 15, 10, 18, 14, 16, 13)
)

# User Interface
ui <- navbarPage(
  
  "Weather Analysis Dashboard",
  
  tabPanel(
    "Dashboard",
    
    br(),
    
    h1("Weather Analysis Dashboard", align = "center"),
    
    h3("Weekly Weather Data Analysis",
       align = "center"),
    
    br(),
    
    fluidRow(
      
      column(
        3,
        wellPanel(
          h3("Average Temperature"),
          h2(paste(round(mean(weather$Temperature), 1), "°C"))
        )
      ),
      
      column(
        3,
        wellPanel(
          h3("Average Humidity"),
          h2(paste(round(mean(weather$Humidity), 1), "%"))
        )
      ),
      
      column(
        3,
        wellPanel(
          h3("Total Rainfall"),
          h2(paste(sum(weather$Rainfall), "mm"))
        )
      ),
      
      column(
        3,
        wellPanel(
          h3("Highest Temperature"),
          h2(paste(max(weather$Temperature), "°C"))
        )
      )
    ),
    
    br(),
    
    h3("Project Objective"),
    
    p(
      "This project analyzes weekly weather conditions
      using R programming. It displays temperature,
      humidity, rainfall and wind speed."
    )
  ),
  
  
  tabPanel(
    "Temperature Chart",
    
    br(),
    
    h2("Daily Temperature"),
    
    plotOutput("temperaturePlot")
  ),
  
  
  tabPanel(
    "Weather Data",
    
    br(),
    
    h2("Weather Dataset"),
    
    tableOutput("weatherTable")
  )
)


# Server
server <- function(input, output, session) {
  
  output$temperaturePlot <- renderPlot({
    
    barplot(
      weather$Temperature,
      names.arg = weather$Day,
      main = "Daily Temperature",
      xlab = "Day",
      ylab = "Temperature (°C)",
      las = 2
    )
  })
  
  
  output$weatherTable <- renderTable({
    weather
  })
}


# Run Application
shinyApp(
  ui = ui,
  server = server
)