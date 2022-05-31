---
title       : Explorations of Attractions in Southern California near Anaheim and Beyond
subtitle    : A Shiny App for Coursera
author      : ALee
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
---

## Useage

1. The users begin exploring nearby attractions by choosing a distance for the 
radius of a "pink" circle centered at Disney Resort, holding the number of attractions constant

2. As the users increase the radius the number of attractions (constant) remain
within the boundary. The users then can increase the number of attractions, in which case, some new attractions will fall outside of the circle.

3. Remember to adjust the zoom in order to see newly included attractions. There
are a total of sixty one attractions, including beaches, shopping malls, nearby
airports.

4. The ui.R and server.R files are shared in the next two slides. They are in
GitHub as well.

--- 

## User Interface
```
sidebarLayout(
        sidebarPanel(
          numericInput("n_interest",
                        "Number of Attractions:", min = 1, max = 61,
                        value = 5, step = 1),
          h4("1000 meters = 0.6 miles"),
          sliderInput("Distance",
                      "Distance from Disneyland in meters",
                      min = 10, max = 4000, value = 50),
          h4("Please zoom out as you increase the radius to see 
             attractions away from Anaheim")),

        mainPanel(
            h3("A Leaflet Interactive Map of Anaheim Attractions"),
            leafletOutput("neighborPlot", height="100vh"))
    )
))

---

## Server

```
output$neighborPlot <- renderLeaflet({
      nrows <- input$n_interest
      df <- read.csv("Anaheim_attractions.csv")
      df_sm <- df[1:nrows, ]
      df_sm <-  df_sm %>% leaflet() %>% 
             addTiles() %>% 
             addMarkers(lat=df_sm$lat, lng=df_sm$lng, popup=df_sm$Name) %>% 
             addCircles(lat = 33.8091, lng= -117.9237,
                        radius = input$Distance,
                        color="pink", stroke = FALSE, fillOpacity = 0.6)
      df_sm
    })
```

---

## Summary
This simple and easy-to-use App provides a tool of exploration of attractions 
near Anaheim and beyond in Southern California.

This version of the App needs to be fine-tuned so that it would be much more 
useful, such as type of attractions, the distance needs to be converted to
mileage, instead of meters.

A filter is recommended so that different type of attractions can be selected, 
depending on the interest, such as winery or faraway beaches.






