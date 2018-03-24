flxr: An R package for scraping movie data <img src="tools/flxr.png" align="right" width="120" height="139" />
==============================================================================================================

This package allows users to easily scrape movie data from the internet. By only supplying a movie title, users can currently retrieve the movie description, director, lead cast, genre, runtime, IMDB user rating, and Metacritic rating. The package can currently be installed using the following code:

``` r
devtools::install_github("markroepke/flxr")
```

Here is an example of `flxr` in use:

``` r
# Get movie director
flx_mov_director("The Godfather")
#> Returning movie director for The Godfather:
#> [1] "Francis Ford Coppola"
```

The other functions in `flxr` are:

-   `flx_mov_desc()`
-   `flx_mov_genre()`
-   `flx_mov_lead_cast()`
-   `flx_mov_mc_rtg()`
-   `flx_mov_runtime()`
-   `flx_mov_user_rtg()`

There is also wrapper function, `flx_mov_details()`, to easily run all `flxr` functions:

``` r
# Get movie information
flx_mov_details("The Godfather")
#> # A tibble: 1 x 8
#>   movie  description          genre director lead_cast runtime user_rating
#>   <chr>  <chr>                <chr> <chr>    <list>      <dbl>       <dbl>
#> 1 The G~ The aging patriarch~ Crime Francis~ <chr [3]>    175.        9.20
#> # ... with 1 more variable: metacritic_rating <dbl>
```
