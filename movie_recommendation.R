library(data.table)
library(jsonlite)
library(tm)
library(proxy)
library(stringdist)
library(stringr)

# Load datasets
tmdb_movies <- fread("tmdb_5000_movies.csv")
credits <- fread("tmdb_5000_credits.csv")

# Extract JSON fields
extract_names <- function(x){
  x <- gsub("'", '"', x)
  tryCatch({
    data <- fromJSON(x)
    paste(data$name, collapse=" ")
  }, error=function(e){
    ""
  })
}

tmdb_movies$genres <- sapply(tmdb_movies$genres, extract_names)
tmdb_movies$keywords <- sapply(tmdb_movies$keywords, extract_names)

extract_cast <- function(x){
  x <- gsub("'", '"', x)
  tryCatch({
    data <- fromJSON(x)
    paste(head(data$name,3), collapse=" ")
  }, error=function(e){
    ""
  })
}

credits$cast <- sapply(credits$cast, extract_cast)

# Merge cast with movies
tmdb_movies$cast <- credits$cast[
  match(tmdb_movies$title, credits$title)
]

# Build content column
tmdb_movies$content <- paste(
  tmdb_movies$genres,
  tmdb_movies$keywords,
  tmdb_movies$cast,
  tmdb_movies$overview
)

# Text preprocessing
corpus <- VCorpus(VectorSource(tmdb_movies$content))
corpus <- tm_map(corpus, content_transformer(tolower))
corpus <- tm_map(corpus, removePunctuation)
corpus <- tm_map(corpus, removeNumbers)
corpus <- tm_map(corpus, removeWords, stopwords("en"))
corpus <- tm_map(corpus, stripWhitespace)

# Document term matrix
dtm <- DocumentTermMatrix(corpus)
dtm <- removeSparseTerms(dtm, 0.99)

dtm_matrix <- as.matrix(dtm)

# Cosine similarity
similarity <- as.matrix(simil(dtm_matrix, method="cosine"))

# Clean title
clean_title <- function(x){
  x <- tolower(x)
  x <- gsub("[^a-z0-9 ]","",x)
  x <- gsub("\\s+"," ",x)
  trimws(x)
}

tmdb_movies$clean_title <- clean_title(tmdb_movies$title)

# Recommendation function
recommend_movie <- function(name){
  name_clean <- clean_title(name)
  
  distances <- stringdist(name_clean,
                          tmdb_movies$clean_title,
                          method="jw")
  
  idx <- which.min(distances)
  
  cat("Matched with:", tmdb_movies$title[idx], "\n\n")
  
  top <- order(similarity[idx,], decreasing=TRUE)[2:6]
  
  tmdb_movies$title[top]
}

# Example
recommend_movie("avatar")
recommend_movie("dark knight rises")
recommend_movie("spider man")
