Computes Kullback-Leibler divergence metric between `y_true` and

@description
Formula:

```python
loss = y_true * log(y_true / y_pred)
```
`y_pred`.

Formula:

```python
metric = y_true * log(y_true / y_pred)
```

# Usage
Standalone usage:

```python
m = keras.metrics.KLDivergence()
m.update_state([[0, 1], [0, 0]], [[0.6, 0.4], [0.4, 0.6]])
m.result()
# 0.45814306
```

```python
m.reset_state()
m.update_state([[0, 1], [0, 0]], [[0.6, 0.4], [0.4, 0.6]],
               sample_weight=[1, 0])
m.result()
# 0.9162892
```

Usage with `compile()` API:

```python
model.compile(optimizer='sgd',
              loss='mse',
              metrics=[keras.metrics.KLDivergence()])
```

# Returns
KL Divergence loss values with shape = `[batch_size, d0, .. dN-1]`.

# Examples
```python
y_true = np.random.randint(0, 2, size=(2, 3)).astype(np.float32)
y_pred = np.random.random(size=(2, 3))
loss = keras.losses.kl_divergence(y_true, y_pred)
assert loss.shape == (2,)
y_true = ops.clip(y_true, 1e-7, 1)
y_pred = ops.clip(y_pred, 1e-7, 1)
assert np.array_equal(
    loss, np.sum(y_true * np.log(y_true / y_pred), axis=-1))
```

@param name (Optional) string name of the metric instance.
@param dtype (Optional) data type of the metric result.
@param y_true Tensor of true targets.
@param y_pred Tensor of predicted targets.
@param ... Passed on to the Python callable

@export
@family metric
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/metrics/KLDivergence>