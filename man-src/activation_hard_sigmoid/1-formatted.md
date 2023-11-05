Hard sigmoid activation function.

@description
The hard sigmoid activation is defined as:

- `0` if `if x < -2.5`
- `1` if `x > 2.5`
- `0.2 * x + 0.5` if `-2.5 <= x <= 2.5`

It's a faster, piecewise linear approximation
of the sigmoid activation.

# Reference
- [Wikipedia "Hard sigmoid"](https://en.wikipedia.org/wiki/Hard_sigmoid)

@param x Input tensor.

@export
@family activation functions
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/activations/hard_sigmoid>