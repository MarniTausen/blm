#' Predict new data from blm model
#'
#' Predict new data points from a blm model, if no new data is given returns the fitted response variables. If new data is given, it gives predicted response variables.
#'
#' @param object       Blm object
#' @param ...          Additional parameters such as data to be predicted on called 'data'. If left empty will return the fitted values. Boolean variable, which states whether variances of the predicted values should be included.
#'
#' @return predicted values
#' @import stats
#' @export
predict.blm <- function(object, ...){
    parameters <- list(...)
    mxy <- object$posterior$mu
    Sxy <- object$posterior$Sigma

    findDF <- Vectorize(function(x) class(x)=="data.frame")

    modeldata <- parameters$data
    if(is.null(modeldata)) {
        modeldata <- object$model
        if(sum(unlist(findDF(parameters)))==1) modeldata = parameters[[findDF(parameters)]]
    }

    formula <- object$terms
    responseless.formula <- delete.response(terms(formula))
    frame <- model.frame(responseless.formula, modeldata)
    theta_x <- model.matrix(responseless.formula, frame)

    means = vector(length=nrow(theta_x))
    sds = vector(length=nrow(theta_x))
    for(i in seq_along(means)) {
        means[i] <- t(mxy) %*% theta_x[i,]
        sds[i] <- 1/object$beta + (t(theta_x[i,]) %*% Sxy %*% theta_x[i,])
    }

    if(is.null(parameters$variances)) {
        variances = FALSE
    } else {
        variances = parameters$variances
    }
    if(variances==TRUE) return(list(mean=means, var=sds))

    means
}
