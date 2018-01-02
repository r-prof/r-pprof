#' Return the path to the pprof executable
#'
#' It remains the caller's responsibility to run the process.
#' @export
#' @examples
#' system2(get_pprof_pkg_path())
get_pprof_pkg_path <- function() {
  system.file("bin", "pprof", package = "pprof")
}
