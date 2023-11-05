Computes Kullback-Leibler divergence loss between `y_true` & `y_pred`.

Formula:

```python
loss = y_true * log(y_true / y_pred)
```

Args:
    reduction: Type of reduction to apply to the loss. In almost all cases
        this should be `"sum_over_batch_size"`.
        Supported options are `"sum"`, `"sum_over_batch_size"` or `None`.
    name: Optional name for the loss instance.