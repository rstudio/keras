keras.initializers.HeNormal
__signature__
(seed=None)
__doc__
He normal initializer.

It draws samples from a truncated normal distribution centered on 0 with
`stddev = sqrt(2 / fan_in)` where `fan_in` is the number of input units in
the weight tensor.

Examples:

>>> # Standalone usage:
>>> initializer = HeNormal()
>>> values = initializer(shape=(2, 2))

>>> # Usage in a Keras layer:
>>> initializer = HeNormal()
>>> layer = Dense(3, kernel_initializer=initializer)

Args:
    seed: A Python integer or instance of
        `keras.backend.SeedGenerator`.
        Used to make the behavior of the initializer
        deterministic. Note that an initializer seeded with an integer
        or `None` (unseeded) will produce the same random values
        across multiple calls. To get different random values
        across multiple calls, use as seed an instance
        of `keras.backend.SeedGenerator`.

Reference:

- [He et al., 2015](https://arxiv.org/abs/1502.01852)