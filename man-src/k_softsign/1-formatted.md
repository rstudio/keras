Softsign activation function.

@description
It is defined as `f(x) = x / (abs(x) + 1)`.

# Returns
A tensor with the same shape as `x`.

# Examples
```python
x = keras.ops.convert_to_tensor([-0.100, -10.0, 1.0, 0.0, 100.0])
keras.ops.softsign(x)
# Array([-0.09090909, -0.90909094, 0.5, 0.0, 0.990099], dtype=float32)
```

@param x Input tensor.

@export
@family ops
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/ops/softsign>