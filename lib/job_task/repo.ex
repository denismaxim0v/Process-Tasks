defmodule JobTask.Repo do
  use Ecto.Repo,
    otp_app: :job_task,
    adapter: Ecto.Adapters.Postgres
end
