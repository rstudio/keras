Flattens the input. Does not affect the batch size.

# Note
If inputs are shaped `(batch,)` without a feature axis, then
flattening adds an extra channel dimension and output shape is `(batch, 1)`.

# Examples
```python
x = keras.Input(shape=(10, 64))
y = keras.layers.Flatten()(x)
y.shape
# (None, 640)
```

@param data_format A string, one of `"channels_last"` (default) or
`"channels_first"`. The ordering of the dimensions in the inputs.
`"channels_last"` corresponds to inputs with shape
`(batch, ..., channels)` while `"channels_first"` corresponds to
inputs with shape `(batch, channels, ...)`.
When unspecified, uses `image_data_format` value found in your Keras
config file at `~/.keras/keras.json` (if exists). Defaults to
`"channels_last"`.
@param object Object to compose the layer with. A tensor, array, or sequential model.
@param ... Passed on to the Python callable

@export
@family reshaping layers
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/layers/Flatten>