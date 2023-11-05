Gaussian error linear unit (GELU) activation function.

@description
The Gaussian error linear unit (GELU) is defined as:

`gelu(x) = x * P(X <= x)` where `P(X) ~ N(0, 1)`,
i.e. `gelu(x) = 0.5 * x * (1 + erf(x / sqrt(2)))`.

GELU weights inputs by their value, rather than gating
inputs by their sign as in ReLU.

# Reference
- [Hendrycks et al., 2016](https://arxiv.org/abs/1606.08415)

@param x Input tensor.
@param approximate A `bool`, whether to enable approximation.

@export
@family activation functions
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/activations/gelu>