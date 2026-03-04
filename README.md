# Movie Recommendation System (R)

This project implements a **Content-Based Movie Recommendation System** using R.

## Features

* NLP text preprocessing
* Cosine similarity for movie matching
* Fuzzy search for incorrect movie names
* Uses TMDB movie dataset

## Technologies Used

* R
* tm (text mining)
* proxy (cosine similarity)
* stringdist (fuzzy matching)

## Example

```r
recommend_movie("avatar")
```

Output:

Matched with: Avatar

1. Guardians of the Galaxy
2. John Carter
3. Star Trek
4. Jupiter Ascending
5. Interstellar
