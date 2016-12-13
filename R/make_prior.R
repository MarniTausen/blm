#' Make the prior distribution
#'
#' Makes a prior distribution, according to the corresponding alpha parameter
#'
#' @param model   A formula describing the model.
#' @param alpha   Hyper-parameter used in the the prior
#'
#' @return a prior distribution, list of mu and Sigma
#' @export
make_prior <- function(model, alpha){
    n <- ncol(model.matrix(model))
    list(mu=vector("numeric", length=n), Sigma=diag(1/alpha, nrow=n))
}
