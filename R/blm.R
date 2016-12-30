#' Bayesian linear model.
#'
#' Fits a model, given as a formula, optionally with data provided through the "..." parameter.
#'
#' @param model   A formula describing the model.
#' @param alpha   Hyper-parameter for the prior
#' @param beta    Hyper-parameter for the accuracy of the data points.
#' @param ...     Additional data, for example a data frame.
#'
#' @return A fitted model.
#' @import stats
#' @export
blm <- function(model, alpha, beta, ...) {

    prior <- make_prior(model, alpha, ...)
    posterior <- update(model, prior, beta, ...)

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
