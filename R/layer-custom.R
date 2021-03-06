

#' (Deprecated) Base R6 class for Keras layers
#'
#' Custom R6 layers can now inherit directly from `keras$layers$Layer` or other layers.
#'
#' @docType class
#'
#' @format An [R6Class] generator object #'
#' @section Methods: \describe{ \item{\code{build(input_shape)}}{Creates the
#'   layer weights (must be implemented by all layers that have weights)}
#'   \item{\code{call(inputs,mask)}}{Call the layer on an input tensor.}
#'   \item{\code{compute_output_shape(input_shape)}}{Compute the output shape
#'   for the layer.}
#'   \item{\code{add_loss(losses, inputs)}}{Add losses to the layer.}
#'   \item{\code{add_weight(name,shape,dtype,initializer,regularizer,trainable,constraint)}}{Adds
#'   a weight variable to the layer.} }
#'
#' @return [KerasLayer].
#'
#' @export
KerasLayer <- R6Class("KerasLayer",

  public = list(

    # Create the layer weights.
    build = function(input_shape) {

    },

    # Call the layer on an input tensor.
    call = function(inputs, mask = NULL) {
      stop("Keras custom layers must implement the call function")
    },

    # Compute the output shape for the layer.
    compute_output_shape = function(input_shape) {
      input_shape
    },

    # Add losses to the layer
    add_loss = function(losses, inputs = NULL) {
      args <- list()
      args$losses <- losses
      args$inputs <- inputs
      do.call(private$wrapper$add_loss, args)
    },

    # Adds a weight variable to the layer.
    add_weight = function(name, shape, dtype = NULL, initializer = NULL,
                          regularizer = NULL, trainable = TRUE, constraint = NULL) {

      args <- list()
      args$name <- name
      args$shape <- shape
      args$dtype <- dtype
      args$initializer <- initializer
      args$regularizer <- regularizer
      args$trainable <- trainable
      args$constraint <- constraint

      do.call(private$wrapper$add_weight, args)
    },

    # back reference to python layer that wraps us
    .set_wrapper = function(wrapper) {
      private$wrapper <- wrapper
    },

    python_layer = function() {
      private$wrapper
    }
  ),

  active = list(
    input = function(value) {
      if (missing(value)) return(private$wrapper$input)
      else private$wrapper$input <- value
    },
    output = function(value) {
      if (missing(value)) return(private$wrapper$output)
      else private$wrapper$output <- value
    }
  ),

  private = list(
    wrapper = NULL
  )
)


compat_custom_KerasLayer_handler <- function(layer_class, args) {
    # common layer parameters (e.g. "input_shape") need to be passed to the
    # Python Layer constructor rather than the R6 constructor. Here we
    # extract and set aside any of those arguments we find and set them to
    # NULL within the args list which will be passed to the R6 layer
    common_arg_names <- c("input_shape", "batch_input_shape", "batch_size",
                          "dtype", "name", "trainable", "weights")

    py_wrapper_args <- args[common_arg_names]
    py_wrapper_args[sapply(py_wrapper_args, is.null)] <- NULL
    for (arg in names(py_wrapper_args))
      args[[arg]] <- NULL

    # create the R6 layer
    r6_layer <- do.call(layer_class$new, args)

    # create the python wrapper (passing the extracted py_wrapper_args)
    python_path <- system.file("python", package = "keras")
    tools <- import_from_path("kerastools", path = python_path)
    py_wrapper_args$r_build <- r6_layer$build
    py_wrapper_args$r_call <-  reticulate::py_func(r6_layer$call)
    py_wrapper_args$r_compute_output_shape <- r6_layer$compute_output_shape
    layer <- do.call(tools$layer$RLayer, py_wrapper_args)

    # set back reference in R layer
    r6_layer$.set_wrapper(layer)
    list(layer, args)
}
