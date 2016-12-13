#' Coefficients for the blm class
#'
#' Retrieve coefficients from the blm class
#'
#' @param object    object of class blm
#' @param ...       Additional parameters
#'
#' @return vector of coefficients
#' @export
coef.blm <- function(object, ...){
    n <- colnames(object$coefficients)
    coefs <- as.vector(object$coefficients)
    names(coefs) <- n
    coefs
}
