#' Updating the Prior distribution into a Posterior distribution
#'
#' Updates the given prior distribution, using the observed data, to produce the posterior distribution
#'
#' @param model    A formula describing the model
#' @param prior    The prior distribution to be updated
#' @param beta     Hyper-parameter beta, for uncertainty of the measurements.
#' @param ...      Additional data, for example a data frame.
#'
#' @return Posterior distribution, list of mu and Sigma
#' @import stats
#' @export
update <- function(model, prior, beta, ...) {
    data <- model.frame(model)
    mx <- model.matrix(model, ...)
    Sxy <- solve(prior$Sigma + beta * t(mx) %*% mx)
    mxy <- beta * Sxy %*% t(mx) %*% data[,1]
    list(mu=mxy, Sigma=Sxy)
}
