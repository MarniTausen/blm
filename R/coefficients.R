#' Coefficients for the blm class
#'
#' Retrieve coefficients from the blm class
#'
#' @param x    object of class blm
#'
#' @return vector of coefficients
#' @export
coef.blm <- function(x){
    n <- colnames(x$coefficients)
    coefs <- as.vector(x$coefficients)
    names(coefs) <- n
    coefs
}
