Bayesian linear regression
================
Marni Tausen
2016-12-30

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

First to load the package you can use:

``` r
library(blm)
```


    Attaching package: 'blm'

    The following object is masked from 'package:stats':

        update

To do the blm model, you use the blm function, which takes in the parameters, alpha and beta. If uncertain about the alpha and beta hyper-parameters, setting them both to 1 gives a neutral effect.

``` r
blm(y ~ x, 1, 1)
```

    blm model: y ~ x

    Posterior:
         (Intercept)        x
    [1,] -0.09289503 1.000389

                  (Intercept)             x
    (Intercept)  0.0390212100 -5.824044e-04
    x           -0.0005824044  1.164809e-05

``` r
summary(blm(y ~ x, 1, 1))
```

    blm model: y ~ x

    Coefficients:
                       Mean     Variance
    (Intercept) -0.09289503 3.902121e-02
    x            1.00038861 1.164809e-05

    Confindence intervals: 
                     2.5 %    97.5 %
    (Intercept) -0.4800621 0.2942721
    x            0.9936994 1.0070778

    R-squared: 0.9988448

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
