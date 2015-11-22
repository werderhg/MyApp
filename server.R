library(shiny) 
library(propagate)


shinyServer(
    function(input, output){
        
        output$resultY  <- renderPlot({
            a<-as.numeric(c(input$a,input$a1))
            b<-as.numeric(c(input$b,input$b1))
            c<-as.numeric(c(input$c,input$c1))
            d<-as.numeric(c(input$d,input$d1))
            DF1<-as.data.frame(cbind(a,b,c,d))
            tt<-input$equationY
            EXPR1<-parse(text=tt)
            cal<-propagate(expr=EXPR1,data=DF1,type="stat", do.sim=TRUE, verbose=TRUE)
            plot(cal)
        })
      
      output$sim <- renderTable({
          a<-as.numeric(c(input$a,input$a1))
          b<-as.numeric(c(input$b,input$b1))
          c<-as.numeric(c(input$c,input$c1))
          d<-as.numeric(c(input$d,input$d1))
          DF1<-as.data.frame(cbind(a,b,c,d))
          tt<-input$equationY
          EXPR1<-parse(text=tt)
          cal<-propagate(expr=EXPR1,data=DF1,type="stat", do.sim=TRUE, verbose=TRUE)
          t(as.data.frame(cal$sim))
          })
      output$help <- renderText(" This is an uncertainity calculation for four variables (a,b,c,d). For each variable
         you will input its value and its standard deviation (=sd). Then you will define the function for these variables
        Y=f(a,b,b,d). All four variables must be included in the function otherwise the result will be incorrect. br()
        Unused variables should be set to zero and just be added to the function. (Note: if a variable is set to zero but has a standard deviation
        greater zero than it will influence the output Y.)
        The result of Y is represented with a Monte Carlo simulation which reports the mean and the distribution. The 95% interval is shown with the blue lines.
                                 ")
    } 
)
