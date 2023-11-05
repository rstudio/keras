Saves an image stored as a NumPy array to a path or file object.

@param path Path or file object.
@param x NumPy array.
@param data_format Image data format, either `"channels_first"` or
    `"channels_last"`.
@param file_format Optional file format override. If omitted, the format to
    use is determined from the filename extension. If a file object was
    used instead of a filename, this parameter should always be used.
@param scale Whether to rescale image values to be within `[0, 255]`.
@param ... Additional keyword arguments passed to `PIL.Image.save()`.

@export
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/utils/save_img>