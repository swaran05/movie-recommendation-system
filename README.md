# 🎬 Movie Recommendation System (R)

A **Content-Based Movie Recommendation System** built using **R** that suggests movies similar to a given movie based on features like **genres, keywords, cast, and overview**.

The system uses **Natural Language Processing (NLP)** and **Cosine Similarity** to find movies with similar content.

---

# 📌 Project Overview

Movie recommendation systems help users discover movies based on similarities between movies.
This project builds a **content-based recommendation engine** using metadata from the **TMDB movie dataset**.

The system analyzes movie features and recommends movies that are most similar to the selected movie.

---

# ⚙️ Technologies Used

* **R** – programming language
* **tm** – text mining and NLP preprocessing
* **proxy** – cosine similarity calculation
* **stringdist** – fuzzy string matching for movie titles
* **data.table** – fast data loading and manipulation
* **jsonlite** – parsing JSON movie metadata

---

# 📂 Dataset

The project uses the **TMDB 5000 Movie Dataset**, which contains information about movies such as:

* Title
* Genres
* Keywords
* Cast
* Overview

Files used:

```
tmdb_5000_movies.csv
tmdb_5000_credits.csv
movies.csv
ratings.csv
```

---

# 🔄 Project Workflow

The recommendation system follows these steps:

```
Movie Dataset
      ↓
Load and preprocess data
      ↓
Extract genres, keywords, and cast
      ↓
Combine features into content text
      ↓
Text preprocessing (NLP)
      ↓
Create Document-Term Matrix
      ↓
Compute Cosine Similarity
      ↓
Find most similar movies
      ↓
Return Top 5 recommendations
```

---

# 🧠 Recommendation Algorithm

This project uses **Content-Based Filtering**.

Movies are converted into vectors using a **Document-Term Matrix**, and similarity between movies is calculated using:

**Cosine Similarity**

Movies with the highest similarity score are recommended.

---

# 💻 Example Usage

Run the script in R or RStudio:

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

---

# 🚀 How to Run the Project

1. Clone the repository

```
git clone https://github.com/swaran05/movie-recommendation-system.git
```

2. Open the project in **RStudio**

3. Install required packages

```r
install.packages(c("tm","proxy","stringdist","data.table","jsonlite"))
```

4. Run the script

```r
source("movie_recommendation.R")
```

---

# 📊 Features

✔ Content-based movie recommendations
✔ NLP text preprocessing
✔ Cosine similarity algorithm
✔ Fuzzy movie title search (handles typos)
✔ Fast data processing with data.table

---

GitHub:
https://github.com/swaran05
