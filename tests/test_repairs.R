# Focused offline checks; run from the repository root with Rscript --vanilla.
root <- normalizePath(".",winslash="/",mustWork=TRUE)
cases <- 0L
check <- function(label, code) {
  force(code)
  cases <<- cases+1L
  cat("PASS",label,"\n")
}
definitions <- function(path) {
  env <- new.env(parent=globalenv())
  expressions <- parse(file=file.path(root,path),encoding="UTF-8")
  for (ex in expressions) {
    if (is.call(ex) && as.character(ex[[1]])[1] %in% c("<-","=") &&
        length(ex)>=3L && is.call(ex[[3]]) && identical(ex[[3]][[1]],as.name("function"))) eval(ex,env)
  }
  env
}

check("confounding adjustment", {
  env <- definitions("Linear_regression/3.4 Confounders - if changes in Z causes changes in both X and Y.R")
  result <- env$confounding_example(n=20000L)
  stopifnot(coef(result$marginal)["x"] > 0.8,
            abs(coef(result$adjusted)["x"]) < 0.05,
            abs(coef(result$adjusted)["z"]-2) < 0.05)
})
check("strict Simpson reversal", {
  env <- definitions("Linear_regression/3.5 Simpson's Paradox.R")
  result <- env$simpson_example()
  a <- subset(result$within,treatment=="A")$rate
  b <- subset(result$within,treatment=="B")$rate
  stopifnot(all(a>b), result$overall$rate[result$overall$treatment=="A"] <
                      result$overall$rate[result$overall$treatment=="B"])
})
check("dependent defaults preserve mean and increase variance", {
  env <- definitions("Probability/section 4; independence and dependence of sample-the big short.R")
  result <- env$default_loss_example(B=50000L)
  stopifnot(abs(mean(result$independent)/result$expected-1) < 0.02,
            abs(mean(result$dependent)/result$expected-1) < 0.04,
            abs(var(result$dependent)/result$dependent_variance-1) < 0.1,
            var(result$dependent)>15*var(result$independent))
})
check("zero dependence has binomial variance", {
  env <- definitions("Probability/section 4; independence and dependence of sample-the big short.R")
  result <- env$default_loss_example(rho=0,B=30000L)
  stopifnot(result$dependent_variance==result$independent_variance,
            abs(var(result$dependent)/result$dependent_variance-1)<0.05)
})
check("natural blackjack matches exact probability", {
  env <- definitions("useful_math-statistics_codes/Monte Carlo simulation-Blackjack_probability.R")
  result <- env$natural_blackjack(B=30000L)
  stopifnot(isTRUE(all.equal(result$exact,32/663)),
            abs(result$estimate-result$exact)<5*result$standard_error)
})
check("birthday formula handles boundaries", {
  env <- definitions("useful_math-statistics_codes/The birthday problem-duplicated birthdays in a group.R")
  stopifnot(env$exact_prob(0)==0,env$exact_prob(1)==0,env$exact_prob(366)==1,
            abs(env$exact_prob(23)-0.507297234323985)<1e-12,
            inherits(try(env$exact_prob(-1),silent=TRUE),"try-error"))
})
check("integer sums match closed forms including zero", {
  env <- definitions("useful_math-statistics_codes/Sum_of _integers.R")
  for (n in c(0L,1L,10L,100L)) {
    stopifnot(env$sum_n(n)==n*(n+1)/2,
              env$sum_n_p2(n)==n*(n+1)*(2*n+1)/6)
  }
})
check("offline text tokenization", {
  env <- definitions("Data_wrangling/Text_mining.R")
  result <- env$token_counts(c("Data, data!","Clear DATA.",NA_character_,""))
  stopifnot(result$n[result$token=="data"]==3L,sum(result$n)==4L,
            nrow(env$token_counts(character()))==0L)
})
check("Iris split and training-only scaling", {
  env <- definitions("Machine_learning/2.1 Offline classification reference.R")
  result <- env$iris_knn_reference()
  stopifnot(length(result$train)==105L,length(result$test)==45L,
            !length(intersect(result$train,result$test)),result$accuracy>0.8,
            isTRUE(all.equal(result$center,colMeans(iris[result$train,1:4]))))
})
check("roster constraint columns track shuffled players", {
  suppressPackageStartupMessages(library(reshape2))
  suppressPackageStartupMessages(library(lpSolve))
  expressions <- parse(file=file.path(root,"Linear_regression/2.8 LP linear programming application - building a better offensive metric for baseball.R"))
  start <- which(vapply(expressions,function(e) is.call(e) && length(e)>2L &&
                  identical(e[[2]],as.name("constraint_matrix")) && is.call(e[[3]]) &&
                  identical(e[[3]][[1]],as.name("acast")),logical(1)))
  finish <- which(vapply(expressions,function(e) is.call(e) && identical(e[[1]],as.name("stopifnot")) &&
                   grepl("lp_solution",paste(deparse(e),collapse="")),logical(1)))
  for (order in list(1:4,c(4,2,1,3))) {
    players <- data.frame(playerID=c("z","a","y","b"),POS=c("A","A","B","B"),
                          salary=c(8,30,9,40)*1e6,R_hat=c(4,5,3,6))[order,]
    env <- new.env(parent=globalenv());env$players <- players
    for (i in start:finish) eval(expressions[[i]],env)
    selected <- players[env$lp_solution$solution==1,]
    stopifnot(identical(colnames(env$constraint_matrix),players$playerID),
              setequal(selected$playerID,c("z","b")),sum(selected$salary)<=50e6,
              all(table(selected$POS)==1L))
  }
})
check("loan plot is actually in million-dollar units", {
  suppressPackageStartupMessages(library(ggplot2))
  suppressPackageStartupMessages(library(dplyr))
  expressions <- parse(file=file.path(root,"Probability/section 4; case study-the interest rates.R"))
  env <- new.env(parent=globalenv());env$losses <- c(-2e6,-3e6,-4e6)
  graph <- eval(expressions[[length(expressions)]],env)
  stopifnot(identical(graph$data$losses_millions,c(-2,-3,-4)))
  built <- ggplot_build(graph)
  stopifnot(all(abs(built$data[[1]]$x)<10))
})
check("package helper defaults to inspection", {
  env <- new.env(parent=globalenv());calls <- 0L
  env$install.packages <- function(...) {calls <<- calls+1L;stop("Unexpected install")}
  sys.source(file.path(root,"packages.R"),envir=env)
  env$install_archive_packages()
  stopifnot(calls==0L)
})
cat("Focused cases passed:",cases,"\n")
