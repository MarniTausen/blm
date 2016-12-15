context("summary")

test_that("Testing summary", {

    n <- 1000
    x <- rnorm(n, 50, 2)
    y <- rnorm(n, x, 1)
    fit <- blm(y ~ x, 1, 1)
    fitlm <- lm(y ~ x)

    summary(fit)

    # R-squared matches
    expect_equivalent(summary(fit)$RSquared, summary(fit)$r.squared)

    capture.output(print(summary(fit)))
})
