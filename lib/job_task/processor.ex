defmodule JobTask.Processor do
  import Ecto.Query, warn: false

  alias JobTask.Tasks

  def parse_task(attrs) do
    %Tasks{}
    |> Tasks.changeset(attrs)
    |> Ecto.Changeset.apply_action(:insert)
  end

  def parse_tasks(tasks) do
    tasks
    |> Enum.map(fn x -> parse_task(x) end)
  end

  def process_job(params) do
    parsed_tasks = parse_tasks(params)

    tasks =
      parsed_tasks
      |> Enum.reduce(%{}, fn {_status, task}, acc -> Map.put(acc, task.name, task) end)
      |> sort_tasks

    {:ok, tasks}
  end

  defp sort_tasks(task_map) do
    task_map
    |> Enum.map(fn {_name, x} -> x end)
    |> Enum.sort_by(fn x ->
      case !is_nil(x.requires) do
        true ->
          Enum.map(x.requires, fn y -> String.to_integer(String.replace(y, ~r/[^\d]/, "")) end)
          |> Enum.sum()

        false ->
          x
      end
    end)
    |> Enum.sort_by(fn x -> !is_nil(x.requires) end)
  end
end
