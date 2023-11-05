Converts integer tensor `x` into a one-hot tensor.

@description
The one-hot encoding is a representation where each integer value is
converted into a binary vector with a length equal to `num_classes`,
and the index corresponding to the integer value is marked as 1, while
all other indices are marked as 0.

# Returns
Integer tensor: One-hot encoded tensor with the same shape as `x`
except for the specified `axis` dimension, which will have
a length of `num_classes`. The dtype of the output tensor
is determined by `dtype` or the default data type of the backend.

# Examples
```python
x = keras.ops.convert_to_tensor([1, 3, 2, 0])
one_hot(x, num_classes=4)
# array([[0. 1. 0. 0.]
#        [0. 0. 0. 1.]
#        [0. 0. 1. 0.]
#        [1. 0. 0. 0.]], shape=(4, 4), dtype=float32)
```

@param x Integer tensor to be encoded. The shape can be
    arbitrary, but the dtype should be integer.
@param num_classes Number of classes for the one-hot encoding.
@param axis Axis along which the encoding is performed. Defaults to
    `-1`, which represents the last axis.
@param dtype (Optional) Data type of the output tensor. If not
    provided, it defaults to the default data type of the backend.

@export
@family ops
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/ops/one_hot>