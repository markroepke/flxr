#' Get the IMDB user rating of a movie
#'
#' @param movie The name of a movie as a character string or an XML document representing the HTML of of a movie page
#' @return A numeric vector of length one. The average IMDB user rating of the movie.
#' @examples
#' flx_mov_user_rtg(movie = "The Godfather")
#' @export

flx_mov_user_rtg <- function(movie = NULL){

  if (is.character(movie)){
    html_object <- flx_mov_html(movie)
  } else if (sum(class(movie) == "xml_document") > 0){
    html_object <- movie
  } else {
    stop(stringr::str_c("Error: ", quote(movie), " is not of type character or xml_document."))
  }

  user_rtg <- html_object %>%
    rvest::html_nodes(".ratingValue") %>%
    rvest::html_text() %>%
    stringr::str_replace_all("\n", "") %>%
    stringr::str_replace_all("/10", "") %>%
    as.numeric()

  if (is.character(movie)){
    message(stringr::str_c("Returning movie user rating for ", flx_mov_name(movie), ":"))
  }

  return(user_rtg)

}
