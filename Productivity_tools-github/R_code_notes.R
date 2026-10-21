#practice 1

# New 2026 reference completing a one-line practice placeholder.
# Inspect before sharing: sessionInfo() can contain local environment details.
archive_session_info <- function() {
  list(R=R.version.string, platform=R.version$platform,
       package_versions=vapply(c("stats","utils"),function(x) as.character(packageVersion(x)),character(1)))
}
# Read-only Git commands to run manually in a terminal:
# git status --short
# git branch --show-current
# git remote -v
# git diff -- path/to/reviewed/file.R
# Commit/push only reviewed paths after checking the diff.
if (sys.nframe()==0L) print(archive_session_info())
