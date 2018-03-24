#' Get HTML for a movie page
#'
#' @importFrom magrittr "%>%"
#' @param movie The name of a movie as a character string.
#' @return An XML document representing the HTML of the movie page.
#' @examples
#' flx_mov_html(movie = "The Godfather")

flx_mov_html <- function(movie = NULL){

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

  url_beg <- top_result %>%
    stringr::str_locate("href=\"") %>%
    .[1,2] + 1

  url_end <- top_result %>%
    stringr::str_sub(url_beg, stringr::str_length(.)) %>%
    stringr::str_locate("\"") %>%
    .[1,1] - 2 + url_beg

  html <- top_result %>%
    stringr::str_sub(url_beg, url_end) %>%
    stringr::str_c("http://www.imdb.com", .) %>%
    xml2::read_html()

  return(html)

}
