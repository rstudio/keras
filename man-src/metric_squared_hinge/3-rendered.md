Computes the hinge metric between `y_true` and `y_pred`.

@description
Formula:

```python
loss = mean(square(maximum(1 - y_true * y_pred, 0)), axis=-1)
```
`y_true` values are expected to be -1 or 1. If binary (0 or 1) labels are
provided we will convert them to -1 or 1.

# Usage
Standalone usage:

```python
m = keras.metrics.SquaredHinge()
m.update_state([[0, 1], [0, 0]], [[0.6, 0.4], [0.4, 0.6]])
m.result()
# 1.86
m.reset_state()
m.update_state([[0, 1], [0, 0]], [[0.6, 0.4], [0.4, 0.6]],
               sample_weight=[1, 0])
m.result()
# 1.46
```

# Returns
Squared hinge loss values with shape = `[batch_size, d0, .. dN-1]`.

# Examples
```python
y_true = np.random.choice([-1, 1], size=(2, 3))
y_pred = np.random.random(size=(2, 3))
loss = keras.losses.squared_hinge(y_true, y_pred)
```

@param name (Optional) string name of the metric instance.
@param dtype (Optional) data type of the metric result.
@param y_true The ground truth values. `y_true` values are expected to be -1
    or 1. If binary (0 or 1) labels are provided we will convert them
    to -1 or 1 with shape = `[batch_size, d0, .. dN]`.
@param y_pred The predicted values with shape = `[batch_size, d0, .. dN]`.
@param ... Passed on to the Python callable

@export
@family metric
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/metrics/SquaredHinge>