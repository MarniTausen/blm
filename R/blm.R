#' Bayesian linear model.
#'
#' Fits a model, given as a formula, optionally with data provided through the "..." parameter.
#'
#' @param model   A formula describing the model.
#' @param alpha   Hyper-parameter for the prior
#' @param beta    Hyper-parameter for the accuracy of the data points.
#' @param prior   Provide a prior distribution, with structure list(mu, Sigma), where mu is a vector of means and Sigma is a covariance matrix. Needs to have the same dimensions as the
#' @param ...     Additional data, for example a data frame.
#'
#' @return A fitted model.
#' @import stats
#' @export
blm <- function(model, alpha=1, beta=1, prior=NULL, ...) {

    if(class(alpha)!="numeric" || class(beta)!="numeric") {
        stop("Please include data using: blm(formula, data=your_data)
  or by: blm(formula, alpha, beta, your_data)")
    }

    if(is.null(prior)) prior <- make_prior(model, alpha, ...)
    if(class(prior)!="list") stop("Prior is of wrong type: ", class(prior),
                                  " Should be a list")
    if(length(prior$mu)!=ncol(model.frame(model, ...))) {
        stop("Prior has wrong dimensions")
    }
    posterior <- update_prior(model, prior, beta, ...)

    obj <- list(coefficients=t(posterior$mu),
                variances=posterior$Sigma,
                model=model.frame(model, ...),
                prior=prior,
                posterior=posterior,
                terms=model,
                alpha=alpha,
                beta=beta)
    class(obj) <- "blm"
    obj
}
