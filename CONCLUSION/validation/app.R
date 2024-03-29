library(shiny)

ui <- fluidPage(
    
    titlePanel("Validation App"),
    
    sidebarLayout(
        sidebarPanel(
            selectInput("data", label = "Data set",
                        choices = c("iris"))
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            tableOutput("table"),
            plotOutput("plot")
        )
    )
)

server <- function(input, output) {
    
    data <- reactive({ get(input$data, 'package:datasets') })
    
    output$plot <- renderPlot({
        hist(data()[, 1], col = 'forestgreen', border = 'white')
    })
    
    output$table <- renderTable({
        head(data())
    })
    
}

shinyApp(ui, server)