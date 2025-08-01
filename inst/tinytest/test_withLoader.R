library(tinytest)
library(shinybiocloader)

# Test that withLoader returns a shiny.tag.list
expect_true(
    inherits(withLoader(shiny::div()), "shiny.tag.list")
)

# Test that withLoader sets proxy.height to 100% when height is specified
expect_true(
    grepl(
        "height:100%",
        withLoader(shiny::div(style = "height: 200px"))
    )
)
