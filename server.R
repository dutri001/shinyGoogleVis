
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(googleVis)
library(XML)

# Read table from html
url <- "http://en.wikipedia.org/wiki/List_of_national_parks"
x <- readHTMLTable(readLines(url), which=3, stringsAsFactors = FALSE)

# Clean up df 
colnames (x) <- c('country', 'oldest', 'number', 'area_tot', 'country_percentage')
x$oldest <- as.numeric(x$oldest)
x$number <- as.numeric(gsub("\\*", "", x$number))
x$area_tot <- as.numeric(gsub("(,)|(\\[.*\\])", "", x$area_tot))
x$country_percentage <- as.numeric(gsub("(%)|(\\[.*\\])", "", x$country_percentage))


shinyServer(function(input, output) {

  output$naturePlot <- renderGvis({

      colorvar <- input$colorvar
      sizevar <- input$sizevar
      
      gvisGeoChart(x, locationvar="country", colorvar = colorvar, sizevar = sizevar,
                         options=list(region="150", displayMode="markers"))
      

  })

})
