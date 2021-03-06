% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/blm.R
\name{blm}
\alias{blm}
\title{Bayesian linear model.}
\usage{
blm(model, alpha = 1, beta = 1, prior = NULL, ...)
}
\arguments{
\item{model}{A formula describing the model.}

\item{alpha}{Hyper-parameter for the prior}

\item{beta}{Hyper-parameter for the accuracy of the data points.}

\item{prior}{Provide a prior distribution, with structure list(mu, Sigma), where mu is a vector of means and Sigma is a covariance matrix. Needs to have the same dimensions as the}

\item{...}{Additional data, for example a data frame.}
}
\value{
A fitted model.
}
\description{
Fits a model, given as a formula, optionally with data provided through the "..." parameter.
}

