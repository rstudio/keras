Computes the max of segments in a tensor.

# Returns
A tensor containing the max of segments, where each element
represents the max of the corresponding segment in `data`.

# Examples
```python
data = keras.ops.convert_to_tensor([1, 2, 10, 20, 100, 200])
segment_ids = keras.ops.convert_to_tensor([0, 0, 1, 1, 2, 2])
num_segments = 3
keras.ops.segment_max(data, segment_ids, num_segments)
# array([2, 20, 200], dtype=int32)
```

@param data Input tensor.
@param segment_ids A 1-D tensor containing segment indices for each
    element in `data`.
@param num_segments An integer representing the total number of
    segments. If not specified, it is inferred from the maximum
    value in `segment_ids`.
@param sorted A boolean indicating whether `segment_ids` is sorted.
    Defaults to`False`.

@export
@family ops
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/ops/segment_max>