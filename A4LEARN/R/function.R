#' Create directory if not already exists
#' 
#' @name safe.dir.create
#' @export
safe.dir.create <- function(path) {
  dirTest <- function(x) !is.na(isdir <- file.info(x)$isdir) & 
    isdir
  if (!dirTest(path) && !dir.create(path)) 
    stop(gettextf("cannot create directory '%s'", path), 
         domain = NA)
}