Map the input array to new coordinates by interpolation..

@description
Note that interpolation near boundaries differs from the scipy function,
because we fixed an outstanding bug
[scipy/issues/2640](https://github.com/scipy/scipy/issues/2640).

# Returns
    Output image or batch of images.

@param input The input array.
@param coordinates The coordinates at which input is evaluated.
@param order The order of the spline interpolation. The order must be `0` or
    `1`. `0` indicates the nearest neighbor and `1` indicates the linear
    interpolation.
@param fill_mode Points outside the boundaries of the input are filled
    according to the given mode. Available methods are `"constant"`,
    `"nearest"`, `"wrap"` and `"mirror"` and `"reflect"`. Defaults to
    `"constant"`.
    - `"constant"`: `(k k k k | a b c d | k k k k)`
        The input is extended by filling all values beyond
        the edge with the same constant value k specified by
        `fill_value`.
    - `"nearest"`: `(a a a a | a b c d | d d d d)`
        The input is extended by the nearest pixel.
    - `"wrap"`: `(a b c d | a b c d | a b c d)`
        The input is extended by wrapping around to the opposite edge.
    - `"mirror"`: `(c d c b | a b c d | c b a b)`
        The input is extended by mirroring about the edge.
    - `"reflect"`: `(d c b a | a b c d | d c b a)`
        The input is extended by reflecting about the edge of the last
        pixel.
@param fill_value Value used for points outside the boundaries of the input if
    `fill_mode="constant"`. Defaults to `0`.

@export
@family ops
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/ops/image/map_coordinates>