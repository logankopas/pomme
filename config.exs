
config :logger,
  backends: [
    {LoggerFileBackend, :info},
    {LoggerFileBackend, :error}
  ]

config :logger, :info,
  path: "./info.log",
  level: :info

config :logger, :error,
  path: "./error.log",
  level: :error
