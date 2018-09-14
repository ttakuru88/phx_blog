defmodule PhxBlog.Auth do
  alias PhxBlog.Admins.Admin

  def authenticate_user(email, password) do
    Repo.get_by(Admin, email: email)
    |> check_password(password)
  end

  defp check_password(nil, _) do
    {:error, "メールアドレスが違うわ"}
  end
  defp check_password(user, password) do
    case Argon2.checkpw(password, user.password_hash) do
      true -> {:ok, user}
      false -> {:error, "パスワードが違うわ"}
    end
  end
end
