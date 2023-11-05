Exponential Linear Unit.

@description
The exponential linear unit (ELU) with `alpha > 0` is defined as:

- `x` if `x > 0`
- `alpha * exp(x) - 1` if `x < 0`

ELUs have negative values which pushes the mean of the activations
closer to zero.

Mean activations that are closer to zero enable faster learning as they
bring the gradient closer to the natural gradient.
ELUs saturate to a negative value when the argument gets smaller.
Saturation means a small derivative which decreases the variation
and the information that is propagated to the next layer.

# Reference
- [Clevert et al., 2016](https://arxiv.org/abs/1511.07289)

@param x Input tensor.
@param alpha Numeric. See description for details.

@export
@family activation functions
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/activations/elu>