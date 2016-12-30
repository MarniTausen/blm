context("coefficients")

test_that("Testing coefficients", {

    n <- 1000
    x <- rnorm(n, 40, 10)
    a <- 0.6; b <- 1;
    y <- 0.6*x+b
    fit <- blm(y ~ x, 1, 1)
    fitlm <- lm(y ~ x)

    expect_equal(coefficients(fit), coefficients(fitlm), tolerance=1e-1)
    expect_equal(names(coefficients(fit)), names(coefficients(fitlm)))

})
