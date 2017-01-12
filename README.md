Bayesian linear regression
================
Marni Tausen
2017-01-12

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

The blm package uses the same interface as the lm and glm functions in R, and therefore functions very similarly.

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
    -   Description
-   coef (coefficients)
    -   Description
-   confint
    -   Description
-   deviance
    -   Description
-   fitted
    -   Description
-   predict
    -   Description
-   residuals
    -   Description
-   summary
    -   Description
