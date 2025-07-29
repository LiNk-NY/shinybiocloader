#' Add a loader to a Shiny UI element
#'
#' @param ui_element A Shiny UI element (e.g., `uiOutput`, `plotOutput`, etc.)
#'   for which to wrap with the loader.
#'
#' @param loader `character(1)` A string specifying the loader type. Default is
#'   "biocspin".
#'
#' @param proxy.height `character(1)` A string specifying the height of the
#'   proxy element. Default is "400px". If the `ui_element` already has a
#'   height specified, this will be set to "100%".
#'
#' @references
#' `shinycustomloader` https://github.com/emitanaka/shinycustomloader
#'
#' `dna spin` https://codepen.io/knut/pen/ZopMWW
#'
#' @import htmltools
#'
#' @examples
#' \dontrun{
#' withLoader(plotOutput("myplot"))
#' }
#' @export
withLoader <- function(
    ui_element, loader = "biocspin", proxy.height = "400px"
) {
    if (grepl("height:\\s*\\d", ui_element))
        proxy.height <- "100%"
    proxy_element <- tagList()
    if (!is.null(proxy.height)) {
        proxy_element <- div(
            style = glue::glue(
                "height:{proxy.height}"
            ), class = "shiny-loader-placeholder"
        )
    }
    htmlfile <-
        system.file("www", paste0(loader, ".html"), package = "shinybiocloader")
    tagList(
        singleton(tags$head(tags$link(
            rel = "stylesheet",
            href = "www/imgcustom-loader.css"
        ))),
        singleton(tags$script(
            src = "www/imgcustom-loader.js"
        )),
        singleton(tags$head(tags$link(
            rel = "stylesheet",
            href = "css-loaders/css/imgcustom-fallback.css"
        ))),
        singleton(tags$head(tags$link(
            rel = "stylesheet",
            href = file.path("www", paste0(loader, ".css"))
        ))),
        div(
            class = "shiny-loader-output-container",
            div(class = "load-container", includeHTML(htmlfile)),
            proxy_element,
            ui_element
        )
    )
}
