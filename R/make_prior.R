#' Make the prior distribution
#'
#' Makes a prior distribution, according to the corresponding alpha parameter
#'
#' @param model   A formula describing the model.
#' @param alpha   Hyper-parameter used in the the prior
#' @param ...     Additional parameters, specifically data.
#'
#' @return a prior distribution, list of mu and Sigma
#' @import stats
#' @export
make_prior <- function(model, alpha, ...){
    n <- ncol(model.matrix(model, ...))
    list(mu=vector("numeric", length=n), Sigma=diag(1/alpha, nrow=n))
}
