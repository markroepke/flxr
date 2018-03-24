#' Get the movie name matched to the input character string
#'
#' @importFrom magrittr "%>%"
#' @param movie The name of a movie as a character string.
#' @return A character string of the movie matched to the input.
#' @examples
#' .flx_mov_name(movie = "The Godfather")

flx_mov_name <- function(movie = NULL){

  movie_search <- movie %>%
    stringr::str_split(" ") %>%
    .[[1]] %>%
    stringr::str_c(collapse = "%20")

  search_page <- stringr::str_c("http://www.imdb.com/find?q=", movie_search, "&s=tt&ttype=ft&ref_=fn_ft") %>%
    xml2::read_html()

  top_result <- search_page %>%
    rvest::html_nodes(".result_text") %>%
    as.character() %>%
    .[[1]]

  movie_name <- top_result %>%
    stringr::str_sub(stringr::str_locate(., "/title/")[1,2], stringr::str_length(.)) %>%
    stringr::str_sub(stringr::str_locate(., ">")[1,1] + 1, stringr::str_locate(., "<")[1,1] - 1)

  return(movie_name)

}
