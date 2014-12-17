
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("National parks of Europe"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
        selectInput('colorvar',
                    label = 'Buble color',
                    choices = list('oldest', 'number', 'area_tot', 'country_percentage'),
                    selected = 'oldest'),
        
        selectInput('sizevar',
                    label = 'Buble size',
                    choices = list('oldest', 'number', 'area_tot', 'country_percentage'),
                    selected = 'number')
    ),

    # Show a plot of the generated distribution
    mainPanel(
        htmlOutput("naturePlot")
    )
  )
))
