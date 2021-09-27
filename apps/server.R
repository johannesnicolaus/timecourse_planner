library(plotly)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  # Print the time in [hh]:[mm]:[ss] everytime it changes
  observe(print(strftime(input$time2, "%T")))
  
}