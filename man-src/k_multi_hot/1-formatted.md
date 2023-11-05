Encodes integer labels as multi-hot vectors.

@description
This function encodes integer labels as multi-hot vectors, where each label
is mapped to a binary value in the resulting vector.

# Returns
Tensor: The multi-hot encoded tensor.

# Examples
```python
data = keras.ops.convert_to_tensor([0, 4])
keras.ops.multi_hot(data, num_tokens=5)
# array([1.0, 0.0, 0.0, 0.0, 1.0], dtype=float32)
```

@param inputs Tensor of integer labels to be converted to multi-hot vectors.
@param num_tokens Integer, the total number of unique tokens or classes.
@param axis (optional) Axis along which the multi-hot encoding should be
    added. Defaults to `-1`, which corresponds to the last dimension.
@param dtype (optional) The data type of the resulting tensor. Default
    is backend's float type.

@export
@family ops
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/ops/multi_hot>