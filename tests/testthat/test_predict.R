context("predict")

test_that("predicting new variables", {

    n <- 1000
    x <- rnorm(n, 50, 2)
    y <- rnorm(n, x, 1)
    fit <- blm(y ~ x, 1, 1)
    fitlm <- lm(y ~ x)

    newdata <- data.frame(x = rnorm(20, 50, 2))

    ypred <- predict(fit, newdata)
    lmpred <- predict(fitlm, newdata)
    names(lmpred) <- NULL

    expect_equal(ypred, lmpred, tolerance=1e-2)

})

test_that("Test variances feature", {

    n <- 1000
    x <- rnorm(n, 50, 2)
    y <- rnorm(n, x, 1)
    fit <- blm(y ~ x, 1, 1)

    expect_equal(length(predict(fit, variances=TRUE)), 2)
    expect_equal(length(predict(fit, variances=FALSE)), n)

})
