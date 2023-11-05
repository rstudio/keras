Compute the standard deviation along the specified axis.

# Returns
    Output tensor containing the standard deviation values.

@param x Input tensor.
@param axis Axis along which to compute standard deviation.
    Default is to compute the standard deviation of the
    flattened tensor.
@param keepdims If this is set to `True`, the axes which are reduced are left
    in the result as dimensions with size one.

@export
@family ops
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/ops/std>