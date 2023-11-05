Set the value of the fuzz factor used in numeric expressions.

# Examples
```python
keras.config.epsilon()
# 1e-07
```

```python
keras.config.set_epsilon(1e-5)
keras.config.epsilon()
# 1e-05
```

```python
# Set it back to the default value.
keras.config.set_epsilon(1e-7)
```

@param value float. New value of epsilon.

@export
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/config/set_epsilon>