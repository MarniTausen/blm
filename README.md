Bayesian linear regression
================
Marni Tausen
2017-01-13

### blm package

The blm package is an R package for Bayesian linear models, which has the same kind of interface as lm and glm in R. The difference of the Bayesian model, is that we do not directly estimate the value of the parameters, instead we estimate an normal distribution giving the mean and the variance for each of the parameters.

### Installation

The package is currently only available through github. Therefore the easiest way to install the package, is to use the devtools package. Skip the installation part, if already installed.

``` r
install.packages("devtools")
library(devtools)
```

Using devtools, you can install the package using install\_github().

``` r
install_github("MarniTausen/blm")
```

and voila! The package is installed.

### Quick Guide

The blm package uses the same interface as the lm and glm functions in R, and therefore it functions very similarly.

First to load the package:

``` r
library(blm)
```

To construct the blm model use the blm function and feed it a formula, with the structure **response** ~ **predictors**.

``` r
blm(y ~ x)
```

    blm model: y ~ x

    Posterior:
         (Intercept)        x
    [1,]  -0.1467252 1.004073

                  (Intercept)             x
    (Intercept)  0.0390212100 -5.824044e-04
    x           -0.0005824044  1.164809e-05

To extract summary statistics of the blm model, we can combine

``` r
summary(blm(y ~ x))
```

    blm model: y ~ x

    Coefficients:
                      Mean     Variance
    (Intercept) -0.1467252 3.902121e-02
    x            1.0040725 1.164809e-05

    Confindence intervals: 
                     2.5 %    97.5 %
    (Intercept) -0.5338923 0.2404419
    x            0.9973833 1.0107618

    R-squared: 0.9988067

A quick guide of how to use the package. Short and simple. Very straight forward.

### Features

A list of features the package contains, and a short description of their purpose and function. For a more indepth description check the documentation with ?x.blm, or the github wiki page for the function.

-   blm
    -   The core function of the package. Produces the Bayesian linear model (blm) and the blm object. It takes in the parameters: blm(formula, alpha=1, beta=1, ...), where ... includes the parameter data, which allows the inclusion of a data.frame for the data in the formula. For an indepth look at the function of alpha and beta, look at the next section.
-   coef (coefficients)
    -   coef, gives the coefficients of the model when used on a blm class object. This returns a vector with the names of the coefficients.
-   confint
    -   confint gives the confidence intervals of the coefficients from the blm object. The usage is as following: confint(object, parm, level = 0.95, ...). Where object is the blm object, and parm is a vector specifying which coefficients should be considered. Level refers to the confidence level, where 0.95 corresponds to the 95% confidence level.
-   deviance
    -   deviance returns the deviance of the blm object.
-   fitted
    -   fitted gives the fitted response values in the blm object.
-   predict
    -   predict allows the prediction of new response variables from new observations. If no new data is provided it returns the fitted response variables.
-   residuals
    -   returns the residuals of blm object, which is the difference between the fitted response values and the observed response values.
-   summary
    -   summary, produces and returns an summary.blm object, which contains summary statistics of the blm object. Printing this object displays the summary statistics.

There are two objects/classes included in the package, which contain a lot of attributes. Here is a summary of attributes in the two objects.

-   blm
    -   **coefficients**: *vector of the coefficients*
    -   **variances**: *covariance matrix of the parameters*
    -   **model**: *the observations used for the model*
    -   **prior**: *the prior used for the creation of the posterior*
    -   **posterior**: *the posterior, containing the means and covariances of the parameters*
    -   **terms**: *the formula used for the model*
    -   **alpha**: *the alpha parameter used for the prior*
    -   **beta**: *the beta parameter used for the posterior*
-   summary.blm
    -   **terms**: *the formula used for the blm model*
    -   **confint**: *the confidence intervals of the coefficients*
    -   **coefficients**: *coefficients stats, mean, variance*
    -   **Rsquared**: *R-squared statistics of the fit*

Finally there are two internal functions used for the actual Bayesian linear calculations. A description of how these functions work, and how parameters alpha and beta influence the results.

-   make\_prior
    -   Initialize the prior distribution. Usage is as follows: make\_prior(model, alpha, ...), where model is the formula, and alpha is the hyper-parameter. It returns a prior distribution, with a vector of means and a covariance matrix.
-   update\_prior
    -   Updates a prior distribution, with the observed data and produces a posterior distribution. Usage is as follows: update\_prior(model, prior, beta, ...), where model is the formula, prior is the prior distribution, and beta is a hyper-parameter. It returns a posterior distribution, with a vector of means and a covariance matrix.

### Bayesian properties

A description of the Bayesian properties of the model, and two internal core functions, which do the Bayesian calculations.
