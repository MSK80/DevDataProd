library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Weibull distribution plotter"),
  sidebarPanel(
    h3('Data input'),
    sliderInput('observations', 'Number of observations', min=0, max=10000, value=100, step=50),
    numericInput('beta', 'beta', 0.1, min=0.1, max=10, step=0.1),
    numericInput('eta', 'eta', 100, min=100, max=100000, step=500),
    h3('Data output'),
    "Minimum:", verbatimTextOutput("min"),
    "1st quantile:", verbatimTextOutput("q1"),
    "Median:", verbatimTextOutput("med"),
    "Mean:", verbatimTextOutput("mean"),
    "3rd quantile:", verbatimTextOutput("q3"),
    "Maximum:", verbatimTextOutput("max")
  ),
  mainPanel(
    plotOutput('cp'),
    plotOutput('Hist'),
    h4('Help'),
    h5('Purpose'),
    h6('This tool is designet to show user how Weibull distribution changes dependently on parameters of
       distribution and number of observations.'),
    h5('Data Input'),
    h6('Three things needs to be selected as an input data:'),
    h6('- number of observations - this is a number of measurement points that will be generated for
       Weibull distribution'),
    h6('- beta - this is a shape parameter of Weibull distribution'),
    h6('- eta - this is a scale paramter of weibull distribution'),
    h6('All three input parameters can be modified within given range by typing required values or
       scrolling/sliding them with use of left mouse button.'),
    h5('Data output'),
    h6('The output shown on a lower side of left panel is a typical summary of mesurements: minimum,
       maximum, mean value, median and also first and third quantile.'),
    h5('Plots'),
    h6('Plots shown on a main panel are:'),
    h6('Probability Denfity function (red line) and a Cumulative Distribution function (blue line)'),
    h6('Lower plot contains histogram of generated values.')
    )
    ))
