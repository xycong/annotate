defmodule Annotate.UserView do
  use Annotate.Web, :view
  alias Annotate.User
  
  def first_name(%User{name: name}) do
    name
    |> String.split(" ")
    |> Enum.at(0)
  end
end