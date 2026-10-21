# Explicit figure generation for new 2026 synthetic reference models.
output <- commandArgs(trailingOnly=TRUE)
output <- if (length(output)) output[1L] else "assets/results"
dir.create(output,recursive=TRUE,showWarnings=FALSE)
load_reference <- function(path) {
  env <- new.env(parent=globalenv());sys.source(path,envir=env);env
}
theme_plot <- function() par(mar=c(6.6,5,4,2)+0.1,cex.lab=1.25,cex.axis=1.1,cex.main=1.4,col.axis="#334155",col.lab="#334155")

env <- load_reference("Linear_regression/3.5 Simpson's Paradox.R")
result <- env$simpson_example()
rates <- rbind(A=c(subset(result$within,treatment=="A")$rate,result$overall$rate[1]),
               B=c(subset(result$within,treatment=="B")$rate,result$overall$rate[2]))
png(file.path(output,"simpson-reference.png"),width=1400,height=800,res=150)
theme_plot()
barplot(100*rates,beside=TRUE,names.arg=c("Easy stratum","Hard stratum","Pooled"),
        col=c("#178f87","#d68a32"),border=NA,ylim=c(0,105),ylab="Success rate (%)",
        main="A wins within each stratum; B wins in the pooled mixture")
legend("topright",legend=c("Treatment A","Treatment B"),fill=c("#178f87","#d68a32"),bty="n")
mtext("Invented counts · new 2026 reference · mixture weights differ",side=1,line=5.1,cex=0.85)
dev.off()

env <- load_reference("Probability/section 4; independence and dependence of sample-the big short.R")
result <- env$default_loss_example()
png(file.path(output,"default-dependence-reference.png"),width=1400,height=800,res=150)
theme_plot()
plot(ecdf(result$independent/1e6),xlim=range(c(result$independent,result$dependent)/1e6),
     verticals=TRUE,do.points=FALSE,col="#178f87",lwd=2,xlab="Portfolio loss (million USD)",ylab="Cumulative probability",
     main="Equal marginal default rates; different loss distributions")
lines(ecdf(result$dependent/1e6),verticals=TRUE,do.points=FALSE,col="#d68a32",lwd=2)
legend("bottomright",legend=c("Independent defaults","Shared beta factor, rho = 0.02"),col=c("#178f87","#d68a32"),lwd=2,bty="n")
mtext("Hypothetical model · n=1,000, p=0.02, B=10,000 · not financial calibration",side=1,line=5.1,cex=0.85)
dev.off()

env <- load_reference("Linear_regression/3.4 Confounders - if changes in Z causes changes in both X and Y.R")
result <- env$confounding_example()
png(file.path(output,"confounding-reference.png"),width=1400,height=800,res=150)
theme_plot()
values <- c(coef(result$marginal)["x"],coef(result$adjusted)["x"])
xpos <- barplot(values,names.arg=c("Marginal: y ~ x","Adjusted: y ~ x + z"),
        col=c("#d68a32","#178f87"),border=NA,ylim=c(-0.15,1.25),ylab="Estimated coefficient of x",
        main="A shared cause creates a marginal association")
abline(h=0,col="#475569")
points(xpos,values,pch=19,col=c("#a36824","#178f87"),cex=1.5)
text(xpos,values,labels=sprintf("%.3f",values),pos=3,offset=0.8,cex=1.05)
mtext("Synthetic common-cause model · n=2,000, seed=2045 · point estimates only",side=1,line=5.1,cex=0.85)
dev.off()
