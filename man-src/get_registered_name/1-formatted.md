Returns the name registered to an object within the Keras framework.

@description
This function is part of the Keras serialization and deserialization
framework. It maps objects to the string names associated with those objects
for serialization/deserialization.

# Returns
The name associated with the object, or the default Python name if the
object is not registered.

@param obj The object to look up.

@export
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/utils/get_registered_name>