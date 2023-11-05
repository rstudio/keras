Encodes integer labels as multi-hot vectors.

This function encodes integer labels as multi-hot vectors, where each label
is mapped to a binary value in the resulting vector.

Args:
    inputs: Tensor of integer labels to be converted to multi-hot vectors.
    num_tokens: Integer, the total number of unique tokens or classes.
    axis: (optional) Axis along which the multi-hot encoding should be
        added. Defaults to `-1`, which corresponds to the last dimension.
    dtype: (optional) The data type of the resulting tensor. Default
        is backend's float type.

Returns:
    Tensor: The multi-hot encoded tensor.

Example:

>>> data = keras.ops.convert_to_tensor([0, 4])
>>> keras.ops.multi_hot(data, num_tokens=5)
array([1.0, 0.0, 0.0, 0.0, 1.0], dtype=float32)