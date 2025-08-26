# shinybiocloader

The `shinybiocloader` package provides a wrapper function similar to
emitanaka's `shinycustomloader` package at
https://github.com/emitanaka/shinycustomloader.

It allows users to add a Bioconductor note loading animation while an app is
loading.

## Installation

You can install the released version of `shinybiocloader` from
GitHub with:

```r
BiocManager::install("Bioconductor/shinybiocloader")
```

## Usage

```r
library(shinybiocloader)
withLoader(
    plotOutput("myplot"),
    loader = "biocspin"
)
```

