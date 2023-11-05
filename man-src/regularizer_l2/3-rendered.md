A regularizer that applies a L2 regularization penalty.

@description
The L2 regularization penalty is computed as:
`loss = l2 * reduce_sum(square(x))`

L2 may be passed to a layer as a string identifier:

```python
dense = Dense(3, kernel_regularizer='l2')
```

In this case, the default value used is `l2=0.01`.

@param l2 float, L2 regularization factor.

@export
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/regularizers/L2>