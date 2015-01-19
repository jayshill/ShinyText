# This is the ui for the shiny web application.

library(shiny)

shinyUI(pageWithSidebar(

  # Application title
  headerPanel(h1("The AMAZING Character Counter!")),

  # Sidebar with a text input box, radio buttons, and submit button
  sidebarPanel(
    textInput("entry", "Enter some text in the box below, and the app will count up the number of times each letter appears in the text.", value = "Enter your text here"),
    radioButtons("radio", "Display raw counts or frequencies?",
                 choices = c("Counts", "Frequencies"), 
                 selected = "Counts", inline = F),
    submitButton("Submit")
  ),

  # Plot of the distribution of characters in the text input
  mainPanel(
    plotOutput("charPlot")
  )
 )
)
