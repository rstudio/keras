Callback to back up and restore the training state.

@description
`backup_and_restore` callback is intended to recover training from an
interruption that has happened in the middle of a `fit` execution, by
backing up the training states in a temporary checkpoint file, at the end of
each epoch. Each backup overwrites the previously written checkpoint file,
so at any given time there is at most one such checkpoint file for
backup/restoring purpose.

If training restarts before completion, the training state (which includes
the model weights and epoch number) is restored to the most recently saved
state at the beginning of a new `fit` run. At the completion of a
`fit` run, the temporary checkpoint file is deleted.

Note that the user is responsible to bring jobs back after the interruption.
This callback is important for the backup and restore mechanism for fault
tolerance purpose, and the model to be restored from a previous checkpoint
is expected to be the same as the one used to back up. If user changes
arguments passed to `compile` or `fit`, the checkpoint saved for fault tolerance
can become invalid.

# Examples



```r
callback_interrupting <- new_callback_class(
  "InterruptingCallback",
  on_epoch_begin = function(epoch, logs = NULL) {
    if (epoch == 4) {
      stop('Interrupting!')
    }
  }
)

callback <- callback_backup_and_restore(backup_dir = "/tmp/backup")
model <- keras_model_sequential() %>%
  layer_dense(10)
model %>% compile(optimizer = optimizer_sgd(), loss = 'mse')

tryCatch({
  model %>% fit(x = k_ones(c(5, 20)),
                y = k_zeros(5),
                epochs = 10, batch_size = 1,
                callbacks = list(callback, callback_interrupting()),
                verbose = 0)
}, python.builtin.RuntimeError = function(e) message("Interrupted!"))
```

```
## Interrupted!
```

```r
history <- model %>% fit(x = k_ones(c(5, 20)),
                         y = k_zeros(5),
                         epochs = 10, batch_size = 1,
                         callbacks = list(callback),
                         verbose = 0)

# Only 6 more epochs are run, since first training got interrupted at
# zero-indexed epoch 4, second training will continue from 4 to 9.
nrow(as.data.frame(history))
```

```
## [1] 10
```

@param backup_dir String, path of directory where to store the data
    needed to restore the model. The directory
    cannot be reused elsewhere to store other files, e.g. by the
    `backup_and_restore` callback of another training run,
    or by another callback (e.g. `callback_model_checkpoint`)
    of the same training run.
@param save_freq `"epoch"`, integer, or `FALSE`. When set to `"epoch"`,
  the callback saves the checkpoint at the end of each epoch.
  When set to an integer, the callback saves the checkpoint every
  `save_freq` batches. Set `save_freq = FALSE` only if using
  preemption checkpointing (i.e. with `save_before_preemption = TRUE`).
@param delete_checkpoint Boolean, defaults to `TRUE`. This `backup_and_restore`
  callback works by saving a checkpoint to back up the training state.
  If `delete_checkpoint = TRUE`, the checkpoint will be deleted after
  training is finished. Use `FALSE` if you'd like to keep the checkpoint
  for future usage.

@export
@family callback
@seealso
+ <https://www.tensorflow.org/api_docs/python/tf/keras/callbacks/BackupAndRestore>