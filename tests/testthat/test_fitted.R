context("fitted")

test_that("Testing fitted results",{

    n <- 1000
    x <- rnorm(n, 50, 2)
    y <- rnorm(n, x, 1)
    fit <- blm(y ~ x, 1, 1)
    fitlm <- lm(y ~ x)

    rlm <- fitted(fitlm)
    names(rlm) <- NULL

    expect_equal(fitted(fit), rlm, tolerance=1e-2)
    expect_equal(length(fitted(fit)), n)

})
