context("confint")

test_that("Comparing confidence intervals of the parameters to lm", {

    n <- 1000
    x <- rnorm(n, 20, 3)
    y <- rnorm(n, x, 1)
    fit <- blm(y ~ x, 1, 1)
    fitlm <- lm(y ~ x)

    expect_equal(confint(fit), confint(fitlm), tolerance=5e-2)
    expect_equal(dim(confint(fit)), dim(confint(fitlm)))
    expect_equal(dim(confint(fit, "x")), dim(confint(fitlm, "x")))
    confint(fit, "y")

})
