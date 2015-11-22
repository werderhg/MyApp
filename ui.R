library(shiny) 
shinyUI(
    
    
    pageWithSidebar( 
        headerPanel("Uncertainty calculation with 4 variables (for COURSERA Data Products Nov. 2015, Switzerland)",windowTitle = "RoccoStrada Analytics"), 
        sidebarPanel(
            p("Enter your formula with all 4 variables or you will get an error"),
            textInput("equationY","Y= f(a,b,c,d)","a+b+c+d"),
            p("hint: if you don't need a variable then set it's value and sd to zero and add it (+) at the end of the formula. Expl: a*b*c+d"),
              p("-----------------------------------------"),
            textInput("a","Variable a","0"),textInput("a1","sd of a (default=0.1)","0.1"),
            textInput("b","Variable b","0"),textInput("b1","sd of b","0"),
            textInput("c", "Variable c","0"),textInput("c1","sd of c","0"),
            textInput("d", "Variable d","0"),textInput("d1","sd of d","0"),
          
            
            tags$img(src=("logo.jpg"))
        ),
        
        
        mainPanel(
            
           tabsetPanel(
            
                tabPanel("Result",
                p("A service of the Division RoccoStrada Analytics of Interwatt GmbH"),
                
                p(strong("Statistical values of output Y")),
                p("from Monte Carlo simulation"),
                tableOutput("sim"),
                
                p(strong("Output Y: Histogramm, Densitychart und Boxplot")),
                tags$time(),
                plotOutput("resultY"),
              
                br(),
                p("Calculation uses R and the package propagate from CRAN of Andrej-Nikolai Spiess uni-hamburg.de")
                ),
                tabPanel( "Help", 
                textOutput("help") 
                )
            ) 
        )
)) 