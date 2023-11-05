A preprocessing layer which randomly adjusts contrast during training.

@description
This layer will randomly adjust the contrast of an image or images
by a random factor. Contrast is adjusted independently
for each channel of each image during training.

For each channel, this layer computes the mean of the image pixels in the
channel and then adjusts each component `x` of each pixel to
`(x - mean) * contrast_factor + mean`.

Input pixel values can be of any range (e.g. `[0., 1.)` or `[0, 255]`) and
in integer or floating point dtype.
By default, the layer will output floats.

**Note:** This layer is safe to use inside a `tf.data` pipeline
(independently of which backend you're using).

# Input Shape
3D (unbatched) or 4D (batched) tensor with shape:
`(..., height, width, channels)`, in `"channels_last"` format.

# Output Shape
3D (unbatched) or 4D (batched) tensor with shape:
`(..., height, width, channels)`, in `"channels_last"` format.

@param factor a positive float represented as fraction of value, or a tuple of
    size 2 representing lower and upper bound.
    When represented as a single float, lower = upper.
    The contrast factor will be randomly picked between
    `[1.0 - lower, 1.0 + upper]`. For any pixel x in the channel,
    the output will be `(x - mean) * factor + mean`
    where `mean` is the mean value of the channel.
@param seed Integer. Used to create a random seed.
@param object Object to compose the layer with. A tensor, array, or sequential model.
@param ... Passed on to the Python callable

@export
@family preprocessing layers
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/layers/RandomContrast>