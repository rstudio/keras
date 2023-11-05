Draw random integers from a uniform distribution.

@description
The generated values follow a uniform distribution in the range
`[minval, maxval)`. The lower bound `minval` is included in the range,
while the upper bound `maxval` is excluded.

`dtype` must be an integer type.

@param shape The shape of the random values to generate.
@param minval Floats, defaults to 0. Lower bound of the range of
    random values to generate (inclusive).
@param maxval Floats, defaults to 1. Upper bound of the range of
    random values to generate (exclusive).
@param dtype Optional dtype of the tensor. Only integer types are
    supported. If not specified, `keras.config.floatx()` is used,
    which defaults to `float32` unless you configured it otherwise (via
    `keras.config.set_floatx(float_dtype)`)
@param seed A Python integer or instance of
    `keras.random.SeedGenerator`.
    Used to make the behavior of the initializer
    deterministic. Note that an initializer seeded with an integer
    or None (unseeded) will produce the same random values
    across multiple calls. To get different random values
    across multiple calls, use as seed an instance
    of `keras.random.SeedGenerator`.

@export
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/random/randint>