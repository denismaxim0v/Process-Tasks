defmodule JobTaskWeb.TaskController do
  use JobTaskWeb, :controller

  alias JobTask.Processor


  def process_job(conn, %{"tasks" => params}) do
    with {:ok, tasks} <- Processor.process_job(params) do
      case get_format(conn) do
        "json" ->
          conn
          |> put_status(:ok)
          |> render("tasks.json", tasks: tasks)

        "text" ->
          bash_script = format_commands(tasks)

          conn
          |> put_status(:ok)
          |> text(bash_script)
      end
    end
  end

  defp format_commands(tasks) do
    command_list =
      tasks
      |> Enum.map(fn x -> "#{x.command}\r\n" end)

    header = "#!/usr/bin/env bash\r\n"
    [header | command_list]
  end
end
