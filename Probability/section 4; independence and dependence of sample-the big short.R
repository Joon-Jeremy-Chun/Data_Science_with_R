# New 2026 reference: hypothetical correlated defaults, not financial calibration.
default_loss_example <- function(n=1000L, p=0.02, rho=0.02, loss=200000,
                                 B=10000L, seed=2045L) {
  stopifnot(length(n)==1L,n>0,n==floor(n),length(B)==1L,B>0,B==floor(B),
            length(p)==1L,p>0,p<1,length(rho)==1L,rho>=0,rho<1,
            length(loss)==1L,is.finite(loss),loss>=0)
  set.seed(seed)
  independent <- rbinom(B,n,p)*loss
  probability <- if (rho==0) rep(p,B) else {
    concentration <- 1/rho-1
    rbeta(B,p*concentration,(1-p)*concentration)
  }
  dependent <- rbinom(B,n,probability)*loss
  list(independent=independent,dependent=dependent,
       expected=n*p*loss,
       independent_variance=n*p*(1-p)*loss^2,
       dependent_variance=n*p*(1-p)*(1+(n-1)*rho)*loss^2)
}
if (sys.nframe()==0L) {
  result <- default_loss_example()
  print(c(mean_independent=mean(result$independent),mean_dependent=mean(result$dependent),
          expected=result$expected))
  print(c(var_independent=var(result$independent),var_dependent=var(result$dependent)))
}
