Lecun uniform initializer.

@description
Draws samples from a uniform distribution within `[-limit, limit]`, where
`limit = sqrt(3 / fan_in)` (`fan_in` is the number of input units in the
weight tensor).

# Examples
```python
# Standalone usage:
initializer = LecunUniform()
values = initializer(shape=(2, 2))
```

```python
# Usage in a Keras layer:
initializer = LecunUniform()
layer = Dense(3, kernel_initializer=initializer)
```

# Reference
- [Klambauer et al., 2017](https://arxiv.org/abs/1706.02515)

@param seed A Python integer or instance of
`keras.backend.SeedGenerator`.
Used to make the behavior of the initializer
deterministic. Note that an initializer seeded with an integer
or `None` (unseeded) will produce the same random values
across multiple calls. To get different random values
across multiple calls, use as seed an instance
of `keras.backend.SeedGenerator`.

@export
@family initializer
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/initializers/LecunUniform>