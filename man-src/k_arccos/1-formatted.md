Trigonometric inverse cosine, element-wise.

@description
The inverse of `cos` so that, if `y = cos(x)`, then `x = arccos(y)`.

# Returns
Tensor of the angle of the ray intersecting the unit circle at the given
x-coordinate in radians `[0, pi]`.

# Examples
```python
x = keras.ops.convert_to_tensor([1, -1])
keras.ops.arccos(x)
# array([0.0, 3.1415927], dtype=float32)
```

@param x Input tensor.

@export
@family ops
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/ops/arccos>