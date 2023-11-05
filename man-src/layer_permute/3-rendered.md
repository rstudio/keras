Permutes the dimensions of the input according to a given pattern.

@description
Useful e.g. connecting RNNs and convnets.

# Input Shape
Arbitrary.

# Output Shape
Same as the input shape, but with the dimensions re-ordered according
to the specified pattern.

# Examples
```python
x = keras.Input(shape=(10, 64))
y = keras.layers.Permute((2, 1))(x)
y.shape
# (None, 64, 10)
```

@param dims Tuple of integers. Permutation pattern does not include the
batch dimension. Indexing starts at 1.
For instance, `(2, 1)` permutes the first and second dimensions
of the input.
@param object Object to compose the layer with. A tensor, array, or sequential model.
@param ... Passed on to the Python callable

@export
@family reshaping layers
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/layers/Permute>