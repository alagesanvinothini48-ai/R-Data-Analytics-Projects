library(shiny)

# Hospital Disease Data
hospital <- data.frame(
  Disease = c(
    "Diabetes",
    "Hypertension",
    "Fever",
    "Asthma",
    "Heart Disease",
    "Arthritis"
  ),
  
  Patients = c(25, 20, 18, 12, 10, 15)
)

# User Interface
ui <- navbarPage(
  "Hospital Disease Analysis",
  
  # Dashboard
  tabPanel(
    "Dashboard",
    
    br(),
    
    h1(
      "Hospital Disease Analysis",
      align = "center"
    ),
    
    h3(
      "R Programming Data Analytics Project",
      align = "center"
    ),
    
    br(),
    
    fluidRow(
      
      column(
        3,
        wellPanel(
          h3("Total Patients"),
          h2(sum(hospital$Patients))
        )
      ),
      
      column(
        3,
        wellPanel(
          h3("Number of Diseases"),
          h2(nrow(hospital))
        )
      ),
      
      column(
        3,
        wellPanel(
          h3("Highest Patients"),
          h2(max(hospital$Patients))
        )
      ),
      
      column(
        3,
        wellPanel(
          h3("Average Patients"),
          h2(round(mean(hospital$Patients), 1))
        )
      )
    ),
    
    br(),
    
    h3("Project Objective"),
    
    p(
      "This project analyzes hospital disease data using R programming.
      It identifies the number of patients affected by different diseases
      and displays the disease-wise patient count using a bar chart."
    )
  ),
  
  # Disease Chart
  tabPanel(
    "Disease Chart",
    
    br(),
    
    h2(
      "Disease-wise Patient Count",
      align = "center"
    ),
    
    plotOutput("diseasePlot")
  ),
  
  # Data Table
  tabPanel(
    "Patient Data",
    
    br(),
    
    h2(
      "Hospital Patient Data",
      align = "center"
    ),
    
    tableOutput("hospitalTable")
  )
)

# Server
server <- function(input, output, session) {
  
  # Disease-wise Bar Chart
  output$diseasePlot <- renderPlot({
    
    barplot(
      hospital$Patients,
      names.arg = hospital$Disease,
      main = "Disease-wise Patient Count",
      xlab = "Disease",
      ylab = "Number of Patients",
      las = 2
    )
  })
  
  # Patient Data Table
  output$hospitalTable <- renderTable({
    hospital
  })
}

# Run Shiny Application
shinyApp(
  ui = ui,
  server = server
)
