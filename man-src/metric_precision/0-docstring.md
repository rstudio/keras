Computes the precision of the predictions with respect to the labels.

The metric creates two local variables, `true_positives` and
`false_positives` that are used to compute the precision. This value is
ultimately returned as `precision`, an idempotent operation that simply
divides `true_positives` by the sum of `true_positives` and
`false_positives`.

If `sample_weight` is `None`, weights default to 1.
Use `sample_weight` of 0 to mask values.

If `top_k` is set, we'll calculate precision as how often on average a class
among the top-k classes with the highest predicted values of a batch entry
is correct and can be found in the label for that entry.

If `class_id` is specified, we calculate precision by considering only the
entries in the batch for which `class_id` is above the threshold and/or in
the top-k highest predictions, and computing the fraction of them for which
`class_id` is indeed a correct label.

Args:
    thresholds: (Optional) A float value, or a Python list/tuple of float
        threshold values in `[0, 1]`. A threshold is compared with
        prediction values to determine the truth value of predictions (i.e.,
        above the threshold is `True`, below is `False`). If used with a
        loss function that sets `from_logits=True` (i.e. no sigmoid applied
        to predictions), `thresholds` should be set to 0. One metric value
        is generated for each threshold value. If neither `thresholds` nor
        `top_k` are set, the default is to calculate precision with
        `thresholds=0.5`.
    top_k: (Optional) Unset by default. An int value specifying the top-k
        predictions to consider when calculating precision.
    class_id: (Optional) Integer class ID for which we want binary metrics.
        This must be in the half-open interval `[0, num_classes)`, where
        `num_classes` is the last dimension of predictions.
    name: (Optional) string name of the metric instance.
    dtype: (Optional) data type of the metric result.

Usage:

Standalone usage:

>>> m = keras.metrics.Precision()
>>> m.update_state([0, 1, 1, 1], [1, 0, 1, 1])
>>> m.result()
0.6666667

>>> m.reset_state()
>>> m.update_state([0, 1, 1, 1], [1, 0, 1, 1], sample_weight=[0, 0, 1, 0])
>>> m.result()
1.0

>>> # With top_k=2, it will calculate precision over y_true[:2]
>>> # and y_pred[:2]
>>> m = keras.metrics.Precision(top_k=2)
>>> m.update_state([0, 0, 1, 1], [1, 1, 1, 1])
>>> m.result()
0.0

>>> # With top_k=4, it will calculate precision over y_true[:4]
>>> # and y_pred[:4]
>>> m = keras.metrics.Precision(top_k=4)
>>> m.update_state([0, 0, 1, 1], [1, 1, 1, 1])
>>> m.result()
0.5

Usage with `compile()` API:

```python
model.compile(optimizer='sgd',
              loss='mse',
              metrics=[keras.metrics.Precision()])
```

Usage with a loss with `from_logits=True`:

```python
model.compile(optimizer='adam',
              loss=keras.losses.BinaryCrossentropy(from_logits=True),
              metrics=[keras.metrics.Precision(thresholds=0)])
```