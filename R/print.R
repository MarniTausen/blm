#' Print for blm objects
#'
#' Prints blm objects as intended
#'
#' @param x    a blm object
#' @param ...  Additional options
#'
#' @return Nothing
#' @export
print.blm <- function(x, ...){
    cat("blm model: "); print(x$terms)
    cat("\n")
    cat("Posterior:\n")
    print(t(x$posterior$mu)); cat("\n")
    print(x$posterior$Sigma)
}
