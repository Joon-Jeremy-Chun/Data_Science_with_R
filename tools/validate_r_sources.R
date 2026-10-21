# Parse source without executing lessons, installing packages or downloading data.
files <- list.files(".",pattern="\\.[Rr]$",recursive=TRUE,full.names=TRUE)
failures <- character()
warnings <- character()
for (file in files) {
  tryCatch(withCallingHandlers(parse(file=file,encoding="UTF-8"),
    warning=function(w) {warnings <<- c(warnings,paste(file,conditionMessage(w)));invokeRestart("muffleWarning")}),
    error=function(e) {failures <<- c(failures,paste(file,conditionMessage(e)))})
}
cat("R sources parsed:",length(files),"; errors:",length(failures),"\n")
if (length(warnings)) cat(paste(unique(warnings),collapse="\n"),"\n")
if (length(failures)) {cat(paste(failures,collapse="\n"),"\n");quit(status=1)}
