Upsampling layer for 1D inputs.

@description
Repeats each temporal step `size` times along the time axis.

# Examples
```python
input_shape = (2, 2, 3)
x = np.arange(np.prod(input_shape)).reshape(input_shape)
x
# [[[ 0  1  2]
#   [ 3  4  5]]
#  [[ 6  7  8]
#   [ 9 10 11]]]
y = keras.layers.UpSampling1D(size=2)(x)
y
# [[[ 0.  1.  2.]
#   [ 0.  1.  2.]
#   [ 3.  4.  5.]
#   [ 3.  4.  5.]]
```

 `[[ 6.  7.  8.]`
  `[ 6.  7.  8.]`
  `[ 9. 10. 11.]`
  `[ 9. 10. 11.]]]`

# Input Shape
3D tensor with shape: `(batch_size, steps, features)`.

# Output Shape
    3D tensor with shape: `(batch_size, upsampled_steps, features)`.

@param size Integer. Upsampling factor.
@param object Object to compose the layer with. A tensor, array, or sequential model.
@param ... Passed on to the Python callable

@export
@family reshaping layers
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/layers/UpSampling1D>