Returns numbers spaced evenly on a log scale.

@description
In linear space, the sequence starts at `base ** start` and ends with
`base ** stop` (see `endpoint` below).

# Note
Torch backend does not support `axis` argument.

# Returns
    A tensor of evenly spaced samples on a log scale.

@param start The starting value of the sequence.
@param stop The final value of the sequence, unless `endpoint` is `False`.
    In that case, `num + 1` values are spaced over the interval in
    log-space, of which all but the last (a sequence of length `num`)
    are returned.
@param num Number of samples to generate. Defaults to `50`.
@param endpoint If `True`, `stop` is the last sample. Otherwise, it is not
    included. Defaults to`True`.
@param base The base of the log space. Defaults to `10`.
@param dtype The type of the output tensor.
@param axis The axis in the result to store the samples. Relevant only
    if start or stop are array-like.

@export
@family ops
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/ops/logspace>