% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/random.R
\name{random_dropout}
\alias{random_dropout}
\title{Randomly set some values in a tensor to 0.}
\usage{
random_dropout(inputs, rate, noise_shape = NULL, seed = NULL)
}
\arguments{
\item{inputs}{A tensor}

\item{rate}{numeric}

\item{noise_shape}{A \code{shape()} value}

\item{seed}{Initial seed for the random number generator}
}
\value{
A tensor that is a copy of \code{inputs} with some values set to \code{0}.
}
\description{
Randomly set some portion of values in the tensor to 0.
}
\seealso{
Other random: \cr
\code{\link{random_beta}()} \cr
\code{\link{random_binomial}()} \cr
\code{\link{random_categorical}()} \cr
\code{\link{random_gamma}()} \cr
\code{\link{random_integer}()} \cr
\code{\link{random_normal}()} \cr
\code{\link{random_seed_generator}()} \cr
\code{\link{random_shuffle}()} \cr
\code{\link{random_truncated_normal}()} \cr
\code{\link{random_uniform}()} \cr
}
\concept{random}
