Calculates how often predictions match binary labels.

@description
This metric creates two local variables, `total` and `count` that are used
to compute the frequency with which `y_pred` matches `y_true`. This
frequency is ultimately returned as `binary accuracy`: an idempotent
operation that simply divides `total` by `count`.

If `sample_weight` is `None`, weights default to 1.
Use `sample_weight` of 0 to mask values.

# Usage
Standalone usage:

```python
m = keras.metrics.BinaryAccuracy()
m.update_state([[1], [1], [0], [0]], [[0.98], [1], [0], [0.6]])
m.result()
# 0.75
```

```python
m.reset_state()
m.update_state([[1], [1], [0], [0]], [[0.98], [1], [0], [0.6]],
               sample_weight=[1, 0, 0, 1])
m.result()
# 0.5
```

Usage with `compile()` API:

```python
model.compile(optimizer='sgd',
              loss='binary_crossentropy',
              metrics=[keras.metrics.BinaryAccuracy()])
```

@param name (Optional) string name of the metric instance.
@param dtype (Optional) data type of the metric result.
@param threshold (Optional) Float representing the threshold for deciding
whether prediction values are 1 or 0.
@param y_true Tensor of true targets.
@param y_pred Tensor of predicted targets.
@param ... Passed on to the Python callable

@export
@family metric
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/metrics/BinaryAccuracy>