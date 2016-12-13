#' Model Deviance for blm models
#'
#' Returns the deviance of the blm model object
#'
#' @param object  blm object the deviance
#' @param ...     Additional parameters.
#'
#' @return The deviance of the object
#' @export
deviance.blm <- function(object, ...) sum((object$model[,1]-fitted(object, ...))^2)
