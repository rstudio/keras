Sigmoid Linear Unit (SiLU) activation function, also known as Swish.

@description
The SiLU activation function is computed by the sigmoid function multiplied
by its input. It is defined as `f(x) = x * sigmoid(x)`.

# Returns
A tensor with the same shape as `x`.

# Examples
```python
x = keras.ops.convert_to_tensor([-6.0, 1.0, 0.0, 1.0, 6.0])
keras.ops.sigmoid(x)
# array([0.00247262, 0.7310586, 0.5, 0.7310586, 0.9975274], dtype=float32)
keras.ops.silu(x)
# array([-0.0148357, 0.7310586, 0.0, 0.7310586, 5.9851646], dtype=float32)
```

@param x Input tensor.

@export
@family ops
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/ops/silu>