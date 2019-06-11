library(shiny)
dataset <- read.csv("data-raw/Iris.csv", header=FALSE)
# Define UI for dataset viewer application
shinyUI(pageWithSidebar(
    
    # Application title
    headerPanel("Shiny Text"),
    
    # Sidebar with controls to select a dataset and specify the number
    # of observations to view
    sidebarPanel(
        selectInput("dataset", "Choose a dataset:", 
                    choices = c("V1", "V2", "V3 ","V4", )),
        
        numericInput("obs", "Number of observations to view:", 10)
    ),
    
    # Show a summary of the dataset and an HTML table with the requested
    # number of observations
    mainPanel(
        verbatimTextOutput("summary"),
        
        tableOutput("view")
    )
))