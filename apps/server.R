library(plotly)
library(lubridate)
library(tidyverse)

# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  # Print the time in [hh]:[mm]:[ss] everytime it changes
  observe(print(strftime(input$time_1, "%T")))
  
  output$plot <- renderPlotly({
    
    # add time
    fin_time_1 <- input$time_1 + (
      strsplit(input$time_vec_1, ",") %>%
        unlist() %>%
        hm() %>%
        period_to_seconds() %>% 
        cumsum()
    )
    
    # add activity
    fin_activity_1 <- (unlist(strsplit(input$activity_vec_1, ",")))
    
    # make df
    df <- tibble(Experiment = input$name_1,
           Time = fin_time_1,
           Events = fin_activity_1) 
    
    # add tooltip
    df <- df %>% unite("combined_md",c("Experiment", "Time", "Events") , remove = F, sep = "<br>")
    
    
    # plot
    plot <- ggplot(data=df, aes(x=Time,y=Experiment)) +
      geom_line(color = "gray80", size = 5) +
      geom_point(size = 10, aes(color = Experiment)) +
      geom_text(aes(label = Events), nudge_y = 0.1) +
      theme(
        legend.position = "none",
        panel.grid.major.y = element_line(colour = "gray80", size = 0.5, linetype = 2),
        panel.background = element_blank(),
        panel.grid.major.x = element_line(colour = "gray80", size = 0.5),
      )
    
    print(ggplotly(plot, tooltip = c("Time")))
    
  })
  
  

}


