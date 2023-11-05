Apply additive zero-centered Gaussian noise.

@description
This is useful to mitigate overfitting
(you could see it as a form of random data augmentation).
Gaussian Noise (GS) is a natural choice as corruption process
for real valued inputs.

As it is a regularization layer, it is only active at training time.

# Call Arguments
- `inputs`: Input tensor (of any rank).
- `training`: Python boolean indicating whether the layer should behave in
    training mode (adding noise) or in inference mode (doing nothing).

@param stddev Float, standard deviation of the noise distribution.
@param seed Integer, optional random seed to enable deterministic behavior.
@param object Object to compose the layer with. A tensor, array, or sequential model.
@param ... Passed on to the Python callable

@export
@family regularization layers
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/layers/GaussianNoise>