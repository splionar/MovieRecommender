#server.R
library(shiny)

source("CollaborativeFiltering.R")
movies <- readRDS(file="movies2014.rds")

shinyServer(function(input, output) {
  
  output$ui <- renderUI({
    if (is.null(input$input_genre))
      return()
    
    switch(input$input_genre,
           "Action" = selectInput("input1", "Movie Title",
                                  choices = sort(movies$title[grepl("Action", movies$genres)]),
                                  selected = sort(movies$title[grepl("Action", movies$genres)])[1]),
           "Adventure" = selectInput("input1", "Movie Title",
                                     choices = sort(movies$title[grepl("Adventure", movies$genres)]),
                                     selected = sort(movies$title[grepl("Adventure", movies$genres)])[1]),
           "Animation" =  selectInput("input1", "Movie Title",
                                      choices = sort(movies$title[grepl("Animation", movies$genres)]),
                                      selected = sort(movies$title[grepl("Animation", movies$genres)])[1]),
           "Children" =  selectInput("input1", "Movie Title",
                                     choices = sort(movies$title[grepl("Children", movies$genres)]),
                                     selected = sort(movies$title[grepl("Children", movies$genres)])[1]),
           "Comedy" =  selectInput("input1", "Movie Title",
                                   choices = sort(movies$title[grepl("Comedy", movies$genres)]),
                                   selected = sort(movies$title[grepl("Comedy", movies$genres)])[1]),
           "Crime" =  selectInput("input1", "Movie Title",
                                  choices = sort(movies$title[grepl("Crime", movies$genres)]),
                                  selected = sort(movies$title[grepl("Crime", movies$genres)])[1]),
           "Documentary" =  selectInput("input1", "Movie Title",
                                        choices = sort(movies$title[grepl("Documentary", movies$genres)]),
                                        selected = sort(movies$title[grepl("Documentary", movies$genres)])[1]),
           "Drama" =  selectInput("input1", "Movie Title",
                                  choices = sort(movies$title[grepl("Drama", movies$genres)]),
                                  selected = sort(movies$title[grepl("Drama", movies$genres)])[1]),
           "Fantasy" =  selectInput("input1", "Movie Title",
                                    choices = sort(movies$title[grepl("Fantasy", movies$genres)]),
                                    selected = sort(movies$title[grepl("Fantasy", movies$genres)])[1]),
           "Horror" =  selectInput("input1", "Movie Title",
                                   choices = sort(movies$title[grepl("Horror", movies$genres)]),
                                   selected = sort(movies$title[grepl("Horror", movies$genres)])[1]),
           "IMAX" =  selectInput("input1", "Movie Title",
                                 choices = sort(movies$title[grepl("IMAX", movies$genres)]),
                                 selected = sort(movies$title[grepl("IMAX", movies$genres)])[1]),
           "Musical" =  selectInput("input1", "Movie Title",
                                    choices = sort(movies$title[grepl("Musical", movies$genres)]),
                                    selected = sort(movies$title[grepl("Musical", movies$genres)])[1]),
           "Mystery" =  selectInput("input1", "Movie Title",
                                    choices = sort(movies$title[grepl("Mystery", movies$genres)]),
                                    selected = sort(movies$title[grepl("Mystery", movies$genres)])[1]),
           "Romance" =  selectInput("input1", "Movie Title",
                                    choices = sort(movies$title[grepl("Romance", movies$genres)]),
                                    selected = sort(movies$title[grepl("Romance", movies$genres)])[1]),
           "Sci-Fi" =  selectInput("input1", "Movie Title",
                                   choices = sort(movies$title[grepl("Sci-Fi", movies$genres)]),
                                   selected = sort(movies$title[grepl("Sci-Fi", movies$genres)])[1]),
           "Thriller" =  selectInput("input1", "Movie Title",
                                     choices = sort(movies$title[grepl("Thriller", movies$genres)]),
                                     selected = sort(movies$title[grepl("Thriller", movies$genres)])[1]),
           "War" =  selectInput("input1", "Movie Title",
                                choices = sort(movies$title[grepl("War", movies$genres)]),
                                selected = sort(movies$title[grepl("War", movies$genres)])[1]),
           "Western" = selectInput("input1", "Movie Title",
                                   choices = sort(movies$title[grepl("Western", movies$genres)]),
                                   selected = sort(movies$title[grepl("Western", movies$genres)])[1])
    )
  })
  
  output$ui2 <- renderUI({
    if (is.null(input$input_genre2))
      return()
    
    switch(input$input_genre2,
           "Action" = selectInput("input2", "Movie Title",
                                  choices = sort(movies$title[grepl("Action", movies$genres)]),
                                  selected = sort(movies$title[grepl("Action", movies$genres)])[1]),
           "Adventure" = selectInput("input2", "Movie Title",
                                     choices = sort(movies$title[grepl("Adventure", movies$genres)]),
                                     selected = sort(movies$title[grepl("Adventure", movies$genres)])[1]),
           "Animation" =  selectInput("input2", "Movie Title",
                                      choices = sort(movies$title[grepl("Animation", movies$genres)]),
                                      selected = sort(movies$title[grepl("Animation", movies$genres)])[1]),
           "Children" =  selectInput("input2", "Movie Title",
                                     choices = sort(movies$title[grepl("Children", movies$genres)]),
                                     selected = sort(movies$title[grepl("Children", movies$genres)])[1]),
           "Comedy" =  selectInput("input2", "Movie Title",
                                   choices = sort(movies$title[grepl("Comedy", movies$genres)]),
                                   selected = sort(movies$title[grepl("Comedy", movies$genres)])[1]),
           "Crime" =  selectInput("input2", "Movie Title",
                                  choices = sort(movies$title[grepl("Crime", movies$genres)]),
                                  selected = sort(movies$title[grepl("Crime", movies$genres)])[1]),
           "Documentary" =  selectInput("input2", "Movie Title",
                                        choices = sort(movies$title[grepl("Documentary", movies$genres)]),
                                        selected = sort(movies$title[grepl("Documentary", movies$genres)])[1]),
           "Drama" =  selectInput("input2", "Movie Title",
                                  choices = sort(movies$title[grepl("Drama", movies$genres)]),
                                  selected = sort(movies$title[grepl("Drama", movies$genres)])[1]),
           "Fantasy" =  selectInput("input2", "Movie Title",
                                    choices = sort(movies$title[grepl("Fantasy", movies$genres)]),
                                    selected = sort(movies$title[grepl("Fantasy", movies$genres)])[1]),
           "Horror" =  selectInput("input2", "Movie Title",
                                   choices = sort(movies$title[grepl("Horror", movies$genres)]),
                                   selected = sort(movies$title[grepl("Horror", movies$genres)])[1]),
           "IMAX" =  selectInput("input2", "Movie Title",
                                 choices = sort(movies$title[grepl("IMAX", movies$genres)]),
                                 selected = sort(movies$title[grepl("IMAX", movies$genres)])[1]),
           "Musical" =  selectInput("input2", "Movie Title",
                                    choices = sort(movies$title[grepl("Musical", movies$genres)]),
                                    selected = sort(movies$title[grepl("Musical", movies$genres)])[1]),
           "Mystery" =  selectInput("input2", "Movie Title",
                                    choices = sort(movies$title[grepl("Mystery", movies$genres)]),
                                    selected = sort(movies$title[grepl("Mystery", movies$genres)])[1]),
           "Romance" =  selectInput("input2", "Movie Title",
                                    choices = sort(movies$title[grepl("Romance", movies$genres)]),
                                    selected = sort(movies$title[grepl("Romance", movies$genres)])[1]),
           "Sci-Fi" =  selectInput("input2", "Movie Title",
                                   choices = sort(movies$title[grepl("Sci-Fi", movies$genres)]),
                                   selected = sort(movies$title[grepl("Sci-Fi", movies$genres)])[1]),
           "Thriller" =  selectInput("input2", "Movie Title",
                                     choices = sort(movies$title[grepl("Thriller", movies$genres)]),
                                     selected = sort(movies$title[grepl("Thriller", movies$genres)])[1]),
           "War" =  selectInput("input2", "Movie Title",
                                choices = sort(movies$title[grepl("War", movies$genres)]),
                                selected = sort(movies$title[grepl("War", movies$genres)])[1]),
           "Western" = selectInput("input2", "Movie Title",
                                   choices = sort(movies$title[grepl("Western", movies$genres)]),
                                   selected = sort(movies$title[grepl("Western", movies$genres)])[1])
    )
  })
  
  output$ui3 <- renderUI({
    if (is.null(input$input_genre3))
      return()
    
    switch(input$input_genre3,
           "Action" = selectInput("input3", "Movie Title",
                                  choices = sort(movies$title[grepl("Action", movies$genres)]),
                                  selected = sort(movies$title[grepl("Action", movies$genres)])[1]),
           "Adventure" = selectInput("input3", "Movie Title",
                                     choices = sort(movies$title[grepl("Adventure", movies$genres)]),
                                     selected = sort(movies$title[grepl("Adventure", movies$genres)])[1]),
           "Animation" =  selectInput("input3", "Movie Title",
                                      choices = sort(movies$title[grepl("Animation", movies$genres)]),
                                      selected = sort(movies$title[grepl("Animation", movies$genres)])[1]),
           "Children" =  selectInput("input3", "Movie Title",
                                     choices = sort(movies$title[grepl("Children", movies$genres)]),
                                     selected = sort(movies$title[grepl("Children", movies$genres)])[1]),
           "Comedy" =  selectInput("input3", "Movie Title",
                                   choices = sort(movies$title[grepl("Comedy", movies$genres)]),
                                   selected = sort(movies$title[grepl("Comedy", movies$genres)])[1]),
           "Crime" =  selectInput("input3", "Movie Title",
                                  choices = sort(movies$title[grepl("Crime", movies$genres)]),
                                  selected = sort(movies$title[grepl("Crime", movies$genres)])[1]),
           "Documentary" =  selectInput("input3", "Movie Title",
                                        choices = sort(movies$title[grepl("Documentary", movies$genres)]),
                                        selected = sort(movies$title[grepl("Documentary", movies$genres)])[1]),
           "Drama" =  selectInput("input3", "Movie Title",
                                  choices = sort(movies$title[grepl("Drama", movies$genres)]),
                                  selected = sort(movies$title[grepl("Drama", movies$genres)])[1]),
           "Fantasy" =  selectInput("input3", "Movie Title",
                                    choices = sort(movies$title[grepl("Fantasy", movies$genres)]),
                                    selected = sort(movies$title[grepl("Fantasy", movies$genres)])[1]),
           "IMAX" =  selectInput("input3", "Movie Title",
                                   choices = sort(movies$title[grepl("IMAX", movies$genres)]),
                                   selected = sort(movies$title[grepl("IMAX", movies$genres)])[1]),
           "Horror" =  selectInput("input3", "Movie Title",
                                   choices = sort(movies$title[grepl("Horror", movies$genres)]),
                                   selected = sort(movies$title[grepl("Horror", movies$genres)])[1]),
           "Musical" =  selectInput("input3", "Movie Title",
                                    choices = sort(movies$title[grepl("Musical", movies$genres)]),
                                    selected = sort(movies$title[grepl("Musical", movies$genres)])[1]),
           "Mystery" =  selectInput("input3", "Movie Title",
                                    choices = sort(movies$title[grepl("Mystery", movies$genres)]),
                                    selected = sort(movies$title[grepl("Mystery", movies$genres)])[1]),
           "Romance" =  selectInput("input3", "Movie Title",
                                    choices = sort(movies$title[grepl("Romance", movies$genres)]),
                                    selected = sort(movies$title[grepl("Romance", movies$genres)])[1]),
           "Sci-Fi" =  selectInput("input3", "Movie Title",
                                   choices = sort(movies$title[grepl("Sci-Fi", movies$genres)]),
                                   selected = sort(movies$title[grepl("Sci-Fi", movies$genres)])[1]),
           "Thriller" =  selectInput("input3", "Movie Title",
                                     choices = sort(movies$title[grepl("Thriller", movies$genres)]),
                                     selected = sort(movies$title[grepl("Thriller", movies$genres)])[1]),
           "War" =  selectInput("input3", "Movie Title",
                                choices = sort(movies$title[grepl("War", movies$genres)]),
                                selected = sort(movies$title[grepl("War", movies$genres)])[1]),
           "Western" = selectInput("input3", "Movie Title",
                                   choices = sort(movies$title[grepl("Western", movies$genres)]),
                                   selected = sort(movies$title[grepl("Western", movies$genres)])[1])
    )
  })
  
  
  table1 <- reactive({
  column_names <- c("Title", "Genre")
  InputTable <- data.frame(matrix(ncol=2, nrow = 3))
  colnames(InputTable) <- column_names
  
  InputTable[1,1] <- input$input1
  InputTable[1,2] <- movies$genres[movies$title == input$input1]
  InputTable[2,1] <- input$input2
  InputTable[2,2] <- movies$genres[movies$title == input$input2]
  InputTable[3,1] <- input$input3
  InputTable[3,2] <- movies$genres[movies$title == input$input3]
  return(InputTable)
  })
  
  output$text1 <- renderUI(h4("Movies you selected:"))
  output$Table1<- renderTable({
    table1()
  })
  
  output$text2 <- renderUI(h4("Recommended for you:"))
  output$TablePredictions <- renderTable({
    RecommendMovie(input$input1, input$input2, input$input3)
  })
  
 })