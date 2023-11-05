Initializer that generates tensors initialized to 0.

# Examples
```python
# Standalone usage:
initializer = Zeros()
values = initializer(shape=(2, 2))
```

```python
# Usage in a Keras layer:
initializer = Zeros()
layer = Dense(units=3, kernel_initializer=initializer)
```

@export
@family initializer
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/initializers/Zeros>