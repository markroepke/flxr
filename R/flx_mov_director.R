#' Get the director of a movie
#'
#' @importFrom magrittr "%>%"
#' @param movie The name of a movie as a character string or an XML document representing the HTML of of a movie page
#' @return A character vector of length one. The director of the movie.
#' @examples
#' flx_mov_director(movie = "The Godfather")
#' @export

flx_mov_director <- function(movie = NULL){

  if (is.character(movie)){
    html_object <- flx_mov_html(movie)
  } else if (sum(class(movie) == "xml_document") > 0){
    html_object <- movie
  } else {
    stop(stringr::str_c("Error: ", quote(movie), " is not of type character or xml_document."))
  }

  director <- html_object %>%
    rvest::html_nodes(".credit_summary_item") %>%
    rvest::html_text() %>%
    .[1] %>%
    stringr::str_replace_all("Director:", "") %>%
    stringr::str_replace_all("\n", "") %>%
    stringr::str_trim()

  if (is.character(movie)){
    message(stringr::str_c("Returning movie director for ", flx_mov_name(movie), ":"))
  }

  return(director)

}
