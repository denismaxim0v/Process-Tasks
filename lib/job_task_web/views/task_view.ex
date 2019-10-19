defmodule JobTaskWeb.TaskView do
  @moduledoc false
  use JobTaskWeb, :view
  alias JobTaskWeb.TaskView

  def render("tasks.json", %{tasks: tasks}) do
    render_many(tasks, TaskView, "task.json")
  end

  def render("task.json", %{task: task}) do
    %{name: task.name, command: task.command}
  end
end