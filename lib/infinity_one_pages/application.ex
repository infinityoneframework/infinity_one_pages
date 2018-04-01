defmodule InfinityOnePages.Application do
  use Application

  @env Mix.env()

  def env, do: @env

  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  def start(_type, _args) do
    import Supervisor.Spec

    # Define workers and child supervisors to be supervised
    standalone = Application.get_env(:infinity_one_pages, :standalone, false)

    test_children =
      if env() == :test or standalone  do
        [
          # Start the endpoint when the application starts
          supervisor(InfinityOnePagesWeb.Endpoint, []),
          # Start your own worker by calling: InfinityOnePages.Worker.start_link(arg1, arg2, arg3)
          # worker(InfinityOnePages.Worker, [arg1, arg2, arg3]),
        ]
      else
        []
      end

    children = [
      # Start the Ecto repository
      # supervisor(InfinityOnePages.Repo, []),
      worker(InfinityOnePages.Github.Server, []) | test_children]
    # children = [worker(InfinityOnePages.Github.Server, [])]
    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: InfinityOnePages.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    InfinityOnePagesWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
