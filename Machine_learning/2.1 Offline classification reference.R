# New 2026 companion to the preserved introduction notes; no external data.
iris_knn_reference <- function(seed=2045L, k=5L) {
  stopifnot(length(k)==1L,k>0,k==floor(k))
  set.seed(seed)
  dat <- datasets::iris
  train <- sort(unlist(lapply(split(seq_len(nrow(dat)),dat$Species),
                             function(indices) sample(indices,floor(0.7*length(indices))))))
  test <- setdiff(seq_len(nrow(dat)),train)
  x_train <- scale(dat[train,1:4])
  center <- attr(x_train,"scaled:center"); spread <- attr(x_train,"scaled:scale")
  x_test <- scale(dat[test,1:4],center=center,scale=spread)
  predicted <- class::knn(x_train,x_test,dat$Species[train],k=k)
  list(train=train,test=test,center=center,scale=spread,
       confusion=table(actual=dat$Species[test],predicted=predicted),
       accuracy=mean(predicted==dat$Species[test]))
}
if (sys.nframe()==0L) print(iris_knn_reference()[c("confusion","accuracy")])
