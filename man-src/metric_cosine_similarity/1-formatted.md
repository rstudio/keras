Computes the cosine similarity between the labels and predictions.

@description
Formula:

```python
loss = sum(l2_norm(y_true) * l2_norm(y_pred))
```
See: [Cosine Similarity](https://en.wikipedia.org/wiki/Cosine_similarity).
This metric keeps the average cosine similarity between `predictions` and
`labels` over a stream of data.

# Examples
Standalone usage:

```python
# l2_norm(y_true) = [[0., 1.], [1./1.414, 1./1.414]]
# l2_norm(y_pred) = [[1., 0.], [1./1.414, 1./1.414]]
# l2_norm(y_true) . l2_norm(y_pred) = [[0., 0.], [0.5, 0.5]]
# result = mean(sum(l2_norm(y_true) . l2_norm(y_pred), axis=1))
#        = ((0. + 0.) +  (0.5 + 0.5)) / 2
m = keras.metrics.CosineSimilarity(axis=1)
m.update_state([[0., 1.], [1., 1.]], [[1., 0.], [1., 1.]])
m.result()
# 0.49999997
m.reset_state()
m.update_state([[0., 1.], [1., 1.]], [[1., 0.], [1., 1.]],
               sample_weight=[0.3, 0.7])
m.result()
# 0.6999999
```

Usage with `compile()` API:

```python
model.compile(
    optimizer='sgd',
    loss='mse',
    metrics=[keras.metrics.CosineSimilarity(axis=1)])
```

@param name (Optional) string name of the metric instance.
@param dtype (Optional) data type of the metric result.
@param axis (Optional) Defaults to `-1`. The dimension along which the cosine
    similarity is computed.
@param ... Passed on to the Python callable

@export
@family metric
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/metrics/CosineSimilarity>