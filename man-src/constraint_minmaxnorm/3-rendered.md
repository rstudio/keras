MinMaxNorm weight constraint.

@description
Constrains the weights incident to each hidden unit
to have the norm between a lower bound and an upper bound.

@param min_value the minimum norm for the incoming weights.
@param max_value the maximum norm for the incoming weights.
@param rate rate for enforcing the constraint: weights will be
    rescaled to yield
    `(1 - rate) * norm + rate * norm.clip(min_value, max_value)`.
    Effectively, this means that rate=1.0 stands for strict
    enforcement of the constraint, while rate<1.0 means that
    weights will be rescaled at each step to slowly move
    towards a value inside the desired interval.
@param axis integer, axis along which to calculate weight norms.
    For instance, in a `Dense` layer the weight matrix
    has shape `(input_dim, output_dim)`,
    set `axis` to `0` to constrain each weight vector
    of length `(input_dim,)`.
    In a `Conv2D` layer with `data_format="channels_last"`,
    the weight tensor has shape
    `(rows, cols, input_depth, output_depth)`,
    set `axis` to `[0, 1, 2]`
    to constrain the weights of each filter tensor of size
    `(rows, cols, input_depth)`.

@export
@family constraint
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/constraints/MinMaxNorm>