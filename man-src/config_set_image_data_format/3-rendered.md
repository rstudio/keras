Set the value of the image data format convention.

# Examples
```python
keras.config.image_data_format()
# 'channels_last'
```

```python
keras.config.set_image_data_format('channels_first')
keras.config.image_data_format()
# 'channels_first'
```

```python
# Set it back to `'channels_last'`
keras.config.set_image_data_format('channels_last')
```

@param data_format string. `'channels_first'` or `'channels_last'`.

@export
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/config/set_image_data_format>