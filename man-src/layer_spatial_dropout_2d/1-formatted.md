Spatial 2D version of Dropout.

@description
This version performs the same function as Dropout, however, it drops
entire 2D feature maps instead of individual elements. If adjacent pixels
within feature maps are strongly correlated (as is normally the case in
early convolution layers) then regular dropout will not regularize the
activations and will otherwise just result in an effective learning rate
decrease. In this case, `SpatialDropout2D` will help promote independence
between feature maps and should be used instead.

# Call Arguments
- `inputs`: A 4D tensor.
- `training`: Python boolean indicating whether the layer
    should behave in training mode (applying dropout)
    or in inference mode (pass-through).

# Input Shape
4D tensor with shape: `(samples, channels, rows, cols)` if
    data_format='channels_first'
or 4D tensor with shape: `(samples, rows, cols, channels)` if
    data_format='channels_last'.

# Output Shape
Same as input.

# Reference
- [Tompson et al., 2014](https://arxiv.org/abs/1411.4280)

@param rate Float between 0 and 1. Fraction of the input units to drop.
@param data_format `"channels_first"` or `"channels_last"`.
    In `"channels_first"` mode, the channels dimension (the depth)
    is at index 1, in `"channels_last"` mode is it at index 3.
    It defaults to the `image_data_format` value found in your
    Keras config file at `~/.keras/keras.json`.
    If you never set it, then it will be `"channels_last"`.
@param object Object to compose the layer with. A tensor, array, or sequential model.
@param name String, name for the object
@param seed Initial seed for the random number generator
@param dtype datatype (e.g., `"float32"`).

@export
@family regularization layers
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/layers/SpatialDropout2D>