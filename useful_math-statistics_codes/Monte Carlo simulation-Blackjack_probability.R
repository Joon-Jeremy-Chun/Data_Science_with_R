# New 2026 reference: an ace and a ten-valued card in a two-card hand.
natural_blackjack <- function(B=10000L, seed=2045L) {
  stopifnot(length(B)==1L,B>0,B==floor(B))
  set.seed(seed)
  ranks <- rep(seq_len(13L),each=4L)
  hits <- replicate(B, {
    hand <- ranks[sample.int(52L,2L,replace=FALSE)]
    any(hand==1L) && any(hand>=10L)
  })
  exact <- 4*16/choose(52,2)
  list(estimate=mean(hits), exact=exact, standard_error=sqrt(exact*(1-exact)/B))
}
if (sys.nframe()==0L) print(natural_blackjack())
