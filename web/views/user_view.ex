defmodule SpotitApp.UserView do
  use SpotitApp.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, SpotitApp.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, SpotitApp.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id,
      email: user.email,
      encrypted_password: user.encrypted_password,
      username: user.username}
  end
end
