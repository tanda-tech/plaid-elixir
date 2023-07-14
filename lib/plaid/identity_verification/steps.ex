defmodule Plaid.IdentityVerification.Steps do
  @moduledoc """
  Plaid Steps data structure.
  """
  @derive Jason.Encoder
  defstruct accept_tos: nil,
            verify_sms: nil,
            key_check: nil,
            documentary_verification: nil,
            selfie_check: nil,
            watchlist_screening: nil,
            risk_check: nil

  @type t :: %__MODULE__{
          accept_tos: String.t(),
          verify_sms: String.t(),
          key_check: String.t(),
          documentary_verification: String.t(),
          selfie_check: String.t(),
          watchlist_screening: String.t(),
          risk_check: String.t()
  }
end
