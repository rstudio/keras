2D separable convolution layer.

@description
This layer performs a depthwise convolution that acts separately on
channels, followed by a pointwise convolution that mixes channels.
If `use_bias` is True and a bias initializer is provided,
it adds a bias vector to the output. It then optionally applies an
activation function to produce the final output.

# Input Shape
- If `data_format="channels_last"`:
    A 4D tensor with shape: `(batch_size, height, width, channels)`
- If `data_format="channels_first"`:
    A 4D tensor with shape: `(batch_size, channels, height, width)`

# Output Shape
- If `data_format="channels_last"`:
    A 4D tensor with shape: `(batch_size, new_height, new_width, filters)`
- If `data_format="channels_first"`:
    A 4D tensor with shape: `(batch_size, filters, new_height, new_width)`

# Returns
A 4D tensor representing
`activation(separable_conv2d(inputs, kernel) + bias)`.

# Examples
```python
x = np.random.rand(4, 10, 10, 12)
y = keras.layers.SeparableConv2D(3, 4, 3, 2, activation='relu')(x)
print(y.shape)
# (4, 4, 4, 4)
```

@param filters int, the dimensionality of the output space (i.e. the number
    of filters in the pointwise convolution).
@param kernel_size int or tuple/list of 2 integers, specifying the size of the
    depthwise convolution window.
@param strides int or tuple/list of 2 integers, specifying the stride length
    of the depthwise convolution. If only one int is specified, the same
    stride size will be used for all dimensions. `strides > 1` is
    incompatible with `dilation_rate > 1`.
@param padding string, either `"valid"` or `"same"` (case-insensitive).
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
    rate to use for dilated convolution. If only one int is specified,
    the same dilation rate will be used for all dimensions.
@param depth_multiplier The number of depthwise convolution output channels
    for each input channel. The total number of depthwise convolution
    output channels will be equal to `input_channel * depth_multiplier`.
@param activation Activation function. If `None`, no activation is applied.
@param use_bias bool, if `True`, bias will be added to the output.
@param depthwise_initializer An initializer for the depthwise convolution
    kernel. If None, then the default initializer (`"glorot_uniform"`)
    will be used.
@param pointwise_initializer An initializer for the pointwise convolution
    kernel. If None, then the default initializer (`"glorot_uniform"`)
    will be used.
@param bias_initializer An initializer for the bias vector. If None, the
    default initializer ('"zeros"') will be used.
@param depthwise_regularizer Optional regularizer for the depthwise
    convolution kernel.
@param pointwise_regularizer Optional regularizer for the pointwise
    convolution kernel.
@param bias_regularizer Optional regularizer for the bias vector.
@param activity_regularizer Optional regularizer function for the output.
@param depthwise_constraint Optional projection function to be applied to the
    depthwise kernel after being updated by an `Optimizer` (e.g. used
    for norm constraints or value constraints for layer weights). The
    function must take as input the unprojected variable and must return
    the projected variable (which must have the same shape).
@param pointwise_constraint Optional projection function to be applied to the
    pointwise kernel after being updated by an `Optimizer`.
@param bias_constraint Optional projection function to be applied to the
    bias after being updated by an `Optimizer`.
@param object Object to compose the layer with. A tensor, array, or sequential model.
@param ... Passed on to the Python callable

@export
@family convolutional layers
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/layers/SeparableConv2D>