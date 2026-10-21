# New 2026 reference completing an empty lesson. Synthetic association is not causation.
confounding_example <- function(n=2000L, seed=2045L) {
  stopifnot(length(n)==1L, n >= 10, n == floor(n))
  set.seed(seed)
  z <- rnorm(n)
  dat <- data.frame(z=z, x=z+rnorm(n), y=2*z+rnorm(n))
  list(data=dat, marginal=lm(y~x,data=dat), adjusted=lm(y~x+z,data=dat))
}
if (sys.nframe()==0L) {
  result <- confounding_example()
  print(coef(result$marginal)); print(coef(result$adjusted))
}
