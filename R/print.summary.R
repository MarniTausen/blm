#' Print summary.blm
#'
#' Prints the summary details of summary.blm object
#'
#' @param x     a summary.blm object
#' @param ...   additional options
#'
#' @return nothing
#' @export
print.summary.blm <- function(x, ...) {
    cat("blm model: "); print(x$terms)
    cat("\n")

    cat("Coefficients:\n");
    ct <- x$coefficients
    print(ct)

    cat("\nConfindence intervals: \n")
    print(x$confint)

    cat("\nR-squared:", x$Rsquared)
    cat("\n")
}
