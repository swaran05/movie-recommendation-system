# 🎬 Movie Recommendation System (R)

A **Content-Based Movie Recommendation System** built using **R** that recommends movies similar to a given movie based on metadata such as **genres, keywords, cast, and overview**.

The system uses **Natural Language Processing (NLP)** techniques and **Cosine Similarity** to find movies with similar content.

---

# 📌 Project Overview

Movie recommendation systems help users discover new movies based on similarities between movies.

This project builds a **content-based recommendation engine** using the **TMDB 5000 Movie Dataset**.

The recommendation model analyzes movie metadata and suggests movies that share similar features with the selected movie.

---

# ⚙️ Technologies Used

* **R** – programming language
* **tm** – text mining and NLP preprocessing
* **proxy** – cosine similarity computation
* **stringdist** – fuzzy string matching for movie titles
* **data.table** – fast dataset loading and manipulation
* **jsonlite** – parsing JSON movie metadata

---

# 📂 Dataset

This project uses the **TMDB 5000 Movie Dataset**, which contains metadata about movies.

Main features used in the recommendation system:

* Movie title
* Genres
* Keywords
* Cast
* Overview

Dataset files used:

```
tmdb_5000_movies.csv
tmdb_5000_credits.csv
movies.csv
ratings.csv
```

---

# 🏗 System Architecture

The recommendation system follows a structured pipeline to generate movie recommendations.

```
User Input (Movie Name)
        │
        ▼
Movie Title Matching
(Fuzzy Matching using stringdist)
        │
        ▼
Feature Extraction
Genres • Keywords • Cast • Overview
        │
        ▼
Text Processing (NLP)
Lowercase
Remove punctuation
Remove stopwords
Remove numbers
        │
        ▼
Document-Term Matrix
        │
        ▼
Cosine Similarity Calculation
        │
        ▼
Top 5 Similar Movies
```

---

# 🔄 Project Workflow

```
Movie Dataset
      ↓
Load and preprocess data
      ↓
Extract genres, keywords, and cast
      ↓
Combine features into a single text field
      ↓
Text preprocessing (NLP)
      ↓
Create Document-Term Matrix
      ↓
Compute cosine similarity
      ↓
Find most similar movies
      ↓
Return top 5 recommendations
```

---

# 🧠 Recommendation Algorithm

This system uses **Content-Based Filtering**.

Steps:

1. Extract movie features:

   * genres
   * keywords
   * cast
   * overview

2. Combine these features into a single text representation.

3. Convert text into a **Document-Term Matrix (DTM)**.

4. Calculate similarity between movies using **Cosine Similarity**.

Cosine similarity formula:

```
similarity(A,B) = (A · B) / (||A|| × ||B||)
```

Movies with the highest similarity score are recommended.

---

# 💻 Example Usage

Run the script in **RStudio** or R.

Example:

```r
recommend_movie("avatar")
```

Example Output:

```
Matched with: Avatar

1. Guardians of the Galaxy
2. John Carter
3. Star Trek
4. Jupiter Ascending
5. Interstellar
```

The system also handles spelling mistakes using fuzzy matching.

Example:

```r
recommend_movie("avatr")
recommend_movie("spider man")
recommend_movie("dark knight rises")
```

---

# 🚀 How to Run the Project

### 1️⃣ Clone the repository

```
git clone https://github.com/swaran05/movie-recommendation-system.git
```

### 2️⃣ Open the project in **RStudio**

### 3️⃣ Install required packages

```r
install.packages(c(
"tm",
"proxy",
"stringdist",
"data.table",
"jsonlite"
))
```

### 4️⃣ Run the script

```r
source("movie_recommendation.R")
```

### 5️⃣ Test recommendations

```r
recommend_movie("avatar")
recommend_movie("spider man")
recommend_movie("inception")
```

---

# 📁 Project Structure

```
movie-recommendation-system
│
├── movie_recommendation.R
├── tmdb_5000_movies.csv
├── tmdb_5000_credits.csv
├── movies.csv
├── ratings.csv
└── README.md
```

---

# 📊 Features

✔ Content-based movie recommendation
✔ Natural language processing (NLP)
✔ Cosine similarity matching
✔ Fuzzy movie title search (handles typos)
✔ Fast dataset processing with data.table

---

# 🔮 Future Improvements

Possible enhancements:

* Build a **web interface using R Shiny**
* Add **movie posters using TMDB API**
* Deploy the recommendation system online
* Improve recommendations using hybrid models

---

GitHub
https://github.com/swaran05
