A preprocessing layer which randomly rotates images during training.

@description
This layer will apply random rotations to each image, filling empty space
according to `fill_mode`.

By default, random rotations are only applied during training.
At inference time, the layer does nothing. If you need to apply random
rotations at inference time, set `training` to True when calling the layer.

Input pixel values can be of any range (e.g. `[0., 1.)` or `[0, 255]`) and
of integer or floating point dtype.
By default, the layer will output floats.

**Note:** This layer is safe to use inside a `tf.data` pipeline
(independently of which backend you're using).

# Input Shape
3D (unbatched) or 4D (batched) tensor with shape:
`(..., height, width, channels)`, in `"channels_last"` format

# Output Shape
3D (unbatched) or 4D (batched) tensor with shape:
`(..., height, width, channels)`, in `"channels_last"` format

@param factor a float represented as fraction of 2 Pi, or a tuple of size 2
    representing lower and upper bound for rotating clockwise and
    counter-clockwise. A positive values means rotating
    counter clock-wise,
    while a negative value means clock-wise.
    When represented as a single
    float, this value is used for both the upper and lower bound.
    For instance, `factor=(-0.2, 0.3)`
    results in an output rotation by a random
    amount in the range `[-20% * 2pi, 30% * 2pi]`.
    `factor=0.2` results in an
    output rotating by a random amount
    in the range `[-20% * 2pi, 20% * 2pi]`.
@param fill_mode Points outside the boundaries of the input are filled
    according to the given mode
    (one of `{"constant", "reflect", "wrap", "nearest"}`).
    - *reflect*: `(d c b a | a b c d | d c b a)`
        The input is extended by reflecting about
        the edge of the last pixel.
    - *constant*: `(k k k k | a b c d | k k k k)`
        The input is extended by
        filling all values beyond the edge with
        the same constant value k = 0.
    - *wrap*: `(a b c d | a b c d | a b c d)` The input is extended by
        wrapping around to the opposite edge.
    - *nearest*: `(a a a a | a b c d | d d d d)`
        The input is extended by the nearest pixel.
@param interpolation Interpolation mode. Supported values: `"nearest"`,
    `"bilinear"`.
@param seed Integer. Used to create a random seed.
@param fill_value a float represents the value to be filled outside
    the boundaries when `fill_mode="constant"`.
@param object Object to compose the layer with. A tensor, array, or sequential model.
@param ... Passed on to the Python callable
@param value_range see description
@param data_format see description

@export
@family preprocessing layers
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/layers/RandomRotation>