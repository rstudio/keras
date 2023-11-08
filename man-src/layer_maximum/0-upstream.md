keras.layers.Maximum
__signature__
(*args, **kwargs)
__doc__
Computes element-wise maximum on a list of inputs.

It takes as input a list of tensors, all of the same shape,
and returns a single tensor (also of the same shape).

Examples:

>>> input_shape = (2, 3, 4)
>>> x1 = np.random.rand(*input_shape)
>>> x2 = np.random.rand(*input_shape)
>>> y = keras.layers.Maximum()([x1, x2])

Usage in a Keras model:

>>> input1 = keras.layers.Input(shape=(16,))
>>> x1 = keras.layers.Dense(8, activation='relu')(input1)
>>> input2 = keras.layers.Input(shape=(32,))
>>> x2 = keras.layers.Dense(8, activation='relu')(input2)
>>> # equivalent to `y = keras.layers.maximum([x1, x2])`
>>> y = keras.layers.Maximum()([x1, x2])
>>> out = keras.layers.Dense(4)(y)
>>> model = keras.models.Model(inputs=[input1, input2], outputs=out)