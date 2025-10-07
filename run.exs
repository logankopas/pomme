
Logger.add_backend({LoggerFileBackend, :debug})
Logger.configure_backend({LoggerFileBackend, :debug},
  path: "./debug.log",
  level: :debug
)

Ratatouille.run(RenderingDemo)
