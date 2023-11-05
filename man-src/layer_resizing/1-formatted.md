A preprocessing layer which resizes images.

@description
This layer resizes an image input to a target height and width. The input
should be a 4D (batched) or 3D (unbatched) tensor in `"channels_last"`
format. Input pixel values can be of any range
(e.g. `[0., 1.)` or `[0, 255]`).

# Input Shape
3D (unbatched) or 4D (batched) tensor with shape:
`(..., height, width, channels)`, in `"channels_last"` format,
or `(..., channels, height, width)`, in `"channels_first"` format.

# Output Shape
3D (unbatched) or 4D (batched) tensor with shape:
    `(..., target_height, target_width, channels)`,
    or `(..., channels, target_height, target_width)`,
    in `"channels_first"` format.

**Note:** This layer is safe to use inside a `tf.data` pipeline
(independently of which backend you're using).

@param height Integer, the height of the output shape.
@param width Integer, the width of the output shape.
@param interpolation String, the interpolation method.
    Supports `"bilinear"`, `"nearest"`, `"bicubic"`,
    `"lanczos3"`, `"lanczos5"`. Defaults to `"bilinear"`.
@param crop_to_aspect_ratio If `True`, resize the images without aspect
    ratio distortion. When the original aspect ratio differs
    from the target aspect ratio, the output image will be
    cropped so as to return the
    largest possible window in the image (of size `(height, width)`)
    that matches the target aspect ratio. By default
    (`crop_to_aspect_ratio=False`), aspect ratio may not be preserved.
@param data_format string, either `"channels_last"` or `"channels_first"`.
    The ordering of the dimensions in the inputs. `"channels_last"`
    corresponds to inputs with shape `(batch, height, width, channels)`
    while `"channels_first"` corresponds to inputs with shape
    `(batch, channels, height, width)`. It defaults to the
    `image_data_format` value found in your Keras config file at
    `~/.keras/keras.json`. If you never set it, then it will be
    `"channels_last"`.
@param ... Base layer keyword arguments, such as `name` and `dtype`.
@param object Object to compose the layer with. A tensor, array, or sequential model.

@export
@family preprocessing layers
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/layers/Resizing>