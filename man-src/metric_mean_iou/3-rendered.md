Computes the mean Intersection-Over-Union metric.

@description
Formula:

```python
iou = true_positives / (true_positives + false_positives + false_negatives)
```
Intersection-Over-Union is a common evaluation metric for semantic image
segmentation.

To compute IoUs, the predictions are accumulated in a confusion matrix,
weighted by `sample_weight` and the metric is then calculated from it.

If `sample_weight` is `None`, weights default to 1.
Use `sample_weight` of 0 to mask values.

Note that this class first computes IoUs for all individual classes, then
returns the mean of these values.

# Examples
Standalone usage:

```python
# cm = [[1, 1],
#        [1, 1]]
# sum_row = [2, 2], sum_col = [2, 2], true_positives = [1, 1]
# iou = true_positives / (sum_row + sum_col - true_positives))
# result = (1 / (2 + 2 - 1) + 1 / (2 + 2 - 1)) / 2 = 0.33
m = keras.metrics.MeanIoU(num_classes=2)
m.update_state([0, 0, 1, 1], [0, 1, 0, 1])
m.result()
# 0.33333334
```

```python
m.reset_state()
m.update_state([0, 0, 1, 1], [0, 1, 0, 1],
               sample_weight=[0.3, 0.3, 0.3, 0.1])
m.result().numpy()
# 0.23809525
```

Usage with `compile()` API:

```python
model.compile(
    optimizer='sgd',
    loss='mse',
    metrics=[keras.metrics.MeanIoU(num_classes=2)])
```

@param num_classes The possible number of labels the prediction task can have.
    This value must be provided, since a confusion matrix of dimension =
    `[num_classes, num_classes]` will be allocated.
@param name (Optional) string name of the metric instance.
@param dtype (Optional) data type of the metric result.
@param ignore_class Optional integer. The ID of a class to be ignored during
    metric computation. This is useful, for example, in segmentation
    problems featuring a "void" class (commonly -1 or 255) in
    segmentation maps. By default (`ignore_class=None`), all classes are
    considered.
@param sparse_y_true Whether labels are encoded using integers or
    dense floating point vectors. If `False`, the `argmax` function
    is used to determine each sample's most likely associated label.
@param sparse_y_pred Whether predictions are encoded using integers or
    dense floating point vectors. If `False`, the `argmax` function
    is used to determine each sample's most likely associated label.
@param axis (Optional) The dimension containing the logits. Defaults to `-1`.
@param ... Passed on to the Python callable

@export
@family metric
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/metrics/MeanIoU>