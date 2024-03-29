% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/layers-preprocessing.R
\name{adapt}
\alias{adapt}
\title{Fits the state of the preprocessing layer to the data being passed}
\usage{
adapt(object, data, ..., batch_size = NULL, steps = NULL)
}
\arguments{
\item{object}{Preprocessing layer object}

\item{data}{The data to train on. It can be passed either as a
\code{tf.data.Dataset} or as an R array.}

\item{...}{Used for forwards and backwards compatibility. Passed on to the underlying method.}

\item{batch_size}{Integer or \code{NULL}. Number of asamples per state update. If
unspecified, \code{batch_size} will default to \code{32}. Do not specify the
batch_size if your data is in the form of a TF Dataset or a generator
(since they generate batches).}

\item{steps}{Integer or \code{NULL}. Total number of steps (batches of samples)
When training with input tensors such as TensorFlow data tensors, the
default \code{NULL} is equal to the number of samples in your dataset divided by
the batch size, or \code{1} if that cannot be determined. If x is a
\code{tf.data.Dataset}, and \code{steps} is \code{NULL}, the epoch will run until the
input dataset is exhausted. When passing an infinitely repeating dataset,
you must specify the steps argument. This argument is not supported with
array inputs.}
}
\value{
Returns \code{object}, invisibly.
}
\description{
Fits the state of the preprocessing layer to the data being passed
}
\details{
After calling \code{adapt} on a layer, a preprocessing layer's state will not
update during training. In order to make preprocessing layers efficient in
any distribution context, they are kept constant with respect to any
compiled \code{tf.Graph}s that call the layer. This does not affect the layer use
when adapting each layer only once, but if you adapt a layer multiple times
you will need to take care to re-compile any compiled functions as follows:
\itemize{
\item If you are adding a preprocessing layer to a keras model, you need to
call \code{compile(model)} after each subsequent call to \code{adapt()}.
\item If you are calling a preprocessing layer inside \code{\link[tfdatasets:dataset_map]{tfdatasets::dataset_map()}},
you should call \code{dataset_map()} again on the input \code{Dataset} after each
\code{adapt()}.
\item If you are using a \code{\link[tensorflow:tf_function]{tensorflow::tf_function()}} directly which calls a preprocessing
layer, you need to call \code{tf_function()} again on your callable after
each subsequent call to \code{adapt()}.
}

\code{keras_model()} example with multiple adapts:

\if{html}{\out{<div class="sourceCode r">}}\preformatted{layer <- layer_normalization(axis = NULL)
adapt(layer, c(0, 2))
model <- keras_model_sequential() |> layer()
predict(model, c(0, 1, 2), verbose = FALSE) # [1] -1  0  1
}\if{html}{\out{</div>}}

\if{html}{\out{<div class="sourceCode">}}\preformatted{## [1] -1  0  1

}\if{html}{\out{</div>}}

\if{html}{\out{<div class="sourceCode r">}}\preformatted{adapt(layer, c(-1, 1))
compile(model)  # This is needed to re-compile model.predict!
predict(model, c(0, 1, 2), verbose = FALSE) # [1] 0 1 2
}\if{html}{\out{</div>}}

\if{html}{\out{<div class="sourceCode">}}\preformatted{## [1] 0 1 2

}\if{html}{\out{</div>}}

\code{tfdatasets} example with multiple adapts:

\if{html}{\out{<div class="sourceCode r">}}\preformatted{layer <- layer_normalization(axis = NULL)
adapt(layer, c(0, 2))
input_ds <- tfdatasets::range_dataset(0, 3)
normalized_ds <- input_ds |>
  tfdatasets::dataset_map(layer)
str(tfdatasets::iterate(normalized_ds))
}\if{html}{\out{</div>}}

\if{html}{\out{<div class="sourceCode">}}\preformatted{## List of 3
##  $ :<tf.Tensor: shape=(1), dtype=float32, numpy=array([-1.], dtype=float32)>
##  $ :<tf.Tensor: shape=(1), dtype=float32, numpy=array([0.], dtype=float32)>
##  $ :<tf.Tensor: shape=(1), dtype=float32, numpy=array([1.], dtype=float32)>

}\if{html}{\out{</div>}}

\if{html}{\out{<div class="sourceCode r">}}\preformatted{adapt(layer, c(-1, 1))
normalized_ds <- input_ds |>
  tfdatasets::dataset_map(layer) # Re-map over the input dataset.

normalized_ds |>
  tfdatasets::as_array_iterator() |>
  tfdatasets::iterate(simplify = FALSE) |>
  str()
}\if{html}{\out{</div>}}

\if{html}{\out{<div class="sourceCode">}}\preformatted{## List of 3
##  $ : num [1(1d)] 0
##  $ : num [1(1d)] 1
##  $ : num [1(1d)] 2

}\if{html}{\out{</div>}}
}
\concept{preprocessing layer methods}
