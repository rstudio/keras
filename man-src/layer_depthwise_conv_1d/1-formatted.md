1D depthwise convolution layer.

@description
Depthwise convolution is a type of convolution in which each input channel
is convolved with a different kernel (called a depthwise kernel). You can
understand depthwise convolution as the first step in a depthwise separable
convolution.

It is implemented via the following steps:

- Split the input into individual channels.
- Convolve each channel with an individual depthwise kernel with
  `depth_multiplier` output channels.
- Concatenate the convolved outputs along the channels axis.

Unlike a regular 1D convolution, depthwise convolution does not mix
information across different input channels.

The `depth_multiplier` argument determines how many filters are applied to
one input channel. As such, it controls the amount of output channels that
are generated per input channel in the depthwise step.

# Input Shape
- If `data_format="channels_last"`:
    A 3D tensor with shape: `(batch_shape, steps, channels)`
- If `data_format="channels_first"`:
    A 3D tensor with shape: `(batch_shape, channels, steps)`

# Output Shape
- If `data_format="channels_last"`:
    A 3D tensor with shape:
    `(batch_shape, new_steps, channels * depth_multiplier)`
- If `data_format="channels_first"`:
    A 3D tensor with shape:
    `(batch_shape, channels * depth_multiplier, new_steps)`

# Returns
A 3D tensor representing
`activation(depthwise_conv1d(inputs, kernel) + bias)`.

# Raises
ValueError: when both `strides > 1` and `dilation_rate > 1`.

# Examples
```python
x = np.random.rand(4, 10, 12)
y = keras.layers.DepthwiseConv1D(3, 3, 2, activation='relu')(x)
print(y.shape)
# (4, 4, 36)
```

@param kernel_size int or tuple/list of 1 integer, specifying the size of the
    depthwise convolution window.
@param strides int or tuple/list of 1 integer, specifying the stride length
    of the convolution. `strides > 1` is incompatible with
    `dilation_rate > 1`.
@param padding string, either `"valid"` or `"same"` (case-insensitive).
    `"valid"` means no padding. `"same"` results in padding evenly to
    the left/right or up/down of the input such that output has the same
    height/width dimension as the input.
@param depth_multiplier The number of depthwise convolution output channels
    for each input channel. The total number of depthwise convolution
    output channels will be equal to `input_channel * depth_multiplier`.
@param data_format string, either `"channels_last"` or `"channels_first"`.
    The ordering of the dimensions in the inputs. `"channels_last"`
    corresponds to inputs with shape `(batch, steps, features)`
    while `"channels_first"` corresponds to inputs with shape
    `(batch, features, steps)`. It defaults to the `image_data_format`
    value found in your Keras config file at `~/.keras/keras.json`.
    If you never set it, then it will be `"channels_last"`.
@param dilation_rate int or tuple/list of 1 integers, specifying the dilation
    rate to use for dilated convolution.
@param activation Activation function. If `None`, no activation is applied.
@param use_bias bool, if `True`, bias will be added to the output.
@param depthwise_initializer Initializer for the convolution kernel.
    If `None`, the default initializer (`"glorot_uniform"`)
    will be used.
@param bias_initializer Initializer for the bias vector. If `None`, the
    default initializer (`"zeros"`) will be used.
@param depthwise_regularizer Optional regularizer for the convolution kernel.
@param bias_regularizer Optional regularizer for the bias vector.
@param activity_regularizer Optional regularizer function for the output.
@param depthwise_constraint Optional projection function to be applied to the
    kernel after being updated by an `Optimizer` (e.g. used to implement
    norm constraints or value constraints for layer weights). The
    function must take as input the unprojected variable and must return
    the projected variable (which must have the same shape). Constraints
    are not safe to use when doing asynchronous distributed training.
@param bias_constraint Optional projection function to be applied to the
    bias after being updated by an `Optimizer`.
@param object Object to compose the layer with. A tensor, array, or sequential model.
@param ... Passed on to the Python callable

@export
@family convolutional layers
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/layers/DepthwiseConv1D>