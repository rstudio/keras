keras.optimizers.LossScaleOptimizer
__signature__
(
  inner_optimizer,
  initial_scale=32768.0,
  dynamic_growth_steps=2000,
  **kwargs
)
__doc__
An optimizer that dynamically scales the loss to prevent underflow.

Loss scaling is a technique to prevent numeric underflow in intermediate
gradients when float16 is used. To prevent underflow, the loss is multiplied
(or "scaled") by a certain factor called the "loss scale", which causes
intermediate gradients to be scaled by the loss scale as well. The final
gradients are divided (or "unscaled") by the loss scale to bring them back
to their original value.

`LossScaleOptimizer` wraps another optimizer and applies dynamic loss
scaling to it. This loss scale is dynamically updated over time as follows:
- On any train step, if a nonfinite gradient is encountered, the loss scale
  is halved, and the train step is skipped.
- If `dynamic_growth_steps` have ocurred since the last time the loss scale
  was updated, and no nonfinite gradients have occurred, the loss scale
  is doubled.

Args:
    inner_optimizer: The `keras.optimizers.Optimizer` instance to wrap.
    initial_scale: Float. The initial loss scale. This scale will be updated
        during training. It is recommended for this to be a very high
        number, because a loss scale that is too high gets lowered far more
        quickly than a loss scale that is too low gets raised.
    dynamic_growth_steps: Int. How often to update the scale upwards. After
        every `dynamic_growth_steps` steps with finite gradients, the
        loss scale is doubled.
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