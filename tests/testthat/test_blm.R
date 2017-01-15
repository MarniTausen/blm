context("blm")

test_that("fitting a blm object", {
    ## Test whether the fit works.

    ## Generating data
    n <- 1000
    x <- rnorm(n, 40, 10)
    a <- 0.6; b <- 1;
    y <- 0.6*x+b
    fit <- blm(y ~ x, 1, 1)
    cof <- coefficients(fit)
    names(cof) <- NULL

    expect_equal(cof[2], a, tolerance=1e-1)
    expect_equal(cof[1], b, tolerance=1e-1)
    expect_equal(nrow(fit$model), n)
    ## Running the print function
    capture.output(print(fit))
})

test_that("ensure errors work", {

    n <- 1000
    x <- rnorm(n, 40, 10)
    a <- 0.6; b <- 1;
    y <- 0.6*x+b
    dat <- data.frame(x = x, y = y)
    expect_error(blm(y ~ x, dat))
    expect_error(blm(y ~ x, 1, dat))
    expect_error(blm(y ~ x, 1, 1, dat))
    expect_error(blm(y ~ x, prior=list(mu=c(0), Sigma=c(0))))
})

test_that("introduction of data", {

    variables <- c("price", "value", "profit")

    n <- 200
    pri <- rnorm(n, 1000, 300)
    val <- 0.6*pri - rnorm(n, 40, 10)
    pro <- (pri*val)/2

    data <- data.frame(pri, val, pro)
    colnames(data) <- variables

    fit1 <- blm(profit ~ price + value, 1, 1, data=data)

    expect_equal(sort(colnames(fit1$model)), sort(variables))
    expect_equal(nrow(fit1$model), n)
    expect_equal(nrow(fit1$model), nrow(data))

    fit2 <- blm(profit ~ price + value, data = data, alpha = 1, beta = 1)

    expect_equal(sort(colnames(fit2$model)), sort(variables))
    expect_equal(nrow(fit2$model), n)
    expect_equal(nrow(fit2$model), nrow(data))

    # Using global variables
    fit3 <- blm(pro ~ pri + val, 1, 1)
    expect_equal(sort(colnames(fit3$model)), sort(c("pri", "val", "pro")))
    expect_equal(nrow(fit3$model), n)

    # Adding additional data
    data = rbind(data, c(1, 2, 3))
    fit4 <- blm(profit ~ price + value, data=data)
    expect_equal(sort(colnames(fit4$model)), sort(variables))
    expect_false(isTRUE(all.equal(nrow(fit4$model), n)))
    expect_equal(nrow(fit4$model), n+1)

})


test_that("test the plot function", {
    n <- 1000
    x <- rnorm(n, 40, 10)
    a <- 0.6; b <- 1;
    y <- 0.6*x+b
    fit <- blm(y ~ x, 1, 1)

    plot(fit)
    plot(fit, ggplot=FALSE)

    z <- rnorm(n, 40, 10)
    fit <- blm(y ~ x + z)

    plot(fit)
})
