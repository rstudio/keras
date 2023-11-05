Softmax converts a vector of values to a probability distribution.

@description
The elements of the output vector are in range `[0, 1]` and sum to 1.

Each input vector is handled independently.
The `axis` argument sets which axis of the input the function
is applied along.

Softmax is often used as the activation for the last
layer of a classification network because the result could be interpreted as
a probability distribution.

The softmax of each vector x is computed as
`exp(x) / sum(exp(x))`.

The input values in are the log-odds of the resulting probability.

@param x Input tensor.
@param axis Integer, axis along which the softmax is applied.

@export
@family activation functions
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/activations/softmax>