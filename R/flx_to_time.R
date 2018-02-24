.flx_to_time <- function(x = NULL, type = "text"){
  if (stringr::str_detect(x, "h")){
    as.numeric(stringr::str_replace_all(x, "[:alpha:]", ""))*60
  } else if (stringr::str_detect(x, "min")) {
    as.numeric(stringr::str_replace_all(x, "[:alpha:]", ""))
  } else {
    stop("Error: not a recognized unit of time")
  }
}
