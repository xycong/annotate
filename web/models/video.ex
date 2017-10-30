defmodule Annotate.Video do
  use Annotate.Web, :model

  schema "videos" do
    field :url, :string
    field :title, :string
    field :description, :string
    belongs_to :user, Annotate.User
    belongs_to :category, Annotate.Category

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  @required_fields [:url, :title, :description]
  @optional_fields [:category_id]

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, @required_fields, @optional_fields)
    |> assoc_constraint(:category)
  end
end
