# Explicit dependency helper. Sourcing this file never installs or updates packages.
archive_packages <- c("tidyverse","dslabs","HistData","Lahman","broom","ggrepel",
                      "gridExtra","gtools","reshape2","lpSolve","rvest","readxl",
                      "data.table","pdftools","rmarkdown","knitr","jsonlite")
install_archive_packages <- function(install=FALSE, lib=.libPaths()[1L]) {
  missing <- archive_packages[!vapply(archive_packages,requireNamespace,logical(1),quietly=TRUE)]
  if (install && length(missing)) install.packages(missing,lib=lib,repos="https://cloud.r-project.org")
  invisible(missing)
}
if (sys.nframe()==0L) {
  args <- commandArgs(trailingOnly=TRUE)
  missing <- install_archive_packages(install="--install" %in% args)
  cat("Missing packages:",if (length(missing)) paste(missing,collapse=", ") else "none","\n")
  if (!"--install" %in% args) cat("Dry run. Use Rscript packages.R --install to install missing packages.\n")
}
