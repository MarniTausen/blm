#' Plot blm object
#'
#' Plots an blm object
#'
#' @param x     blm object
#' @param ...   Additional parameters like ggplot
#'
#' @return a figure
#' @export
plot.blm <- function(x, ...){
    if(is.null(list(...)$ggplot)) { ggplot = TRUE } else { ggplot = list(...)$ggplot }
    if(requireNamespace("ggplot2", quietly = TRUE) && ggplot==TRUE) {
        data = x$model
        variables = colnames(x$model)

        c = Inf
        regression_data = list()

        for(var in variables[-1]){
            if(c==Inf){
                min <- min(data[,var]); max = max(data[,var])
                sequence <- seq(min, max, by=0.01)
                c <- length(sequence)
                regression_data <- c(regression_data, list(sequence))
            } else {
                min <- min(data[,var]); max = max(data[,var])
                sequence <- seq(min, max, by=(max-min)/c)
                regression_data <- c(regression_data, list(sequence[1:c]))
            }
        }

        regression_data = data.frame(regression_data)
        colnames(regression_data) = variables[-1]

        prediction <- predict(x, data=regression_data)
        cfi <- confint(x, variables[1], data=regression_data)

        figure <- ggplot2::qplot(data[,2], data[,1]) + ggplot2::theme_bw()
        figure <- figure + ggplot2::labs(x=variables[2], y=variables[1], title="Blm fit")
        figure <- figure + ggplot2::geom_line(ggplot2::aes(x=regression_data[,1],
                                                           y=prediction),
                                              )
        figure <- figure + ggplot2::geom_line(ggplot2::aes(x=regression_data[,1],
                                                           y=cfi$lb),
                                              linetype=2, color="cadetblue4")
        figure <- figure + ggplot2::geom_line(ggplot2::aes(x=regression_data[,1],
                                                           y=cfi$ub),
                                              linetype=2, color="cadetblue4")
        figure
    } else {

    }
}
