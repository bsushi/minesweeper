defmodule Minesweeper.Application do
  use Application

  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    # Define workers and child supervisors to be supervised
    children = [
      # Start the endpoint when the application starts
      MinesweeperWeb.Endpoint,

      # Start your own worker by calling: Minesweeper.Worker.start_link(arg1, arg2, arg3)
      # worker(Minesweeper.Worker, [arg1, arg2, arg3]),
      # {Phoenix.PubSub, [name: Minesweeper.PubSub, adapter: Phoenix.PubSub.PG2]},
      {Phoenix.PubSub, name: Minesweeper.PubSub},
      Minesweeper.Presence
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Minesweeper.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    MinesweeperWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
