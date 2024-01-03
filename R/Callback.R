
#' Define a custom Callback
#'
#' @description
#' Callbacks can be passed to keras methods such as `fit()`, `evaluate()`, and
#' `predict()` in order to hook into the various stages of the model training,
#' evaluation, and inference lifecycle.
#'
#' To create a custom callback, call `Callback()` and
#' override the method associated with the stage of interest.
#'
#' # Examples
#' ```{r, eval = F}
#' training_finished <- FALSE
#' callback_mark_finished <- Callback("MarkFinished",
#'   on_train_end = function(logs = NULL) {
#'     training_finished <<- TRUE
#'   }
#' )
#'
#' model <- keras_model_sequential(input_shape = c(1)) |>
#'   layer_dense(1)
#' model |> compile(loss = 'mean_squared_error')
#' model |> fit(op_ones(c(1, 1)), op_ones(c(1, 1)),
#'              callbacks = callback_mark_finished())
#' stopifnot(isTRUE(training_finished))
#' ```
#'
#' All R function custom methods (public and private) will have the
#' following symbols in scope:
#' * `self`: the `Layer` instance.
#' * `super`: the `Layer` superclass.
#' * `private`: An R environment specific to the class instance.
#'     Any objects defined here will be invisible to the Keras framework.
#' * `__class__` the current class type object. This will also be available as
#'     an alias symbol, the value supplied to `Layer(classname = )`
#'
#' # Attributes (accessible via `self$`)
#'
#' * `params`: Named list, Training parameters
#'      (e.g. verbosity, batch size, number of epochs, ...).
#' * `model`: Instance of `Model`.
#'      Reference of the model being trained.
#'
#' The `logs` named list that callback methods
#' take as argument will contain keys for quantities relevant to
#' the current batch or epoch (see method-specific docstrings).
#'
#' @param
#' on_epoch_begin
#' ```r
#' \(epoch, logs = NULL)
#' ```
#' Called at the start of an epoch.
#'
#' Subclasses should override for any actions to run. This function should
#' only be called during TRAIN mode.
#'
#' Args:
#' * `epoch`: Integer, index of epoch.
#' * `logs`: Named List. Currently no data is passed to this argument for this
#'       method but that may change in the future.
#'
#' @param
#' on_epoch_end
#' ```r
#' \(epoch, logs = NULL)
#' ```
#' Called at the end of an epoch.
#'
#' Subclasses should override for any actions to run. This function should
#' only be called during TRAIN mode.
#'
#' Args:
#' * `epoch`: Integer, index of epoch.
#' * `logs`: Named List, metric results for this training epoch, and for the
#'    validation epoch if validation is performed. Validation result
#'    keys are prefixed with `val_`. For training epoch, the values of
#'    the `Model`'s metrics are returned. Example:
#'    `list(loss = 0.2, accuracy = 0.7)`.
#' @param
#' on_predict_batch_begin
#' ```r
#' \(batch, logs = NULL)
#' ```
#' Called at the beginning of a batch in `predict()` methods.
#'
#' Subclasses should override for any actions to run.
#'
#' Note that if the `steps_per_execution` argument to `compile()` in
#' `Model` is set to `N`, this method will only be called every
#' `N` batches.
#'
#' Args:
#' * `batch`: Integer, index of batch within the current epoch.
#' * `logs`: Named list. Currently no data is passed to this argument for this
#'    method but that may change in the future.
#'
#' @param
#' on_predict_batch_end
#' ```r
#' \(batch, logs = NULL)
#' ```
#' Called at the end of a batch in `predict()` methods.
#'
#' Subclasses should override for any actions to run.
#'
#' Note that if the `steps_per_execution` argument to `compile` in
#' `Model` is set to `N`, this method will only be called every
#' `N` batches.
#'
#' Args:
#' * `batch`: Integer, index of batch within the current epoch.
#' * `logs`: Named list. Aggregated metric results up until this batch.
#'
#' @param
#' on_predict_begin
#' ```r
#' \(logs = NULL)
#' ```
#' Called at the beginning of prediction.
#'
#' Subclasses should override for any actions to run.
#'
#' Args:
#' * `logs`: Named list. Currently no data is passed to this argument for this
#'   method but that may change in the future.
#'
#' @param
#' on_predict_end
#' ```r
#' \(logs = NULL)
#' ```
#' Called at the end of prediction.
#'
#' Subclasses should override for any actions to run.
#'
#' Args:
#' * `logs`: Named list. Currently no data is passed to this argument for this
#'   method but that may change in the future.
#'
#' @param
#' on_test_batch_begin
#' ```r
#' \(batch, logs = NULL)
#' ```
#' Called at the beginning of a batch in `evaluate()` methods.
#'
#' Also called at the beginning of a validation batch in the `fit()`
#' methods, if validation data is provided.
#'
#' Subclasses should override for any actions to run.
#'
#' Note that if the `steps_per_execution` argument to `compile()` in
#' `Model` is set to `N`, this method will only be called every
#' `N` batches.
#'
#' Args:
#' * `batch`: Integer, index of batch within the current epoch.
#' * `logs`: Named list. Currently no data is passed to this argument for this
#'   method but that may change in the future.
#'
#' @param
#' on_test_batch_end
#' ```r
#' \(batch, logs = NULL)
#' ```
#' Called at the end of a batch in `evaluate()` methods.
#'
#' Also called at the end of a validation batch in the `fit()`
#' methods, if validation data is provided.
#'
#' Subclasses should override for any actions to run.
#'
#' Note that if the `steps_per_execution` argument to `compile()` in
#' `Model` is set to `N`, this method will only be called every
#' `N` batches.
#'
#' Args:
#' * `batch`: Integer, index of batch within the current epoch.
#' * `logs`: Named list. Aggregated metric results up until this batch.
#'
#' @param
#' on_test_begin
#' ```r
#' \(logs = NULL)
#' ```
#' Called at the beginning of evaluation or validation.
#'
#' Subclasses should override for any actions to run.
#'
#' Args:
#' * `logs`: Named list. Currently no data is passed to this argument for this
#'    method but that may change in the future.
#'
#' @param
#' on_test_end
#' ```r
#' \(logs = NULL)
#' ```
#' Called at the end of evaluation or validation.
#'
#' Subclasses should override for any actions to run.
#'
#' Args:
#' * `logs`: Named list. Currently the output of the last call to
#'   `on_test_batch_end()` is passed to this argument for this method
#'    but that may change in the future.
#'
#' @param
#' on_train_batch_begin
#' ```
#' \(batch, logs = NULL)
#' ```
#' Called at the beginning of a training batch in `fit()` methods.
#'
#' Subclasses should override for any actions to run.
#'
#' Note that if the `steps_per_execution` argument to `compile` in
#' `Model` is set to `N`, this method will only be called every
#' `N` batches.
#'
#' Args:
#' * `batch`: Integer, index of batch within the current epoch.
#' * `logs`: Named list. Currently no data is passed to this argument for this
#'   method but that may change in the future.
#'
#' @param
#' on_train_batch_end
#' ```
#' \(batch, logs=NULL)
#' ```
#' Called at the end of a training batch in `fit()` methods.
#'
#' Subclasses should override for any actions to run.
#'
#' Note that if the `steps_per_execution` argument to `compile` in
#' `Model` is set to `N`, this method will only be called every
#' `N` batches.
#'
#' Args:
#' * `batch`: Integer, index of batch within the current epoch.
#' * `logs`: Named list. Aggregated metric results up until this batch.
#'
#' @param
#' on_train_begin
#' ```
#' \(logs = NULL)
#' ```
#' Called at the beginning of training.
#'
#' Subclasses should override for any actions to run.
#'
#' Args:
#' * `logs`: Named list. Currently no data is passed to this argument for this
#'    method but that may change in the future.
#'
#' @param
#' on_train_end
#' ```
#' \(logs = NULL)
#' ```
#' Called at the end of training.
#'
#' Subclasses should override for any actions to run.
#'
#' Args:
#' * `logs`: Named list. Currently the output of the last call to
#'  `on_epoch_end()` is passed to this argument for this method but
#'   that may change in the future.
#'
#'
#' @details
#'
#' If you want to use `Callback` objects in a custom training loop:
#'
#' 1. You should pack all your callbacks into a single `keras$callbacks$CallbackList`
#'    so they can all be called together.
#' 2. You will need to manually call all the `on_*` methods at the appropriate
#'    locations in your loop. Like this:
#'
#' Example:
#'
#' ```r
#' CallbackList <- function(...)
#'   reticulate::import("keras")$callbacks$CallbackList(list(...))
#' enumerate <- reticulate::import_builtins()$enumerate
#' callbacks <- CallbackList(callback1(), callback2(), ...)
#' callbacks$append(callback3())
#' callbacks$on_train_begin(...)
#' for (epoch in seq(0, len = EPOCHS)) {
#'   callbacks$on_epoch_begin(epoch)
#'   ds_iterator <- as_iterator(enumerate(dataset))
#'   while (!is.null(c(i, batch) %<-% iter_next(ds_iterator))) {
#'     callbacks$on_train_batch_begin(i)
#'     batch_logs <- model$train_step(batch)
#'     callbacks$on_train_batch_end(i, batch_logs)
#'   }
#'   epoch_logs <- ...
#'   callbacks$on_epoch_end(epoch, epoch_logs)
#' }
#' final_logs <- ...
#' callbacks$on_train_end(final_logs)
#' ```
#' @param ...,public Additional methods or public members of the custom class.
#' @param classname The name of the callback class. CamelCase by convention.
#' @param private Named list of R objects (typically, functions) to include in
#'   instance private environments. `private` will be a symbol in scope in all
#'   class methods, resolving to an R environment populated with the list
#'   provided. Each instance will have it's own `private` environment. All
#'   methods (functions) in `private` will have in scope `self` and `__class__`
#'   symbols. Any objects in `private` will be invisible from the Keras
#'   framework and the Python runtime.
#' @param parent_env The environment that all class methods will have as a grandparent.
#' @param inherit The Callback class to inherit from. By default, the base `Callback`.
#'
#' @export
#' @tether keras.callbacks.Callback
#' @family callbacks
#' @seealso
#' + <https:/keras.io/api/callbacks/base_callback#callback-class>
#' + <https://www.tensorflow.org/api_docs/python/tf/keras/callbacks/Callback>
Callback <-
function(classname,
         on_epoch_begin = NULL,
         on_epoch_end = NULL,
         on_train_begin = NULL,
         on_train_end = NULL,
         on_train_batch_begin = NULL,
         on_train_batch_end = NULL,
         on_test_begin = NULL,
         on_test_end = NULL,
         on_test_batch_begin = NULL,
         on_test_batch_end = NULL,
         on_predict_begin = NULL,
         on_predict_end = NULL,
         on_predict_batch_begin = NULL,
         on_predict_batch_end = NULL,
         ...,
         public = list(),
         private = list(),
         inherit = keras$callbacks$Callback,
         parent_env = parent.frame())
{

  members <- drop_nulls(named_list(
    on_epoch_begin, on_epoch_end,
    on_train_begin, on_train_end,
    on_train_batch_begin, on_train_batch_end,
    on_test_begin, on_test_end,
    on_test_batch_begin, on_test_batch_end,
    on_predict_begin, on_predict_end,
    on_predict_batch_begin, on_predict_batch_end
  ))
  members <- modifyList(members, list2(...), keep.null = FALSE)
  members <- modifyList(members, public, keep.null = TRUE)

  python_path <- system.file("python", package = "keras3")
  tools <- import_from_path("kerastools.callback", path = python_path)
  wrap_sig_idx_logs <- tools$wrap_sig_idx_logs
  wrap_sig_logs <- tools$wrap_sig_logs

  members <- modify_intersection(members, list(
    from_config =            \(x) decorate_method(x, "classmethod"),
    on_epoch_begin =         \(x) decorate_method(x, wrap_sig_idx_logs),
    on_epoch_end =           \(x) decorate_method(x, wrap_sig_idx_logs),
    on_train_begin =         \(x) decorate_method(x, wrap_sig_logs),
    on_train_end =           \(x) decorate_method(x, wrap_sig_logs),
    on_train_batch_begin =   \(x) decorate_method(x, wrap_sig_idx_logs),
    on_train_batch_end =     \(x) decorate_method(x, wrap_sig_idx_logs),
    on_test_begin =          \(x) decorate_method(x, wrap_sig_logs),
    on_test_end =            \(x) decorate_method(x, wrap_sig_logs),
    on_test_batch_begin =    \(x) decorate_method(x, wrap_sig_idx_logs),
    on_test_batch_end =      \(x) decorate_method(x, wrap_sig_idx_logs),
    on_predict_begin =       \(x) decorate_method(x, wrap_sig_logs),
    on_predict_end =         \(x) decorate_method(x, wrap_sig_logs),
    on_predict_batch_begin = \(x) decorate_method(x, wrap_sig_idx_logs),
    on_predict_batch_end =   \(x) decorate_method(x, wrap_sig_idx_logs)
  ))

  new_py_type(
    classname = classname,
    members = members,
    inherit = inherit,
    parent_env = parent_env,
    private = private
  )
}



#' @export
#' @rdname Callback
new_callback_class <- Callback