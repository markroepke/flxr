#' Get the runtime of a movie
#'
#' @importFrom magrittr "%>%"
#' @param movie The name of a movie as a character string or an XML document representing the HTML of of a movie page
#' @return A numeric vector of length one. The number of minutes.
#' @examples
#' flx_mov_runtime(movie = "The Godfather")
#' @export

flx_mov_runtime <- function(movie = NULL){

  if (is.character(movie)){
    html_object <- flx_mov_html(movie)
  } else if (sum(class(movie) == "xml_document") > 0){
    html_object <- movie
  } else {
    stop(stringr::str_c("Error: ", quote(movie), " is not of type character or xml_document."))
  }

  runtime <- html_object %>%
    rvest::html_nodes("#title-overview-widget time") %>%
    rvest::html_text() %>%
    stringr::str_replace_all("\n", "") %>%
    stringr::str_trim() %>%
    stringr::str_split(" ") %>%
    .[[1]] %>%
    purrr::map_dbl(.flx_to_time) %>%
    sum()

  if (is.character(movie)){
    message(stringr::str_c("Returning movie runtime for ", flx_mov_name(movie), ":"))
  }

  return(runtime)

}
