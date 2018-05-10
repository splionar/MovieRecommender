library(reshape2)
library(recommenderlab)
library(stringi)

movies <- read.csv("ml-latest-small/movies.csv", header = TRUE, stringsAsFactors=FALSE) # Data from MovieLens Latest dataset
ratings <- read.csv("ml-latest/ratings.csv", header = TRUE, nrows = 2000000) 

movies$year <- stri_extract_last_words(movies$title)
movies$year <- as.numeric(movies$year)
movies2014 <- movies[movies$year>2013,]
movies2014 <- movies2014[complete.cases(movies2014), ]
movies2014$year <- NULL

movies2014 <- movies2014[-which((movies2014$movieId %in% ratings$movieId) == FALSE),]
ratings <- ratings[-which(ratings$movieId %in% movies2014$movieId == FALSE),]

ratingmatrix <- dcast(ratings, userId~movieId, value.var = "rating", na.rm=FALSE)
ratingmatrix <- ratingmatrix[,-1]
ratingmatrix <- as.matrix(ratingmatrix)
ratingmatrix <- as(ratingmatrix, "realRatingMatrix")
ratingmatrix <- normalize(ratingmatrix, method="center", row=TRUE)
ratingmatrix <- as(ratingmatrix, "matrix")

saveRDS(ratingmatrix, "ratingmatrix2014.rds")
saveRDS(movies2014, "movies2014.rds")
