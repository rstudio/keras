Returns a tensor of shape `shape` where `indices` are set to `values`.

@description
At a high level, this operation does `zeros[indices] = updates` and
returns the output. It is equivalent to:

```python
zeros = keras.ops.zeros(shape)
output = keras.ops.scatter_update(zeros, indices, values)
```

# Examples
```python
indices = [[0, 1], [1, 1]]
values = np.array([1., 1.])
keras.ops.scatter(indices, values, shape=(2, 2))
# array([[0., 1.],
#        [0., 1.]])
```

@param indices A tensor or list/tuple specifying
    indices for the values in `values`.
@param values A tensor, the values to be set at `indices`.
@param shape Shape of the output tensor.

@export
@family ops
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/ops/scatter>