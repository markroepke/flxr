#' Get the lead cast of a movie
#'
#' @importFrom magrittr "%>%"
#' @param movie The name of a movie as a character string or an XML document representing the HTML of of a movie page
#' @return A character vector. The lead cast of the movie.
#' @examples
#' flx_mov_lead_cast(movie = "The Godfather")
#' @export

flx_mov_lead_cast <- function(movie = NULL){

  if (is.character(movie)){
    html_object <- flx_mov_html(movie)
  } else if (sum(class(movie) == "xml_document") > 0){
    html_object <- movie
  } else {
    stop(stringr::str_c("Error: ", quote(movie), " is not of type character or xml_document."))
  }

  lead_cast <- html_object %>%
    rvest::html_nodes(".credit_summary_item") %>%
    rvest::html_text() %>%
    .[3] %>%
    stringr::str_replace_all("Stars:", "") %>%
    stringr::str_replace_all("See full cast & crew", "") %>%
    stringr::str_replace_all("\n", "") %>%
    stringr::str_replace_all(" +", " ") %>%
    stringr::str_replace_all("[^[:alpha:], ]", "") %>%
    stringr::str_trim() %>%
    stringr::str_split(pattern = ", ") %>%
    .[[1]]

  if (is.character(movie)){
    message(stringr::str_c("Returning movie lead cast for ", flx_mov_name(movie), ":"))
  }

  return(lead_cast)

}
