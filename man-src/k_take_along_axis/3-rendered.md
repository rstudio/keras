Select values from `x` at the 1-D `indices` along the given axis.

# Returns
    The corresponding tensor of values.

@param x Source tensor.
@param indices The indices of the values to extract.
@param axis The axis over which to select values. By default, the flattened
    input tensor is used.

@export
@family ops
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/ops/take_along_axis>