Identity layer.

@description
This layer should be used as a placeholder when no operation is to be
performed. The layer just returns its `inputs` argument as output.

@param object Object to compose the layer with. A tensor, array, or sequential model.
@param ... Passed on to the Python callable

@export
@family core layers
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/layers/Identity>