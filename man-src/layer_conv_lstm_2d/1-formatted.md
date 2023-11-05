2D Convolutional LSTM.

@description
Similar to an LSTM layer, but the input transformations
and recurrent transformations are both convolutional.

# Call Arguments
- `inputs`: A 5D tensor.
- `mask`: Binary tensor of shape `(samples, timesteps)` indicating whether a
    given timestep should be masked.
- `training`: Python boolean indicating whether the layer should behave in
    training mode or in inference mode.
    This is only relevant if `dropout` or `recurrent_dropout` are set.
- `initial_state`: List of initial state tensors to be passed to the first
    call of the cell.

# Input Shape
- If `data_format='channels_first'`:
    5D tensor with shape: `(samples, time, channels, rows, cols)`
- If `data_format='channels_last'`:
    5D tensor with shape: `(samples, time, rows, cols, channels)`

# Output Shape
- If `return_state`: a list of tensors. The first tensor is the output.
    The remaining tensors are the last states,
    each 4D tensor with shape: `(samples, filters, new_rows, new_cols)` if
    `data_format='channels_first'`
    or shape: `(samples, new_rows, new_cols, filters)` if
    `data_format='channels_last'`. `rows` and `cols` values might have
    changed due to padding.
- If `return_sequences`: 5D tensor with shape: `(samples, timesteps,
    filters, new_rows, new_cols)` if data_format='channels_first'
    or shape: `(samples, timesteps, new_rows, new_cols, filters)` if
    `data_format='channels_last'`.
- Else, 4D tensor with shape: `(samples, filters, new_rows, new_cols)` if
    `data_format='channels_first'`
    or shape: `(samples, new_rows, new_cols, filters)` if
    `data_format='channels_last'`.

# References
- [Shi et al., 2015](http://arxiv.org/abs/1506.04214v1)
    (the current implementation does not include the feedback loop on the
    cells output).

@param filters int, the dimension of the output space (the number of filters
    in the convolution).
@param kernel_size int or tuple/list of 2 integers, specifying the size of the
    convolution window.
@param strides int or tuple/list of 2 integers, specifying the stride length
    of the convolution. `strides > 1` is incompatible with
    `dilation_rate > 1`.
@param padding string, `"valid"` or `"same"` (case-insensitive).
    `"valid"` means no padding. `"same"` results in padding evenly to
    the left/right or up/down of the input such that output has the same
    height/width dimension as the input.
@param data_format string, either `"channels_last"` or `"channels_first"`.
    The ordering of the dimensions in the inputs. `"channels_last"`
    corresponds to inputs with shape `(batch, steps, features)`
    while `"channels_first"` corresponds to inputs with shape
    `(batch, features, steps)`. It defaults to the `image_data_format`
    value found in your Keras config file at `~/.keras/keras.json`.
    If you never set it, then it will be `"channels_last"`.
@param dilation_rate int or tuple/list of 2 integers, specifying the dilation
    rate to use for dilated convolution.
@param activation Activation function to use. By default hyperbolic tangent
    activation function is applied (`tanh(x)`).
@param recurrent_activation Activation function to use for the recurrent step.
@param use_bias Boolean, whether the layer uses a bias vector.
@param kernel_initializer Initializer for the `kernel` weights matrix,
    used for the linear transformation of the inputs.
@param recurrent_initializer Initializer for the `recurrent_kernel` weights
    matrix, used for the linear transformation of the recurrent state.
@param bias_initializer Initializer for the bias vector.
@param unit_forget_bias Boolean. If `True`, add 1 to the bias of the forget
    gate at initialization.
    Use in combination with `bias_initializer="zeros"`.
    This is recommended in [Jozefowicz et al., 2015](
    http://www.jmlr.org/proceedings/papers/v37/jozefowicz15.pdf)
@param kernel_regularizer Regularizer function applied to the `kernel` weights
    matrix.
@param recurrent_regularizer Regularizer function applied to the
    `recurrent_kernel` weights matrix.
@param bias_regularizer Regularizer function applied to the bias vector.
@param activity_regularizer Regularizer function applied to.
@param kernel_constraint Constraint function applied to the `kernel` weights
    matrix.
@param recurrent_constraint Constraint function applied to the
    `recurrent_kernel` weights matrix.
@param bias_constraint Constraint function applied to the bias vector.
@param dropout Float between 0 and 1. Fraction of the units to drop for the
    linear transformation of the inputs.
@param recurrent_dropout Float between 0 and 1. Fraction of the units to drop
    for the linear transformation of the recurrent state.
@param seed Random seed for dropout.
@param return_sequences Boolean. Whether to return the last output
    in the output sequence, or the full sequence. Default: `False`.
@param return_state Boolean. Whether to return the last state in addition
    to the output. Default: `False`.
@param go_backwards Boolean (default: `False`).
    If `True`, process the input sequence backwards and return the
    reversed sequence.
@param stateful Boolean (default False). If `True`, the last state
    for each sample at index i in a batch will be used as initial
    state for the sample of index i in the following batch.
@param unroll Boolean (default: `False`).
    If `True`, the network will be unrolled,
    else a symbolic loop will be used.
    Unrolling can speed-up a RNN,
    although it tends to be more memory-intensive.
    Unrolling is only suitable for short sequences.

@param object Object to compose the layer with. A tensor, array, or sequential model.
@param ... Passed on to the Python callable

@export
@family recurrent layers
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/layers/ConvLSTM2D>