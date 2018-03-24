#' Get the genre of a movie
#'
#' @importFrom magrittr "%>%"
#' @param movie The name of a movie as a character string or an XML document representing the HTML of of a movie page
#' @return A character string of the genre of the movie.
#' @examples
#' flx_mov_genre(movie = "The Godfather")
#' @export

flx_mov_genre <- function(movie = NULL){

  if (is.character(movie)){
    html_object <- flx_mov_html(movie)
  } else if (sum(class(movie) == "xml_document") > 0){
    html_object <- movie
  } else {
    stop(stringr::str_c("Error: ", quote(movie), " is not of type character or xml_document."))
  }

  genre <- html_object %>%
    rvest::html_nodes(".itemprop") %>%
    rvest::html_text() %>%
    .[1]

  if (is.character(movie)){
    message(stringr::str_c("Returning movie genre for ", flx_mov_name(movie), ":"))
  }

  return(genre)

}
