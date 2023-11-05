Return evenly spaced numbers over a specified interval.

@description
Returns `num` evenly spaced samples, calculated over the interval
`[start, stop]`.

The endpoint of the interval can optionally be excluded.

# Note
Torch backend does not support `axis` argument.

# Returns
A tensor of evenly spaced numbers.
If `retstep` is `True`, returns `(samples, step)`

@param start The starting value of the sequence.
@param stop The end value of the sequence, unless `endpoint` is set to
    `False`. In that case, the sequence consists of all but the last
    of `num + 1` evenly spaced samples, so that `stop` is excluded.
    Note that the step size changes when `endpoint` is `False`.
@param num Number of samples to generate. Defaults to `50`. Must be
    non-negative.
@param endpoint If `True`, `stop` is the last sample. Otherwise, it is
    not included. Defaults to`True`.
@param retstep If `True`, return `(samples, step)`, where `step` is the
    spacing between samples.
@param dtype The type of the output tensor.
@param axis The axis in the result to store the samples. Relevant only if
    start or stop are array-like. Defaults to `0`.

@export
@family ops
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/ops/linspace>