Applies the rectified linear unit activation function.

@description
With default values, this returns the standard ReLU activation:
`max(x, 0)`, the element-wise maximum of 0 and the input tensor.

Modifying default parameters allows you to use non-zero thresholds,
change the max value of the activation,
and to use a non-zero multiple of the input for values below the threshold.

# Examples

```r
x <- c(-10, -5, 0, 5, 10)
activation_relu(x)
```

```
## tf.Tensor([ 0.  0.  0.  5. 10.], shape=(5), dtype=float32)
```

```r
activation_relu(x, negative_slope = 0.5)
```

```
## tf.Tensor([-5.  -2.5  0.   5.  10. ], shape=(5), dtype=float32)
```

```r
activation_relu(x, max_value = 5)
```

```
## tf.Tensor([0. 0. 0. 5. 5.], shape=(5), dtype=float32)
```

```r
activation_relu(x, threshold = 5)
```

```
## tf.Tensor([-0. -0.  0.  0. 10.], shape=(5), dtype=float32)
```

# Returns
    A tensor with the same shape and dtype as input `x`.

@param x Input tensor.
@param negative_slope A `numeric` that controls the slope
    for values lower than the threshold.
@param max_value A `numeric` that sets the saturation threshold (the largest
    value the function will return).
@param threshold A `numeric` giving the threshold value of the activation
    function below which values will be damped or set to zero.

@export
@family activation functions
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/activations/relu>