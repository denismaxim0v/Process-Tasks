use Mix.Config

# Configure your database
config :job_task, JobTask.Repo,
  username: "postgres",
  password: "postgres",
  database: "job_task_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :job_task, JobTaskWeb.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
