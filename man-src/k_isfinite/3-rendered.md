Return whether a tensor is finite, element-wise.

@description
Real values are finite when they are not NaN, not positive infinity, and
not negative infinity. Complex values are finite when both their real
and imaginary parts are finite.

# Returns
    Output boolean tensor.

@param x Input tensor.

@export
@family ops
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/ops/isfinite>