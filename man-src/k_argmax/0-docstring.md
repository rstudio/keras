Returns the indices of the maximum values along an axis.

Args:
    x: Input tensor.
    axis: By default, the index is into the flattened tensor, otherwise
        along the specified axis.

Returns:
    Tensor of indices. It has the same shape as `x`, with the dimension
    along `axis` removed.

Example:
>>> x = keras.ops.arange(6).reshape(2, 3) + 10
>>> x
array([[10, 11, 12],
       [13, 14, 15]], dtype=int32)
>>> keras.ops.argmax(x)
array(5, dtype=int32)
>>> keras.ops.argmax(x, axis=0)
array([1, 1, 1], dtype=int32)
>>> keras.ops.argmax(x, axis=1)
array([2, 2], dtype=int32)