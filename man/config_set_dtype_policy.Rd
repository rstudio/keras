% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/config.R
\name{config_set_dtype_policy}
\alias{config_set_dtype_policy}
\title{Sets the default dtype policy globally.}
\usage{
config_set_dtype_policy(policy)
}
\arguments{
\item{policy}{A string or \code{DTypePolicy} object.}
}
\value{
No return value, called for side effects.
}
\description{
Sets the default dtype policy globally.
}
\section{Examples}{
\if{html}{\out{<div class="sourceCode r">}}\preformatted{config_set_dtype_policy("mixed_float16")
}\if{html}{\out{</div>}}
}

