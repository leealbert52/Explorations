#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Attractions in Anaheim, California"),
    

    # Sidebar with a numeric input for a number of attractions nearby
    sidebarLayout(
        sidebarPanel(
          h4("As you increase the number of attractions new attractions will 
          appear on the map. As you hover the markers the name of the 
          attraction will be visible"),
          numericInput("n_interest",
                        "Number of Attractions:",
                        min = 1,
                        max = 61,
                        value = 5, step = 1),
          h4("1000 meters = 0.6 miles"),
          sliderInput("Distance",
                      "Distance from Disneyland in meters",
                      min = 10, 
                      max = 4000, 
                      value = 50),
          h4("Please zoom out as you increase the radius to see 
             attractions away from Anaheim")
        ),

        # Show a leaflet plot of the random neighbor of Disneyland
        mainPanel(
            h3("A Leaflet Interactive Map of Anaheim Attractions"),
            leafletOutput("neighborPlot", height="100vh")
        )
    )
))
