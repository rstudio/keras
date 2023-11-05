Initializer that generates an orthogonal matrix.

@description
If the shape of the tensor to initialize is two-dimensional, it is
initialized with an orthogonal matrix obtained from the QR decomposition of
a matrix of random numbers drawn from a normal distribution. If the matrix
has fewer rows than columns then the output will have orthogonal rows.
Otherwise, the output will have orthogonal columns.

If the shape of the tensor to initialize is more than two-dimensional,
a matrix of shape `(shape[0] * ... * shape[n - 2], shape[n - 1])`
is initialized, where `n` is the length of the shape vector.
The matrix is subsequently reshaped to give a tensor of the desired shape.

# Examples
```python
# Standalone usage:
initializer = keras.initializers.Orthogonal()
values = initializer(shape=(2, 2))
```

```python
# Usage in a Keras layer:
initializer = keras.initializers.Orthogonal()
layer = keras.layers.Dense(3, kernel_initializer=initializer)
```

# Reference
- [Saxe et al., 2014](https://openreview.net/forum?id=_wzZwKpTDF_9C)

@param gain Multiplicative factor to apply to the orthogonal matrix.
@param seed A Python integer. Used to make the behavior of the initializer
    deterministic.

@export
@family initializer
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/initializers/OrthogonalInitializer>