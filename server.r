library(shiny)
data(mtcars)
df <- data.frame(mtcars)
df$am <- factor(df$am)
fit <- lm(mpg ~ wt + qsec + am + am:wt, data = df)
mpg <- function(wt, qsec, am) {
  x <- data.frame(wt=wt, qsec=qsec, am=am)
  result <- predict(fit, x, interval='confidence')
  result
}


shinyServer(function(input, output) {
  #data(mtcars)
  #df <- data.frame(mtcars)
  #df$am <- factor(df$am)
  #fit <- lm(mpg ~ wt + am, data = mtcars)
  output$inputQsec <- renderPrint({input$qsec})  
  output$inputWt <- renderPrint({input$wt})
  output$transmission <- renderPrint(ifelse(input$am==0, 
                                            "Automatic", "Manual"))
  #output$inputAm <- renderPrint({input$am})
  
  output$prediction <- renderPrint({mpg(input$wt, input$qsec, input$am)})
  
})
