defmodule Plaid.IdentityVerification.User do
  @moduledoc """
  Plaid User data structure.
  """
  @derive Jason.Encoder
  defstruct phone_number: nil,
            date_of_birth: nil,
            ip_address: nil,
            email_address: nil,
            name: nil,
            address: nil,
            id_number: nil

  @type t :: %__MODULE__{
          phone_number: String.t(),
          date_of_birth: String.t(),
          ip_address: String.t(),
          email_address: String.t(),
          name: Name.t(),
          address: Address.t(),
          id_number: IdNumber.t(),
  }

  defmodule Name do
    @moduledoc """
    Plaid Name data structure.
    """
    @derive Jason.Encoder
    defstruct given_name: nil,
              family_name: nil

    @type t :: %__MODULE__{
            given_name: String.t(),
            family_name: String.t()
    }
  end

  defmodule Address do
    @moduledoc """
    Plaid Address data structure.
    """
    @derive Jason.Encoder
    defstruct street: nil,
              street2: nil,
              city: nil,
              region: nil,
              postal_code: nil,
              country: nil

    @type t :: %__MODULE__{
            street: String.t(),
            street2: String.t(),
            city: String.t(),
            region: String.t(),
            postal_code: String.t(),
            country: String.t()
    }
  end

  defmodule IdNumber do
    @moduledoc """
    Plaid IdNumber data structure.
    """
    @derive Jason.Encoder
    defstruct value: nil,
              type: nil

    @type t :: %__MODULE__{
            value: String.t(),
            type: String.t()
    }
  end
end
