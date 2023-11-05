Initializer that adapts its scale to the shape of its input tensors.

With `distribution="truncated_normal" or "untruncated_normal"`, samples are
drawn from a truncated/untruncated normal distribution with a mean of zero
and a standard deviation (after truncation, if used) `stddev = sqrt(scale /
n)`, where `n` is:

- number of input units in the weight tensor, if `mode="fan_in"`
- number of output units, if `mode="fan_out"`
- average of the numbers of input and output units, if `mode="fan_avg"`

With `distribution="uniform"`, samples are drawn from a uniform distribution
within `[-limit, limit]`, where `limit = sqrt(3 * scale / n)`.

Examples:

>>> # Standalone usage:
>>> initializer = VarianceScaling(
    scale=0.1, mode='fan_in', distribution='uniform')
>>> values = initializer(shape=(2, 2))

>>> # Usage in a Keras layer:
>>> initializer = VarianceScaling(
    scale=0.1, mode='fan_in', distribution='uniform')
>>> layer = Dense(3, kernel_initializer=initializer)

Args:
    scale: Scaling factor (positive float).
    mode: One of `"fan_in"`, `"fan_out"`, `"fan_avg"`.
    distribution: Random distribution to use.
        One of `"truncated_normal"`, `"untruncated_normal"`, or `"uniform"`.
    seed: A Python integer or instance of
        `keras.backend.SeedGenerator`.
        Used to make the behavior of the initializer
        deterministic. Note that an initializer seeded with an integer
        or `None` (unseeded) will produce the same random values
        across multiple calls. To get different random values
        across multiple calls, use as seed an instance
        of `keras.backend.SeedGenerator`.