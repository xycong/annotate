defmodule Annotate.VideoViewTest do
  use Annotate.ConnCase, async: true
  import Phoenix.View

  test "renders index.html", %{conn: conn} do
    videos = [%Annotate.Video{id: "1", title: "dogs"},
              %Annotate.Video{id: "2", title: "cats"}]
    content = render_to_string(Annotate.VideoView, "index.html", conn: conn, videos: videos)
    
    assert String.contains?(content, "Listing videos")
    for video <- videos do
      assert String.contains?(content, video.title)
    end
  end

  test "renders new.html", %{conn: conn} do
    changeset = Annotate.Video.changeset(%Annotate.Video{})
    categories = [{"cats", 123}]
    content = render_to_string(Annotate.VideoView, "new.html",
      conn: conn, categories: cateogories)

    assert String.contains?(content, "New video")
  end
end