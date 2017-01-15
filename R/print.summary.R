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
    cat("------ \n")
    cat("Signif. codes:  0 '****' 0.0001 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1\n")

    cat("\nConfindence intervals: \n")
    print(x$confint)

    cat("\nR-squared:", x$Rsquared)
    cat("\n")
}
