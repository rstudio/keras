Returns the indices of the minium values along an axis.

# Returns
Tensor of indices. It has the same shape as `x`, with the dimension
along `axis` removed.

# Examples
```python
x = keras.ops.arange(6).reshape(2, 3) + 10
x
# array([[10, 11, 12],
#        [13, 14, 15]], dtype=int32)
keras.ops.argmin(x)
# array(0, dtype=int32)
keras.ops.argmin(x, axis=0)
# array([0, 0, 0], dtype=int32)
keras.ops.argmin(x, axis=1)
# array([0, 0], dtype=int32)
```

@param x Input tensor.
@param axis By default, the index is into the flattened tensor, otherwise
    along the specified axis.

@export
@family ops
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/ops/argmin>