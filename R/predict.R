#' Predict new data from blm model
#'
#' Predict new data points from a blm model, if no new data is given returns the fitted response variables. If new data is given, it gives predicted response variables.
#'
#' @param object       Blm object
#' @param variances    Whether to return variances aswell
#' @param ...          Additional parameters, in particular new data to predict from.
#'
#' @return predicted values
#' @export
predict.blm <- function(object, variances=FALSE, ...){

    mxy <- object$posterior$mu
    Sxy <- object$posterior$Sigma

    formula <- object$terms
    responseless.formula <- delete.response(terms(formula))
    frame <- model.frame(responseless.formula, ...)
    theta_x <- model.matrix(responseless.formula, frame)

    means = vector(length=nrow(theta_x))
    sds = vector(length=nrow(theta_x))
    for(i in seq_along(means)) {
        means[i] <- t(mxy) %*% theta_x[i,]
        sds[i] <- 1/object$beta + (t(theta_x[i,]) %*% Sxy %*% theta_x[i,])
    }

    if(variances==TRUE) return(list(mean=means, var=sds))

    means
}