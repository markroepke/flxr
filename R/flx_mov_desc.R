#' Get the description of a movie
#'
#' @param movie The name of a movie as a character string or an XML document representing the HTML of of a movie page
#' @return A character string of the description of the movie.
#' @examples
#' flx_mov_desc(movie = "The Godfather")
#' @export

flx_mov_desc <- function(movie = NULL){

  if (is.character(movie)){
    html_object <- flx_mov_html(movie)
  } else if (sum(class(movie) == "xml_document") > 0){
    html_object <- movie
  } else {
    stop(stringr::str_c("Error: ", quote(movie), " is not of type character or xml_document."))
  }

  description <- html_object %>%
    rvest::html_nodes(".summary_text") %>%
    rvest::html_text() %>%
    stringr::str_replace_all("\n", "") %>%
    stringr::str_trim()

  if (is.character(movie)){
    message(stringr::str_c("Returning movie description for ", flx_mov_name(movie), ":"))
  }

  return(description)

}
