#' Summary of blm object
#'
#' Creates summary statistics of the blm model given.
#'
#' @param object    blm object
#' @param ...       Additional variables
#'
#' @return summary.blm class, containing the summary statistics
#' @import stats
#' @export
summary.blm <- function(object, ...){

    ## run some tests and statistics on the bayesian models

    cf <- confint(object)
    Rsquared <- 1-sum(residuals(object)^2)/sum((object$model[,1]-mean(object$model[,1]))^2)

    statstable <- t(object$coefficients)
    statstable <- cbind(statstable, diag(object$posterior$Sigma))
    colnames(statstable) <- c("Mean", "Variance")

    statstable <- as.data.frame(statstable)

    includesZero <- function(v) ifelse(v[1]<0 && v[2]>0, TRUE, FALSE)

    levels <- c(0.88, 0.9, 0.95, 0.975, 0.99, 0.999, 0.9999)
    slevels <- c(" ", ".", "*", "*", "**", "***", "****")
    pvalues <- vector("character", length=nrow(statstable))
    signfic <- vector("character", length=nrow(statstable))
    collected <- vector(length=nrow(statstable))
    for(l in seq_along(levels)){
        ccf <- confint(object, level=levels[l])
        for(i in seq_along(pvalues)[!collected]){
            B <- includesZero(ccf[i,])
            if(B){
                if(levels[l]<0.90) pvalues[i] <- ">0.10"
                pvalues[i] <- paste("<", 1-levels[l], sep="")
                signfic[i] <- slevels[l]
                collected[i] <- TRUE
            }
        }
    }
    for(i in seq_along(pvalues)[!collected]){
        pvalues[i] <- paste("<0.0001", sep="")
        signfic[i] <- "****"
    }

    statstable <- cbind(statstable, pvalues, signfic)
    colnames(statstable) <- c("Mean", "Variance", "p-value", " ")

    obj <- list(terms=object$terms, confint=cf, coefficients=statstable,
                Rsquared=Rsquared)
    class(obj) <- "summary.blm"
    obj
}
