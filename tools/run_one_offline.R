# Internal worker for smoke_offline.py. Plots go to a temporary PDF.
file <- commandArgs(trailingOnly=TRUE)[1L]
grDevices::pdf(file=tempfile(fileext=".pdf"))
env <- new.env(parent=globalenv())
expressions <- parse(file=file,encoding="UTF-8")
status <- 0L
for (i in seq_along(expressions)) {
  ex <- expressions[[i]]
  head <- if (is.call(ex)) as.character(ex[[1]])[1L] else ""
  if (head %in% c("?","help","help.search","View")) next
  problem <- tryCatch({invisible(eval(ex,envir=env));NULL},error=function(e) conditionMessage(e))
  if (!is.null(problem)) {cat("AUDIT_ERROR",i,problem,"\n");status<-1L;break}
}
grDevices::dev.off()
cat("AUDIT_STATUS",status,"\n")
quit(status=status)
