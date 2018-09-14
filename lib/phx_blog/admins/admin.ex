defmodule PhxBlog.Admins.Admin do
  use Ecto.Schema
  import Ecto.Changeset


  schema "admins" do
    field :email, :string
    field :password_hash, :string
    field :password, :string, virtual: true

    timestamps()
  end

  @doc false
  def changeset(admin, attrs) do
    admin
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
    |> put_password_hash()
  end

  defp put_password_hash(changeset) do
    case changeset do
      %Ecto.Changeset{valid?: true, changes: %{password: pass}} ->
        changeset
        |> put_change(:password_hash, Comeonin.Argon2.hashpwsalt(pass))
      _ ->
        changeset
    end
  end
end
