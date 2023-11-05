Check if interactive logging is enabled.

To switch between writing logs to stdout and `absl.logging`, you may use
`keras.config.enable_interactive_logging()` and
`keras.config.disable_interactie_logging()`.

Returns:
    Boolean, `True` if interactive logging is enabled,
    and `False` otherwise.