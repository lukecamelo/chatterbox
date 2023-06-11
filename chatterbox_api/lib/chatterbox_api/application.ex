defmodule ChatterboxApi.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ChatterboxApiWeb.Telemetry,
      # Start the Ecto repository
      ChatterboxApi.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: ChatterboxApi.PubSub},
      # Start Finch
      {Finch, name: ChatterboxApi.Finch},
      # Start the Endpoint (http/https)
      ChatterboxApiWeb.Endpoint
      # Start a worker by calling: ChatterboxApi.Worker.start_link(arg)
      # {ChatterboxApi.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ChatterboxApi.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    ChatterboxApiWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
