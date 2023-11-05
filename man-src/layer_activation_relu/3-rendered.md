Rectified Linear Unit activation function layer.

@description
Formula:
``` python
f(x) = max(x,0)
f(x) = max_value if x >= max_value
f(x) = x if threshold <= x < max_value
f(x) = negative_slope * (x - threshold) otherwise
```

# Examples
``` python
relu_layer = keras.layers.activations.ReLU(
    max_value=10,
    negative_slope=0.5,
    threshold=0,
)
input = np.array([-10, -5, 0.0, 5, 10])
result = relu_layer(input)
# result = [-5. , -2.5,  0. ,  5. , 10.]
```

@param max_value Float >= 0. Maximum activation value. None means unlimited.
    Defaults to `None`.
@param negative_slope Float >= 0. Negative slope coefficient.
    Defaults to `0.0`.
@param threshold Float >= 0. Threshold value for thresholded activation.
    Defaults to `0.0`.
@param ... Base layer keyword arguments, such as `name` and `dtype`.
@param object Object to compose the layer with. A tensor, array, or sequential model.

@export
@family activations layers
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/layers/ReLU>