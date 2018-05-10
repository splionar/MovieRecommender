library(recommenderlab)

ratingmatrix <- readRDS(file="ratingmatrix2014.rds")
movies <- readRDS(file="movies2014.rds")

RecommendMovie <- function(input1,input2,input3) {
  #movies <- movies[-which((movies$movieId %in% colnames(ratingmatrix)) == FALSE),]
  NCol <- as.numeric(dim(movies)[[1]])
  userarray <- matrix(ncol = NCol, nrow = 1)
  index1 <- which(movies[,2] == input1)
  index2 <- which(movies[,2] == input2)
  index3 <- which(movies[,2] == input3)
 
  userarray[1,index1] <- 1
  userarray[1,index2] <- 1
  userarray[1,index3] <- 1

  colnames(userarray) <- colnames(ratingmatrix)
  profile_matrix <- rbind(userarray,ratingmatrix)
  profile_matrix <- as(profile_matrix, "realRatingMatrix")
  
  recommender <- Recommender(profile_matrix, method = "UBCF",param=list(normalize = NULL, method="Cosine", nn = 10))
  prediction <- predict(recommender, profile_matrix[1], n=200)
  prediction_list <- as(prediction, "list")
  
  column_names <- c("Title", "Genre")
  recommendation <- data.frame(matrix(ncol=2, nrow = 200))
  colnames(recommendation) <- column_names
  if (as.character(prediction_list) == "character(0)"){
    ErrorMessage <- "Sorry, there is insufficient data for the movies you selected. Please choose different movies."
    return(as.data.frame(ErrorMessage))
  } else{ 
    for (i in c(1:200)){
      recommendation[i,1] <- as.character(subset(movies, movies$movieId == as.integer(prediction_list[[1]][i]))$title)
      recommendation[i,2] <- as.character(subset(movies, movies$movieId == as.integer(prediction_list[[1]][i]))$genres)
    }
    
    genre1 <- movies$genres[movies$title == input1]
    genre2 <- movies$genres[movies$title == input2]
    genre3 <- movies$genres[movies$title == input3]

    genres_combined <- paste(genre1, genre2, genre3, sep = "|")
    genre_tomatch <- strsplit(genres_combined, split = "\\|")[[1]]
    genre_tomatch <- unique(genre_tomatch)
    
    index_genres <- grep(paste(genre_tomatch,collapse="|"),recommendation$Genre)
    recommendation2 <- rbind(recommendation[index_genres,], recommendation[-index_genres,])
    
    return(recommendation2[1:10,])
  }
}
