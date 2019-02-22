emptyPlot <-
  function() {
    #x-axis
    x <- list(visible=FALSE)

    #Left y-axis
    y <- list(visible=FALSE)
    
    #BPL Logo Splash
    logo <- list(
      list(
        source =  "https://raw.githubusercontent.com/cunybpl/noBAS-vis/master/bpl-logo.png",
        xref = "paper",
        yref = "paper",
        x = 0,
        y = 1,
        sizex = 1,
        sizey = 1,
        sizing = "contain",
        opacity = 0.3,
        layer = "below"
      )
    )
    
    plt <-
      plot_ly(type = 'scatter', mode = 'lines') %>% layout(title = '',
                                                           images = logo,
                                                           xaxis=x,
                                                           yaxis=y)
    
    return(plt)
  }