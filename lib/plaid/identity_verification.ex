defmodule Plaid.IdentityVerification do
  @moduledoc """
  Functions for Plaid `identity_verification` endpoint.
  """

  alias Plaid.Client.Request
  alias Plaid.Client

  @derive Jason.Encoder
  defstruct id: nil,
            client_user_id: nil,
            created_at: nil,
            completed_at: nil,
            previous_attempt_id: nil,
            shareable_url: nil,
            template: nil,
            user: nil,
            status: nil,
            steps: nil,
            documentary_verification: nil,
            selfie_check: nil,
            kyc_check: nil,
            risk_check: nil,
            watchlist_screening_id: nil,
            redacted_at: nil,
            request_id: nil

  @type t :: %__MODULE__{
          id: String.t(),
          client_user_id: String.t(),
          created_at: String.t(),
          completed_at: String.t(),
          previous_attempt_id: String.t(),
          shareable_url: String.t(),
          template: Template.t(),
          user: User.t(),
          status: String.t(),
          steps: Steps.t(),
          documentary_verification: DocumentaryVerification.t(),
          selfie_check: SelfieCheck.t(),
          kyc_check: KycCheck.t(),
          risk_check: RiskCheck.t(),
          watchlist_screening_id: String.t(),
          redacted_at: String.t(),
          request_id: String.t()
        }
  @type params :: %{required(atom) => term}
  @type config :: %{required(atom) => String.t() | keyword}
  @type error :: {:error, Plaid.Error.t() | any()} | no_return

  @doc """
  Retrieve a previously created identity verification.

  Parameters
  ```
  %{
    identity_verification_id: "id-verification-id"
  }
  ```
  """
  @spec get(params, config) :: {:ok, Plaid.IdentityVerification.t()} | error
  def get(params, config \\ %{}) do
    c = config[:client] || Plaid

    Request
    |> struct(method: :post, endpoint: "identity_verification/get", body: params)
    |> Request.add_metadata(config)
    |> c.send_request(Client.new(config))
    |> c.handle_response(&map_identity_verifiction(&1))
  end

  defp map_identity_verifiction(body) do
    Poison.Decode.transform(
      body,
      %{
        as: %Plaid.IdentityVerification{
          template: %Plaid.IdentityVerification.Template{},
          user: %Plaid.IdentityVerification.User{
            name: %Plaid.IdentityVerification.User.Name{},
            address: %Plaid.IdentityVerification.User.Address{},
            id_number: %Plaid.IdentityVerification.User.IdNumber{}
          },
          steps: %Plaid.IdentityVerification.Steps{},
          documentary_verification: %Plaid.IdentityVerification.DocumentaryVerification{
            documents: [%Plaid.IdentityVerification.DocumentaryVerification.Documents{
              images: %Plaid.IdentityVerification.DocumentaryVerification.Documents.Images{},
              extracted_data: %Plaid.IdentityVerification.DocumentaryVerification.Documents.ExtractedData{},
              analysis: %Plaid.IdentityVerification.DocumentaryVerification.Documents.Analysis{
                extracted_data: %Plaid.IdentityVerification.DocumentaryVerification.Documents.Analysis.ExtractedData{}
              }
            }]
          },
          selfie_check: %Plaid.IdentityVerification.SelfieCheck{
            selfies: [%Plaid.IdentityVerification.SelfieCheck.Selfie{}]
          },
          kyc_check: %Plaid.IdentityVerification.KycCheck{},
          risk_check: %Plaid.IdentityVerification.RiskCheck{
            behavior: %Plaid.IdentityVerification.RiskCheck.Behavior{},
            email: %Plaid.IdentityVerification.RiskCheck.Email{},
            phone: %Plaid.IdentityVerification.RiskCheck.Phone{},
            devices: [%Plaid.IdentityVerification.RiskCheck.Device{}],
            identity_abuse_signals: %Plaid.IdentityVerification.RiskCheck.IdentityAbuseSignals{}
          },
        },
      }
    )
  end
end
