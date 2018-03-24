#' Get the Metacritic rating of a movie
#'
#' @importFrom magrittr "%>%"
#' @param movie The name of a movie as a character string or an XML document representing the HTML of of a movie page
#' @return A numeric vector of length one. The Metacritic rating of the movie.
#' @examples
#' flx_mov_mc_rtg(movie = "The Godfather")
#' @export

flx_mov_mc_rtg <- function(movie = NULL){

  if (is.character(movie)){
    html_object <- flx_mov_html(movie)
  } else if (sum(class(movie) == "xml_document") > 0){
    html_object <- movie
  } else {
    stop(stringr::str_c("Error: ", quote(movie), " is not of type character or xml_document."))
  }

  metacritic_rtg <- html_object %>%
    rvest::html_nodes(".titleReviewBarItem") %>%
    rvest::html_text() %>%
    stringr::str_replace_all("\n", "") %>%
    .[[1]] %>%
    stringr::str_extract("[[:digit:]]+") %>%
    as.numeric()

  if (is.character(movie)){
    message(stringr::str_c("Returning movie Metacritic rating for ", flx_mov_name(movie), ":"))
  }

  return(metacritic_rtg)

}
