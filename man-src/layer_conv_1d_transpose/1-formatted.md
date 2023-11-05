1D transposed convolution layer.

@description
The need for transposed convolutions generally arise from the desire to use
a transformation going in the opposite direction of a normal convolution,
i.e., from something that has the shape of the output of some convolution
to something that has the shape of its input while maintaining a
connectivity pattern that is compatible with said convolution.

# Input Shape
- If `data_format="channels_last"`:
    A 3D tensor with shape: `(batch_shape, steps, channels)`
- If `data_format="channels_first"`:
    A 3D tensor with shape: `(batch_shape, channels, steps)`

# Output Shape
- If `data_format="channels_last"`:
    A 3D tensor with shape: `(batch_shape, new_steps, filters)`
- If `data_format="channels_first"`:
    A 3D tensor with shape: `(batch_shape, filters, new_steps)`

# Returns
A 3D tensor representing
`activation(conv1d_transpose(inputs, kernel) + bias)`.

# Raises
ValueError: when both `strides > 1` and `dilation_rate > 1`.

# References
- [A guide to convolution arithmetic for deep learning](
    https://arxiv.org/abs/1603.07285v1)
- [Deconvolutional Networks](
    https://www.matthewzeiler.com/mattzeiler/deconvolutionalnetworks.pdf)

# Examples
```python
x = np.random.rand(4, 10, 128)
y = keras.layers.Conv1DTranspose(32, 3, 2, activation='relu')(x)
print(y.shape)
# (4, 21, 32)
```

@param filters int, the dimension of the output space (the number of filters
    in the transpose convolution).
@param kernel_size int or tuple/list of 1 integer, specifying the size of the
    transposed convolution window.
@param strides int or tuple/list of 1 integer, specifying the stride length
    of the transposed convolution. `strides > 1` is incompatible with
    `dilation_rate > 1`.
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
@param dilation_rate int or tuple/list of 1 integers, specifying the dilation
    rate to use for dilated transposed convolution.
@param activation Activation function. If `None`, no activation is applied.
@param use_bias bool, if `True`, bias will be added to the output.
@param kernel_initializer Initializer for the convolution kernel. If `None`,
    the default initializer (`"glorot_uniform"`) will be used.
@param bias_initializer Initializer for the bias vector. If `None`, the
    default initializer (`"zeros"`) will be used.
@param kernel_regularizer Optional regularizer for the convolution kernel.
@param bias_regularizer Optional regularizer for the bias vector.
@param activity_regularizer Optional regularizer function for the output.
@param kernel_constraint Optional projection function to be applied to the
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
+ <https://www.tensorflow.org/api_docs/python/tf/keras/layers/Conv1DTranspose>