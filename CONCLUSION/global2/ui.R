# UI for app
shinyUI(pageWithSidebar(
    # title
    headerPanel("Select Options"),
    
    #input
    sidebarPanel
    (
        selectInput("dataset","Data:", 
                    list(iris = "iris")
        ),
        uiOutput("variable"), 	# depends on dataset ( set by output$variable in  server.R)
        uiOutput("group"),  		# depends on dataset	( set by output$group in  server.R)
        selectInput("plot.type","Plot Type:", 
                    list(boxplot = "boxplot", histogram = "histogram", density = "density", bar = "bar")
        ),
        checkboxInput("show.points", "show points", TRUE)
    ),	
    
    # output				
    mainPanel(
        h3(textOutput("caption")),
        #h3(htmlOutput("caption")),
        uiOutput("plot") # depends on input 
    )
))