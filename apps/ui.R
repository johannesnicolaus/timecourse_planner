


textinput1 <- textInput("bins", label = "Number of bins", value = "NA")


start_time <- shinyTime::timeInput("time2", "Time:", value = Sys.time())


numinput <- numericInput("num", "Number one", value = 0, min = 0, max = 100)


# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  pageWithSidebar(
    
    # Application title
    headerPanel("Visualization of gene expression levels"),
    
    sidebarPanel(
      start_time,
      numinput
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      # plotOutput(outputId = "distPlot")
      
    )
  )
)