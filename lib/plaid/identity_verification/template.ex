defmodule Plaid.IdentityVerification.Template do
  @moduledoc """
  Plaid Template data structure.
  """
  @derive Jason.Encoder
  defstruct id: nil,
            version: nil

  @type t :: %__MODULE__{
          id: String.t(),
          version: integer
  }
end
