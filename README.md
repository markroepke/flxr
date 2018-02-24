# flxr: An R package for scraping movie data

This package allows users to easily scrape movie data from the internet. By only supplying a movie title, users can currently retrieve the movie description, director, lead cast, genre, runtime, IMDB user rating, and Metacritic rating. The package can currently be installed using the following code:

```r
devtools::install_github("markroepke/flxr")
```

Here is an example of `flxr` in use:

```r
# Get movie director
flx_mov_director("The Godfather")
```

There is also broad function, `flx_mov_details()` for easily pulling all movie information.

```r
# Get movie information
flx_mov_details("The Godfather")
```
