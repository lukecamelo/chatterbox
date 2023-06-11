defmodule ChatterboxApi.Repo do
  use Ecto.Repo,
    otp_app: :chatterbox_api,
    adapter: Ecto.Adapters.Postgres
end
