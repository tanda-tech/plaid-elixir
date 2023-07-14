defmodule Plaid.IdentityVerification.RiskCheck do
  @moduledoc """
  Plaid Risk Check data structure.
  """
  @derive Jason.Encoder
  defstruct status: nil,
            behavior: nil,
            email: nil,
            phone: nil,
            devices: [],
            identity_abuse_signals: nil

  @type t :: %__MODULE__{
          status: String.t(),
          behavior: Behavior.t(),
          email: Email.t(),
          phone: Phone.t(),
          devices: [Device.t()],
          identity_abuse_signals: IdentityAbuseSignals.t()
  }

  defmodule Behavior do
    @moduledoc """
    Plaid Behavior data structure.
    """

    @derive Jason.Encoder
    defstruct user_interactions: nil,
              fraud_ring_detected: nil,
              bot_detected: nil

    @type t :: %__MODULE__{
            user_interactions: String.t(),
            fraud_ring_detected: String.t(),
            bot_detected: String.t()
    }
  end

  defmodule Email do
    @moduledoc """
    Plaid Email data structure.
    """
    @derive Jason.Encoder
    defstruct is_deliverable: nil,
              breach_count: nil,
              first_breached_at: nil,
              last_breached_at: nil,
              domain_registered_at: nil,
              domain_is_free_provider: nil,
              domain_is_custom: nil,
              domain_is_disposable: nil,
              top_level_domain_is_suspicious: nil,
              linked_services: []

    @type t :: %__MODULE__{
            is_deliverable: String.t(),
            breach_count: integer,
            first_breached_at: String.t(),
            last_breached_at: String.t(),
            domain_registered_at: String.t(),
            domain_is_free_provider: String.t(),
            domain_is_custom: String.t(),
            domain_is_disposable: String.t(),
            top_level_domain_is_suspicious: String.t(),
            linked_services: [String.t()]
    }
  end

  defmodule Phone do
    @moduledoc """
    Plaid Phone data structure.
    """
    @derive Jason.Encoder
    defstruct linked_services: []

    @type t :: %__MODULE__{
            linked_services: [String.t()]
    }
  end

  defmodule Device do
    @moduledoc """
    Plaid Devices data structure.
    """
    @derive Jason.Encoder
    defstruct ip_proxy_type: nil,
              ip_spam_list_count: nil,
              ip_timezone_offset: nil

    @type t :: %__MODULE__{
            ip_proxy_type: String.t(),
            ip_spam_list_count: integer,
            ip_timezone_offset: String.t()
    }
  end

  defmodule IdentityAbuseSignals do
    @moduledoc """
    Plaid Identity Abuse Signals data structure.
    """
    @derive Jason.Encoder
    defstruct synthetic_identity: nil,
              stolen_identity: nil

    @type t :: %__MODULE__{
            synthetic_identity: %{score: integer},
            stolen_identity: %{score: integer}
    }
  end
end
