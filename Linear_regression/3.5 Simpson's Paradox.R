#Simpson’s Paradox happens when we see the sign of the correlation flip when comparing the entire dataset with specific strata.

# New 2026 reference completing a placeholder; invented counts, no clinical interpretation.
simpson_example <- function() {
  dat <- data.frame(stratum=rep(c("easy","hard"),each=2),
                    treatment=rep(c("A","B"),2),
                    successes=c(9,80,20,1), total=c(10,100,100,10))
  dat$rate <- dat$successes/dat$total
  totals <- aggregate(cbind(successes,total)~treatment,data=dat,FUN=sum)
  totals$rate <- totals$successes/totals$total
  list(within=dat, overall=totals)
}
if (sys.nframe()==0L) {result <- simpson_example(); print(result)}
