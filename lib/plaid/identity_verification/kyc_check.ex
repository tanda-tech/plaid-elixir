defmodule Plaid.IdentityVerification.KycCheck do
  @moduledoc """
  Plaid KycCheck data structure.
  """
  @derive Jason.Encoder
  defstruct status: nil,
            address: nil,
            name: nil,
            date_of_birth: nil,
            id_number: nil,
            phone_number: nil

  @type t :: %__MODULE__{
          status: String.t(),
          address: %{summary: String.t(), po_box: String.t(), type: String.t()},
          name: %{summary: String.t()},
          date_of_birth: %{summary: String.t()},
          id_number: %{summary: String.t()},
          phone_number: %{summary: String.t()}
  }
end
