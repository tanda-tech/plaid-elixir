import Config
require Logger

if config_env() in [:dev, :test] do
  Logger.info("Loaded env configuration, environment=#{Config.config_env()}")
  DotenvParser.load_file(".env")
end

if System.get_env("PLAID_CREDENTIALS_CLIENT") do
  Logger.info("Plaid client present")

  config :plaid,
    client_id: System.get_env("PLAID_CREDENTIALS_CLIENT"),
    secret: System.get_env("PLAID_CREDENTIALS_SECRET")
end
