Dot product of two tensors.

@description
- If both `x1` and `x2` are 1-D tensors, it is inner product of vectors
  (without complex conjugation).
- If both `x1` and `x2` are 2-D tensors, it is matrix multiplication.
- If either `x1` or `x2` is 0-D (scalar), it is equivalent to `x1 * x2`.
- If `x1` is an N-D tensor and `x2` is a 1-D tensor, it is a sum product
  over the last axis of `x1` and `x2`.
- If `x1` is an N-D tensor and `x2` is an M-D tensor (where `M>=2`),
  it is a sum product over the last axis of `x1` and the second-to-last
  axis of `x2`: `dot(x1, x2)[i,j,k,m] = sum(a[i,j,:] * b[k,:,m])`.

# Note
Torch backend does not accept 0-D tensors as arguments.

# Returns
    Dot product of `x1` and `x2`.

@param x1 First argument.
@param x2 Second argument.

@export
@family ops
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/ops/dot>