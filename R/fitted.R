#' Extracted fitted response values
#'
#' Returns the fitted response values from the model, given the mean values they would correspond to
#'
#' @param object    blm model object
#' @param ...       Additional pararmeters, forwarded to predict.blm()
#'
#' @return vector of the fitted response variables
#' @export
fitted.blm  <- function(object, ...) predict(object)
