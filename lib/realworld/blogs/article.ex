defmodule Realworld.Blogs.Article do
  alias Realworld.Blogs.Comment
  @moduledoc """
  Article Schema
  """
  use Ecto.Schema
  import Ecto.Changeset

  schema "articles" do
    field :body, :string
    field :title, :string

    has_many :comments, Comment, on_delete: :delete_all
    timestamps()
  end

  @doc false
  def changeset(article, attrs) do
    article
    |> cast(attrs, [:title, :body])
    |> validate_required([:title, :body])
  end
end
