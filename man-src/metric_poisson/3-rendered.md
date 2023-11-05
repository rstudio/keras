Computes the Poisson metric between `y_true` and `y_pred`.

@description
Formula:

```python
loss = y_pred - y_true * log(y_pred)
```
Formula:

```python
metric = y_pred - y_true * log(y_pred)
```

# Examples
```python
y_true = np.random.randint(0, 2, size=(2, 3))
y_pred = np.random.random(size=(2, 3))
loss = keras.losses.poisson(y_true, y_pred)
assert loss.shape == (2,)
y_pred = y_pred + 1e-7
assert np.allclose(
    loss, np.mean(y_pred - y_true * np.log(y_pred), axis=-1),
    atol=1e-5)
```
Standalone usage:

```python
m = keras.metrics.Poisson()
m.update_state([[0, 1], [0, 0]], [[1, 1], [0, 0]])
m.result()
# 0.49999997
```

```python
m.reset_state()
m.update_state([[0, 1], [0, 0]], [[1, 1], [0, 0]],
               sample_weight=[1, 0])
m.result()
# 0.99999994
```

Usage with `compile()` API:

```python
model.compile(optimizer='sgd',
              loss='mse',
              metrics=[keras.metrics.Poisson()])
```

# Returns
Poisson loss values with shape = `[batch_size, d0, .. dN-1]`.

@param name (Optional) string name of the metric instance.
@param dtype (Optional) data type of the metric result.
@param y_true Ground truth values. shape = `[batch_size, d0, .. dN]`.
@param y_pred The predicted values. shape = `[batch_size, d0, .. dN]`.
@param ... Passed on to the Python callable

@export
@family metric
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/metrics/Poisson>