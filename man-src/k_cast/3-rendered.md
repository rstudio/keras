Cast a tensor to the desired dtype.

# Returns
A tensor of the specified `dtype`.

# Examples
```python
x = keras.ops.arange(4)
x = keras.ops.cast(x, dtype="float16")
```

@param x A tensor or variable.
@param dtype The target type.

@export
@family ops
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/ops/cast>