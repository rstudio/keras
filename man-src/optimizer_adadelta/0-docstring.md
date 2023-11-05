Optimizer that implements the Adadelta algorithm.

Adadelta optimization is a stochastic gradient descent method that is based
on adaptive learning rate per dimension to address two drawbacks:

- The continual decay of learning rates throughout training.
- The need for a manually selected global learning rate.

Adadelta is a more robust extension of Adagrad that adapts learning rates
based on a moving window of gradient updates, instead of accumulating all
past gradients. This way, Adadelta continues learning even when many updates
have been done. Compared to Adagrad, in the original version of Adadelta you
don't have to set an initial learning rate. In this version, the initial
learning rate can be set, as in most other Keras optimizers.

Args:
    learning_rate: A float, a
        `keras.optimizers.schedules.LearningRateSchedule` instance, or
        a callable that takes no arguments and returns the actual value to
        use. The learning rate. Defaults to `0.001`. Note that `Adadelta`
        tends to benefit from higher initial learning rate values compared
        to other optimizers. To match the exact form in the original paper,
        use 1.0.
    rho: A floating point value. The decay rate. Defaults to `0.95`.
    epsilon: Small floating point value for maintaining numerical stability.
    name: String. The name to use
      for momentum accumulator weights created by
      the optimizer.
    weight_decay: Float. If set, weight decay is applied.
    clipnorm: Float. If set, the gradient of each weight is individually
      clipped so that its norm is no higher than this value.
    clipvalue: Float. If set, the gradient of each weight is clipped to be
      no higher than this value.
    global_clipnorm: Float. If set, the gradient of all weights is clipped
      so that their global norm is no higher than this value.
    use_ema: Boolean, defaults to False. If True, exponential moving average
      (EMA) is applied. EMA consists of computing an exponential moving
      average of the weights of the model (as the weight values change after
      each training batch), and periodically overwriting the weights with
      their moving average.
    ema_momentum: Float, defaults to 0.99. Only used if `use_ema=True`.
      This is the momentum to use when computing
      the EMA of the model's weights:
      `new_average = ema_momentum * old_average + (1 - ema_momentum) *
      current_variable_value`.
    ema_overwrite_frequency: Int or None, defaults to None. Only used if
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
    loss_scale_factor: Float or `None`. If a float, the scale factor will
      be multiplied the loss before computing gradients, and the inverse of
      the scale factor will be multiplied by the gradients before updating
      variables. Useful for preventing underflow during mixed precision
      training. Alternately, `keras.optimizers.LossScaleOptimizer` will
      automatically set a loss scale factor.


Reference:

- [Zeiler, 2012](http://arxiv.org/abs/1212.5701)