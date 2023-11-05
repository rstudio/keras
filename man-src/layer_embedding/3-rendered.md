Turns positive integers (indexes) into dense vectors of fixed size.

@description
e.g. `[[4], [20]] -> [[0.25, 0.1], [0.6, -0.2]]`

This layer can only be used on positive integer inputs of a fixed range.

# Examples
```python
model = keras.Sequential()
model.add(keras.layers.Embedding(1000, 64, input_length=10))
# The model will take as input an integer matrix of size (batch,
# input_length), and the largest integer (i.e. word index) in the input
# should be no larger than 999 (vocabulary size).
# Now model.output_shape is (None, 10, 64), where `None` is the batch
# dimension.
input_array = np.random.randint(1000, size=(32, 10))
model.compile('rmsprop', 'mse')
output_array = model.predict(input_array)
print(output_array.shape)
# (32, 10, 64)
```

# Input Shape
2D tensor with shape: `(batch_size, input_length)`.

# Output Shape
    3D tensor with shape: `(batch_size, input_length, output_dim)`.

@param input_dim Integer. Size of the vocabulary,
    i.e. maximum integer index + 1.
@param output_dim Integer. Dimension of the dense embedding.
@param embeddings_initializer Initializer for the `embeddings`
    matrix (see `keras.initializers`).
@param embeddings_regularizer Regularizer function applied to
    the `embeddings` matrix (see `keras.regularizers`).
@param embeddings_constraint Constraint function applied to
    the `embeddings` matrix (see `keras.constraints`).
@param mask_zero Boolean, whether or not the input value 0 is a special
    "padding" value that should be masked out.
    This is useful when using recurrent layers which
    may take variable length input. If this is `True`,
    then all subsequent layers in the model need
    to support masking or an exception will be raised.
    If mask_zero is set to True, as a consequence,
    index 0 cannot be used in the vocabulary (input_dim should
    equal size of vocabulary + 1).
@param object Object to compose the layer with. A tensor, array, or sequential model.
@param ... Passed on to the Python callable

@export
@family core layers
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/layers/Embedding>