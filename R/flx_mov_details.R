#' Get a variety of movie details
#'
#' @param movie The name of a movie as a character string or an XML document representing the HTML of of a movie page
#' @return A tibble with 8 columns and 1 row containing the movie name, description, genre, director, lead cast, runtime, user rating, and Metacritic rating.
#' @examples
#' flx_mov_details(movie = "The Godfather")
#' @export

flx_mov_details <- function(movie){

  movie_html <- flx_mov_html(movie)

  mov_details <- tibble::tibble(
    movie = flx_mov_name(movie),
    description = flx_mov_desc(movie_html),
    genre = flx_mov_genre(movie_html),
    director = flx_mov_director(movie_html),
    lead_cast = list(flx_mov_lead_cast(movie_html)),
    runtime = flx_mov_runtime(movie_html),
    user_rating = flx_mov_user_rtg(movie_html),
    metacritic_rating = flx_mov_mc_rtg(movie_html)

  )

  return(mov_details)

}
