defmodule PhxBlog.Auth do
  alias PhxBlog.Admins.Admin
  alias PhxBlog.Auth.Guardian
  alias PhxBlog.Repo

  def authenticate_admin(email, password) do
    Repo.get_by(Admin, email: email)
    |> check_password(password)
  end

  def login(conn, admin) do
    conn
    |> Guardian.Plug.sign_in(admin)
    |> Plug.Conn.assign(:current_admin, admin)
  end

  def logout(conn) do
    conn
    |> Guardian.Plug.sign_out()
  end

  defp check_password(nil, _) do
    {:error, "メールアドレスが違うわ"}
  end

  defp check_password(admin, password) do
    case Comeonin.Argon2.checkpw(password, admin.password_hash) do
      true -> {:ok, admin}
      false -> {:error, "パスワードが違うわ"}
    end
  end
end
