#' Residuals from the blm object
#'
#' This function returns the residuals of the fit. That is the difference between predicted values and observed values for the response variable.
#'
#' @param object    Blm object
#' @param ...       Additional parameters
#'
#' @return a vector of the residuals
#' @export
residuals.blm <- function(object, ...) object$model[,1]-fitted(object)
