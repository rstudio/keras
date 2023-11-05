Optimizer that implements the Nadam algorithm.

@description
Much like Adam is essentially RMSprop with momentum, Nadam is Adam with
Nesterov momentum.

# Reference
- [Dozat, 2015](http://cs229.stanford.edu/proj2015/054_report.pdf).

@param learning_rate A float, a
    `keras.optimizers.schedules.LearningRateSchedule` instance, or
    a callable that takes no arguments and returns the actual value to
    use. The learning rate. Defaults to `0.001`.
@param beta_1 A float value or a constant float tensor, or a callable
    that takes no arguments and returns the actual value to use. The
    exponential decay rate for the 1st moment estimates.
    Defaults to `0.9`.
@param beta_2 A float value or a constant float tensor, or a callable
    that takes no arguments and returns the actual value to use. The
    exponential decay rate for the 2nd moment estimates. Defaults to
    `0.999`.
@param epsilon A small constant for numerical stability. This epsilon is
    "epsilon hat" in the Kingma and Ba paper (in the formula just before
    Section 2.1), not the epsilon in Algorithm 1 of the paper.
    Defaults to `1e-7`.
@param name String. The name to use
  for momentum accumulator weights created by
  the optimizer.
@param weight_decay Float. If set, weight decay is applied.
@param clipnorm Float. If set, the gradient of each weight is individually
  clipped so that its norm is no higher than this value.
@param clipvalue Float. If set, the gradient of each weight is clipped to be
  no higher than this value.
@param global_clipnorm Float. If set, the gradient of all weights is clipped
  so that their global norm is no higher than this value.
@param use_ema Boolean, defaults to False. If True, exponential moving average
  (EMA) is applied. EMA consists of computing an exponential moving
  average of the weights of the model (as the weight values change after
  each training batch), and periodically overwriting the weights with
  their moving average.
@param ema_momentum Float, defaults to 0.99. Only used if `use_ema=True`.
  This is the momentum to use when computing
  the EMA of the model's weights:
  `new_average = ema_momentum * old_average + (1 - ema_momentum) *
  current_variable_value`.
@param ema_overwrite_frequency Int or None, defaults to None. Only used if
  `use_ema=True`. Every `ema_overwrite_frequency` steps of iterations,
  we overwrite the model variable by its moving average.
  If None, the optimizer
  does not overwrite model variables in the middle of training, and you
  need to explicitly overwrite the variables at the end of training
  by calling `optimizer.finalize_variable_values()`
  (which updates the model
  variables in-place). When using the built-in `fit()` training loop,
  this happens automatically after the last epoch,
  and you don't need to do anything.
@param loss_scale_factor Float or `None`. If a float, the scale factor will
  be multiplied the loss before computing gradients, and the inverse of
  the scale factor will be multiplied by the gradients before updating
  variables. Useful for preventing underflow during mixed precision
  training. Alternately, `keras.optimizers.LossScaleOptimizer` will
  automatically set a loss scale factor.

@param ... Passed on to the Python callable

@export
@family optimizer
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/optimizers/Nadam>