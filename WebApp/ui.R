#ui.R
library(shiny)
library(shinythemes)

genre_list <- c("Action", "Adventure", "Animation", "Children", 
                "Comedy", "Crime","Documentary", "Drama", "Fantasy",
                "Horror", "IMAX", "Musical", "Mystery","Romance",
                "Sci-Fi", "Thriller", "War", "Western")

shinyUI(navbarPage(theme = shinytheme("slate"),
  title = ("User-user Collaborative Filtering Movie Recommender"),
  
  tabPanel(title="Application",
  h4("Instructions:"),
  p("Select 3 movies that you like. Recommendations will be given based on your selections."),
      fluidRow(
              column(4, h3("Movie 1"),
                     wellPanel(
                       selectInput("input_genre", "Genre",
                                   genre_list),
                       uiOutput("ui")
                     )),
              
                  column(4, h3("Movie 2"),
                         wellPanel(
                           selectInput("input_genre2", "Genre",
                                       genre_list),
                           uiOutput("ui2")
                         )),
                  
                  column(4, h3("Movie 3"),
                         wellPanel(
                           selectInput("input_genre3", "Genre",
                                       genre_list),
                           uiOutput("ui3")
                         ))
  ),
     fluidRow(  
                column(6, align = "right",
                       htmlOutput("text1"),
                       tableOutput("Table1")
                ),
                
                column(6,align = "left",
                       htmlOutput("text2"),
                       tableOutput("TablePredictions")
                       )
  )
  ),
  
  tabPanel(title="About",
           fluidRow(
                column(2),
                column(8,
                       h3("About this application"),
                       p("This application is prototype of user-user 
                         collaborative filtering recommendation system. The dataset is taken from ",
                        a("MovieLens Latest Datasets.", href="https://grouplens.org/datasets/movielens/latest/", target="_blank"),
                       "Only movies with year 2014 onwards from small dataset and top 2 million ratings from full dataset are selected."),
                       p("Code is available on", a("GitHub.", href ="https://github.com/splionar/MovieRecommender" ,target = "blank"))
                ),
                column(2)
             
           )
  )
))