Sys.setenv(TF_CPP_MIN_LOG_LEVEL = 1)

tf_version <- tensorflow::tf_version

skip_if_no_keras <- function(required_version = NULL) {
  if (!is_keras_available(required_version))
    skip("required keras version not available for testing")
}

expect_warning_if <- function(cond, expr) {
  expect_warning(
    expr,
    regexp = if (cond) NULL else NA
  )
}

py_capture_output <- reticulate::import("IPython")$utils$capture$capture_output

test_succeeds <- function(desc, expr, required_version = NULL) {

  invisible(
    capture.output({
      test_that(desc, {
        skip_if_no_keras(required_version)
        with(py_capture_output(), {
          expect_error(force(expr), NA)
        })
      })
    })
  )
}

test_call_succeeds <- function(call_name, expr, required_version = NULL) {
  test_succeeds(paste(call_name, "call succeeds"), expr, required_version)
}

is_backend <- function(name) {
  is_keras_available() && identical(backend()$backend(), name)
}

skip_if_cntk <- function() {
  if (is_backend("cntk"))
    skip("Test not run for CNTK backend")
}

skip_if_theano <- function() {
  if (is_backend("theano"))
    skip("Test not run for theano backend")
}

skip_if_tensorflow_implementation <- function() {
  if (keras:::is_tensorflow_implementation())
    skip("Test not run for TensorFlow implementation")
}

define_model <- function() {
  model <- keras_model_sequential()
  model %>%
    layer_dense(32, input_shape = 784, kernel_initializer = initializer_ones()) %>%
    layer_activation('relu') %>%
    layer_dense(10) %>%
    layer_activation('softmax')
  model
}

define_and_compile_model <- function() {
  model <- define_model()
  model %>%
    compile(
      loss='binary_crossentropy',
      optimizer = optimizer_sgd(),
      metrics='accuracy'
    )
  model
}

random_array <- function(dim) {
  array(runif(prod(dim)), dim = dim)
}

expect_tensor <- function(x, shape, shaped_as) {
  eval.parent(bquote(expect_true(is_keras_tensor(.(substitute(x))))))
  if(!missing(shaped_as))
    eval.parent(bquote(expect_identical(
      .(substitute(x))$shape$as_list(),
      .(substitute(shaped_as))$shape$as_list())))
  if(!missing(shape))
    eval.parent(bquote(expect_identical(
      .(substitute(x))$shape$as_list(),
      .(substitute(shape)))))
}

expect_same_pyobj <- function(x, y) {
  eval.parent(bquote(expect_identical(
    get("pyobj", as.environment(.(x))),
    get("pyobj", as.environment(.(y)))
  )))
}
