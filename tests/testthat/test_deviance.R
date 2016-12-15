context("deviance")

test_that("Testing the deviance calculation", {
    n <- 1000
    x <- rnorm(n, 40, 10)
    a <- 0.6; b <- 1;
    y <- 0.6*x+b
    fit <- blm(y ~ x, 1, 1)
    fit2 <- lm(y ~ x)

    expect_equal(deviance(fit), deviance(fit2), tolerance=1e-1)
    expect_equal(length(deviance(fit)), 1)

})
