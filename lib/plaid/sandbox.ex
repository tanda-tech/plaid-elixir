defmodule Plaid.Sandbox do

  alias Plaid.Client.Request
  alias Plaid.Client

  defmodule PublicToken do
    @derive Jason.Encoder
    defstruct public_token: nil,
              request_id: nil

    def create_public_token(params, config \\ %{}) do
      request_operation("sandbox/public_token/create", params, config)
    end

    defp request_operation(endpoint, params, config) do
      c = config[:client] || Plaid

      Request
      |> struct(method: :post, endpoint: endpoint, body: params)
      |> Request.add_metadata(config)
      |> c.send_request(Client.new(config))
      |> c.handle_response(&map_link(&1))
    end


    defp map_link(body) do
      Poison.Decode.transform(
        body,
        %{
          as: %Plaid.Sandbox.PublicToken{}
        }
      )
    end
  end

  defmodule ProcessorToken do
    defstruct processor_token: nil,
              request_id: nil

    def create_processor_token(params, config \\ %{}) do
      request_operation("sandbox/processor_token/create", params, config)
    end

    defp request_operation(endpoint, params, config) do
      c = config[:client] || Plaid

      Request
      |> struct(method: :post, endpoint: endpoint, body: params)
      |> Request.add_metadata(config)
      |> c.send_request(Client.new(config))
      |> c.handle_response(&map_link(&1))
    end

    defp map_link(body) do
      Poison.Decode.transform(
        body,
        %{
          as: %Plaid.Sandbox.ProcessorToken{}
        }
      )
    end
  end
end
