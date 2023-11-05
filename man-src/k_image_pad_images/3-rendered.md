Pad `images` with zeros to the specified `height` and `width`.

# Returns
If `images` were 4D, a 4D float Tensor of shape
    `(batch, target_height, target_width, channels)`
If `images` were 3D, a 3D float Tensor of shape
    `(target_height, target_width, channels)`

# Examples
```python
images = np.random.random((15, 25, 3))
padded_images = keras.ops.image.pad_images(
    images, 2, 3, target_height=20, target_width=30
)
padded_images.shape
# (20, 30, 3)
```

```python
batch_images = np.random.random((2, 15, 25, 3))
padded_batch = keras.ops.image.pad_images(
    batch_images, 2, 3, target_height=20, target_width=30
)
padded_batch.shape
# (2, 20, 30, 3)
```

@param images 4D Tensor of shape `(batch, height, width, channels)` or 3D
    Tensor of shape `(height, width, channels)`.
@param top_padding Number of rows of zeros to add on top.
@param bottom_padding Number of rows of zeros to add at the bottom.
@param left_padding Number of columns of zeros to add on the left.
@param right_padding Number of columns of zeros to add on the right.
@param target_height Height of output images.
@param target_width Width of output images.

@export
@family ops
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/ops/image/pad_images>