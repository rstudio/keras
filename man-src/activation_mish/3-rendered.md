Mish activation function.

@description
It is defined as:

`mish(x) = x * tanh(softplus(x))`

where `softplus` is defined as:

`softplus(x) = log(exp(x) + 1)`

# Reference
- [Misra, 2019](https://arxiv.org/abs/1908.08681)

@param x Input tensor.

@export
@family activation functions
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/activations/mish>