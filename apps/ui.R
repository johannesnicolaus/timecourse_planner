library(plotly)


expname_1 <- textInput("name_1", label = "Activity", value = "experiment_1")

start_time <- shinyTime::timeInput("time_1", "Start time:", value = Sys.time(), seconds = FALSE)


# numinput <- numericInput("num", "Number one", value = 0, min = 0, max = 100)

activity_1 <- textInput('activity_vec_1', 'Enter a vector of activity (comma delimited)', "plate cells,treatment,sampling")

time_1 <- textInput('time_vec_1', 'Enter a vector of time required for each activity (comma delimited, H:min)', "1:30,0:30,4:10")

# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  pageWithSidebar(
    
    # Application title
    headerPanel("Time course experiment planner"),
    
    sidebarPanel(
      expname_1,
      start_time,
     #numinput,
      activity_1,
      time_1
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      # plotOutput(outputId = "distPlot")
      plotlyOutput("plot", height = "600px"),
      textOutput("tbl_dims"),
      div(style="height:600px; overflow:scroll; align:text-center",
          tableOutput("contents")
          )
    )
  )
)







