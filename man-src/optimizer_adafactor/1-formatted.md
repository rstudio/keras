Optimizer that implements the Adafactor algorithm.

@description
Adafactor is commonly used in NLP tasks, and has the advantage
of taking less memory because it only saves partial information of previous
gradients.

The default argument setup is based on the original paper (see reference).
When gradients are of dimension > 2, Adafactor optimizer will delete the
last 2 dimensions separately in its accumulator variables.

# Reference
- [Shazeer, Noam et al., 2018](https://arxiv.org/abs/1804.04235).

@param learning_rate A float, a
    `keras.optimizers.schedules.LearningRateSchedule` instance, or
    a callable that takes no arguments and returns the actual value to
    use. The learning rate. Defaults to `0.001`.
@param beta_2_decay float, defaults to -0.8. The decay rate of `beta_2`.
@param epsilon_1 float, defaults to 1e-30. A small offset to keep denominator
    away from 0.
@param epsilon_2 float, defaults to 1e-3. A small offset to avoid learning
    rate becoming too small by time.
@param clip_threshold float, defaults to 1.0. Clipping threshold. This is a
    part of Adafactor algorithm, independent from `clipnorm`,
    `clipvalue`, and `global_clipnorm`.
@param relative_step bool, defaults to True. If `learning_rate` is a
    constant and `relative_step=True`, learning rate will be adjusted
    based on current iterations. This is a default learning rate decay
    in Adafactor.
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
+ <https://www.tensorflow.org/api_docs/python/tf/keras/optimizers/Adafactor>