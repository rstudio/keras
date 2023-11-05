Computes best precision where recall is >= specified value.

@description
This metric creates four local variables, `true_positives`,
`true_negatives`, `false_positives` and `false_negatives` that are used to
compute the precision at the given recall. The threshold for the given
recall value is computed and used to evaluate the corresponding precision.

If `sample_weight` is `None`, weights default to 1.
Use `sample_weight` of 0 to mask values.

If `class_id` is specified, we calculate precision by considering only the
entries in the batch for which `class_id` is above the threshold
predictions, and computing the fraction of them for which `class_id` is
indeed a correct label.

# Usage
Standalone usage:

```python
m = keras.metrics.PrecisionAtRecall(0.5)
m.update_state([0, 0, 0, 1, 1], [0, 0.3, 0.8, 0.3, 0.8])
m.result()
# 0.5
```

```python
m.reset_state()
m.update_state([0, 0, 0, 1, 1], [0, 0.3, 0.8, 0.3, 0.8],
               sample_weight=[2, 2, 2, 1, 1])
m.result()
# 0.33333333
```

Usage with `compile()` API:

```python
model.compile(
    optimizer='sgd',
    loss='mse',
    metrics=[keras.metrics.PrecisionAtRecall(recall=0.8)])
```

@param recall A scalar value in range `[0, 1]`.
@param num_thresholds (Optional) Defaults to 200. The number of thresholds to
    use for matching the given recall.
@param class_id (Optional) Integer class ID for which we want binary metrics.
    This must be in the half-open interval `[0, num_classes)`, where
    `num_classes` is the last dimension of predictions.
@param name (Optional) string name of the metric instance.
@param dtype (Optional) data type of the metric result.
@param ... Passed on to the Python callable

@export
@family metric
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/metrics/PrecisionAtRecall>