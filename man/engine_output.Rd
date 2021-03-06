% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/engine.R
\name{engine_output}
\alias{engine_output}
\title{An output wrapper for language engine output}
\usage{
engine_output(options, code, out, extra = NULL)
}
\arguments{
\item{options}{A list of chunk options. Usually this is just the object
\code{options} passed to the engine function; see
\code{\link{knit_engines}}.}

\item{code}{Source code of the chunk, to which the output hook
\code{source} is applied, unless the chunk option \code{echo} is \code{FALSE}.}

\item{out}{Text output from the engine, to which the hook \code{output}
is applied, unless the chunk option \code{results} is \code{'hide'}}

\item{extra}{Any additional text output that you want to include.}
}
\value{
A character string generated from the source code and output using
  the appropriate output hooks.
}
\description{
If you have designed a language engine, you may call this function in the end
to format and return the text output from your engine.
}
\details{
For expert users, an advanced usage of this function is
\code{engine_output(options, out = LIST)} where \code{LIST} is a list that
has the same structure as the output of \code{evaluate::evaluate()}. In this
case, the arguments \code{code} and \code{extra} are ignored, and the list is
passed to an internal function \code{knitr:::wrap()} to return a character
vector of final output.
}
\examples{
library(knitr)
engine_output(opts_chunk$merge(list(engine = "Rscript")), 
    code = "1 + 1", out = "[1] 2")
engine_output(opts_chunk$merge(list(echo = FALSE, engine = "Rscript")), 
    code = "1 + 1", out = "[1] 2")

# expert use only
engine_output(opts_chunk$merge(list(engine = "python")), 
    out = list(structure(list(src = "1 + 1"), class = "source"), 
        "2"))
}
