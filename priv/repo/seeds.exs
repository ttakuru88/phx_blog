# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     PhxBlog.Repo.insert!(%PhxBlog.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# PhxBlog.Repo.insert!(%PhxBlog.Admins.Admin{
#   email: "admin@example.com",
#   password: "awefawef"
# })

PhxBlog.Admins.create_or_update_admin(%{
  email: "admin@example.com",
  password: "awefawef"
})
