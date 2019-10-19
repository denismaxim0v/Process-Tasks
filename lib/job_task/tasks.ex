defmodule JobTask.Tasks do
  use Ecto.Schema
  import Ecto.Changeset

  schema "task" do
    field :command, :string
    field :name, :string
    field :requires, {:array, :string}

    timestamps()
  end

  @doc false
  def changeset(tasks, attrs) do
    tasks
    |> cast(attrs, [:name, :command, :requires])
    |> validate_required([:name, :command])
  end
end
