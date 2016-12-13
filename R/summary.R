#' Summary of blm object
#'
#' Creates summary statistics of the blm model given.
#'
#' @param object    blm object
#' @param ...       Additional variables
#'
#' @return summary.blm class, containing the summary statistics
#' @export
summary.blm <- function(object, ...){

    ## run some tests and statistics on the bayesian models

    cf <- confint(object)
    Rsquared <- 1-sum(residuals(object)^2)/sum((object$model[,1]-mean(object$model[,1]))^2)

    obj <- list(terms=object$terms, confint=cf, coefficients=t(object$coefficients),
                Rsquared=Rsquared)
    class(obj) <- "summary.blm"
    obj
}

print.summary.blm <- function(x) {
    cat("blm model: "); print(x$terms)
    cat("\n")

    cat("Coefficients:\n");
    ct = x$coefficients
    colnames(ct) <- c("Mean")
    print(ct)

    cat("\nConfindence intervals: \n")
    print(x$confint)

    cat("\nR-squared:", x$Rsquared)
    cat("\n")
}
