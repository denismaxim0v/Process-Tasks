defmodule JobTask.Repo.Migrations.CreateTask do
  use Ecto.Migration

  def change do
    create table(:task) do
      add :name, :string
      add :command, :string
      add :requires, {:array, :string}

      timestamps()
    end

  end
end
