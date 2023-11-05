Computes the logarithm of the hyperbolic cosine of the prediction error.

@description
Formula:
```python
loss = mean(log(cosh(y_pred - y_true)), axis=-1)
```

Note that `log(cosh(x))` is approximately equal to `(x ** 2) / 2` for small
`x` and to `abs(x) - log(2)` for large `x`. This means that 'logcosh' works
mostly like the mean squared error, but will not be so strongly affected by
the occasional wildly incorrect prediction.
Formula:

```python
error = y_pred - y_true
logcosh = mean(log((exp(error) + exp(-error))/2), axis=-1)`
```
where x is the error `y_pred - y_true`.

# Examples
```python
y_true = [[0., 1.], [0., 0.]]
y_pred = [[1., 1.], [0., 0.]]
loss = keras.losses.log_cosh(y_true, y_pred)
# 0.108
```

# Returns
    Logcosh error values with shape = `[batch_size, d0, .. dN-1]`.

@param reduction Type of reduction to apply to loss. Options are `"sum"`,
    `"sum_over_batch_size"` or `None`. Defaults to
    `"sum_over_batch_size"`.
@param name Optional name for the instance.
@param y_true Ground truth values with shape = `[batch_size, d0, .. dN]`.
@param y_pred The predicted values with shape = `[batch_size, d0, .. dN]`.
@param ... Passed on to the Python callable

@export
@family loss
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/losses/LogCosh>