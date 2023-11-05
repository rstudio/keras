Approximates the AUC (Area under the curve) of the ROC or PR curves.

The AUC (Area under the curve) of the ROC (Receiver operating
characteristic; default) or PR (Precision Recall) curves are quality
measures of binary classifiers. Unlike the accuracy, and like cross-entropy
losses, ROC-AUC and PR-AUC evaluate all the operational points of a model.

This class approximates AUCs using a Riemann sum. During the metric
accumulation phrase, predictions are accumulated within predefined buckets
by value. The AUC is then computed by interpolating per-bucket averages.
These buckets define the evaluated operational points.

This metric creates four local variables, `true_positives`,
`true_negatives`, `false_positives` and `false_negatives` that are used to
compute the AUC.  To discretize the AUC curve, a linearly spaced set of
thresholds is used to compute pairs of recall and precision values. The area
under the ROC-curve is therefore computed using the height of the recall
values by the false positive rate, while the area under the PR-curve is the
computed using the height of the precision values by the recall.

This value is ultimately returned as `auc`, an idempotent operation that
computes the area under a discretized curve of precision versus recall
values (computed using the aforementioned variables). The `num_thresholds`
variable controls the degree of discretization with larger numbers of
thresholds more closely approximating the true AUC. The quality of the
approximation may vary dramatically depending on `num_thresholds`. The
`thresholds` parameter can be used to manually specify thresholds which
split the predictions more evenly.

For a best approximation of the real AUC, `predictions` should be
distributed approximately uniformly in the range `[0, 1]` (if
`from_logits=False`). The quality of the AUC approximation may be poor if
this is not the case. Setting `summation_method` to 'minoring' or 'majoring'
can help quantify the error in the approximation by providing lower or upper
bound estimate of the AUC.

If `sample_weight` is `None`, weights default to 1.
Use `sample_weight` of 0 to mask values.

Args:
    num_thresholds: (Optional) The number of thresholds to
        use when discretizing the roc curve. Values must be > 1.
        Defaults to `200`.
    curve: (Optional) Specifies the name of the curve to be computed,
        `'ROC'` (default) or `'PR'` for the Precision-Recall-curve.
    summation_method: (Optional) Specifies the [Riemann summation method](
          https://en.wikipedia.org/wiki/Riemann_sum) used.
          'interpolation' (default) applies mid-point summation scheme for
          `ROC`.  For PR-AUC, interpolates (true/false) positives but not
          the ratio that is precision (see Davis & Goadrich 2006 for
          details); 'minoring' applies left summation for increasing
          intervals and right summation for decreasing intervals; 'majoring'
          does the opposite.
    name: (Optional) string name of the metric instance.
    dtype: (Optional) data type of the metric result.
    thresholds: (Optional) A list of floating point values to use as the
        thresholds for discretizing the curve. If set, the `num_thresholds`
        parameter is ignored. Values should be in `[0, 1]`. Endpoint
        thresholds equal to {`-epsilon`, `1+epsilon`} for a small positive
        epsilon value will be automatically included with these to correctly
        handle predictions equal to exactly 0 or 1.
    multi_label: boolean indicating whether multilabel data should be
        treated as such, wherein AUC is computed separately for each label
        and then averaged across labels, or (when `False`) if the data
        should be flattened into a single label before AUC computation. In
        the latter case, when multilabel data is passed to AUC, each
        label-prediction pair is treated as an individual data point. Should
        be set to False for multi-class data.
    num_labels: (Optional) The number of labels, used when `multi_label` is
        True. If `num_labels` is not specified, then state variables get
        created on the first call to `update_state`.
    label_weights: (Optional) list, array, or tensor of non-negative weights
        used to compute AUCs for multilabel data. When `multi_label` is
        True, the weights are applied to the individual label AUCs when they
        are averaged to produce the multi-label AUC. When it's False, they
        are used to weight the individual label predictions in computing the
        confusion matrix on the flattened data. Note that this is unlike
        `class_weights` in that `class_weights` weights the example
        depending on the value of its label, whereas `label_weights` depends
        only on the index of that label before flattening; therefore
        `label_weights` should not be used for multi-class data.
    from_logits: boolean indicating whether the predictions (`y_pred` in
    `update_state`) are probabilities or sigmoid logits. As a rule of thumb,
    when using a keras loss, the `from_logits` constructor argument of the
    loss should match the AUC `from_logits` constructor argument.

Usage:

Standalone usage:

>>> m = keras.metrics.AUC(num_thresholds=3)
>>> m.update_state([0, 0, 1, 1], [0, 0.5, 0.3, 0.9])
>>> # threshold values are [0 - 1e-7, 0.5, 1 + 1e-7]
>>> # tp = [2, 1, 0], fp = [2, 0, 0], fn = [0, 1, 2], tn = [0, 2, 2]
>>> # tp_rate = recall = [1, 0.5, 0], fp_rate = [1, 0, 0]
>>> # auc = ((((1 + 0.5) / 2) * (1 - 0)) + (((0.5 + 0) / 2) * (0 - 0)))
>>> #     = 0.75
>>> m.result()
0.75

>>> m.reset_state()
>>> m.update_state([0, 0, 1, 1], [0, 0.5, 0.3, 0.9],
...                sample_weight=[1, 0, 0, 1])
>>> m.result()
1.0

Usage with `compile()` API:

```python
# Reports the AUC of a model outputting a probability.
model.compile(optimizer='sgd',
              loss=keras.losses.BinaryCrossentropy(),
              metrics=[keras.metrics.AUC()])

# Reports the AUC of a model outputting a logit.
model.compile(optimizer='sgd',
              loss=keras.losses.BinaryCrossentropy(from_logits=True),
              metrics=[keras.metrics.AUC(from_logits=True)])
```