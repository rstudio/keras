Sigmoid activation function.

@description
It is defined as `f(x) = 1 / (1 + exp(-x))`.

# Returns
A tensor with the same shape as `x`.

# Examples
```python
x = keras.ops.convert_to_tensor([-6.0, 1.0, 0.0, 1.0, 6.0])
keras.ops.sigmoid(x)
# array([0.00247262, 0.7310586, 0.5, 0.7310586, 0.9975274], dtype=float32)
```

@param x Input tensor.

@export
@family ops
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/ops/sigmoid>