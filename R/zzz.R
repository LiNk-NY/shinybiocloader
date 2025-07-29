.onLoad <- function(libname, pkgname) {
    shiny::addResourcePath(
        prefix = "www",
        directoryPath = system.file("www", package = pkgname)
    )
    shiny::addResourcePath(
        prefix = "css-loaders",
        directoryPath = system.file("css-loaders", package = pkgname)
    )
}

.onUnload <- function(libname, pkgname) {
    shiny::removeResourcePath("www")
    shiny::removeResourcePath("css-loaders")
}

