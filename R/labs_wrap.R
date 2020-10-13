#' Wrap ggplot labels
#'
#' `boof_labs_wrap()` wraps [stringr::str_wrap()] around any argument passed to
#' [ggplot2::labs()], thus wrapping it. Taken from \href{https://malco.io/}{Malcolm Barrett}
#'
#' @param ... Arguments passed to [ggplot2::labs()]
#' @param width The width of the characters to wrap to.
#'
#' @export
#' @examples
#' library(ggplot2)
#' ggplot(mtcars, aes(mpg, hp)) +
#' boof_labs_wrap(title =
#'   "Here is my really long title. You see, I have a lot to say, you see.",
#'   width = 30)
boof_labs_wrap <- function(..., width = 80) {
  x <- tibble::enframe(c(...))
  x <- dplyr::mutate(x, value = stringr::str_wrap(value, width = width))
  x <- tibble::deframe(x)

  ggplot2::labs(!!!x)
}
