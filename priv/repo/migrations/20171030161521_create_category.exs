defmodule Annotate.Repo.Migrations.CreateCategory do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :name, :string, null: false

      timestamps()
    end

    create unique_index(:categories, [:name])

    def alphabetical(query) do
      from c in query, order_by: c.name
    end

    def names_and_ids(query) do
      from c in query, select: {c.name, c.id}
    end
  end
end
