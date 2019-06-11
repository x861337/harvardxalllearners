library(shiny)
library(datasets)
dataset <- read.csv("data-raw/Iris.csv", header=FALSE)
# Define server logic required to summarize and view the selected dataset
shinyServer(function(input, output) {
    
    # Return the requested dataset
    datasetInput <- reactive({
        switch(input$dataset,
               "V1" = rock,
               "V3" = pressure,
               "V3" = cars)
    })
    
    
    
    
    
    
    # Generate a summary of the dataset
    output$summary <- renderPrint({
        dataset <- datasetInput()
        summary(dataset)
    })
    
    # Show the first "n" observations
    output$view <- renderTable({
        head(datasetInput(), n = input$obs)
    })
})