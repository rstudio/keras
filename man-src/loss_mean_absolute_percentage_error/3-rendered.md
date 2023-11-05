Computes the mean absolute percentage error between `y_true` & `y_pred`.

@description
Formula:

```python
loss = 100 * mean(abs((y_true - y_pred) / y_true), axis=-1)
```

Division by zero is prevented by dividing by `maximum(y_true, epsilon)`
where `epsilon = keras.backend.epsilon()`
(default to `1e-7`).
Formula:

```python
loss = 100 * mean(abs((y_true - y_pred) / y_true))
```

# Returns
Mean absolute percentage error values with shape = `[batch_size, d0, ..
dN-1]`.

# Examples
```python
y_true = np.random.random(size=(2, 3))
y_pred = np.random.random(size=(2, 3))
loss = keras.losses.mean_absolute_percentage_error(y_true, y_pred)
```

@param reduction Type of reduction to apply to the loss. In almost all cases
    this should be `"sum_over_batch_size"`.
    Supported options are `"sum"`, `"sum_over_batch_size"` or `None`.
@param name Optional name for the loss instance.
@param y_true Ground truth values with shape = `[batch_size, d0, .. dN]`.
@param y_pred The predicted values with shape = `[batch_size, d0, .. dN]`.
@param ... Passed on to the Python callable

@export
@family loss
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/losses/MeanAbsolutePercentageError>