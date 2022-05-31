#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(leaflet)
library(dplyr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

    output$neighborPlot <- renderLeaflet({
      
      nrows <- input$n_interest
        
      df <- read.csv("Anaheim_attractions.csv")
      
      df_sm <- df[1:nrows, ]
      
      df_sm <-  df_sm %>% leaflet() %>% 
             addTiles() %>% 
             addMarkers(lat=df_sm$lat, lng=df_sm$lng, popup=df_sm$Name) %>% 
             addCircles(lat = 33.8091, lng= -117.9237,
                        radius = input$Distance,
                        color="pink",
                        stroke = FALSE, 
                        fillOpacity = 0.6)
            
      df_sm
    })

})
