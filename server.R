library(shiny)
shinyServer(
  function(input, output) {
    output$cp <- renderPlot({
      par(mar=c(5,5,2,5))
      plot(dweibull(1:input$observations, input$beta, input$eta),type="l",col="red",ylab="Probability Density Function")
      par(new=T)
      plot(ecdf(dweibull(1:input$observations, input$beta, input$eta)),xlab=NA, axes=F,ylab=NA,col="blue",main="Generated Weibull distribution")
      axis(side=4)
      mtext(side=4, line=3, 'Cumulative Distribution Function')
    })
    output$Hist <- renderPlot({
      hist(rweibull(input$observations, input$beta, input$eta), probability=TRUE,main="Histogram",xlab="")
    })
    output$min <- renderPrint({summary(rweibull(input$observations, input$beta, input$eta))[[1]]})
    output$q1 <- renderPrint({summary(rweibull(input$observations, input$beta, input$eta))[[2]]})
    output$med <- renderPrint({summary(rweibull(input$observations, input$beta, input$eta))[[3]]})
    output$mean <- renderPrint({summary(rweibull(input$observations, input$beta, input$eta))[[4]]})
    output$q3 <- renderPrint({summary(rweibull(input$observations, input$beta, input$eta))[[5]]})
    output$max <- renderPrint({summary(rweibull(input$observations, input$beta, input$eta))[[6]]})
  }
)
