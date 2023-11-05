Computes the categorical hinge loss between `y_true` & `y_pred`.

@description
Formula:

```python
loss = maximum(neg - pos + 1, 0)
```

where `neg=maximum((1-y_true)*y_pred)` and `pos=sum(y_true*y_pred)`
Formula:

```python
loss = maximum(neg - pos + 1, 0)
```

where `neg=maximum((1-y_true)*y_pred)` and `pos=sum(y_true*y_pred)`

# Returns
Categorical hinge loss values with shape = `[batch_size, d0, .. dN-1]`.

# Examples
```python
y_true = np.random.randint(0, 3, size=(2,))
y_true = np.eye(np.max(y_true) + 1)[y_true]
y_pred = np.random.random(size=(2, 3))
loss = keras.losses.categorical_hinge(y_true, y_pred)
```

@param reduction Type of reduction to apply to the loss. In almost all cases
    this should be `"sum_over_batch_size"`.
    Supported options are `"sum"`, `"sum_over_batch_size"` or `None`.
@param name Optional name for the loss instance.
@param y_true The ground truth values. `y_true` values are expected to be
    either `{-1, +1}` or `{0, 1}` (i.e. a one-hot-encoded tensor) with
    shape = `[batch_size, d0, .. dN]`.
@param y_pred The predicted values with shape = `[batch_size, d0, .. dN]`.
@param ... Passed on to the Python callable

@export
@family loss
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/losses/CategoricalHinge>