#' Confidence intervals of a Blm class
#'
#' Retrieve confidence intervals of the coefficients, or from observations
#'
#' @param object    Blm class object
#' @param parm      A specification of which parameters are to be given confidence intervals, either a vector of numbers or a vector of names. If missing, all parameters are considered. If the name of the response variable is given, then the confidence intervals of the fitted values values, or new predicted values if a data frame of new observations is given.
#' @param level     Confidence interval level of interest, corresponds to a percentage.
#' @param ...       Additional parameters
#'
#' @return Matrix of confidence intervals, or a list of 2 vectors with upper-bound and lower-bound values for the fitted, or predicted variables.
#' @import stats
#' @export
confint.blm <- function(object, parm, level = 0.95, ...){

    response = names(object$model)[1]

    a <- c((1-level)/2, 1-(1-level)/2)

    variables = names(coefficients(object))
    if(missing(parm)) parm = variables
    if(parm[1]==response){
        if(is.null(list(...)$data)){
            fit <- predict(object, variances=TRUE)
            list(lb=qnorm(a[1], fit$mean, fit$var),
                 ub=qnorm(a[2], fit$mean, fit$var))
        } else {
            fit <- predict(object, variances=TRUE, ...)
            list(lb=qnorm(a[1], fit$mean, fit$var),
                 ub=qnorm(a[2], fit$mean, fit$var))
        }
    } else {
        m <- matrix(0, nrow=length(parm), ncol=2)
        colnames(m) <- c(paste(a[1]*100, "%"), paste(a[2]*100, "%"))
        rownames(m) <- parm

        for(i in parm){
            m[i, 1] <- qnorm(a[1], mean=object$posterior$mu[i,1],
                             sd=sqrt(object$posterior$Sigma[i,i]))
            m[i, 2] <- qnorm(a[2], mean=object$posterior$mu[i,1],
                             sd=sqrt(object$posterior$Sigma[i,i]))
        }

        m
    }
}
