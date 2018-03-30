use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :infinity_one_app, InfinityOneAppWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :infinity_one_app, InfinityOneApp.Repo,
  adapter: Ecto.Adapters.MySQL,
  username: "root",
  database: "infinity_one_app_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

if File.exists? "config/dev.secret.exs" do
  import_config "dev.secret.exs"
end
