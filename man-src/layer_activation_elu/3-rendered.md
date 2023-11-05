Applies an Exponential Linear Unit function to an output.

@description
Formula:

```
f(x) = alpha * (exp(x) - 1.) for x < 0
f(x) = x for x >= 0
```

@param alpha float, slope of negative section. Defaults to `1.0`.
@param ... Base layer keyword arguments, such as `name` and `dtype`.
@param object Object to compose the layer with. A tensor, array, or sequential model.

@export
@family activations layers
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/layers/ELU>