# ui.R
library(shiny)
shinyUI(fluidPage(
  titlePanel("Coursera Developing Data Products Project"),
  sidebarLayout(
    sidebarPanel(
      h3("User inputs"),

      sliderInput(inputId="qsec", label=h4("Quarter mile time"),
                  min=14.5, max=22.5, value=17),
      
      sliderInput(inputId="wt", label=h4("Weight (1000lbs)"),
                  min=1.5, max=5.5, value=3.5),
      
      radioButtons(inputId="am", label=h4("Transmission"),
                   choices = list("Automatic" = 0, "Manual" = 1), selected=0),
      
      submitButton("Submit")
    ),
    mainPanel(
      h3("Introduction"),
      
      p("This application helps drivers select the most fuel efficient motor cars by building a linear model on the mtcars dataset and uses 
        1) the quarter mile time of the car; 
        2) the weight of the car (in 1000lbs); and 
        3) whether the car has an automatic or manual transmission 
        as predictors to predict the miles per gallon of a car."),
      
      h3("Usage"),
      
      p("Select the inputs in the side panel on the left, press the submit button and  
        1) the predicted miles per gallon of a car; 
        2) the lower range (MPG); and 
        3) the upper range (MPG) 
        will be updated on the results area."),
            
      h3("Results of Prediction"),
      
      h4("You entered"),

      h5("1/4 mile time"),
      verbatimTextOutput("inputQsec"),
      
      h5("Weight"),
      verbatimTextOutput("inputWt"),
      
      h5("Transmission"),
      verbatimTextOutput("transmission"),
      
      h4("The predicted miles per gallon is"),
      verbatimTextOutput("prediction")        
    )
  )
))
