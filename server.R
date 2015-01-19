# This is the server logic for the Shiny web application.

library(shiny)

shinyServer(function(input, output) {

    output$charPlot <- renderPlot({
        ## Process the input$entry text from ui.R to find the
        ## distribution of characters entered.
        
        # Convert to all lower case
        entryLower <- tolower(input$entry)
        # Split into individual charcters
        splitEntry <- strsplit(entryLower, split="")[[1]]
        # Find the unique characters
        uniqueChar <- sort(unique(splitEntry))
        # Tabulate the number of appearances of each character
        charDist <- as.data.frame(sapply(uniqueChar, function(x) {
            length(grep(x, splitEntry))
            }))
        if (input$radio == "Frequencies") {
            charDist <- charDist / sum(charDist)
            }

        # draw a barplot of the counts of unique characters
        barplot(height = charDist[,1], names.arg = uniqueChar,
                col = "blue", cex.axis = 1.5, cex.names = 1.5)
        title(xlab="Characters in Your Text",
              ylab=input$radio, cex.lab=1.5)
  })

})
