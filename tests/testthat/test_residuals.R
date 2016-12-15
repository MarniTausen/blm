context("residuals")

test_that("Comparing blm residuals to lm residuals", {

    n <- 1000
    x <- rnorm(n, 40, 10)
    a <- 0.6; b <- 1;
    y <- 0.6*x+b
    fit <- blm(y ~ x, 1, 1)
    fitlm <- lm(y ~ x)

    expect_equal(all.equal(residuals(fit), residuals(fitlm),
                           tolerance=2e-1, check.attributes=FALSE), TRUE)
    expect_equal(length(residuals(fit)), n)

})
